package org.idx.lms.controllers;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.idx.lms.libs.ConfigApps;
import org.idx.lms.libs.LogActivity;
import org.idx.lms.libs.RestServiceUnirest;
import org.idx.lms.libs.TokenRegen;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("PartnersGroup")
public class PartnersGroupController {

	private ConfigApps con = new ConfigApps();
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
		 if (checkSession(session, "lvl_prm_prt_grp")) {
		token.regenToken(session);

		model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
		return new ModelAndView("PartnersGroupMainView", model);
		 } else {
		 return new ModelAndView("redirect:/");
		 }
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public @ResponseBody String list(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);

		return new RestServiceUnirest().requestGet(this.API_PARAMETER + "/PartnersGroup/ReadActive/",
				session.getAttribute("accesskey").toString());
	}

	@RequestMapping(value = "/list/{id}", method = RequestMethod.GET)
	public @ResponseBody String listid(@PathVariable("id") String id, HttpSession session, HttpServletRequest req) {
		token.regenToken(session);

		return new RestServiceUnirest().requestGet(this.API_PARAMETER + "/PartnersGroup/ReadActive/" + id,
				session.getAttribute("accesskey").toString());
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public @ResponseBody String delete(@PathVariable("id") String id, HttpSession session, HttpServletRequest req) {
		token.regenToken(session);

		JSONObject jData = new JSONObject();
		jData.put("grp_alias", id);
		return new RestServiceUnirest().requestPost(this.API_PARAMETER + "/PartnersGroup/Delete",
				session.getAttribute("accesskey").toString(), jData.toString());

	}

	@RequestMapping(value = "/dopost", method = RequestMethod.POST)
	public @ResponseBody String dopost(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);

		String bx = req.getParameter("isedit");

		JSONObject jData = new JSONObject();
		jData.put("grp_alias", req.getParameter("grp_alias"));
		jData.put("grp_name", req.getParameter("grp_name"));
		jData.put("grp_hr_data", req.getParameter("grouptype"));
		jData.put("grp_location", req.getParameter("grp_location"));
		jData.put("grp_type", req.getParameter("grp_type"));
		jData.put("grp_header", req.getParameter("grp_header"));
		jData.put("grp_request", req.getParameter("grp_request"));
		jData.put("grp_loan_conf", req.getParameter("grp_loan_conf"));
		jData.put("grp_ads_doc", req.getParameter("grp_ads_doc"));
		jData.put("grp_db_file", "");
		jData.put("grp_input_by", session.getAttribute("session_id").toString());

		RestServiceUnirest objRest = new RestServiceUnirest();
		if (bx.equals("1")) {
			// return jData.toString();
			return objRest.requestPost(this.API_PARAMETER + "/PartnersGroup/Add",
					session.getAttribute("accesskey").toString(), jData.toString());
		} else if (bx.equals("0")) {
			JSONObject j = new JSONObject(objRest.requestPost(this.API_PARAMETER + "/PartnersGroup/Update",
					session.getAttribute("accesskey").toString(), jData.toString()));
			return j.toString();
			/*return objRest.requestPost(this.API_PARAMETER + "/PartnersGroup/Update",
					session.getAttribute("accesskey").toString(), jData.toString());*/
		} else {
			return "";
		}

	}
	
/*	@RequestMapping(value = "/dopost", method = RequestMethod.POST)
	public @ResponseBody String dopost(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);

		String bx = req.getParameter("isedit");

		JSONObject jData = new JSONObject();
		jData.put("grp_alias", req.getParameter("grp_alias"));
		jData.put("grp_name", req.getParameter("grp_name"));
		jData.put("grp_hr_data", req.getParameter("grouptype"));
		jData.put("grp_location", req.getParameter("grp_location"));
		jData.put("grp_type", req.getParameter("grp_type"));
		jData.put("grp_header", req.getParameter("grp_header"));
		jData.put("grp_request", req.getParameter("grp_request"));
		jData.put("grp_db_file", "");
		jData.put("grp_input_by", session.getAttribute("session_id").toString());

		RestServiceUnirest objRest = new RestServiceUnirest();
		if (bx.equals("1")) {
			// return jData.toString();
			return objRest.requestPost(this.API_PARAMETER + "/PartnersGroup/Add",
					session.getAttribute("accesskey").toString(), jData.toString());
		} else if (bx.equals("0")) {
			return objRest.requestPost(this.API_PARAMETER + "/PartnersGroup/Update",
					session.getAttribute("accesskey").toString(), jData.toString());
		} else {
			return "";
		}

	}*/

}
