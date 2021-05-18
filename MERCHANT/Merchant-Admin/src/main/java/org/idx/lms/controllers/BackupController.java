package org.idx.lms.controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.idx.lms.libs.ConfigApps;
import org.idx.lms.model.backup.BackupConfig;
import org.idx.lms.libs.RestServiceUnirest;
import org.idx.lms.libs.TokenRegen;
import org.idx.lms.model.backup.PostBackup;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;

@Controller
@RequestMapping("backupconfig")
public class BackupController {

	private ConfigApps con = new ConfigApps();
	private String API_SERVER = con.getConfigValue("ServerAPI");
	private String API_SERVER_CORE = con.getConfigValue("ServerAPI-CORE");
	private String LOCAL_SERVER = con.getConfigValue("ServerLocal");
	private String DEFAULT_PASSWORD = con.getConfigValue("DeafaulPasswordNewUser");
	private String DES_IVSTRING = con.getConfigValue("DESivString");
	private String DES_KEYSTRING = con.getConfigValue("DESkeyString");
	private String SESSION_ID = "";
	TokenRegen token = new TokenRegen();
	
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
	
	/*@RequestMapping(method = RequestMethod.GET)
	public ModelAndView dashboard(ModelMap model, HttpSession session, HttpServletRequest req) {
		
		if(checkSession(session,"lvl_adm_acl")){
			this.SESSION_ID = session.getAttribute("session_id").toString();
			model.addAttribute("api_server", this.API_SERVER);
			model.addAttribute("api_server_core", this.API_SERVER_CORE);
			model.addAttribute("api_key", session.getAttribute("accesskey"));
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());

			return new ModelAndView("BackUpConfig", model);
		}else{
			return new ModelAndView("redirect:/");
		}
		
	}*/
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getPage(){
		ModelAndView view = new ModelAndView("BackUpConfig");
		return view;
	}
	
	@RequestMapping(value="/getListBackup", method = RequestMethod.GET)
	public @ResponseBody String getListOfSchedule(HttpSession session, HttpServletRequest req) {
		String x = "";
		try {
			HttpResponse<String> postResponse = Unirest.get(this.API_SERVER_CORE + "/parameter/GetSchedulerList")
					.header("accept", "application/json")
					.header("Authorization", "Bearer" + session.getAttribute("accesskey")).asString();
			x = postResponse.getBody();
		} catch (Exception e) {
			// TODO: handle exception
			x = e.getMessage();
		}
		return x;
	}
	
	@RequestMapping(value = "/insertBackup", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String insertBackup(@ModelAttribute("BackupConfig") BackupConfig bc,HttpSession session) {
		String x = "";
		String status = "";
		try {
			if(bc.getNew_edit_status().equals("new")) {
				PostBackup PostItem = new PostBackup();
				
				PostItem.setP_database(bc.getBck_database());
				PostItem.setP_exepath(bc.getBck_exepath());
				PostItem.setP_host(bc.getBck_host());
				PostItem.setP_port(bc.getBck_port());
				PostItem.setP_username(bc.getBck_username());
				PostItem.setP_password(bc.getBck_password());
				PostItem.setP_cleanupday(bc.getBck_cleanupday());
				PostItem.setP_ext(bc.getBck_ext());
				PostItem.setP_destfile(bc.getBck_destination_file());
				
				Gson gson = new Gson();
				String data = "[" + gson.toJson(PostItem).toString() + "]";
				
				HttpResponse<JsonNode> postResponse = Unirest
						.post(this.API_SERVER_CORE + "/parameter/SaveDataBackupConfig")
						.header("Content-Type", "application/json")
						.header("Authorization", "Bearer" + session.getAttribute("accesskey").toString())
						.body(data.toString()).asJson();
				if(postResponse.getStatus()==200) {
					JSONObject json = new JSONObject(postResponse.getBody().toString());
					if(json.getBoolean("success")) {
						x = "success";
					} else {
						x = "failed";
					}
				}
						
				
			} else if (bc.getNew_edit_status().equals("edit")) {
				PostBackup PostItem = new PostBackup();
				
				PostItem.setP_database(bc.getBck_database());
				PostItem.setP_exepath(bc.getBck_exepath());
				PostItem.setP_host(bc.getBck_host());
				PostItem.setP_port(bc.getBck_port());
				PostItem.setP_username(bc.getBck_username());
				PostItem.setP_password(bc.getBck_password());
				PostItem.setP_cleanupday(bc.getBck_cleanupday());
				PostItem.setP_ext(bc.getBck_ext());
				PostItem.setP_destfile(bc.getBck_destination_file());
				
				Gson gson = new Gson();
				String data = "[" + gson.toJson(PostItem).toString() + "]";
				
				HttpResponse<JsonNode> postResponse = Unirest
						.post(this.API_SERVER_CORE + "/parameter/SaveDataBackupConfig")
						.header("Content-Type", "application/json")
						.header("Authorization", "Bearer" + session.getAttribute("accesskey").toString())
						.body(data.toString()).asJson();
				if(postResponse.getStatus()==200) {
					JSONObject json = new JSONObject(postResponse.getBody().toString());
					if(json.getBoolean("success")) {
						x = "success";
					} else {
						x = "failed";
					}
				
			}
		}
	} catch (Exception e) {
		x = e.getMessage();
	}
		return x ;	
	}

	@RequestMapping(value = "/deleteBackup/{val}", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String deleteBackup(@PathVariable("val") String bckid, HttpSession session, 
			HttpServletRequest req) {
		String x = "";
		try {
			PostBackup PostItem = new PostBackup();
			PostItem.setP_id(bckid);
			
			Gson gson = new Gson();
			String data = "[" + gson.toJson(PostItem).toString() + "]";
			
			HttpResponse<JsonNode> postResponse = Unirest
					.post(this.API_SERVER_CORE + "//parameter/RemoveDataBackupconfig" + bckid)
					.header("Content-Type", "appliaction/json")
					.header("Authorization", "Bearer" + session.getAttribute("accesskey"))
					.body(data.toString()).asJson();
			if (postResponse.getStatus() == 200) {
				JSONObject json = new JSONObject(postResponse.getBody().toString());
				if (json.getBoolean("success")) {
					x = "success";
				} else {
					x = "Failed";
				}

			}

			x = postResponse.getBody().toString();
		} catch (Exception e) {
			// TODO: handle exception
			x = e.getMessage();
		}
		return x;
		
	}
	
	@RequestMapping(value= "/getDatabase", method = RequestMethod.GET)
	public @ResponseBody String getMethod(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		JSONObject jResult = new JSONObject(new RestServiceUnirest().requestGet(this.API_SERVER_CORE + "/parameter/GetDdlvalue/databases",//belum dikasih
				session.getAttribute("accesskey").toString()));
		ArrayList<String> methodCode = new ArrayList<String>();
		
		JSONArray array = new JSONArray(jResult.getJSONArray("data").toString());
		for (int i = 0; i < array.length(); i++) {
			JSONObject row = array.getJSONObject(i);
			if (!methodCode.contains(row.getString("db_group"))) {
				methodCode.add(row.getString("db_group"));
			}
		}

		JSONArray jRsx = new JSONArray();
		for (String bc : methodCode) {
			JSONObject jRo = new JSONObject();
			JSONArray jRs = new JSONArray();

			for (int i = 0; i < array.length(); i++) {
				JSONObject row = array.getJSONObject(i);
				if (bc.equals(row.getString("db_group"))) {

					jRs.put(row);
				}

			}
			jRo.put(bc, jRs);
			jRsx.put(jRo);
		}

		return jRsx.toString();
	}
	
	@RequestMapping(value = "/getDataBackup/val", method = RequestMethod.GET)
	public @ResponseBody String getDataBackup(@PathVariable("val") String bckid, HttpSession session, 
				HttpServletRequest req) {
		token.regenToken(session);
		String x = "";
		try {
			HttpResponse<String> postResponse = Unirest
					.get(this.API_SERVER_CORE + "/parameter/GetBackupConfigById/" + bckid)
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

