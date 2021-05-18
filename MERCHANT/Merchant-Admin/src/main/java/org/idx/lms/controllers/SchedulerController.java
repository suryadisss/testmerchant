package org.idx.lms.controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.idx.lms.libs.ConfigApps;
import org.idx.lms.libs.RestServiceUnirest;
import org.idx.lms.libs.TokenRegen;
import org.idx.lms.model.schedul.PostSchedul;
import org.idx.lms.model.schedul.SchedulerList;
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

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;

@Controller
@RequestMapping("schedule")
public class SchedulerController {
	
	private ConfigApps con = new ConfigApps();
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
	
//	@RequestMapping(method = RequestMethod.GET)
//	public ModelAndView main(ModelMap model, HttpSession session, HttpServletRequest req,
//			@ModelAttribute("SchedulerList") SchedulerList sl) {
//		if (checkSession(session, "lvl_adm_mgt")) {
//			token.regenToken(session);
	//		this.SESSION_ID = session.getAttribute("session_id").toString();
//
//			model.addAttribute("API_SERVER_CORE", this.API_SERVER_CORE);
//			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
//			model.addAttribute("session_id", this.SESSION_ID);
//			return new ModelAndView("schedule", model);

//		} else {
//			return new ModelAndView("redirect:/");
//		}

//	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getPage(){
		ModelAndView view = new ModelAndView("Scheduler");
		return view;
	}
	
	@RequestMapping(value="/insertSchedule", method = RequestMethod.POST, produces ="application/json")
	public @ResponseBody String submitData(@ModelAttribute("SchedulerList") SchedulerList sl, HttpSession session) {
		token.regenToken(session);
		String x = "";
		
		try {
			if (sl.getNew_edit_status().equals("new")) {
				PostSchedul PostItem = new PostSchedul();
				PostItem.setP_name(sl.getScl_name());
				PostItem.setP_mothod(sl.getScl_method());
				PostItem.setP_domain(sl.getScl_domain());
				PostItem.setP_api(sl.getScl_api());
				PostItem.setP_module(sl.getScl_module());
				PostItem.setP_occurs(sl.getScl_occurs());
				PostItem.setP_dateat(sl.getScl_date_at());
				//timeat belom
				PostItem.setV_reqdata(sl.getScl_data());
				
				Gson gson = new Gson();
				String data = "[" + gson.toJson(PostItem).toString()+ "]";
				
				HttpResponse<JsonNode> postResponse = Unirest
						.post(this.API_SERVER_CORE + "/parameter/SaveDataSchedulerList")
						.header("Content-Type", "application/json")
						.header("Authorization", "Bearer" + session.getAttribute("accesskey").toString())
						.body(data.toString()).asJson();
				if(postResponse.getStatus()==200) {
					JSONObject json = new JSONObject(postResponse.getBody().toString());
					if(json.getBoolean("success")) {
						
						x = "Success";
					} else {
						x = "Failed";
					}
				}
			
		} else if(sl.getNew_edit_status().equals("edit")) {
			PostSchedul PostItem = new PostSchedul();
			PostItem.setP_name(sl.getScl_name());
			PostItem.setP_mothod(sl.getScl_method());
			PostItem.setV_reqdata(sl.getScl_data());
			PostItem.setP_domain(sl.getScl_domain());
			PostItem.setP_api(sl.getScl_api());
			PostItem.setP_module(sl.getScl_module());
			PostItem.setP_occurs(sl.getScl_occurs());
			PostItem.setP_dateat(sl.getScl_date_at());
			//timeat belom
			
			
			Gson gson = new Gson();
			String data = "[" + gson.toJson(PostItem).toString() + "]";
			
			HttpResponse<JsonNode> postResponse = Unirest
					.post(this.API_SERVER_CORE + "/parameter/SaveDataSchedulerList")
					.header("Content-Type", "application/json")
					.header("Authorization", "Bearer" + session.getAttribute("accesskey").toString())
					.body(data.toString()).asJson();
			if (postResponse.getStatus()==200) {
				JSONObject json = new JSONObject(postResponse.getBody().toString());
				if(json.getBoolean("success")) {
					x = "Success";
				} else {
					x = "Failed";
				}
			}
		}
	
		} catch (Exception e) {
			x = e.getMessage();
		}
		return x;
	}
	
	
	
	@RequestMapping(value= "/getMethod", method = RequestMethod.GET)
	public @ResponseBody String getMethod(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		JSONObject jResult = new JSONObject(new RestServiceUnirest().requestGet(this.API_SERVER_CORE + "/parameter/GetDdlvalue/methods",
				session.getAttribute("accesskey").toString()));
		ArrayList<String> methodCode = new ArrayList<String>();
		
		JSONArray array = new JSONArray(jResult.getJSONArray("data").toString());
		for (int i = 0; i < array.length(); i++) {
			JSONObject row = array.getJSONObject(i);
			if (!methodCode.contains(row.getString("scl_method"))) {
				methodCode.add(row.getString("scl_method"));
			}
		}

		JSONArray jRsx = new JSONArray();
		for (String bc : methodCode) {
			JSONObject jRo = new JSONObject();
			JSONArray jRs = new JSONArray();

			for (int i = 0; i < array.length(); i++) {
				JSONObject row = array.getJSONObject(i);
				if (bc.equals(row.getString("scl_method"))) {

					jRs.put(row);
				}

			}
			jRo.put(bc, jRs);
			jRsx.put(jRo);
		}

		return jRsx.toString();
	}
	
	@RequestMapping(value="/deleteSchedule{val}", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String deleteSchedule(@PathVariable("val") String name, HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		String x = "";
		try {
			PostSchedul PostItem = new PostSchedul();
			PostItem.setP_name(name);
			
			Gson gson = new Gson();
			String data = "[" + gson.toJson(PostItem).toString() + "]";
			
			HttpResponse<JsonNode> postResponse = Unirest
					.post(this.API_SERVER_CORE + "/parameter/RemoveDataSchedulerList")
					.header("Content-Type", "application/json")
					.header("Authorization", "Bearer" + session.getAttribute("accesskey").toString())
					.body(data.toString()).asJson();
			if(postResponse.getStatus()==200) {
				JSONObject json = new JSONObject(postResponse.getBody().toString());
				if(json.getBoolean("success")) {
					x = "success";
				} else {
					x = "Failed";
				}
			}
			
			x = postResponse.getBody().toString();
		} catch (Exception e) {
			x = e.getMessage();
			
		}
		return x;
	}
	
	

	@RequestMapping(value= "/getModule", method = RequestMethod.GET)
	public @ResponseBody String getModule(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		JSONObject jResult = new JSONObject(new RestServiceUnirest().requestGet(this.API_SERVER_CORE + "/parameter/GetDdlvalue/methods",
				session.getAttribute("accesskey").toString()));
		ArrayList<String> modulecode = new ArrayList<String>();
		
		JSONArray array = new JSONArray(jResult.getJSONArray("data").toString());
		for (int i = 0; i < array.length(); i++) {
			JSONObject row = array.getJSONObject(i);
			if (!modulecode.contains(row.getString("mtd_group"))) {
				modulecode.add(row.getString("mtd_group"));
			}
		}

		JSONArray jRsx = new JSONArray();
		for (String mc : modulecode) {
			JSONObject jRo = new JSONObject();
			JSONArray jRs = new JSONArray();

			for (int i = 0; i < array.length(); i++) {
				JSONObject row = array.getJSONObject(i);
				if (mc.equals(row.getString("mtd_group"))) {

					jRs.put(row);
				}

			}
			jRo.put(mc, jRs);
			jRsx.put(jRo);
		}

		return jRsx.toString();
	}


	@RequestMapping(value= "/getOccurs", method = RequestMethod.GET)
	public @ResponseBody String getOccurs(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		JSONObject jResult = new JSONObject(new RestServiceUnirest().requestGet(this.API_SERVER_CORE + "/parameter/GetDdlvalue/scheduleroccurs",
				session.getAttribute("accesskey").toString()));
		ArrayList<String> occurscode = new ArrayList<String>();
		
		JSONArray array = new JSONArray(jResult.getJSONArray("data").toString());
		for (int i = 0; i < array.length(); i++) {
			JSONObject row = array.getJSONObject(i);
			if (!occurscode.contains(row.getString("mtd_group"))) {
				occurscode.add(row.getString("mtd_group"));
			}
		}

		JSONArray jRsx = new JSONArray();
		for (String oc : occurscode) {
			JSONObject jRo = new JSONObject();
			JSONArray jRs = new JSONArray();

			for (int i = 0; i < array.length(); i++) {
				JSONObject row = array.getJSONObject(i);
				if (oc.equals(row.getString("mtd_group"))) {

					jRs.put(row);
				}

			}
			jRo.put(oc, jRs);
			jRsx.put(jRo);
		}

		return jRsx.toString();
	}
	
	@RequestMapping(value = "/getDataSchedule/{val}", method = RequestMethod.GET)
	public @ResponseBody String getDataSchedule(@PathVariable("val") String name, HttpSession session, 
		HttpServletRequest req) {
		token.regenToken(session);
		String x = "";
		try {
			HttpResponse<String> postResponse = Unirest
					.get(this.API_SERVER_CORE + "/parameter/GetSchedulerListById/" + name)
					.header("accept", "application/json")
					.header("Authorization", "Bearer" + session.getAttribute("accesskey")).asString();
			x = postResponse.getBody();
		} catch (Exception e) {
			// TODO: handle exception
			x = e.getMessage();
		}
		return x;

		}
	}
	


