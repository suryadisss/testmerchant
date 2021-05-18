package org.idx.lms.controllers;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.idx.lms.libs.ConfigApps;
import org.idx.lms.libs.RestServiceUnirest;
import org.idx.lms.libs.TokenRegen;
import org.idx.lms.model.UploadTest;
import org.idx.lms.model.scorecard.ScorecardItem;
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
@RequestMapping("print_doc")
public class PrintController {

	@Autowired
	ServletContext context;

	private ConfigApps con = new ConfigApps();
	private String API_SERVER = con.getConfigValue("ServerAPI");
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

	@RequestMapping(value = "/{id}/{booking_code}", method = RequestMethod.GET)
	public ModelAndView print(@PathVariable("id") String id, @PathVariable("booking_code") String booking_code,
			ModelMap model, HttpSession session, HttpServletRequest req) {
		if (checkSession(session, "lvl_act_kc")) {
			token.regenToken(session);
			model.addAttribute("api_server", this.API_SERVER);
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			model.addAttribute("id", id);
			byte[] decodedBytes = Base64.getDecoder().decode(id);
			model.addAttribute("rshid", new String(decodedBytes));
			model.addAttribute("name", session.getAttribute("usrname").toString());
			model.addAttribute("booking_code", booking_code);
			return new ModelAndView("PrintChoice", model);
		} else {
			return new ModelAndView("redirect:/");
		}

	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ModelAndView print(@PathVariable("id") String id,
			ModelMap model, HttpSession session, HttpServletRequest req) {
		if (checkSession(session, "lvl_act_kc")) {
			token.regenToken(session);
			model.addAttribute("api_server", this.API_SERVER);
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			model.addAttribute("id", id);
			byte[] decodedBytes = Base64.getDecoder().decode(id);
			model.addAttribute("rshid", new String(decodedBytes));
			model.addAttribute("name", session.getAttribute("usrname").toString());
			model.addAttribute("booking_code", "");
			return new ModelAndView("print_doc_surat_pernyataan_lockback", model);
		} else {
			return new ModelAndView("redirect:/");
		}

	}
	


	@RequestMapping(value = "/{id}/sp/{booking_code}", method = RequestMethod.GET)
	public ModelAndView student(@PathVariable("id") String id, @PathVariable("booking_code") String booking_code,
			ModelMap model, HttpSession session, HttpServletRequest req) {
		if (checkSession(session, "lvl_act_kc")) {
			token.regenToken(session);
			model.addAttribute("api_server", this.API_SERVER);
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			model.addAttribute("id", id);
			byte[] decodedBytes = Base64.getDecoder().decode(id);
			model.addAttribute("rshid", new String(decodedBytes));
			model.addAttribute("name", session.getAttribute("usrname").toString());
			model.addAttribute("booking_code", booking_code);
			return new ModelAndView("PrintDoc", model);
		} else {
			return new ModelAndView("redirect:/");
		}
	}
	
	@RequestMapping(value = "/{id}/surat_pernyataan/{booking_code}", method = RequestMethod.GET)
	public ModelAndView surat_pernyataan(@PathVariable("id") String id,@PathVariable("booking_code") String booking_code,
			ModelMap model, HttpSession session, HttpServletRequest req) {
		if (checkSession(session, "lvl_act_kc")) {
			token.regenToken(session);
			model.addAttribute("api_server", this.API_SERVER);
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			model.addAttribute("id", id);
			byte[] decodedBytes = Base64.getDecoder().decode(id);
			model.addAttribute("rshid", new String(decodedBytes));
			model.addAttribute("name", session.getAttribute("usrname").toString());
			model.addAttribute("booking_code", booking_code);
			return new ModelAndView("Print_doc_surat_pernyataan", model);
		} else {
			return new ModelAndView("redirect:/");
		}
	}
	
	
	

	@RequestMapping(value = "/{id}/spb/{booking_code}", method = RequestMethod.GET)
	public ModelAndView spb(@PathVariable("id") String id, @PathVariable("booking_code") String booking_code,
			ModelMap model, HttpSession session, HttpServletRequest req) {
		if (checkSession(session, "lvl_act_kc")) {
			token.regenToken(session);
			model.addAttribute("api_server", this.API_SERVER);
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			model.addAttribute("id", id);
			byte[] decodedBytes = Base64.getDecoder().decode(id);
			model.addAttribute("rshid", new String(decodedBytes));
			model.addAttribute("name", session.getAttribute("usrname").toString());
			model.addAttribute("booking_code", booking_code);
			return new ModelAndView("PrintDoc2", model);
		} else {
			return new ModelAndView("redirect:/");
		}

	}
	@RequestMapping(value = "/{id}/parse", method = RequestMethod.GET)
	public @ResponseBody String parse(@PathVariable("id") String id, HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_SERVER + "/parse/history/"+id,
				session.getAttribute("accesskey").toString());
	}


	@RequestMapping(value = "/{id}/temp", method = RequestMethod.GET)
	public @ResponseBody String gettemp(@PathVariable("id") String id, HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		return new RestServiceUnirest().requestPost(this.API_SERVER + "/kinicintaku/ttable",
				session.getAttribute("accesskey").toString(), new JSONObject().put("rsh_id", id).toString());
	}

	@RequestMapping(value = "/{id}/product/{booking_code}", method = RequestMethod.GET)
	public @ResponseBody String gettemp(@PathVariable("id") String id,
			@PathVariable("booking_code") String booking_code, 
			HttpSession session,
			HttpServletRequest req) {
		token.regenToken(session);
		return new RestServiceUnirest().requestPost(this.API_SERVER + "/ProductPurchase/GetProduct",
				session.getAttribute("accesskey").toString(), new JSONObject().put("bookingcode", booking_code).put("branchcode", session.getAttribute("branchcode").toString()).toString());
		
	}

	@RequestMapping(value = "/file/{id}/{type}", method = RequestMethod.POST)
	public @ResponseBody String crunchifySave(@PathVariable("id") String id, @PathVariable("type") String typ,
			@ModelAttribute("uploadForm") UploadTest uploadForm, Model map, HttpServletRequest req,

			HttpSession session) throws IllegalStateException, IOException {
		token.regenToken(session);
		List<MultipartFile> crunchifyFiles = uploadForm.getFiles();

		String myString = "";

		String path = context.getRealPath("/WEB-INF/uploaded/spb/");
		DateFormat df = new SimpleDateFormat("ddMMyyyy_HHmmss");
		String date = df.format(new Date());

		if (null != crunchifyFiles && crunchifyFiles.size() > 0) {
			for (MultipartFile multipartFile : crunchifyFiles) {

				String fileName = id + "_" + typ + "_" + date + "_" + multipartFile.getOriginalFilename();
				if (!"".equalsIgnoreCase(fileName)) {
					File file = new File(path + fileName);
					if (!file.exists()) {
						//
						String path_http = this.LOCAL_SERVER + req.getContextPath() + "/resourcesimage/uploaded/spb/";
						try {
							multipartFile.transferTo(file);
							String ipb = (typ == "ipb") ? "ipb" : "pb";
							if (ipb == "ipb") {
								JSONObject json = new JSONObject(new RestServiceUnirest().requestPost(
										this.API_SERVER + "/kinicintaku/update",
										session.getAttribute("accesskey").toString(),
										new JSONObject().put("rsh_id", Integer.parseInt(id)).put("c_ipb_img", path_http+fileName).toString()));
								if (json.getString("status").equals("Success")) {
									myString = "Success";
									
								} else {
									myString = "Failed";
									file.delete();
								}
							} else {
								JSONObject json = new JSONObject(new RestServiceUnirest().requestPost(
										this.API_SERVER + "/kinicintaku/update",
										session.getAttribute("accesskey").toString(),
										new JSONObject().put("rsh_id", Integer.parseInt(id)).put("c_pk_img",  path_http+fileName).toString()));
								if (json.getString("status").equals("Success")) {
									myString = "Success";
								} else {
									myString = "Failed";
									file.delete();
								}
							}

							
						} catch (Exception e) {
							myString = e.getMessage();
							file.delete();
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

}
