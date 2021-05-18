package org.idx.lms.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.idx.lms.libs.ConfigApps;
import org.idx.lms.libs.EncryptDiggest;
import org.idx.lms.libs.LogActivity;
import org.idx.lms.libs.RestServiceUnirest;
import org.idx.lms.libs.TokenRegen;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import com.mashape.unirest.request.HttpRequest;

@Controller
@RequestMapping("system")
public class SystemController {
	private ConfigApps con = new ConfigApps();
	private String API_SERVER = con.getConfigValue("ServerAPI");
	private String API_SERVER_CORE = con.getConfigValue("ServerAPI-CORE");
	private String LOCAL_SERVER = con.getConfigValue("ServerLocal");
	private String API_COLLECTION = con.getConfigValue("ServerAPI-COLLECTION");
	private String API_SERVER_BATCH = con.getConfigValue("ServerAPI-BATCH");
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
	public ModelAndView index(ModelMap model, HttpSession session, HttpServletRequest req) {
		if (checkSession(session, "lvl_adm_sys_con")) {
			model.addAttribute("api_server", this.API_SERVER);
			model.addAttribute("api_server_core", this.API_SERVER_CORE);
			model.addAttribute("api_key", session.getAttribute("accesskey"));
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());

			return new ModelAndView("SystemMainView", model);
		} else {
			return new ModelAndView("redirect:/");
		}

	}

	@RequestMapping(value = "/log", method = RequestMethod.GET)
	public ModelAndView log(ModelMap model, HttpSession session, HttpServletRequest req) {
		if (checkSession(session, "lvl_adm_sys_con")) {
			model.addAttribute("api_server", this.API_SERVER);
			model.addAttribute("api_server_core", this.API_SERVER_CORE);
			model.addAttribute("api_key", session.getAttribute("accesskey"));
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());

			return new ModelAndView("SystemLogMainView", model);
		} else {
			return new ModelAndView("redirect:/");
		}

	}

	@RequestMapping(value = "sync", method = RequestMethod.GET)
	public @ResponseBody String eodReport(HttpSession session) {
		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_SERVER_BATCH + "/sync",
				session.getAttribute("accesskey").toString());

	}

	@RequestMapping(value = "/collection/sync", method = RequestMethod.POST)
	public @ResponseBody String del(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);

		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestPost(this.API_COLLECTION + "/CollectorParameter/RunCollectionParameter",
				session.getAttribute("accesskey").toString(), new JSONObject().put("", "").toString());
	}

	@RequestMapping(value = "/ListJob", method = RequestMethod.GET)
	public @ResponseBody String ListJob(HttpSession session) {
		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_SERVER_CORE + "/System/ListJobETL",
				session.getAttribute("accesskey").toString());

	}

	@RequestMapping(value = "/ListJob/{id}", method = RequestMethod.GET)
	public @ResponseBody String ListJob(@PathVariable("id") String id, HttpSession session) {
		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_SERVER_CORE + "/System/ListJobETL/" + id,
				session.getAttribute("accesskey").toString());

	}

	@RequestMapping(value = "/updateTimeJob", method = RequestMethod.POST)
	public @ResponseBody String updateTimeJob(HttpSession session, HttpServletRequest request) {
		token.regenToken(session);
		EncryptDiggest en = new EncryptDiggest();
		JSONObject jret = new JSONObject();
		try {
			JSONObject jActLog = new JSONObject(new RestServiceUnirest().requestGet(
					this.API_SERVER_CORE + "/login/getPasswordUser/" + session.getAttribute("session_id").toString(),
					session.getAttribute("accesskey").toString()));

			JSONArray jaData = jActLog.getJSONArray("data");
			String password = jaData.getJSONObject(0).getString("uslpassword");
			String ENC_PASSWORD = en.hashing(request.getParameter("pwd").toString());

			if (ENC_PASSWORD.equals(password)) {
				
				
				
				JSONObject jData = new JSONObject();
				jData.put("id", request.getParameter("list_id"));
				jData.put("time", request.getParameter("list_times"));
				jData.put("startby", session.getAttribute("session_id").toString());
				return new RestServiceUnirest().requestPost(this.API_SERVER_CORE + "/System/UpdateTimeJob",
						session.getAttribute("accesskey").toString(), jData.toString());
				

			} else {
				return new JSONObject().put("status", "warning").put("message", "You have entered an invalid password")
						.toString();
			}

		} catch (Exception e) {
			// TODO: handle exception
			return new JSONObject().put("status", "warning").put("message", "Failed to login").toString();
		}
	}

	@RequestMapping(value = "/updateJob", method = RequestMethod.POST)
	public @ResponseBody String updateJob(HttpSession session, HttpServletRequest request) {

		token.regenToken(session);
		EncryptDiggest en = new EncryptDiggest();
		JSONObject jret = new JSONObject();
		try {
			JSONObject jActLog = new JSONObject(new RestServiceUnirest().requestGet(
					this.API_SERVER_CORE + "/login/getPasswordUser/" + session.getAttribute("session_id").toString(),
					session.getAttribute("accesskey").toString()));

			JSONArray jaData = jActLog.getJSONArray("data");
			String password = jaData.getJSONObject(0).getString("uslpassword");
			String ENC_PASSWORD = en.hashing(request.getParameter("pwd").toString());

			if (ENC_PASSWORD.equals(password)) {

				JSONObject jData = new JSONObject();
				jData.put("pid", request.getParameter("pid"));
				jData.put("startby", session.getAttribute("session_id").toString());
				return new RestServiceUnirest().requestPost(this.API_SERVER_CORE + "/System/QueueToRun",
						session.getAttribute("accesskey").toString(), jData.toString());
			} else {
				return new JSONObject().put("status", "warning").put("message", "You have entered an invalid password")
						.toString();
			}

		} catch (Exception e) {
			// TODO: handle exception
			return new JSONObject().put("status", "warning").put("message", "Failed to login").toString();
		}

	}

	@RequestMapping(value = "/listLogJob", method = RequestMethod.POST)
	public @ResponseBody String listLogJob(HttpSession session, HttpServletRequest request) {
		token.regenToken(session);

		JSONObject jData = new JSONObject();
		jData.put("from", request.getParameter("date_from").toString());
		jData.put("to", request.getParameter("date_to").toString());
		jData.put("job", request.getParameter("job").toString());
		return new RestServiceUnirest().requestPost(this.API_SERVER_CORE + "/System/ListLogJob",
				session.getAttribute("accesskey").toString(), jData.toString());

	}
	
	
	
	
	
	

	@RequestMapping(value = "/listLogJob/{id}", method = RequestMethod.GET)
	public @ResponseBody String listLogJob(@PathVariable("id") String id, HttpSession session,
			HttpServletRequest request) {

		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_SERVER_CORE + "/System/ListLogJob/" + id,
				session.getAttribute("accesskey").toString());

	}

	@RequestMapping(value = "/notif/receiver/{id}", method = RequestMethod.GET)
	public @ResponseBody String notifreceiver(@PathVariable("id") String id, HttpSession session,
			HttpServletRequest request) {

		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_SERVER_CORE + "/System/Notif/Receiver/" + id,
				session.getAttribute("accesskey").toString());

	}

	@RequestMapping(value = "/notif/sender/{id}", method = RequestMethod.GET)
	public @ResponseBody String notifsender(@PathVariable("id") String id, HttpSession session,
			HttpServletRequest request) {

		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_SERVER_CORE + "/System/Notif/Sender/" + id,
				session.getAttribute("accesskey").toString());

	}

	@RequestMapping(value = "/dopost/sender", method = RequestMethod.POST)
	public @ResponseBody String notifsender(HttpSession session, HttpServletRequest request) {

		token.regenToken(session);
		EncryptDiggest en = new EncryptDiggest();
		JSONObject jret = new JSONObject();
		try {
			JSONObject jActLog = new JSONObject(new RestServiceUnirest().requestGet(
					this.API_SERVER_CORE + "/login/getPasswordUser/" + session.getAttribute("session_id").toString(),
					session.getAttribute("accesskey").toString()));

			JSONArray jaData = jActLog.getJSONArray("data");
			String password = jaData.getJSONObject(0).getString("uslpassword");
			String ENC_PASSWORD = en.hashing(request.getParameter("pwd").toString());

			if (ENC_PASSWORD.equals(password)) {
				JSONObject jData = new JSONObject();
				jData.put("id", (request.getParameter("sender_id") != "") ? request.getParameter("sender_id") : 0);
				jData.put("port", request.getParameter("sender_port"));
				jData.put("domain", request.getParameter("sender_domain"));
				if (request.getParameter("sender_authentication") != null) {
					jData.put("auth", true);
				} else {
					jData.put("auth", false);
				}

				jData.put("username", request.getParameter("sender_username"));
				jData.put("password", request.getParameter("sender_password"));
				jData.put("email", request.getParameter("sender_email"));

				return new RestServiceUnirest().requestPost(this.API_SERVER_CORE + "/System/Notif/Sender/",
						session.getAttribute("accesskey").toString(), jData.toString());
			} else {
				return new JSONObject().put("status", "warning").put("message", "You have entered an invalid password")
						.toString();
			}
		} catch (Exception e) {
			// TODO: handle exception
			return new JSONObject().put("status", "warning").put("message", "Failed to saving").toString();

		}

	}

	@RequestMapping(value = "/dopost/receiver", method = RequestMethod.POST)
	public @ResponseBody String notifreciver(HttpSession session, HttpServletRequest request) {

		token.regenToken(session);
		EncryptDiggest en = new EncryptDiggest();
		JSONObject jret = new JSONObject();
		try {
			JSONObject jActLog = new JSONObject(new RestServiceUnirest().requestGet(
					this.API_SERVER_CORE + "/login/getPasswordUser/" + session.getAttribute("session_id").toString(),
					session.getAttribute("accesskey").toString()));

			JSONArray jaData = jActLog.getJSONArray("data");
			String password = jaData.getJSONObject(0).getString("uslpassword");
			String ENC_PASSWORD = en.hashing(request.getParameter("pwd").toString());

			if (ENC_PASSWORD.equals(password)) {
				JSONObject jData = new JSONObject();
				jData.put("id", request.getParameter("receiver_id"));
				jData.put("email", request.getParameter("receiver_email"));

				return new RestServiceUnirest().requestPost(this.API_SERVER_CORE + "/System/Notif/Receiver/",
						session.getAttribute("accesskey").toString(), jData.toString());
			} else {
				return new JSONObject().put("status", "warning").put("message", "You have entered an invalid password")
						.toString();
			}
		} catch (Exception e) {
			// TODO: handle exception
			return new JSONObject().put("status", "warning").put("message", "Failed to saving").toString();

		}

	}
	
	@RequestMapping(value = "/ListGlobalConfig", method = RequestMethod.GET)
	public @ResponseBody String ListGlobalConfig(HttpSession session) {
		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_SERVER_CORE + "/Global/config/list",
				session.getAttribute("accesskey").toString());

	}
	
	@RequestMapping(value = "/DetailGlobalConfig/{code}", method = RequestMethod.GET)
	public @ResponseBody String DetailGlobalConfigByCode(@PathVariable("code") String code, HttpSession session,
			HttpServletRequest request) {

		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_SERVER_CORE + "/Global/config/detail/" + code,
				session.getAttribute("accesskey").toString());

	}
	
	@RequestMapping(value = "/updateGlobalConfig", method = RequestMethod.POST)
	public @ResponseBody String updateGlobalConf(HttpSession session, HttpServletRequest request) {

		token.regenToken(session);
		EncryptDiggest en = new EncryptDiggest();
		JSONObject jret = new JSONObject();
		try {
			JSONObject jActLog = new JSONObject(new RestServiceUnirest().requestGet(
					this.API_SERVER_CORE + "/login/getPasswordUser/" + session.getAttribute("session_id").toString(),
					session.getAttribute("accesskey").toString()));

			JSONArray jaData = jActLog.getJSONArray("data");
			String password = jaData.getJSONObject(0).getString("uslpassword");
			String ENC_PASSWORD = en.hashing(request.getParameter("pwd").toString());

			if (ENC_PASSWORD.equals(password)) {
				JSONObject jData = new JSONObject();
				JSONObject log = new JSONObject(new LogActivity().insertLogCore(request, session, "GlobalConfig", "Update Global Config", jData.toString()));
				if(log.getBoolean("success")){
					if(log.getJSONArray("data").length()>0){
						String idz = log.getJSONArray("data").getJSONObject(0).get("resultprocess").toString();
						
						jData.put("code", request.getParameter("glc_code"));
						jData.put("value", request.getParameter("glc_value"));
						jData.put("usr", session.getAttribute("session_id").toString());
						jData.put("logid", idz);

						return new RestServiceUnirest().requestPost(this.API_SERVER_CORE + "/Global/config/update/",
								session.getAttribute("accesskey").toString(), jData.toString());
					}else{
						return new JSONObject().put("status", "Failed").put("message","Failed to get log").toString();
					}
				}else{
					return new JSONObject().put("status", "Failed").put("message","Failed to get log").toString();
				}
				
			} else {
				return new JSONObject().put("status", "warning").put("message", "You have entered an invalid password")
						.toString();
			}
		} catch (Exception e) {
			// TODO: handle exception
			return new JSONObject().put("status", "warning").put("message", "Failed to saving").toString();

		}

	}
}
