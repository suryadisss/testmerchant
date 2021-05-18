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
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
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
import org.idx.lms.model.inquiry.InquiryItem;
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
@RequestMapping("version")
public class VersionController {
	private ConfigApps con = new ConfigApps();
	private String LOCAL_SERVER = con.getConfigValue("ServerLocal");
	private String API_VERSION = con.getConfigValue("ServerAPI-VERSION");
	private String IMG_PATH = con.getConfigValue("CustomPathVersion");
	private String URL_IMG = con.getConfigValue("URL_ACCESS_IMG");
	private String URL_VERSION = con.getConfigValue("PATERN_URL_VERSION");

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
	public ModelAndView main(ModelMap model, HttpSession session, @ModelAttribute("InquiryItem") InquiryItem inq,
			HttpServletRequest req) {
		 if (checkSession(session, "lvl_adm_version")) {
		token.regenToken(session);
		model.addAttribute("id", session.getAttribute("session_id").toString());
		model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
		return new ModelAndView("VersionMainView", model);

		 } else {
		 return new ModelAndView("redirect:/");
	 }

	}

	@RequestMapping(value = "/getapp/{id}", method = RequestMethod.GET)
	public @ResponseBody String main(@PathVariable("id") String id, HttpSession session, HttpServletRequest req) {
		return new RestServiceUnirest().requestGet(this.API_VERSION + "/version/GetApp/" + id,
				session.getAttribute("accesskey").toString());
	}

	@RequestMapping(value = "/getapplistdet/{id}", method = RequestMethod.GET)
	public @ResponseBody String getapplistdet(@PathVariable("id") String id, HttpSession session,
			HttpServletRequest req) {
		return new RestServiceUnirest().requestGet(this.API_VERSION + "/version/GetAppDetail/" + id,
				session.getAttribute("accesskey").toString());
	}

	@RequestMapping(value = "/getapplistdetbyid/{id}", method = RequestMethod.GET)
	public @ResponseBody String getapplistdetbyid(@PathVariable("id") String id, HttpSession session,
			HttpServletRequest req) {
		return new RestServiceUnirest().requestGet(this.API_VERSION + "/version/GetAppDetailById/" + id,
				session.getAttribute("accesskey").toString());
	}

	@RequestMapping(value = "/getapptype", method = RequestMethod.GET)
	public @ResponseBody String getapptype(HttpSession session, HttpServletRequest req) {
		return new RestServiceUnirest().requestGet(this.API_VERSION + "/version/GetAppType",
				session.getAttribute("accesskey").toString());
	}

	@RequestMapping(value = "/getappstatus", method = RequestMethod.GET)
	public @ResponseBody String getapplistdet(HttpSession session, HttpServletRequest req) {
		return new RestServiceUnirest().requestGet(this.API_VERSION + "/version/GetAppStatus",
				session.getAttribute("accesskey").toString());
	}

	@RequestMapping(value = "/getversiontext/{id}", method = RequestMethod.GET)
	public @ResponseBody String getversion(@PathVariable("id") String id, HttpSession session, HttpServletRequest req) {
		return new RestServiceUnirest().requestGet(this.API_VERSION + "/version/GetLastVersionApp/" + id,
				session.getAttribute("accesskey").toString());
	}

	@RequestMapping(value = "/delappdet", method = RequestMethod.POST)
	public @ResponseBody String delappdet(HttpSession session, HttpServletRequest req) {
		String id = req.getParameter("id");
		return new RestServiceUnirest().requestPost(this.API_VERSION + "/version/DeleteAppDetail",
				session.getAttribute("accesskey").toString(), new JSONObject().put("p_id", id).toString());
	}

	@RequestMapping(value = "/dopost", method = RequestMethod.POST)
	public @ResponseBody String crunchifySavePayroll(@ModelAttribute("uploadForm") UploadTest uploadForm, Model map,
			HttpSession session, HttpServletRequest req)
			throws IllegalStateException, IOException, InvalidFormatException {

		List<MultipartFile> crunchifyFiles = uploadForm.getFiles();

		String myString = "";

		String path = context.getRealPath("/WEB-INF/tmp/");
		DateFormat df = new SimpleDateFormat("ddMMyyyy_HHmmss");
		String date = df.format(new Date());
		String new_edit_status = req.getParameter("new_edit_status");

		String keepoldfile = req.getParameter("oldfile");

		keepoldfile = (keepoldfile == "-") ? null : keepoldfile;
		
		String user_id = session.getAttribute("session_id").toString();

		String[] apps = req.getParameterValues("apptype");
		JSONObject jData = new JSONObject();
		jData.put("p_app_id", req.getParameter("app_id"));
		if(new_edit_status.equalsIgnoreCase("New")) {
			jData.put("p_app_status", req.getParameter("status"));
		}else {
			jData.put("p_app_status", req.getParameter("status_hid"));
		}
		
		jData.put("p_app_desc", req.getParameter("descs"));
		jData.put("p_apps", String.join(", ", apps));
		jData.put("p_user", user_id);
		jData.put("p_subject", req.getParameter("apd_subject"));
		if (null != crunchifyFiles && crunchifyFiles.size() > 0) {
			for (MultipartFile multipartFile : crunchifyFiles) {
				String type = multipartFile.getContentType();
				String fileName = multipartFile.getOriginalFilename();
				long fileSize = multipartFile.getSize();
				fileName = fileName.replaceAll("\\s+", "_");
				if (!"".equalsIgnoreCase(fileName) && fileSize != 0) {
					File file = new File(IMG_PATH + fileName);
					if (!file.exists()) {
						try {
							
							multipartFile.transferTo(file);
							file.setReadable(true, false);
							file.setExecutable(true, false);
							file.setWritable(true, false);
							if (new_edit_status.equalsIgnoreCase("New")) {
								jData.put("p_app_file", URL_IMG + URL_VERSION + fileName);

								myString = new RestServiceUnirest().requestPost(
										this.API_VERSION + "/version/AddVersionDetail",
										session.getAttribute("accesskey").toString(), jData.toString());
							} else if (new_edit_status.equalsIgnoreCase("Edit")) {
								jData.put("p_id", req.getParameter("detid"));
								if (keepoldfile == null) {
									jData.put("p_app_file", URL_IMG + URL_VERSION + fileName);
								} else {
									jData.put("p_app_file", keepoldfile);
								}

								myString = new RestServiceUnirest().requestPost(
										this.API_VERSION + "/version/EditVersionDetail",
										session.getAttribute("accesskey").toString(), jData.toString());
							}

						} catch (FileNotFoundException e) {

							e.printStackTrace();
							myString = e.getMessage();
						} catch (IOException e) {
							e.printStackTrace();
							myString = e.getMessage();
						}

					} else {
						myString = "{ \"status\":\"Error\" ,\"message\":\"File already exist\" }";
					}
				} else {
					if (new_edit_status.equalsIgnoreCase("New")) {
						jData.put("p_app_file", "-");
						myString = new RestServiceUnirest().requestPost(this.API_VERSION + "/version/AddVersionDetail",
								session.getAttribute("accesskey").toString(), jData.toString());

					} else if (new_edit_status.equalsIgnoreCase("Edit")) {
						jData.put("p_id", req.getParameter("detid"));
						if(keepoldfile != null) {
							jData.put("p_app_file", keepoldfile);
						}else {
							jData.put("p_app_file","-");
						}
						

						myString = new RestServiceUnirest().requestPost(this.API_VERSION + "/version/EditVersionDetail",
								session.getAttribute("accesskey").toString(), jData.toString());
					}

				}

			}
		}

		return myString;
	}
}
