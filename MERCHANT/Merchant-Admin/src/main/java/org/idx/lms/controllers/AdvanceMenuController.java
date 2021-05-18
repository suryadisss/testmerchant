package org.idx.lms.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.idx.lms.libs.ConfigApps;
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

@Controller
@RequestMapping("advance_menu")
public class AdvanceMenuController {

	private ConfigApps con = new ConfigApps();
	private String API_SERVER_CORE = con.getConfigValue("ServerAPI-CORE");
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
	public ModelAndView dashboard(ModelMap model, HttpSession session, HttpServletRequest req) {

		if (checkSession(session, "lvl_adm_adv_mn")) {
			token.regenToken(session);
			model.addAttribute("apbi_server_core", this.API_SERVER_CORE);
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());

			return new ModelAndView("AdvanceMenuMainView", model);
		} else {
			return new ModelAndView("redirect:/");
		}

	}

	@RequestMapping(value = "/access_level", method = RequestMethod.GET)
	public ModelAndView access_level(ModelMap model, HttpSession session, HttpServletRequest req) {

		if (checkSession(session, "lvl_adm_adv_mn")) {
			token.regenToken(session);
			model.addAttribute("apbi_server_core", this.API_SERVER_CORE);
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());

			return new ModelAndView("AdvanceMenuAclMainView", model);
		} else {
			return new ModelAndView("redirect:/");
		}

	}

	@RequestMapping(value = "/update/acc", method = RequestMethod.POST)
	public @ResponseBody String updateacc(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);

		String name = req.getParameter("lm_name");
		String id = req.getParameter("id");
		String parent = req.getParameter("lm_parentid");
		JSONObject jData = new JSONObject();
		jData.put("p_id", id);
		jData.put("p_name", name);
		jData.put("p_parent", parent);

		JSONObject log = new JSONObject(new LogActivity().insertLogCore(req, session, "Advance Menu",
				"Update Menu Access Level", jData.toString()));
		if (log.getBoolean("success")) {
			if (log.getJSONArray("data").length() > 0) {
				String idx = log.getJSONArray("data").getJSONObject(0).get("resultprocess").toString();
				jData.put("p_logid", idx);
				RestServiceUnirest objRest = new RestServiceUnirest();
				return objRest.requestPost(this.API_SERVER_CORE + "/AdvanceMenu/update_menu_acc",
						session.getAttribute("accesskey").toString(), jData.toString());
			} else {
				return new JSONObject().put("status", "Failed").put("message", "Failed to get log").toString();
			}
		} else {
			return new JSONObject().put("status", "Failed").put("message", "Failed to get log").toString();
		}
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public @ResponseBody String update(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);

		String name = req.getParameter("mn_name");
		String id = req.getParameter("id");
		String parent = req.getParameter("parent");
		String order = req.getParameter("mn_orderid");
		String breadcrumb = req.getParameter("breadcrumb");

		JSONObject jData = new JSONObject();

		jData.put("p_id", id);
		jData.put("p_name", name);
		jData.put("p_parentid", parent);
		jData.put("p_order", order);
		jData.put("p_breadcrumb", breadcrumb);
	
		JSONObject log = new JSONObject(new LogActivity().insertLogCore(req, session, "Advance Menu",
				"Update Menu", jData.toString()));
		if (log.getBoolean("success")) {
			if (log.getJSONArray("data").length() > 0) {
				String idx = log.getJSONArray("data").getJSONObject(0).get("resultprocess").toString();
				jData.put("p_logid", idx);
				RestServiceUnirest objRest = new RestServiceUnirest();
				return objRest.requestPost(this.API_SERVER_CORE + "/AdvanceMenu/update_menu",
						session.getAttribute("accesskey").toString(),
						jData.toString());
			} else {
				return new JSONObject().put("status", "Failed").put("message", "Failed to get log").toString();
			}
		} else {
			return new JSONObject().put("status", "Failed").put("message", "Failed to get log").toString();
		}
	}

	@RequestMapping(value = "/getlist", method = RequestMethod.GET)
	public @ResponseBody String getListOfAccessLevel(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestGet(this.API_SERVER_CORE + "/AdvanceMenu/list_menu",
				session.getAttribute("accesskey").toString());

	}

	@RequestMapping(value = "/getlist/{id}", method = RequestMethod.GET)
	public @ResponseBody String getListOfAccessLevel(@PathVariable("id") String id, HttpSession session,
			HttpServletRequest req) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestGet(this.API_SERVER_CORE + "/AdvanceMenu/list_menu/" + id,
				session.getAttribute("accesskey").toString());

	}

	@RequestMapping(value = "/det/{id}", method = RequestMethod.GET)
	public @ResponseBody String det(@PathVariable("id") String id, HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestGet(this.API_SERVER_CORE + "/AdvanceMenu/detail/" + id,
				session.getAttribute("accesskey").toString());

	}

	@RequestMapping(value = "/detacc/{id}", method = RequestMethod.GET)
	public @ResponseBody String detacc(@PathVariable("id") String id, HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestGet(this.API_SERVER_CORE + "/AdvanceMenu/detail_acc/" + id,
				session.getAttribute("accesskey").toString());

	}

	@RequestMapping(value = "/parentdet", method = RequestMethod.GET)
	public @ResponseBody String parentdet(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestGet(this.API_SERVER_CORE + "/AdvanceMenu/get_parent_acc",
				session.getAttribute("accesskey").toString());

	}

	@RequestMapping(value = "/bread", method = RequestMethod.GET)
	public @ResponseBody String bread(HttpSession session, HttpServletRequest req) {

		String url = req.getParameter("url");
		if (url != null && url != "") {
			String x = url.substring(url.length() - 1).toString();
			if (x.equalsIgnoreCase("/")) {
				url = url.substring(0, url.length() - 1);
			}
		}
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestPost(this.API_SERVER_CORE + "/AdvanceMenu/get_bread",
				session.getAttribute("accesskey").toString(), new JSONObject().put("p_link", url).toString());

	}
}
