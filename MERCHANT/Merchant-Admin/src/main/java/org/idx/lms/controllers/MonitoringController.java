package org.idx.lms.controllers;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.idx.lms.libs.ConfigApps;
import org.idx.lms.libs.LogActivity;
import org.idx.lms.libs.RestServiceUnirest;
import org.idx.lms.libs.TokenRegen;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("Monitoring")
public class MonitoringController {
	private ConfigApps con = new ConfigApps();
	
	private String API_MONITORING = con.getConfigValue("ServerAPI-CHARGING");
	private String API_SYNC = con.getConfigValue("ServerAPI-SYNC");
	private String LOCAL_SERVER = con.getConfigValue("ServerLocal");
	
	@Autowired
	ServletContext context;
	
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
		if (checkSession(session, "lvl_adm_mgt")) {
			token.regenToken(session);
			model.addAttribute("api_server", this.API_MONITORING);
			model.addAttribute("api_server", this.API_MONITORING);
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			return new ModelAndView("MonitoringMainView", model);
		} else {
			return new ModelAndView("redirect:/");
		}

	}
	
	@RequestMapping(value = "/getListReversal", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String getListLocSms(HttpSession session, HttpServletRequest request) {
		token.regenToken(session);
		return new RestServiceUnirest().requestGet(API_MONITORING + "/monitoring/reversal","");

	}
	
	@RequestMapping(value = "/syncpgdkis", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String syncpgdkis(HttpSession session, HttpServletRequest request) {
		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_MONITORING + "/monitoring/dkis","");

	}
	
	@RequestMapping(value = "/syncpg", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String syncpg(HttpSession session, HttpServletRequest request) {
		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_MONITORING + "/monitoring/pg","");

	}
	
	@RequestMapping(value = "/getDataCons", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String getDataCons(HttpSession session, HttpServletRequest request) {
		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_SYNC + "/Configuration/constring","");

	}
	
	@RequestMapping(value = "/testConn", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String testConn(HttpSession session,HttpServletRequest req) {
		token.regenToken(session);
		String x = "";
		String session_id = session.getAttribute("session_id").toString();
		try {
			
			String con_id = req.getParameter("con_id");
			String server = req.getParameter("con_server_location");
			String port = req.getParameter("con_port");
			String database = req.getParameter("con_database_name");
			String userid = req.getParameter("con_userid");
			String password = req.getParameter("con_password");
			String max_pool_size = req.getParameter("con_max_pool_size");
			
			
			JSONObject jData = new JSONObject();
			jData.put("id", con_id);
			jData.put("server", server);
			jData.put("port", port);
			jData.put("database", database);
			jData.put("userid", userid);
			jData.put("password", password);
			jData.put("max_pool_size", max_pool_size);
			jData.put("user", session_id);
			
			JSONObject json = new JSONObject(
					new RestServiceUnirest().requestPost(this.API_SYNC + "/Configuration/testConnectionConstring",
							"", jData.toString()));
			x = json.toString();

		} catch (Exception e) {
			x = e.getMessage();
		}

		return x;
	}
	
	@RequestMapping(value = "/updateCon", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String saveDecisionTable(HttpSession session,HttpServletRequest req) {
		token.regenToken(session);
		String x = "";
		String session_id = session.getAttribute("session_id").toString();
		try {
			
			String con_id = req.getParameter("con_id");
			String server = req.getParameter("con_server_location");
			String port = req.getParameter("con_port");
			String database = req.getParameter("con_database_name");
			String userid = req.getParameter("con_userid");
			String password = req.getParameter("con_password");
			String max_pool_size = req.getParameter("con_max_pool_size");
			
			
			JSONObject jData = new JSONObject();
			jData.put("id", con_id);
			jData.put("server", server);
			jData.put("port", port);
			jData.put("database", database);
			jData.put("userid", userid);
			jData.put("password", password);
			jData.put("max_pool_size", max_pool_size);
			jData.put("user", session_id);
			
			JSONObject jsonZ = new JSONObject(
					new RestServiceUnirest().requestPost(this.API_SYNC + "/Configuration/testConnectionConstring",
							"", jData.toString()));
			
			if(jsonZ.getString("status").equals("Success")) {
				JSONObject log = new JSONObject(new LogActivity().insertLogCore(req, session,"Payment Gateway Config", "Update Connection String", jData.toString()));
				if(log.getBoolean("success")) {
					if(log.getJSONArray("data").length()>0) {
						String id = log.getJSONArray("data").getJSONObject(0).get("resultprocess").toString();
						jData.put("logid", id);
						
						JSONObject json = new JSONObject(
								new RestServiceUnirest().requestPost(this.API_SYNC + "/Configuration/updateConstring",
										"", jData.toString()));
						x = json.toString();
						
					}
				}
			} else {
				x = jsonZ.toString();
			}
			
			
			

		} catch (Exception e) {
			x = e.getMessage();
		}

		return x;
	}
	
		
	@RequestMapping(value = "/createFile/{type}", method = RequestMethod.POST)
	public ResponseEntity<byte[]> createReportXLS(@PathVariable("type") String type, HttpSession session,
			HttpServletRequest request) throws Exception {
		byte[] output = null;

		HttpHeaders responseHeaders = new HttpHeaders();

		String path = context.getRealPath("/WEB-INF/tmp/");
		DateFormat df = new SimpleDateFormat("ddMMyyyy_HHmmss");
		String date = df.format(new Date());

		if (type.equalsIgnoreCase("xlsx")) {
			JSONObject json = new JSONObject(new RestServiceUnirest().requestGet(API_MONITORING + "/monitoring/reversal",""));

			if (json.getString("status").equals("Success")) {

				if (!json.isNull("data")) {

					String path_file = context.getRealPath("/WEB-INF/tmp/") +  "_" + date
							+ "_tmp_report.xlsx";

					XSSFWorkbook workbook = new XSSFWorkbook();
					XSSFSheet sheet = workbook.createSheet("Report Views");

					int rowNum = 0;
					System.out.println("Creating excel (Report)..");
					int headerCount = 0;
					
					JSONArray c = json.getJSONArray("data");
					
					
					for (int i = 0; i < c.length(); i++) {

						JSONObject obj = new JSONObject(c.getJSONObject(i).toString());
						int colNum = 0;
						
						if (i == 0) {
							Row row = sheet.createRow(rowNum++);
							
							Cell cell = row.createCell(colNum++);
							cell.setCellValue("Payment Number");
							cell = row.createCell(colNum++);
							cell.setCellValue("Order ID");
							cell = row.createCell(colNum++);
							cell.setCellValue("Virtual Account");
							cell = row.createCell(colNum++);
							cell.setCellValue("Amount");
							cell = row.createCell(colNum++);
							cell.setCellValue("Request");
							cell = row.createCell(colNum++);
							cell.setCellValue("Reversal Date");
						}
						
						
						
						colNum = 0;
						Row row = sheet.createRow(rowNum++);
						Cell cell = row.createCell(colNum++);
						cell.setCellValue(obj.get("pay_no").toString());
						cell = row.createCell(colNum++);						
						cell.setCellValue(obj.get("pay_order_id").toString());
						cell = row.createCell(colNum++);
						cell.setCellValue(obj.get("pay_va_no").toString());
						cell = row.createCell(colNum++);
						cell.setCellValue(obj.get("pay_amount").toString());
						cell = row.createCell(colNum++);
						cell.setCellValue(obj.get("pay_request").toString());
						cell = row.createCell(colNum++);
						cell.setCellValue(obj.get("pay_date").toString());
						

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
						responseHeaders.setContentType(
								MediaType.valueOf("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"));
						responseHeaders.setContentLength(output.length);
						responseHeaders.set("Content-disposition",
								"attachment; filename=reportview_" + dtf.format(localDate) + ".xlsx");

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

		} else if (type.equalsIgnoreCase("xls")) {
			return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.NOT_FOUND);
		} else {
			return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.NOT_FOUND);
		}

	}
	
	
	
	/*public void regenTokenSync(HttpSession session) {
		try {
			JSONObject jToken = new JSONObject(new RestServiceUnirest()
					.requestToken(this.API_SYNC + "/token", this.ID_TOKEN, this.PASS_TOKEN)
					.toString());
			if (jToken.getBoolean("success")) {
				session.setAttribute("syncaccesskey", jToken.getString("access_token"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}*/
	
}
