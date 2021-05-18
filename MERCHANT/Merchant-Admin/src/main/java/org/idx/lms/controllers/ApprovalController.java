package org.idx.lms.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.idx.lms.libs.ConfigApps;
import org.idx.lms.libs.RestServiceUnirest;
import org.idx.lms.libs.TokenRegen;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("approval_information")
public class ApprovalController {
	private ConfigApps con = new ConfigApps();
	private String API_SERVER = con.getConfigValue("ServerAPI");
	private String API_SERVER_CORE = con.getConfigValue("ServerAPI-CORE");
	private String API_SERVER_CUST = con.getConfigValue("ServerAPI-CUST");
	private String LOCAL_SERVER = con.getConfigValue("ServerLocal");
	private String SERVER_IMG = con.getConfigValue("URL_ACCESS_IMG");
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
	public ModelAndView dashboard(ModelMap model, HttpSession session, HttpServletRequest req) {

		if (checkSession(session, "lvl_act_app_in")) {

			token.regenToken(session);
			this.SESSION_ID = session.getAttribute("session_id").toString();
			model.addAttribute("api_server", this.API_SERVER);
			model.addAttribute("api_server_core", this.API_SERVER_CORE);
			model.addAttribute("api_key", session.getAttribute("accesskey"));
			model.addAttribute("SERVER_IMG", this.SERVER_IMG);

			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			return new ModelAndView("ApprovalInformationMainView", model);

		} else {
			return new ModelAndView("redirect:/");
		}

	}

	@RequestMapping(value = "/getCustInfo/{key}", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String getCustInfo(@PathVariable("key") String key, HttpSession session,
			HttpServletRequest request) {
		token.regenToken(session);
		String email = request.getParameter("email");
		return new RestServiceUnirest().requestPost(this.API_SERVER_CUST + "/customer/detail",
				session.getAttribute("accesskey").toString(),
				new JSONObject().put("key", key).put("val", email).toString());

	}

	@RequestMapping(value = "/approve", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String approve(HttpSession session, HttpServletRequest request) {
		token.regenToken(session);
		String cif = request.getParameter("approve_cif");

		JSONObject jData = new JSONObject(new RestServiceUnirest().requestPost(this.API_SERVER_CUST + "/customer/updatecustinfopublictemp/Approve",
				session.getAttribute("accesskey").toString(), new JSONObject().put("cif", cif).put("usr", session.getAttribute("session_id").toString()).toString()));
		return jData.toString();

	}

	@RequestMapping(value = "/list_detail/{cif}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String list_detail(@PathVariable("cif") String cif, HttpSession session,
			HttpServletRequest request) {
		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_SERVER_CUST + "/customer/listVerification/" + cif,
				session.getAttribute("accesskey").toString());

	}

	@RequestMapping(value = "/list_detail", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String list_detail(HttpSession session, HttpServletRequest request) {
		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_SERVER_CUST + "/customer/listVerification",
				session.getAttribute("accesskey").toString());

	}

	@RequestMapping(value = "/decline", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String decline(HttpSession session, HttpServletRequest request) {
		token.regenToken(session);
		String cif = request.getParameter("decline_cif");
		String note = request.getParameter("decline_note");

		return new RestServiceUnirest().requestPost(this.API_SERVER_CUST + "/customer/updatecustinfopublictemp/decline",
				session.getAttribute("accesskey").toString(), new JSONObject().put("cif", cif).put("notes", note).put("usr", session.getAttribute("session_id").toString()).toString());

	}

}
