package org.idx.lms.controllers;

import java.io.ByteArrayInputStream;
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
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.idx.lms.libs.ConfigApps;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("recontiliation")
public class RecontiliationController
{

	private ConfigApps con = new ConfigApps();
	private String API_NICEPAY = con.getConfigValue("ServerAPI-NICEPAY");
	private String LOCAL_SERVER = con.getConfigValue("ServerLocal");
	TokenRegen token = new TokenRegen();
	@Autowired
	ServletContext context;

	private boolean checkSession(HttpSession session, String level)
	{
		boolean bol = false;
		if (session.getAttribute("accesskey") != null)
		{
			JSONArray jMenu = new JSONArray(session.getAttribute("session_menu").toString());
			for (int i = 0; i < jMenu.length(); i++)
			{
				if (jMenu.getJSONObject(i).getString("ldlmdescription").equals(level))
				{
					bol = true;
				}
			}
		}
		return bol;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView dashboard(ModelMap model, HttpSession session, HttpServletRequest req)
	{

		// if(checkSession(session,"lvl_prm_brc")){
		token.regenToken(session);

		model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());

		return new ModelAndView("RecontiliationView", model);
		// }else{
		// return new ModelAndView("redirect:/");
		// }

	}

	/*
	 * @RequestMapping(value = "/file", method = RequestMethod.POST)
	 * public @ResponseBody String crunchifySave(@ModelAttribute("uploadForm")
	 * UploadTest uploadForm, Model map, HttpSession session) throws
	 * IllegalStateException, IOException {
	 * 
	 * List<MultipartFile> crunchifyFiles = uploadForm.getFiles();
	 * 
	 * String myString = "";
	 * 
	 * String path = context.getRealPath("/WEB-INF/uploaded/"); DateFormat df = new
	 * SimpleDateFormat("ddMMyyyy_HHmmss"); String date = df.format(new Date());
	 * 
	 * if (null != crunchifyFiles && crunchifyFiles.size() > 0) { for (MultipartFile
	 * multipartFile : crunchifyFiles) {
	 * 
	 * ByteArrayInputStream stream = new
	 * ByteArrayInputStream(multipartFile.getBytes()); String type =
	 * multipartFile.getContentType(); String fileName =
	 * multipartFile.getOriginalFilename(); String fileContent =
	 * IOUtils.toString(stream, "UTF-8"); if (!"".equalsIgnoreCase(fileName) &&
	 * (type.equalsIgnoreCase("text/plain") ||
	 * type.equalsIgnoreCase("application/vnd.ms-excel"))) { File file = new
	 * File(path + date + "_" + fileName); if (!file.exists()) { //
	 * multipartFile.transferTo(file); try {
	 * 
	 * myString = fileContent; } catch (Exception e) { myString = e.getMessage(); }
	 * 
	 * } else { myString = "Failed to upload, file is already exist on the server";
	 * }
	 * 
	 * } else { myString = "Type of file is not allowed"; } } }
	 * 
	 * return myString; }
	 */

	@RequestMapping(value = "/file", method = RequestMethod.POST)
	public @ResponseBody String crunchifySave(@ModelAttribute("uploadForm") UploadTest uploadForm, Model map,
			HttpServletRequest req, HttpSession session) throws IllegalStateException, IOException
	{

		List<MultipartFile> crunchifyFiles = uploadForm.getFiles();
		String myString = "";
		String date2 = req.getParameter("date_from");
		String path = context.getRealPath("/WEB-INF/tmp/");
		DateFormat df = new SimpleDateFormat("ddMMyyyy_HHmmss");
		String date = df.format(new Date());

		if (null != crunchifyFiles && crunchifyFiles.size() > 0)
		{
			for (MultipartFile multipartFile : crunchifyFiles)
			{

				String type = multipartFile.getContentType();
				String fileName = multipartFile.getOriginalFilename();
				String strData = "";
				if (!"".equalsIgnoreCase(fileName)
						&& (type.equalsIgnoreCase("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
								|| type.equalsIgnoreCase("application/vnd.ms-excel")
								|| type.equalsIgnoreCase("application/octet-stream")))
				{
					File file = new File(path + date + "_" + fileName);
					if (!file.exists())
					{
						try
						{
							multipartFile.transferTo(file);

							if (type.equalsIgnoreCase("application/vnd.ms-excel"))
							{
								POIFSFileSystem fileSystem = new POIFSFileSystem(new FileInputStream(file));
								HSSFWorkbook workbook = new HSSFWorkbook(fileSystem);
								HSSFSheet sheet = workbook.getSheetAt(0); // Get first Excel Sheet

								// Iterate throw each row.
								Iterator<Row> rows = sheet.rowIterator();
								while (rows.hasNext())
								{
									HSSFRow row = (HSSFRow) rows.next();
									Iterator<Cell> cells = row.cellIterator();
									int count = 0;
									while (cells.hasNext())
									{
										HSSFCell cell = (HSSFCell) cells.next();
										if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC)
										{

											if (count == 6)
											{
												if (cells.hasNext())
												{
													strData += cell.getDateCellValue() + ";";
												} else
												{
													strData += cell.getDateCellValue() + "\r\n";
												}
											} else
											{
												if (cells.hasNext())
												{
													strData += cell.getNumericCellValue() + ";";
												} else
												{
													strData += cell.getNumericCellValue() + "\r\n";
												}
											}

										} else if (cell.getCellType() == Cell.CELL_TYPE_STRING)
										{

											if (cells.hasNext())
											{
												strData += cell.getStringCellValue() + ";";
											} else
											{
												strData += cell.getStringCellValue() + "\r\n";
											}

										}
										count++;
									}
								}
								workbook.close();
								file.delete();
							} else if (type.equalsIgnoreCase(
									"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
							{
								FileInputStream excelFile = new FileInputStream(file);
								Workbook workbook = new XSSFWorkbook(excelFile);
								Sheet datatypeSheet = workbook.getSheetAt(0);
								Iterator<Row> iterator = datatypeSheet.iterator();

								while (iterator.hasNext())
								{

									Row currentRow = iterator.next();
									Iterator<Cell> cellIterator = currentRow.iterator();
									int count = 0;
									while (cellIterator.hasNext())
									{

										Cell currentCell = cellIterator.next();
										// getCellTypeEnum shown as deprecated for version 3.15
										// getCellTypeEnum ill be renamed to getCellType starting from version 4.0
										if (currentCell.getCellTypeEnum() == CellType.STRING)
										{

											if (cellIterator.hasNext())
											{
												strData += currentCell.getStringCellValue() + ";";
											} else
											{
												strData += currentCell.getStringCellValue() + "\r\n";
											}

										} else if (currentCell.getCellTypeEnum() == CellType.NUMERIC)
										{

											if (count == 6)
											{

												if (cellIterator.hasNext())
												{
													strData += currentCell.getDateCellValue() + ";";
												} else
												{
													strData += currentCell.getDateCellValue() + "\r\n";
												}
											} else
											{

												if (cellIterator.hasNext())
												{
													strData += currentCell.getNumericCellValue() + ";";
												} else
												{
													strData += currentCell.getNumericCellValue() + "\r\n";
												}
											}

										}

									}

								}
								workbook.close();
								file.delete();
							} else if (type.equalsIgnoreCase("application/octet-stream"))
							{
								FileInputStream excelFile = new FileInputStream(file);
								Workbook workbook = new XSSFWorkbook(excelFile);
								Sheet datatypeSheet = workbook.getSheetAt(0);
								Iterator<Row> iterator = datatypeSheet.iterator();
								while (iterator.hasNext())
								{
									Row currentRow = iterator.next();
									Iterator<Cell> cellIterator = currentRow.iterator();
									int count = 0;
									while (cellIterator.hasNext())
									{
										Cell currentCell = cellIterator.next();
										if (currentCell.getCellTypeEnum() == CellType.STRING)
										{

											if (cellIterator.hasNext())
											{
												strData += currentCell.getStringCellValue() + ";";
											} else
											{
												strData += currentCell.getStringCellValue() + "\r\n";
											}

										} else if (currentCell.getCellTypeEnum() == CellType.NUMERIC)
										{
											if (count == 6)
											{
												if (cellIterator.hasNext())
												{
													strData += currentCell.getDateCellValue() + ";";
												} else
												{
													strData += currentCell.getDateCellValue() + "\r\n";
												}
												count = 0;
											} else
											{

												if (cellIterator.hasNext())
												{
													strData += currentCell.getNumericCellValue() + ";";
												} else
												{
													strData += currentCell.getNumericCellValue() + "\r\n";
												}
											}

										}

										count++;
									}

								}
								workbook.close();
								file.delete();
							}

							if (!"".equals(strData) && strData != null)
							{
								try
								{
									JSONObject result = new JSONObject(new RestServiceUnirest().sendPost(
											this.API_NICEPAY + "/recon",
											session.getAttribute("accesskey_mid").toString(),
											new JSONObject().put("records", strData).put("date", date2).toString()

									));

									myString = result.toString();

									// myString = result.getString("message");
								} catch (Exception e)
								{
									myString = e.getMessage();
								}
							} else
							{

								myString = "Failed to upload, please check file content";
							}
						} catch (FileNotFoundException e)
						{
							file.delete();
							e.printStackTrace();
							myString = e.getMessage();
						} catch (IOException e)
						{
							file.delete();
							e.printStackTrace();
							myString = e.getMessage();
						}
					} else
					{
						file.delete();
						myString = "Failed to upload, file is already exist on the server";
					}

				} else
				{
					myString = "Type of file is not allowed";
				}
			}
		}

		return myString;
	}

	@RequestMapping(value = "/file/nicepay", method = RequestMethod.POST)
	public @ResponseBody String crunchifySaveNicePay(@ModelAttribute("uploadForm") UploadTest uploadForm, Model map,
			HttpServletRequest req, HttpSession session) throws IllegalStateException, IOException
	{

		List<MultipartFile> crunchifyFiles = uploadForm.getFiles();
		String myString = "";
		String date2 = req.getParameter("date_from");
		String path = context.getRealPath("/WEB-INF/tmp/");
		DateFormat df = new SimpleDateFormat("ddMMyyyy_HHmmss");
		String date = df.format(new Date());

		if (null != crunchifyFiles && crunchifyFiles.size() > 0)
		{
			for (MultipartFile multipartFile : crunchifyFiles)
			{

				String type = multipartFile.getContentType();
				String fileName = multipartFile.getOriginalFilename();
				String strData = "";
				if (!"".equalsIgnoreCase(fileName)
						&& (type.equalsIgnoreCase("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
								|| type.equalsIgnoreCase("application/vnd.ms-excel")
								|| type.equalsIgnoreCase("application/octet-stream")))
				{
					File file = new File(path + date + "_" + fileName);
					if (!file.exists())
					{
						try
						{
							multipartFile.transferTo(file);

							if (type.equalsIgnoreCase("application/vnd.ms-excel"))
							{
								POIFSFileSystem fileSystem = new POIFSFileSystem(new FileInputStream(file));
								HSSFWorkbook workbook = new HSSFWorkbook(fileSystem);
								HSSFSheet sheet = workbook.getSheetAt(0); // Get first Excel Sheet

								// Iterate throw each row.
								Iterator<Row> rows = sheet.rowIterator();
								while (rows.hasNext())
								{
									HSSFRow row = (HSSFRow) rows.next();
									Iterator<Cell> cells = row.cellIterator();
									while (cells.hasNext())
									{
										HSSFCell cell = (HSSFCell) cells.next();
										if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC)
										{

											if (cells.hasNext())
											{
												strData += cell.getNumericCellValue() + ";";
											} else
											{
												strData += cell.getNumericCellValue() + "\r\n";
											}

										} else if (cell.getCellType() == Cell.CELL_TYPE_STRING)
										{

											if (cells.hasNext())
											{
												strData += cell.getStringCellValue() + ";";
											} else
											{
												strData += cell.getStringCellValue() + "\r\n";
											}

										}

									}
								}
								workbook.close();
								file.delete();
							} else if (type.equalsIgnoreCase(
									"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
							{
								FileInputStream excelFile = new FileInputStream(file);
								Workbook workbook = new XSSFWorkbook(excelFile);
								Sheet datatypeSheet = workbook.getSheetAt(0);
								Iterator<Row> iterator = datatypeSheet.iterator();

								while (iterator.hasNext())
								{

									Row currentRow = iterator.next();
									Iterator<Cell> cellIterator = currentRow.iterator();

									while (cellIterator.hasNext())
									{

										Cell currentCell = cellIterator.next();
										// getCellTypeEnum shown as deprecated for version 3.15
										// getCellTypeEnum ill be renamed to getCellType starting from version 4.0
										if (currentCell.getCellTypeEnum() == CellType.STRING)
										{

											if (cellIterator.hasNext())
											{
												strData += currentCell.getStringCellValue() + ";";
											} else
											{
												strData += currentCell.getStringCellValue() + "\r\n";
											}

										} else if (currentCell.getCellTypeEnum() == CellType.NUMERIC)
										{

											if (cellIterator.hasNext())
											{
												strData += currentCell.getNumericCellValue() + ";";
											} else
											{
												strData += currentCell.getNumericCellValue() + "\r\n";
											}

										}

									}

								}
								workbook.close();
								file.delete();
							} else if (type.equalsIgnoreCase("application/octet-stream"))
							{
								FileInputStream excelFile = new FileInputStream(file);
								Workbook workbook = new XSSFWorkbook(excelFile);
								Sheet datatypeSheet = workbook.getSheetAt(0);
								Iterator<Row> iterator = datatypeSheet.iterator();

								while (iterator.hasNext())
								{
									Row currentRow = iterator.next();
									Iterator<Cell> cellIterator = currentRow.iterator();

									while (cellIterator.hasNext())
									{

										Cell currentCell = cellIterator.next();
										// getCellTypeEnum shown as deprecated for version 3.15
										// getCellTypeEnum ill be renamed to getCellType starting from version 4.0
										if (currentCell.getCellTypeEnum() == CellType.STRING)
										{

											if (cellIterator.hasNext())
											{
												strData += currentCell.getStringCellValue() + ";";
											} else
											{
												strData += currentCell.getStringCellValue() + "\r\n";
											}

										} else if (currentCell.getCellTypeEnum() == CellType.NUMERIC)
										{

											if (cellIterator.hasNext())
											{
												strData += currentCell.getNumericCellValue() + ";";
											} else
											{
												strData += currentCell.getNumericCellValue() + "\r\n";
											}

										}

									}

								}
								workbook.close();
								file.delete();
							}

							if (!"".equals(strData) && strData != null)
							{
								try
								{
									JSONObject result = new JSONObject(new RestServiceUnirest().sendPost(
											this.API_NICEPAY + "/nicepayrecon",
											session.getAttribute("accesskey_mid").toString(),
											new JSONObject().put("records", strData).put("date", date2).toString()

									));

									myString = result.toString();

									// myString = result.getString("message");
								} catch (Exception e)
								{
									myString = e.getMessage();
								}
							} else
							{

								myString = "Failed to upload, please check file content";
							}
						} catch (FileNotFoundException e)
						{
							file.delete();
							e.printStackTrace();
							myString = e.getMessage();
						} catch (IOException e)
						{
							file.delete();
							e.printStackTrace();
							myString = e.getMessage();
						}
					} else
					{
						file.delete();
						myString = "Failed to upload, file is already exist on the server";
					}

				} else
				{
					myString = "Type of file is not allowed";
				}
			}
		}

		return myString;
	}

	@RequestMapping(value = "/file/nicepay2", method = RequestMethod.POST)
	public @ResponseBody String crunchifySaveNicePay2(@ModelAttribute("uploadForm") UploadTest uploadForm, Model map,
			HttpServletRequest req, HttpSession session) throws IllegalStateException, IOException
	{

		List<MultipartFile> crunchifyFiles = uploadForm.getFiles();
		String myString = "";
		String date2 = req.getParameter("date_from");
		String path = context.getRealPath("/WEB-INF/tmp/");
		DateFormat df = new SimpleDateFormat("ddMMyyyy_HHmmss");
		String date = df.format(new Date());

		if (null != crunchifyFiles && crunchifyFiles.size() > 0)
		{
			for (MultipartFile multipartFile : crunchifyFiles)
			{

				String type = multipartFile.getContentType();
				String fileName = multipartFile.getOriginalFilename();
				String strData = "";
				if (!"".equalsIgnoreCase(fileName)
						&& (type.equalsIgnoreCase("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
								|| type.equalsIgnoreCase("application/vnd.ms-excel")
								|| type.equalsIgnoreCase("application/octet-stream")))
				{
					File file = new File(path + date + "_" + fileName);
					if (!file.exists())
					{
						try
						{
							multipartFile.transferTo(file);

							if (type.equalsIgnoreCase("application/vnd.ms-excel"))
							{
								POIFSFileSystem fileSystem = new POIFSFileSystem(new FileInputStream(file));
								HSSFWorkbook workbook = new HSSFWorkbook(fileSystem);
								HSSFSheet sheet = workbook.getSheetAt(0); // Get first Excel Sheet

								// Iterate throw each row.
								Iterator<Row> rows = sheet.rowIterator();
								while (rows.hasNext())
								{
									HSSFRow row = (HSSFRow) rows.next();
									Iterator<Cell> cells = row.cellIterator();
									while (cells.hasNext())
									{
										HSSFCell cell = (HSSFCell) cells.next();
										if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC)
										{

											if (cells.hasNext())
											{
												strData += cell.getNumericCellValue() + ";";
											} else
											{
												strData += cell.getNumericCellValue() + "\r\n";
											}

										} else if (cell.getCellType() == Cell.CELL_TYPE_STRING)
										{

											if (cells.hasNext())
											{
												strData += cell.getStringCellValue() + ";";
											} else
											{
												strData += cell.getStringCellValue() + "\r\n";
											}

										}

									}
								}
								workbook.close();
								file.delete();
							} else if (type.equalsIgnoreCase(
									"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
							{
								FileInputStream excelFile = new FileInputStream(file);
								Workbook workbook = new XSSFWorkbook(excelFile);
								Sheet datatypeSheet = workbook.getSheetAt(0);
								Iterator<Row> iterator = datatypeSheet.iterator();

								while (iterator.hasNext())
								{

									Row currentRow = iterator.next();
									Iterator<Cell> cellIterator = currentRow.iterator();

									while (cellIterator.hasNext())
									{

										Cell currentCell = cellIterator.next();
										// getCellTypeEnum shown as deprecated for version 3.15
										// getCellTypeEnum ill be renamed to getCellType starting from version 4.0
										if (currentCell.getCellTypeEnum() == CellType.STRING)
										{

											if (cellIterator.hasNext())
											{
												strData += currentCell.getStringCellValue() + ";";
											} else
											{
												strData += currentCell.getStringCellValue() + "\r\n";
											}

										} else if (currentCell.getCellTypeEnum() == CellType.NUMERIC)
										{

											if (cellIterator.hasNext())
											{
												strData += currentCell.getNumericCellValue() + ";";
											} else
											{
												strData += currentCell.getNumericCellValue() + "\r\n";
											}

										}

									}

								}
								workbook.close();
								file.delete();
							} else if (type.equalsIgnoreCase("application/octet-stream"))
							{
								FileInputStream excelFile = new FileInputStream(file);
								Workbook workbook = new XSSFWorkbook(excelFile);
								Sheet datatypeSheet = workbook.getSheetAt(0);
								Iterator<Row> iterator = datatypeSheet.iterator();

								while (iterator.hasNext())
								{
									Row currentRow = iterator.next();
									Iterator<Cell> cellIterator = currentRow.iterator();

									while (cellIterator.hasNext())
									{

										Cell currentCell = cellIterator.next();
										// getCellTypeEnum shown as deprecated for version 3.15
										// getCellTypeEnum ill be renamed to getCellType starting from version 4.0
										if (currentCell.getCellTypeEnum() == CellType.STRING)
										{

											if (cellIterator.hasNext())
											{
												strData += currentCell.getStringCellValue() + ";";
											} else
											{
												strData += currentCell.getStringCellValue() + "\r\n";
											}

										} else if (currentCell.getCellTypeEnum() == CellType.NUMERIC)
										{

											if (cellIterator.hasNext())
											{
												strData += currentCell.getNumericCellValue() + ";";
											} else
											{
												strData += currentCell.getNumericCellValue() + "\r\n";
											}

										}

									}

								}
								workbook.close();
								file.delete();
							}

							if (!"".equals(strData) && strData != null)
							{
								try
								{
									JSONObject result = new JSONObject(new RestServiceUnirest().sendPost(
											this.API_NICEPAY + "/nicepayrecon",
											session.getAttribute("accesskey_mid").toString(),
											new JSONObject().put("records", strData).put("date", date2).toString()

									));

									myString = result.toString();

									// myString = result.getString("message");
								} catch (Exception e)
								{
									myString = e.getMessage();
								}
							} else
							{

								myString = "Failed to upload, please check file content";
							}
						} catch (FileNotFoundException e)
						{
							file.delete();
							e.printStackTrace();
							myString = e.getMessage();
						} catch (IOException e)
						{
							file.delete();
							e.printStackTrace();
							myString = e.getMessage();
						}
					} else
					{
						file.delete();
						myString = "Failed to upload, file is already exist on the server";
					}

				} else
				{
					myString = "Type of file is not allowed";
				}
			}
		}

		return myString;
	}
}
