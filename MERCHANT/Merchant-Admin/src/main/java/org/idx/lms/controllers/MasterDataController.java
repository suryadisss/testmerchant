package org.idx.lms.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.idx.lms.libs.ConfigApps;
import org.idx.lms.libs.LogActivity;
import org.idx.lms.libs.RestServiceUnirest;
import org.idx.lms.libs.TokenRegen;
import org.idx.lms.model.masterdata.MasterDataItem;
import org.idx.lms.model.masterdata.PostMasterData;
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
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;

@Controller
@RequestMapping("master_data")
public class MasterDataController {
	private ConfigApps con = new ConfigApps();
	private String API_SERVER = con.getConfigValue("ServerAPI");
	private String LOCAL_SERVER = con.getConfigValue("ServerLocal");
	private String SESSION_ID ="";
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
	
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView student(ModelMap model, HttpSession session, HttpServletRequest req) {
		
		if(checkSession(session,"lvl_prm_data")){
			token.regenToken(session);
			this.SESSION_ID = session.getAttribute("session_id").toString();
			
			model.addAttribute("api_server", this.API_SERVER);
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			return new ModelAndView("MasterDataMainView", model);
		}else{
			return new ModelAndView("redirect:/");
		}
		
	}

	@RequestMapping(value = "/dopost", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String submitData(@ModelAttribute("MasterDataItem") MasterDataItem md, HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		String x = "";
		//PostMasterData PostItem = new PostMasterData();
		try {

			if (md.getNew_edit_status().equals("new")) {
				PostMasterData PostItem = new PostMasterData();
				PostItem.setName(md.getMap_field_name());
				PostItem.setDesc(md.getMap_field_desc());
				PostItem.setFormula(md.getMap_formula());
				//PostItem.setActive(md.isMap_is_active());
				//PostItem.setStatus(md.isMap_status());
				PostItem.setType(md.getMap_type());
				PostItem.setLevel(md.getMap_level());
				PostItem.setUser(this.SESSION_ID);

				JSONObject log = new JSONObject(new LogActivity().insertLogCore(req, session,"Master Data", "Insert Master Data Management", PostItem.toString()));
				if(log.getBoolean("success")) {
					if(log.getJSONArray("data").length()>0) {
						String id = log.getJSONArray("data").getJSONObject(0).get("resultprocess").toString();
						
						PostItem.setP_logid(id);
						JSONObject json = new JSONObject(
								new RestServiceUnirest().requestPost(this.API_SERVER +"/master",
										session.getAttribute("accesskey").toString(), PostItem));
						if (json.getString("status").toLowerCase().equals("success")) {
							x = json.getString("message");
						}
					}
					
				}
				
				
		
			} else if (md.getNew_edit_status().equals("edit")) {
				PostMasterData PostItem = new PostMasterData();
				PostItem.setMap_id(md.getMap_id());
				PostItem.setName(md.getMap_field_name());
				PostItem.setDesc(md.getMap_field_desc());
				PostItem.setFormula(md.getMap_formula());
				//PostItem.setActive(md.isMap_is_active());
				//PostItem.setStatus(md.isMap_status());
				PostItem.setType(md.getMap_type());
				PostItem.setLevel(md.getMap_level());
				
				PostItem.setUser(this.SESSION_ID);
				
				JSONObject log = new JSONObject(new LogActivity().insertLogCore(req, session,"Master Data", "Edit Master Data Management", PostItem.toString()));
				if(log.getBoolean("success")) {
					if(log.getJSONArray("data").length()>0) {
						String id = log.getJSONArray("data").getJSONObject(0).get("resultprocess").toString();
						
						PostItem.setP_logid(id);
						
						JSONObject json = new JSONObject(
								new RestServiceUnirest().requestPost(this.API_SERVER +"/master/update",
										session.getAttribute("accesskey").toString(), PostItem));
						if (json.getString("status").toLowerCase().equals("success")) {
							x = json.getString("message");
						}
					}
				}
				
				

			}

		} catch (Exception e) {
			// TODO: handle exceptio
			x = e.getMessage();
		}
		return x;
	}
	
	@RequestMapping(value = "/getmaster", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String getcomin(HttpSession session) {
		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_SERVER + "/master",
				session.getAttribute("accesskey").toString());

	}
	
	@RequestMapping(value = "/getmaster/{id}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String getcomin(@PathVariable("id")String id,HttpSession session) {
		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_SERVER + "/master/"+id,
				session.getAttribute("accesskey").toString());

	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String delete(@PathVariable("id")String id,HttpSession session) {
		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_SERVER + "/master/del/"+id,
				session.getAttribute("accesskey").toString());

	}
	
	
	// =======================================================APPROVAL===================================================

				@RequestMapping(value = "/Approval")
				public ModelAndView ApprovalRuleSet(ModelMap model, HttpSession session, HttpServletRequest req) {
					if (checkSession(session, "lvl_prm_mstr_apr")) {
					
						token.regenToken(session);
						session.getAttribute("session_id").toString();
						model.addAttribute("api_server", API_SERVER);
						model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
						return new ModelAndView("MasterDataApproval", model);
					} else {
						return new ModelAndView("redirect:/");
					}

				}

				@RequestMapping(value = "/getListApproval", method = RequestMethod.GET, produces = "application/json")
				public @ResponseBody String getApprovalRuleSetList(HttpSession session, HttpServletRequest request) {
					token.regenToken(session);
					return new RestServiceUnirest().requestGet(API_SERVER + "/master/mstr/list/approval",
							session.getAttribute("accesskey").toString());

				}

				@RequestMapping(value = "/approve", method = RequestMethod.POST, produces = "application/json")
				public @ResponseBody String approveRule(HttpSession session, HttpServletRequest request) {
					token.regenToken(session);
					String x = "";
					try {
						x = new RestServiceUnirest().requestPost(API_SERVER + "/master/mstr/approval",
								session.getAttribute("accesskey").toString(),
								new JSONObject().put("approval_usr", session.getAttribute("session_id").toString())
										.put("map_id", request.getParameter("map_id").toString()).toString());
					} catch (Exception e) {
						x = e.getMessage();
					}
					return x;

				}

}
