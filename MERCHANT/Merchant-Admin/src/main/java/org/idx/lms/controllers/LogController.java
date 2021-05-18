package org.idx.lms.controllers;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.idx.lms.libs.ConfigApps;
import org.idx.lms.libs.EncryptDiggest;
import org.idx.lms.libs.LibsGeneral;
import org.idx.lms.libs.RestServiceUnirest;
import org.idx.lms.libs.TokenRegen;
import org.idx.lms.model.DatePost;
import org.idx.lms.model.user.PostUser;
import org.idx.lms.model.user.userManagement;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;

@Controller
@RequestMapping("AuditTrail")
public class LogController {
	// lConn dbConn = new lConn();
	private ConfigApps con = new ConfigApps();
	//private String API_PARAMETER = con.getConfigValue("ServerAPI-PARAMETER");
	private String API_LOGS = con.getConfigValue("ServerAPI-LOG");
	private String API_SERVER = con.getConfigValue("ServerAPI");
	private String API_SERVER_CORE = con.getConfigValue("ServerAPI-CORE");
	private String LOCAL_SERVER = con.getConfigValue("ServerLocal");
	private String DEFAULT_PASSWORD = con.getConfigValue("DeafaulPasswordNewUser");
	private String SESSION_ID = "";
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
	public ModelAndView main(ModelMap model, HttpSession session, HttpServletRequest req
			) {
		if (checkSession(session, "lvl_adm_mgt")) {
			token.regenToken(session);
			//this.SESSION_ID = session.getAttribute("session_id").toString();

			//model.addAttribute("API_SERVER_CORE", this.API_SERVER_CORE);
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			//model.addAttribute("session_id", this.SESSION_ID);
			return new ModelAndView("AuditTrail", model);

		} else {
			return new ModelAndView("redirect:/");
		}

	}
	
	// /nd dibawah ini untuk menu baru di ops "Audit"
	@RequestMapping(value = "/nd",method = RequestMethod.GET)
	public ModelAndView Audit2(ModelMap model, HttpSession session, HttpServletRequest req
			) {
		if (checkSession(session, "lvl_adm_mgt_nd")) {
			token.regenToken(session);
			//this.SESSION_ID = session.getAttribute("session_id").toString();

			//model.addAttribute("API_SERVER_CORE", this.API_SERVER_CORE);
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			//model.addAttribute("session_id", this.SESSION_ID);
			return new ModelAndView("AuditTrailMenuAudit", model);

		} else {
			return new ModelAndView("redirect:/");
		}

	}
	
	@RequestMapping(value = "/list", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String submitSimulation( HttpSession session,
			HttpServletRequest request) {
		token.regenToken(session);
		String v_users = request.getParameter("p_user").toString();
		String v_code = request.getParameter("p_code").toString();
		String v_form = request.getParameter("txtform").toString();
		String v_to = request.getParameter("txtto").toString();
		String x = "";
		try {

				JSONObject jData = new JSONObject();
			
				jData.put("val_users", v_users);
				jData.put("val_code", v_code);
				jData.put("val_form", v_form);
				jData.put("val_to", v_to);
				
				JSONObject json = new JSONObject(
						new RestServiceUnirest().requestPost(this.API_LOGS + "/audit/list_log",
								session.getAttribute("accesskey").toString(), jData.toString()));

				x = json.toString();
		} catch (Exception e) {
			x = e.getMessage();
		}

		return x;

	}
	
	@RequestMapping(value = "/view_detail/{id}/{code}", method = RequestMethod.GET)
	public @ResponseBody String getListOfAccessLevel(@PathVariable("id")String id,@PathVariable("code")String code,HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestGet(this.API_LOGS + "/audit/view_detail/"+id +"/" +code,
				session.getAttribute("accesskey").toString());

	}
	
	@RequestMapping(value = "/list_user", method = RequestMethod.GET)
	public @ResponseBody String list_group(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestGet(this.API_LOGS + "/audit/list_name_user",
				session.getAttribute("accesskey").toString());

	}
	
	@RequestMapping(value = "/list_modul", method = RequestMethod.GET)
	public @ResponseBody String list_modul(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestGet(this.API_LOGS + "/audit/list_modul",
				session.getAttribute("accesskey").toString());

	}

}
