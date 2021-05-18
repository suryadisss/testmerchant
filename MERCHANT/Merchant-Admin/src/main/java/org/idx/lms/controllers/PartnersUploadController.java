package org.idx.lms.controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.idx.lms.libs.ConfigApps;
import org.idx.lms.libs.LogActivity;
import org.idx.lms.libs.RestServiceUnirest;
import org.idx.lms.libs.TokenRegen;
import org.idx.lms.model.UploadTest;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("employee_upload")
public class PartnersUploadController {

	@Autowired
	ServletContext context;

	private ConfigApps con = new ConfigApps();
	private String partners_upload_path = con.getConfigValue("CustomPathPartnersUpload");
	private String API_PARAMETER = con.getConfigValue("ServerAPI-PARAMETER");
	private String LOCAL_SERVER = con.getConfigValue("ServerLocal");

	TokenRegen token = new TokenRegen();

	private boolean checkSession(HttpSession session, String level) {
		boolean bol = false;
		if (session.getAttribute("accesskey") != null) {
			JSONArray jMenu = new JSONArray(session.getAttribute("session_menu").toString());
			for (int i = 0; i < jMenu.length(); i++) {
				if (jMenu.getJSONObject(i).getString("ldlmdescription").equals(level)) {
					bol = true;
				}
			}
		}
		return bol;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView ParameterColl(ModelMap model, HttpSession session, HttpServletRequest req) {
		 if (checkSession(session, "lvl_act_prt_upl")) {
		token.regenToken(session);

		model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
		return new ModelAndView("EmployeeUploadMainView", model);
		 } else {
		 return new ModelAndView("redirect:/");
		 }
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public @ResponseBody String list(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);

		String group = session.getAttribute("group").toString();
		String partner = session.getAttribute("partner").toString();

		return new RestServiceUnirest().requestPost(this.API_PARAMETER + "/PartnersDetail/PartnersReadActive/",
				session.getAttribute("accesskey").toString(),
				new JSONObject().put("gpt_grp_alias", group).put("gpt_alias", partner).toString());
	}

	@RequestMapping(value = "/dopost", method = RequestMethod.POST)
	public @ResponseBody String crunchifySave(@ModelAttribute("uploadForm") UploadTest uploadForm, Model map,
			HttpServletRequest req, HttpSession session) throws IllegalStateException, IOException {

		List<MultipartFile> crunchifyFiles = uploadForm.getFiles();
		String myString = "";
		//String path = context.getRealPath("/WEB-INF/tmp/");
		String path = partners_upload_path;
		DateFormat df = new SimpleDateFormat("ddMMyyyy_HHmmss");
		String date = df.format(new Date());
		String uploadtype = req.getParameter("uploadtype");
		String gpt_id = req.getParameter("gpt_id");
		String user = session.getAttribute("session_id").toString();
		if (null != crunchifyFiles && crunchifyFiles.size() > 0) {
			for (MultipartFile multipartFile : crunchifyFiles) {

				String type = multipartFile.getContentType();
				String fileName = multipartFile.getOriginalFilename();
				String strData = "";
				if (!"".equalsIgnoreCase(fileName)
						&& (type.equalsIgnoreCase("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
								|| type.equalsIgnoreCase("application/vnd.ms-excel")
								|| type.equalsIgnoreCase("application/octet-stream"))) {
					//File file = new File(path + date + "_" + fileName);
					File file = new File(path + date + "_" + user + "_" + uploadtype + "_" + fileName );
					if (!file.exists()) {
						try {
							multipartFile.transferTo(file);
							//multipartFile.transferTo(file2);

							if (type.equalsIgnoreCase("application/vnd.ms-excel")) {
								POIFSFileSystem fileSystem = new POIFSFileSystem(new FileInputStream(file));
								HSSFWorkbook workbook = new HSSFWorkbook(fileSystem);
								HSSFSheet sheet = workbook.getSheetAt(0); // Get first Excel Sheet

								// Iterate throw each row.
								Iterator<Row> rows = sheet.rowIterator();
								while (rows.hasNext()) {
									HSSFRow row = (HSSFRow) rows.next();
									Iterator<Cell> cells = row.cellIterator();
									while (cells.hasNext()) {
										HSSFCell cell = (HSSFCell) cells.next();
										if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
											if (cells.hasNext()) {
												strData += cell.getDateCellValue() + ";";
											} else {
												strData += cell.getDateCellValue() + "\r\n";
											}
										} else if (cell.getCellType() == Cell.CELL_TYPE_STRING) {

											if (cells.hasNext()) {
												strData += cell.getStringCellValue() + ";";
											} else {
												strData += cell.getStringCellValue() + "\r\n";
											}

										}else if (cell.getCellType() == Cell.CELL_TYPE_BOOLEAN) {

											if (cells.hasNext()) {
												strData += cell.getStringCellValue() + ";";
											} else {
												strData += cell.getStringCellValue() + "\r\n";
											}

										}
									}
								}
								workbook.close();
								// untuk disimpan, tidak perlu dlete file.delete();
							} else if (type.equalsIgnoreCase(
									"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")) {
								FileInputStream excelFile = new FileInputStream(file);
								Workbook workbook = new XSSFWorkbook(excelFile);
								Sheet datatypeSheet = workbook.getSheetAt(0);
								Iterator<Row> iterator = datatypeSheet.iterator();

								while (iterator.hasNext()) {

									Row currentRow = iterator.next();
									Iterator<Cell> cellIterator = currentRow.iterator();
									while (cellIterator.hasNext()) {

										Cell currentCell = cellIterator.next();
										if (currentCell.getCellTypeEnum() == CellType.STRING) {

											if (cellIterator.hasNext()) {
												strData += currentCell.getStringCellValue() + ";";
											} else {
												strData += currentCell.getStringCellValue() + "\r\n";
											}

										} else if (currentCell.getCellTypeEnum() == CellType.NUMERIC) {
											if (cellIterator.hasNext()) {
												strData += currentCell.getNumericCellValue() + ";";
											} else {
												strData += currentCell.getNumericCellValue() + "\r\n";
											}
										} else if (currentCell.getCellTypeEnum() == CellType.BOOLEAN) {
											if (cellIterator.hasNext()) {
												strData += currentCell.getBooleanCellValue() + ";";
											} else {
												strData += currentCell.getBooleanCellValue() + "\r\n";
											}

										} else {
											if (cellIterator.hasNext()) {
												strData += ";";
											} else {
												strData += "\r\n";
											}
										}

									}

								}
								workbook.close();
								// untuk disimpan, tidak perlu dlete file.delete();
							} else if (type.equalsIgnoreCase("application/octet-stream")) {
								FileInputStream excelFile = new FileInputStream(file);
								Workbook workbook = new XSSFWorkbook(excelFile);
								Sheet datatypeSheet = workbook.getSheetAt(0);
								Iterator<Row> iterator = datatypeSheet.iterator();
								while (iterator.hasNext()) {
									Row currentRow = iterator.next();
									Iterator<Cell> cellIterator = currentRow.iterator();
									while (cellIterator.hasNext()) {
										Cell currentCell = cellIterator.next();
										if (currentCell.getCellTypeEnum() == CellType.STRING) {

											if (cellIterator.hasNext()) {
												strData += currentCell.getStringCellValue() + ";";
											} else {
												strData += currentCell.getStringCellValue() + "\r\n";
											}

										} else if (currentCell.getCellTypeEnum() == CellType.NUMERIC) {
											if (cellIterator.hasNext()) {
												strData += currentCell.getNumericCellValue() + ";";
											} else {
												strData += currentCell.getNumericCellValue() + "\r\n";
											}
										} else if (currentCell.getCellTypeEnum() == CellType.BOOLEAN) {
											if (cellIterator.hasNext()) {
												strData += currentCell.getBooleanCellValue() + ";";
											} else {
												strData += currentCell.getBooleanCellValue() + "\r\n";
											}

										} else {
											if (cellIterator.hasNext()) {
												strData += ";";
											} else {
												strData += "\r\n";
											}
										}
									}//asd

								}
								workbook.close();
								// untuk disimpan, tidak perlu dlete file.delete();
							}

							if (!"".equals(strData) && strData != null) {
								try {
									JSONObject result = new JSONObject(new RestServiceUnirest().sendPost(
											this.API_PARAMETER + "/PartnersDetail/Upload",
											session.getAttribute("accesskey").toString(),
											new JSONObject().put("records", strData).put("type", uploadtype)
													.put("gpt_id", gpt_id).toString()

									));

									myString = result.getString("message");

									// myString = result.getString("message");
								} catch (Exception e) {
									myString = e.getMessage();
								}
							} else {

								myString = "Failed to upload, please check file content";
							}
						} catch (FileNotFoundException e) {
							// untuk disimpan, tidak perlu dlete file.delete();
							e.printStackTrace();
							myString = e.getMessage();
						} catch (IOException e) {
							// untuk disimpan, tidak perlu dlete file.delete();
							e.printStackTrace();
							myString = e.getMessage();
						}
					} else {
						// untuk disimpan, tidak perlu dlete file.delete();
						myString = "Failed to upload, file is already exist on the server";
					}

				} else {
					myString = "Type of file is not allowed";
				}
			}
		}

		return myString;
	}

	@RequestMapping(value = "/list/{id}", method = RequestMethod.GET)
	public @ResponseBody String listid(@PathVariable("id") String id, HttpSession session, HttpServletRequest req) {
		token.regenToken(session);

		return new RestServiceUnirest().requestGet(this.API_PARAMETER + "/PartnersDetail/ReadActive/" + id,
				session.getAttribute("accesskey").toString());
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public @ResponseBody String delete(@PathVariable("id") String id, HttpSession session, HttpServletRequest req) {
		token.regenToken(session);

		JSONObject jData = new JSONObject();
		jData.put("grp_alias", id);
		return new RestServiceUnirest().requestPost(this.API_PARAMETER + "/PartnersDetail/Delete",
				session.getAttribute("accesskey").toString(), jData.toString());

	}

	/*
	 * @RequestMapping(value = "/dopost", method = RequestMethod.POST)
	 * public @ResponseBody String dopost(HttpSession session, HttpServletRequest
	 * req) { token.regenToken(session);
	 * 
	 * String bx = req.getParameter("isedit");
	 * 
	 * JSONObject jData = new JSONObject(); jData.put("grp_alias",
	 * req.getParameter("grp_alias")); jData.put("grp_name",
	 * req.getParameter("grp_name")); jData.put("grp_hr_data",
	 * req.getParameter("grouptype")); jData.put("grp_location",
	 * req.getParameter("grp_location")); jData.put("grp_type",
	 * req.getParameter("grp_type")); jData.put("grp_header",
	 * req.getParameter("grp_header")); jData.put("grp_request",
	 * req.getParameter("grp_request")); jData.put("grp_db_file", "");
	 * jData.put("grp_input_by", session.getAttribute("session_id").toString());
	 * 
	 * RestServiceUnirest objRest = new RestServiceUnirest(); if (bx.equals("1")) {
	 * // return jData.toString(); return objRest.requestPost(this.API_PARAMETER +
	 * "/PartnersDetail/Add", session.getAttribute("accesskey").toString(),
	 * jData.toString()); } else if (bx.equals("0")) { return
	 * objRest.requestPost(this.API_PARAMETER + "/PartnersDetail/Update",
	 * session.getAttribute("accesskey").toString(), jData.toString()); } else {
	 * return ""; }
	 * 
	 * }
	 */

}
