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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("activity_management")
public class ActivityManagementController {
	private ConfigApps con = new ConfigApps();
	private String API_COLLECTION = con.getConfigValue("ServerAPI-COLLECTION");
	private String LOCAL_SERVER = con.getConfigValue("ServerLocal");
	TokenRegen token = new TokenRegen();
	private String SESSION_ID;
	
	
	private boolean checkSession(HttpSession session, String level){
		boolean bol = false;
		if(session.getAttribute("accesskey")!=null){
			JSONArray jMenu = new JSONArray(session.getAttribute("session_menu").toString());
			for(int i = 0; i<jMenu.length(); i++){
				if(jMenu.getJSONObject(i).getString("ldlmdescription").equals(level)){
					bol = true;
				}
			}
		}
		return bol;
	}
	
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView dashboard(ModelMap model, HttpSession session, HttpServletRequest req) {
		
		if(checkSession(session,"lvl_col_mstr_act")){
			token.regenToken(session);
			this.SESSION_ID = session.getAttribute("session_id").toString();
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());

			return new ModelAndView("Collection_ActivityMainView", model);
		}else{
			return new ModelAndView("redirect:/");
		}
		
	}
	
	@RequestMapping(value = "/getResponse/{id}", method = RequestMethod.GET)
	public @ResponseBody String getResponse(@PathVariable("id")String id,HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestPost(this.API_COLLECTION + "/MasterCollection/GetDataResponseByCode",
				session.getAttribute("accesskey").toString(),new JSONObject().put("p_code", id).toString());
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public @ResponseBody String list(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestGet(this.API_COLLECTION + "/MasterCollection/ListActivityMgmt",
				session.getAttribute("accesskey").toString());
	}
	
	
	@RequestMapping(value = "/list/det/{id}", method = RequestMethod.GET)
	public @ResponseBody String list(@PathVariable("id")String id,HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestGet(this.API_COLLECTION + "/MasterCollection/ListActivityMgmtById/"+id,
				session.getAttribute("accesskey").toString());
	}
	
	@RequestMapping(value = "/dopost", method = RequestMethod.POST)
	public @ResponseBody String dopost(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);

		JSONObject jData = new JSONObject();

		jData.put("p_category", req.getParameter("category").toString().trim());
		jData.put("p_action_code", req.getParameter("action_code").toString().trim());
		jData.put("p_action_name", req.getParameter("action_name").toString().trim());
		jData.put("p_response_code", req.getParameter("response_code").toString().trim());
		jData.put("p_response_name", req.getParameter("response_name").toString().trim());
		jData.put("p_response_category", req.getParameter("response_category").toString().trim());
		jData.put("p_max_reminder", Integer.parseInt(req.getParameter("max_reminder").toString().trim()));
		jData.put("p_status", req.getParameter("status").toString().trim());
		jData.put("p_user", this.SESSION_ID);

		if (req.getParameter("new_edit_status").toString().equals("New")) {
			
			
			RestServiceUnirest objRest = new RestServiceUnirest();
			return objRest.requestPost(this.API_COLLECTION + "/MasterCollection/AddDataActivityMgmt",
					session.getAttribute("accesskey").toString(), jData.toString());

		} else if (req.getParameter("new_edit_status").toString().equals("Edit")) {
			jData.put("p_id",  req.getParameter("id"));
			RestServiceUnirest objRest = new RestServiceUnirest();
			return objRest.requestPost(this.API_COLLECTION + "/MasterCollection/UpdateDataActivityMgmt",
					session.getAttribute("accesskey").toString(), jData.toString());
		}else {
			return "";
		}
	}
	
	@RequestMapping(value = "/del/list", method = RequestMethod.POST)
	public @ResponseBody String del(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		String id = req.getParameter("id");
		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestPost(this.API_COLLECTION + "/MasterCollection/RemoveDataActivityMgmt",
				session.getAttribute("accesskey").toString(), new JSONObject().put("p_id", id).toString());
	}
}
