package org.idx.lms.controllers;

import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.idx.lms.libs.ConfigApps;
import org.idx.lms.libs.LibsGeneral;
import org.idx.lms.libs.RestServiceUnirest;
import org.idx.lms.libs.TokenRegen;
import org.idx.lms.model.accesslevel.AccessLevelItem;
import org.idx.lms.model.accesslevel.AccessLevelListItem;
import org.idx.lms.model.accesslevel.PostAccessLevelItem;
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

@Controller
@RequestMapping("access_level_management_product")
public class AccessLevelManagementProductController {
	private ConfigApps con = new ConfigApps();
	private String API_SERVER = con.getConfigValue("ServerAPI");
	private String API_SERVER_CORE = con.getConfigValue("ServerAPI-CORE");
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
	public ModelAndView dashboard(ModelMap model, HttpSession session, HttpServletRequest req) {
		
		if(checkSession(session,"lvl_acc_mng_prd")){
			token.regenToken(session);
			this.SESSION_ID = session.getAttribute("session_id").toString();
			model.addAttribute("api_server", this.API_SERVER);
			model.addAttribute("apbi_server_core", this.API_SERVER_CORE);
			model.addAttribute("api_key", session.getAttribute("accesskey"));
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());

			return new ModelAndView("AccessLevelManagementProduct", model);
		}else{
			return new ModelAndView("redirect:/");
		}
		
	}
	
	@RequestMapping(value = "/dopost", method = RequestMethod.POST)
	public @ResponseBody String dopost(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		//String cif = req.getParameter("hdcif").toString();
		
		
		String msg;
		String id = req.getParameter("idNprod").toString();
		JSONObject jData = new JSONObject();
		JSONObject RequestPOST, RequestPOST2;
		
		jData.put("p_level_code", id);
		jData.put("event", "Write");
		jData.put("data", getData(req));

		RequestPOST = new JSONObject(
				new RestServiceUnirest().requestPost(this.API_SERVER_CORE + "/AccessLevel/DeleteInsertReportAccessDetail",
						session.getAttribute("accesskey").toString(), jData.toString()));


		if (RequestPOST.getString("status").equals("Success")) {
			
			msg = "{\"status\":\"Success\",\"msg\":\"Data berhasil disimpan\" }";
		} else {
			msg = "{\"status\":\"Failed\",\"msg\":\"Failed to Save\" }";
		}

		return msg;
				
	}	

		JSONArray getData(HttpServletRequest req) {
		JSONArray jRet = new JSONArray();


		String record = req.getParameter("record").toString().replaceAll("on,", "").trim();
		String[] getData = record.split(",");
		
		//String[] namaa = req.getParameterValues("namaa");
		String[] matrixVal = req.getParameterValues("matrixVal");
		String flagging = req.getParameter("flagging").toString();
		//String[] pcs_prd_code = req.getParameterValues("pcs_prd_code");
		//if(flagging == "true") {
		//	for (int n = 0; n < getData.length; n++) {

			//	String[] split = getData[n].split("_");
			//	String splitNama = split[0];
			//	String splitFlag = split[1];
				//String[] bits = getData[n].split("_");
				//String[] splitFlag = bits[bits.length-1];
				//String[] splitFlag = getData[n].substring(getData[n].lastIndexOf("_")+1);
				
			//	JSONObject jDetail = new JSONObject();
			//	jDetail.put("name", getData.toString());
			//	jDetail.put("flag", "true");
			//	String test = getData.toString();
			//	if(test.equals("true")) {
			//		jDetail.put("flag", true);
			//	}else if(test.equals("false")){
			//		jDetail.put("flag", false);
			//	}else {
			//		jDetail.put("flag", getData.toString());
			//	}
				
			//	jRet.put(jDetail);
		//	}
	//	}
	//	else{
			for (int n = 0; n < getData.length; n++) {
				
				JSONObject jDetail = new JSONObject();
				jDetail.put("name", getData[n]);
			//	jDetail.put("name", getData.toString());
				jDetail.put("flag", "true");
			//	String test = Arrays.toString(getData);
			//	if(test.equals("true")) {
			//		jDetail.put("flag", true);
			//	}else if(test.equals("false")){
			//		jDetail.put("flag", false);
			//	}else {
			//		jDetail.put("flag", true);
			//	}
				
				jRet.put(jDetail);
			}
	//	}
		return jRet;
	}	

	@RequestMapping(value = "/doopost", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String submittData(@ModelAttribute("AccessLevel") AccessLevelItem item, HttpSession session) {
		token.regenToken(session);
		String result = "";
		if (item.getNew_edit_status().equals("new")) {
			if (this.isExistLevelCode(item.getLulevelcode(), session.getAttribute("accesskey").toString())) {
				result = "User Role Code is Exist";
			} else {
				result = saveAccessLevel(item, session.getAttribute("accesskey").toString(), this.SESSION_ID);
			}
		} else if (item.getNew_edit_status().equals("edit")) {
			result = editAccessLevel(item, session.getAttribute("accesskey").toString(), this.SESSION_ID);

		}
		return result;
	}

	private String editAccessLevel(AccessLevelItem item, String token, String user) {

		PostAccessLevelItem postItem = new PostAccessLevelItem();
		postItem.setP_luid(item.getId());
		postItem.setP_lcode(item.getLulevelcode());
		postItem.setP_ldesc(item.getLuleveldescription());
		postItem.setP_lname(item.getLulevelname());
		postItem.setP_limfrom(item.getLulimitfrom());
		postItem.setP_limto(item.getLulimitto());
		postItem.setP_usr(user);
		postItem.setP_lstatus(new LibsGeneral().getTrueFalseStringUp(item.isLustatus()));
		ArrayList<String> temps = item.getInputcheckbox();
		Gson gson = new Gson();
		String data = "[" + gson.toJson(postItem).toString() + "]";
		RestServiceUnirest objRest = new RestServiceUnirest();
		String ResultInsert = objRest.requestPost(this.API_SERVER_CORE + "/accesslevel/postJDataEditRecordV2/",
				token, data);
		JSONObject json = new JSONObject(ResultInsert);
		ArrayList<AccessLevelListItem> listLevel = new ArrayList<AccessLevelListItem>();
		String ret = "";
		if (json.getBoolean("success")) {
			String lcode = json.getJSONArray("data").getJSONObject(0).getString("lcode");
			String dpost = objRest.requestPost(
					this.API_SERVER_CORE + "/accesslevel/postJDataDelAccessLevelDetail/", token,
					new JSONArray().put(new JSONObject().put("p_lcode", item.getId())).toString());
			json = new JSONObject(dpost);
			if (json.getBoolean("success")) {
				int j = 0;
				while (temps.size() > j) {
					AccessLevelListItem it = new AccessLevelListItem();
					it.setP_lcode(lcode);
					it.setP_ldescription(temps.get(j));
					it.setP_usr(user);
					listLevel.add(it);
					j++;
				}

				data = gson.toJson(listLevel);
				String ResultListAccesss = objRest.requestPost(
						this.API_SERVER_CORE + "/accesslevel/postJDataInsAccessLevelDetail/", token, data);
				json = new JSONObject(ResultListAccesss);
 				if (json.getBoolean("success")) {
					ret = "Saved";
				} else {
					ret = "Failed to saving data level";
				}

			} else {
				ret = "Failed to delete data level";
			}
		} else {
			ret = "Failed to saving data level";
		}

		return ret;

	}

	private String saveAccessLevel(AccessLevelItem item, String token, String user) {
		PostAccessLevelItem postItem = new PostAccessLevelItem();
		postItem.setP_lcode(item.getLulevelcode());
		postItem.setP_ldesc(item.getLuleveldescription());
		postItem.setP_lname(item.getLulevelname());
		postItem.setP_limfrom(item.getLulimitfrom());
		postItem.setP_limto(item.getLulimitto());
		postItem.setP_lstatus(new LibsGeneral().getTrueFalseStringUp(item.isLustatus()));
		ArrayList<String> temps = item.getInputcheckbox();
		Gson gson = new Gson();
		String data = "[" + gson.toJson(postItem).toString() + "]";
		RestServiceUnirest objRest = new RestServiceUnirest();
		String ResultInsert = objRest.requestPost(this.API_SERVER_CORE + "/accesslevel/postJDataInsertRecord/",
				token, data);
		JSONObject json = new JSONObject(ResultInsert);
		ArrayList<AccessLevelListItem> listLevel = new ArrayList<AccessLevelListItem>();
		String ret = "";
		if (json.getBoolean("success")) {
			String lcode = json.getJSONArray("data").getJSONObject(0).getString("lcode");

			int j = 0;
			while (temps.size() > j) {
				AccessLevelListItem it = new AccessLevelListItem();
				it.setP_lcode(lcode);
				it.setP_ldescription(temps.get(j));
				it.setP_usr(user);
				listLevel.add(it);
				j++;
			}

			data = gson.toJson(listLevel);
			String ResultListAccesss = objRest.requestPost(
					this.API_SERVER_CORE + "/accesslevel/postJDataInsAccessLevelDetail/", token, data);
			json = new JSONObject(ResultListAccesss);
			if (json.getBoolean("success")) {
				ret = "Saved";
			} else {
				ret = "Failed to save data level";
			}

		} else {
			ret = "Failed to save data";

		}
		return ret;
	}

	boolean isExistLevelCode(String val, String token) {
		
		RestServiceUnirest rest = new RestServiceUnirest();
		boolean ret = false;
		String result = rest.requestPost(this.API_SERVER_CORE + "/accesslevel/postJDataCallCheckLevel/", token,
				new JSONArray().put(new JSONObject().put("p_check", val).put("p_code", "CK")).toString());
		JSONObject jsonResult = new JSONObject(result);

		if (jsonResult.getBoolean("success")) {
			if (jsonResult.getJSONArray("data").getJSONObject(0).getInt("t_row") > 0) {
				ret = true;
			}
		}

		return ret;
	}

	@RequestMapping(value = "/getlistlevel", method = RequestMethod.GET)
	public @ResponseBody String getListOfAccessLevel(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestGet(this.API_SERVER_CORE + "/AccessLevel/GetLevelUser",
				session.getAttribute("accesskey").toString());

	}
	
	
	
	@RequestMapping(value = "/getlistleveledit/{id}", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String getListLevelEdit(HttpSession session, HttpServletRequest req, @PathVariable("id") String id) {
		token.regenToken(session);
		//String cif = req.getParameter("hdcif").toString();
		JSONObject jData = new JSONObject();
		
		jData.put("p_level_code", id);
		jData.put("event", "Read");
				
				return new RestServiceUnirest().requestPost(this.API_SERVER_CORE + "/ReportGeneration/ReadEditReportAccessLevel",
						session.getAttribute("accesskey").toString(), jData.toString());
				
	}	

	@RequestMapping(value = "/deleteacclev/{id}", method = RequestMethod.GET)
	public @ResponseBody String deleteacclev(@PathVariable("id") String id, HttpSession session,
			HttpServletRequest req) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestPost(this.API_SERVER_CORE + "/accesslevel/postJDataDelAccessLevel/",
				session.getAttribute("accesskey").toString(),
				new JSONArray().put(new JSONObject().put("p_lid", id).put("p_usr", this.SESSION_ID)).toString());

	}

	@RequestMapping(value = "/getdetailacc/{id}", method = RequestMethod.GET)
	public @ResponseBody String getdetailacc(@PathVariable("id") String id, HttpSession session,
			HttpServletRequest req) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestGet(this.API_SERVER_CORE + "/accesslevel/getDataAccessLevelDetail/" + id,
				session.getAttribute("accesskey").toString());

	}

	@RequestMapping(value = "/getparentacc", method = RequestMethod.GET)
	public @ResponseBody String getparentacc(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestGet(this.API_SERVER_CORE + "/accesslevel/getDataParentLevel",
				session.getAttribute("accesskey").toString());
	}

	@RequestMapping(value = "/getdatachild/{id}", method = RequestMethod.GET)
	public @ResponseBody String getdatachild(@PathVariable("id") String id, HttpSession session,
			HttpServletRequest req) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestGet(this.API_SERVER_CORE + "/accesslevel/getDataChild/" + id,
				session.getAttribute("accesskey").toString());

	}

	@RequestMapping(value = "/getlevellist/{id}", method = RequestMethod.GET)
	public @ResponseBody String getlevellist(@PathVariable("id") String id, HttpSession session,
			HttpServletRequest req) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestGet(this.API_SERVER_CORE + "/accesslevel/getDataAccessLevelListDetail/" + id,
				session.getAttribute("accesskey").toString());

	}

	@RequestMapping(value = "/getlang/{id}", method = RequestMethod.GET)
	public @ResponseBody String getlang(@PathVariable("id") String id, HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestGet(this.API_SERVER_CORE + "/accesslevel/getDataLang/" + id,
				session.getAttribute("accesskey").toString());

	}

}
