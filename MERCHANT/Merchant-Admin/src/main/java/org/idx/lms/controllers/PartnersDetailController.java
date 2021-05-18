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
@RequestMapping("PartnersDetail")
public class PartnersDetailController {

	private ConfigApps con = new ConfigApps();
	private String API_SERVER = con.getConfigValue("ServerAPI");
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
		 if (checkSession(session, "lvl_prm_prt_grp_dtl")) {
		token.regenToken(session);

		model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
		return new ModelAndView("PartnersDetailMainView", model);
		 } else {
		 return new ModelAndView("redirect:/");
		 }
	}

	/*
	 * @RequestMapping(value = "/list", method = RequestMethod.GET)
	 * public @ResponseBody String list(HttpSession session, HttpServletRequest req)
	 * { token.regenToken(session);
	 * 
	 * String group = session.getAttribute("group").toString(); String partner =
	 * session.getAttribute("partner").toString();
	 * 
	 * return new RestServiceUnirest().requestPost(this.API_PARAMETER +
	 * "/PartnersDetail/ReadActive/", session.getAttribute("accesskey").toString(),
	 * new JSONObject().put("gpt_grp_alias", group).put("gpt_alias",
	 * partner).toString()); }
	 */

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public @ResponseBody String list(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);

		return new RestServiceUnirest().requestGet(this.API_PARAMETER + "/PartnersDetail/ReadActive/",
				session.getAttribute("accesskey").toString());
	}


	 @RequestMapping(value = "/GetGroupPartner", method = RequestMethod.GET)
	public @ResponseBody String GetGroupPartner(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		JSONObject jResult = new JSONObject(new RestServiceUnirest().requestGet(this.API_SERVER+ "/ddlen/GetGroupPartner",
				session.getAttribute("accesskey").toString()));
		
		return jResult.toString();
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
		jData.put("gpt_alias", id);
		return new RestServiceUnirest().requestPost(this.API_PARAMETER + "/PartnersDetail/Delete",
				session.getAttribute("accesskey").toString(), jData.toString());

	}

	@RequestMapping(value = "/dopost", method = RequestMethod.POST)
	public @ResponseBody String dopost(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);

		String bx = req.getParameter("isedit");

		JSONObject jData = new JSONObject();
		jData.put("gpt_alias", req.getParameter("gpt_alias"));
		jData.put("gpt_grp_alias", req.getParameter("ddlGroupPartner"));
		jData.put("gpt_name", req.getParameter("gpt_name"));
		jData.put("grp_input_by", session.getAttribute("session_id").toString());

		RestServiceUnirest objRest = new RestServiceUnirest();
		if (bx.equals("1")) {
			// return jData.toString();
			return objRest.requestPost(this.API_PARAMETER + "/PartnersDetail/Add",
					session.getAttribute("accesskey").toString(), jData.toString());
		} else if (bx.equals("0")) {
			return objRest.requestPost(this.API_PARAMETER + "/PartnersDetail/Update",
					session.getAttribute("accesskey").toString(), jData.toString());
		} else {
			return "";
		}

	}

}
