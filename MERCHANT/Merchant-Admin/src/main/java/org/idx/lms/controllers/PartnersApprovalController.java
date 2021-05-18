package org.idx.lms.controllers;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
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
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.idx.lms.libs.ConfigApps;
import org.idx.lms.libs.RestServiceUnirest;
import org.idx.lms.libs.TokenRegen;
import org.idx.lms.model.UploadTest;
import org.idx.lms.model.disbursement.DisbursementDownload;
import org.idx.lms.model.disbursement.DisbursementSingleItem;
import org.idx.lms.model.disbursement.PostDisbursementSingle;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
@RequestMapping("employee_approval")
public class PartnersApprovalController {
	private ConfigApps con = new ConfigApps();

	@Autowired
	ServletContext context;

	private static final String FILE_NAME = "temp_auto_credit.xlsx";
	private String API_SERVER = con.getConfigValue("ServerAPI");

	private String API_SERVER_PARAMETER = con.getConfigValue("ServerAPI-PARAMETER");
	private String API_SERVER_LMS = con.getConfigValue("ServerAPI-LMS");
	private String API_SERVER_CUST = con.getConfigValue("ServerAPI-CUST");
	private String SERVER_PHP = con.getConfigValue("ServerPHP");
	private String SERVER_IMG = con.getConfigValue("URL_ACCESS_IMG");
	private String LOCAL_SERVER = con.getConfigValue("ServerLocal");
	private String SESSION_ID;
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
	public ModelAndView dis_single(ModelMap model, HttpSession session, HttpServletRequest req) {
		if (checkSession(session, "lvl_act_prt_apv")) {
			token.regenToken(session);
			this.SESSION_ID = session.getAttribute("session_id").toString();

			model.addAttribute("api_server", this.API_SERVER);
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			model.addAttribute("SERVER_PHP", this.SERVER_PHP);
			model.addAttribute("SERVER_IMG", this.SERVER_IMG);
			return new ModelAndView("EmployeeApprovalMainView", model);
		} else {
			return new ModelAndView("redirect:/");
		}

	}

	@RequestMapping(value = "/dopost", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String submitData(@ModelAttribute("DisbursementSingleItem") DisbursementSingleItem ds,
			HttpSession session) {
		token.regenToken(session);
		PostDisbursementSingle postItem = new PostDisbursementSingle();
		postItem.setAcc_no(ds.getLoan_acc_no());
		postItem.setDisburse_amount(Integer.parseInt(ds.getLoan_disb_amount_needs().replaceAll("[\\s.]", "")));
		postItem.setDisburse_date(ds.getLdi_req_date());
		postItem.setNotes(ds.getNotes());

		JSONObject json = new JSONObject(
				new RestServiceUnirest().requestPost(this.API_SERVER_LMS + "/disbursement/single/update",
						session.getAttribute("accesskey").toString(), postItem));
		return json.getString("message");
	}

	/*
	 * @RequestMapping(value = "/getdisbursementsingle", method = RequestMethod.GET,
	 * produces = "application/json") public @ResponseBody String
	 * getProduct(HttpSession session) { token.regenToken(session); return new
	 * RestServiceUnirest().requestGet(this.API_SERVER_PARAMETER +
	 * "/PartnersApproval/ReadTempData",
	 * session.getAttribute("accesskey").toString(),new
	 * JSONObject().put("gpt_alias",session.getAttribute("partner").toString()).put(
	 * "gpt_grp_alias", session.getAttribute("group").toString()).toString()); }
	 */
	@RequestMapping(value = "/getdisbursementsingle", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String getProduct(HttpSession session) {
		token.regenToken(session);
		return new RestServiceUnirest().requestPost(this.API_SERVER_PARAMETER + "/PartnersApproval/ReadTempData",
				session.getAttribute("accesskey").toString(),
				new JSONObject().put("gpt_alias", session.getAttribute("partner").toString())
						.put("gpt_grp_alias", session.getAttribute("group").toString()).toString());
	}

	@RequestMapping(value = "/getCustInfoTemp/{key}", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String getCustInfoTemp(@PathVariable("key") String key, HttpSession session,
			HttpServletRequest request) {
		token.regenToken(session);
		// String params = request.getParameter("key");
		String[] array = key.split(",");
		String type = array[0];
		String ktp = array[1];
		String temptable = array[2];
		String table = array[3];
		return new RestServiceUnirest().requestPost(this.API_SERVER_PARAMETER + "/PartnersApproval/Single/Detail",
				session.getAttribute("accesskey").toString(),
				new JSONObject().put("table", temptable).put("ktp", ktp).toString());

	}

	@RequestMapping(value = "/getdisbdetailsingle/{id}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String getdisbdetailsingle(@PathVariable("id") String id, HttpSession session) {
		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_SERVER_LMS + "/disbursement/single/" + id,
				session.getAttribute("accesskey").toString());

	}

	@RequestMapping(value = "/getRshID", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String getrshid(HttpSession session, HttpServletRequest request) {
		token.regenToken(session);
		String data = request.getParameter("acc_no").toString();
		return new RestServiceUnirest().requestPost(this.API_SERVER_CUST + "/account/getrshid",
				session.getAttribute("accesskey").toString(), new JSONObject().put("acc_no", data).toString());

	}

	@RequestMapping(value = "/disapprove", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String cancelApproval(HttpSession session, HttpServletRequest request) {
		token.regenToken(session);
		String data = request.getParameter("acc_no").toString();
		String[] array = data.split(",");
		String type = array[0];
		String ktp = array[1];
		String temptable = array[2];
		String table = array[3];
		return new RestServiceUnirest().requestPost(this.API_SERVER_PARAMETER + "/PartnersApproval/Single/Disapprove",
				session.getAttribute("accesskey").toString(),
				new JSONObject().put("temp_table", temptable).put("table", table).put("ktp", ktp).toString());

	}

	@RequestMapping(value = "/approve", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String Approve(HttpSession session, HttpServletRequest request) {
		token.regenToken(session);
		String data = request.getParameter("acc_no").toString();
		String[] array = data.split(",");
		String type = array[0];
		String ktp = array[1];
		String temptable = array[2];
		String table = array[3];
		return new RestServiceUnirest().requestPost(this.API_SERVER_PARAMETER + "/PartnersApproval/Single/Approve",
				session.getAttribute("accesskey").toString(),
				new JSONObject().put("temp_table", temptable).put("table", table).put("ktp", ktp).toString());

	}

	@RequestMapping(value = "/gettasklist/det/{accno}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String gettasklistdet(@PathVariable("accno") String accno, HttpSession session) {
		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_SERVER_LMS + "/loan/info/" + accno,
				session.getAttribute("accesskey").toString());

	}

	@RequestMapping(value = "/getImage/{nik}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String getImageDet(@PathVariable("nik") String nik, HttpSession session) {
		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_SERVER_CUST + "/gallery/thumbGallery/" + nik,
				session.getAttribute("accesskey").toString());

	}

	@RequestMapping(value = "/LockAndUnlock/{id}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String LockAndUnlock(@PathVariable("id") String id, HttpSession session) {
		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_SERVER_CUST + "/gallery/stat/" + id,
				session.getAttribute("accesskey").toString());

	}

	@RequestMapping(value = "/delImage", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String delImage(HttpSession session, HttpServletRequest request) {
		token.regenToken(session);

		String id = request.getParameter("id").toString();
		String cif = request.getParameter("cif").toString();

		return new RestServiceUnirest().requestPost(this.API_SERVER_CUST + "/gallery/delete/admin",
				session.getAttribute("accesskey").toString(),
				new JSONObject().put("id", id).put("cst_cif", cif).toString());

	}

	private String getNameFile(Object nameFile) {
		String[] nama;
		if (nameFile != null && nameFile != "") {
			nama = nameFile.toString().split("/");
			return nama[nama.length - 1].toString();
		} else {
			return "";
		}

	}

	@RequestMapping(value = "/file", method = RequestMethod.POST)
	public @ResponseBody String crunchifySave(@ModelAttribute("uploadForm") UploadTest uploadForm, Model map,
			HttpServletRequest req, HttpSession session) throws IllegalStateException, IOException {

		List<MultipartFile> crunchifyFiles = uploadForm.getFiles();
		String myString = "";
		String date2 = req.getParameter("date_from");
		String path = context.getRealPath("/WEB-INF/tmp/");
		DateFormat df = new SimpleDateFormat("ddMMyyyy_HHmmss");
		String date = df.format(new Date());

		if (null != crunchifyFiles && crunchifyFiles.size() > 0) {
			for (MultipartFile multipartFile : crunchifyFiles) {

				String type = multipartFile.getContentType();
				String fileName = multipartFile.getOriginalFilename();
				String strData = "";
				if (!"".equalsIgnoreCase(fileName)
						&& (type.equalsIgnoreCase("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
								|| type.equalsIgnoreCase("application/vnd.ms-excel")
								|| type.equalsIgnoreCase("application/octet-stream"))) {
					File file = new File(path + date + "_" + fileName);
					if (!file.exists()) {
						try {
							multipartFile.transferTo(file);

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

										}
									}
								}
								workbook.close();
								file.delete();
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
										// getCellTypeEnum shown as deprecated for version 3.15
										// getCellTypeEnum ill be renamed to getCellType starting from version 4.0
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

										}

									}

								}
								workbook.close();
								file.delete();
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

										}
									}

								}
								workbook.close();
								file.delete();
							}

							if (!"".equals(strData) && strData != null) {
								try {
									JSONObject result = new JSONObject(new RestServiceUnirest().sendPost(
											this.API_SERVER_PARAMETER + "/PartnersApproval/Upload",
											session.getAttribute("accesskey").toString(),
											new JSONObject().put("records", strData).toString()

									));

									myString = result.getString("message");
								} catch (Exception e) {
									myString = e.getMessage();
								}
							} else {

								myString = "Failed to upload, please check file content";
							}
						} catch (FileNotFoundException e) {
							file.delete();
							e.printStackTrace();
							myString = e.getMessage();
						} catch (IOException e) {
							file.delete();
							e.printStackTrace();
							myString = e.getMessage();
						}
					} else {
						file.delete();
						myString = "Failed to upload, file is already exist on the server";
					}

				} else {
					myString = "Type of file is not allowed";
				}
			}
		}

		return myString;
	}

	@RequestMapping(value = "/file2", method = RequestMethod.POST)
	public @ResponseBody String crunchifySave(@ModelAttribute("uploadForm") UploadTest uploadForm, Model map,
			HttpSession session) throws IllegalStateException, IOException {
		List<MultipartFile> crunchifyFiles = uploadForm.getFiles();

		String myString = "";

		String path = context.getRealPath("/WEB-INF/uploaded/");
		DateFormat df = new SimpleDateFormat("ddMMyyyy_HHmmss");
		String date = df.format(new Date());

		if (null != crunchifyFiles && crunchifyFiles.size() > 0) {
			for (MultipartFile multipartFile : crunchifyFiles) {

				ByteArrayInputStream stream = new ByteArrayInputStream(multipartFile.getBytes());
				String type = multipartFile.getContentType();
				String fileName = multipartFile.getOriginalFilename();
				String fileContent = IOUtils.toString(stream, "UTF-8");
				stream.close();
				if (!"".equalsIgnoreCase(fileName)
						&& (type.equalsIgnoreCase("text/plain") || type.equalsIgnoreCase("application/vnd.ms-excel")
								|| type.equalsIgnoreCase("application/octet-stream"))) {
					File file = new File(path + date + "_" + fileName);
					if (!file.exists()) {
						// multipartFile.transferTo(file);
						try {
							JSONObject result = new JSONObject(new RestServiceUnirest().requestPost(
									this.API_SERVER_PARAMETER + "/PartnersApproval/Upload",
									session.getAttribute("accesskey").toString(),
									new JSONObject().put("record", fileContent).toString()

							));
							myString = result.getString("message");
							// myString = fileContent;
						} catch (Exception e) {
							myString = e.getMessage();
						}

					} else {
						myString = "Failed to upload, file is already exist on the server";
					}

				} else {
					myString = "Type of file is not allowed";
				}
			}
		}

		return myString;
	}

	@RequestMapping(value = "/delImage/{id}", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String delImage(@PathVariable("id") String id, HttpServletRequest req, HttpSession session) {
		token.regenToken(session);
		String file_name = req.getParameter("file_name");
		JSONObject json = new JSONObject(new RestServiceUnirest().requestGet(
				this.API_SERVER_CUST + "/gallery/delete/" + id, session.getAttribute("accesskey").toString()));
		if (json.getString("status").equalsIgnoreCase("success")) {
			try {

				/*
				 * String path = context.getRealPath("/WEB-INF/uploaded/user/");
				 */

				String path = con.getConfigValue("CustomPathImgUpload");
				String path_php = con.getConfigValue("DEL_IMG_PHP");
				File file = new File(path + file_name);
				if (file.exists()) {
					file.delete();
				}
				File file2 = new File(path_php + file_name);
				if (file2.exists()) {
					file2.delete();
				}

				/*
				 * String result = new RestServiceUnirest().requestGet(this.SERVER_PHP+
				 * "/index.php/Gallery/delImage/"+file_name+"/optus2018",
				 * session.getAttribute("accesskey").toString());
				 */
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}

			return json.toString();
		} else {
			return "";
		}

	}

	@RequestMapping(value = "/download/csv/", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String downloadCsv(@ModelAttribute("DisbursementDownload") DisbursementDownload ds,
			HttpSession session) {

		token.regenToken(session);
		String Data = String.join("|", ds.getAcc()).replace("on|", "");

		return new RestServiceUnirest().requestPost(this.API_SERVER_LMS + "/disbursement/download-selected",
				session.getAttribute("accesskey").toString(), new JSONObject().put("record", Data).toString());

	}

	@RequestMapping(value = "/download", method = RequestMethod.POST)
	public ResponseEntity<byte[]> getDownloadData(HttpSession session, HttpServletRequest request) throws Exception {
		token.regenToken(session);
		String data = request.getParameter("record");
		byte[] output = null;

		HttpHeaders responseHeaders = new HttpHeaders();
		if (data != null && data != "") {

			data = data.replaceAll("on,", "").replaceAll(",", "|").toString();

			JSONObject json = new JSONObject(new RestServiceUnirest().requestPost(
					this.API_SERVER_LMS + "/disbursement/generate-autocredit",
					session.getAttribute("accesskey").toString(), new JSONObject().put("record", data).toString()));
			if (json.getString("status").equals("Success")) {

				if (!json.isNull("data")) {

					String resultData = json.getString("data");

					List<String> lineData = Arrays.asList(resultData.split("\\r?\\n"));

					String path_file = context.getRealPath("/WEB-INF/tmp/") + this.SESSION_ID + "_" + this.FILE_NAME;

					XSSFWorkbook workbook = new XSSFWorkbook();
					XSSFSheet sheet = workbook.createSheet("Auto Credit");

					int rowNum = 0;
					System.out.println("Creating excel (disbusement)..");

					for (String num : lineData) {
						Row row = sheet.createRow(rowNum++);
						String[] numItem = num.split(";");
						int colNum = 0;
						for (Integer i = 0; i < numItem.length; i++) {
							Cell cell = row.createCell(colNum++);
							cell.setCellValue(numItem[i]);

						}

					}

					try {
						FileOutputStream outputStream = new FileOutputStream(path_file);
						workbook.write(outputStream);
						workbook.close();
						File objFile = new File(path_file);
						output = Files.readAllBytes(objFile.toPath());
						objFile.delete();

						DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMdd");
						LocalDate localDate = LocalDate.now();

						responseHeaders.set("charset", "utf-8");
						responseHeaders.setContentType(MediaType.valueOf("application/vnd.ms-excel"));
						responseHeaders.setContentLength(output.length);
						responseHeaders.set("Content-disposition",
								"attachment; filename=autocredit_" + dtf.format(localDate) + ".xlsx");

						return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.OK);

					} catch (FileNotFoundException e) {
						return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.NOT_FOUND);
					} catch (IOException e) {
						return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.NOT_FOUND);
					}
				} else {
					return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.NOT_FOUND);
				}

			} else {
				return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.NOT_FOUND);
			}

		} else {
			return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.NOT_FOUND);
		}

	}

}
