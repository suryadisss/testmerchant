package org.idx.lms.controllers;

//import java.net.InetAddress;
//import java.net.URI;
//import java.net.URISyntaxException;
//import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.idx.lms.libs.ConfigApps;
//import org.idx.lms.libs.EncryptDiggest;
import org.idx.lms.libs.LogActivity;
import org.idx.lms.libs.RestServiceUnirest;
import org.idx.lms.libs.TokenRegen;
import org.json.JSONArray;
import org.json.JSONObject;
//import org.springframework.session.jdbc.JdbcOperationsSessionRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("ext_conn")
public class ExtConnController {
	private ConfigApps con = new ConfigApps();
	private String API_PARAMETER = con.getConfigValue("ServerAPI-PARAMETER");
	private String API_EN = con.getConfigValue("ServerAPI");
	//private String API_SERVER_CORE = con.getConfigValue("ServerAPI-CORE");
	//private String API_CUST = con.getConfigValue("ServerAPI-CUST");
	private String LOCAL_SERVER = con.getConfigValue("ServerLocal");
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
		
		if(checkSession(session,"lvl_prm_brc")){
			token.regenToken(session);
			
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());

			return new ModelAndView("ExtConnMainView", model);
		}else{
			return new ModelAndView("redirect:/");
		}
		
	}
	

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public @ResponseBody String getParam(HttpSession session) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestGet(this.API_PARAMETER + "/connection/list",
				session.getAttribute("accesskey").toString());

	}
	
	@RequestMapping(value = "/list/{id}", method = RequestMethod.GET)
	public @ResponseBody String getDetail(@PathVariable("id")String id,HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestGet(this.API_PARAMETER + "/connection/list/"+id,
				session.getAttribute("accesskey").toString());

	}	

	@RequestMapping(value = "/ddl", method = RequestMethod.GET)
	public @ResponseBody String getDdlParam(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestGet(this.API_EN + "/master",
				session.getAttribute("accesskey").toString());

	}
	/*
 	@RequestMapping(value = "/insert", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String ins(HttpSession session, HttpServletRequest request) {
		token.regenToken(session);
		
		String s_name = request.getParameter("service_name").toString();
		String s_type = request.getParameter("service_type").toString();
		String s_url = request.getParameter("service_url").toString();
		String s_method = request.getParameter("service_method").toString();
		String[] testkey_h = request.getParameterValues("testkey_h");
		String[] testvalue_h = request.getParameterValues("testvalue_h");
		String[] testkey_d = request.getParameterValues("testkey_d");
		String[] testvalue_d = request.getParameterValues("testvalue_d");		
		
		JSONObject jData = new JSONObject();
		
		jData.put("con_name", s_name);
		jData.put("con_type", s_type);
		jData.put("con_url", s_url);
		jData.put("con_method", s_method);
		
		JSONArray jarDtz = new JSONArray();
		for(int x = 0;x<testkey_h.length;x++) {
			JSONObject jsub = new JSONObject();
			jsub.put("key", testkey_h[x]);
			jsub.put("val", testvalue_h[x]);
			jarDtz.put(jsub);
		}
		jData.put("con_header", jarDtz);		
		
		JSONArray jarDt = new JSONArray();
		for(int x = 0;x<testkey_d.length;x++) {
			JSONObject jsub = new JSONObject();
			jsub.put("key", testkey_d[x]);
			jsub.put("val", testvalue_d[x]);
			jarDt.put(jsub);
		}
		jData.put("con_data", jarDt);
		
		//return new RestServiceUnirest().requestPost(this.API_EN + "/connection/exec",
		//		session.getAttribute("accesskey").toString(),
		//		jData.toString());
		return "";
	}
 	*/
 	@RequestMapping(value = "/val", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String getVal(HttpSession session, HttpServletRequest request) {
		token.regenToken(session);
		
		//String s_name = request.getParameter("service_name").toString();
		//String s_type = request.getParameter("service_type").toString();
		String s_url = request.getParameter("service_url").toString();
		String s_method = request.getParameter("service_method").toString();

		//String[] testkey_d = request.getParameterValues("testkey_d");
		//String[] testvalue_d = request.getParameterValues("testvalue_d");		
		
		JSONObject jData = new JSONObject();
		
		//jData.put("con_name", s_name);
		//jData.put("con_type", s_type);
		jData.put("url", s_url);
		jData.put("method", s_method);

		if(request.getParameterValues("testKey_h").length > 0){
			String[] testkey_h = request.getParameterValues("testKey_h");
			String[] testvalue_h = request.getParameterValues("testValue_h");
			JSONArray jarDtz = new JSONArray();
			for(int x = 0;x<testkey_h.length;x++) {
				if(testkey_h[x] != ""){
					JSONObject jsub = new JSONObject();
					jsub.put("key", testkey_h[x]);
					jsub.put("val", testvalue_h[x]);
					jarDtz.put(jsub);
				}
			}
			jData.put("header", jarDtz);
		}

		if(s_method == "POST"){
		if(request.getParameterValues("testKey_d").length > 0){
			String[] testkey_d = request.getParameterValues("testKey_d");
			String[] testvalue_d = request.getParameterValues("testValue_d");
			JSONArray jarDt = new JSONArray();
			for(int x = 0;x<testkey_d.length;x++) {
				if(testkey_d[x] != ""){
					JSONObject jsub = new JSONObject();
					jsub.put("key", testkey_d[x]);
					jsub.put("val", testvalue_d[x]);
					jarDt.put(jsub);
				}
			}
			jData.put("data", jarDt);
		}		
		}
		
		String x =  new RestServiceUnirest().requestPost(this.API_PARAMETER + "/connection/exec",
				session.getAttribute("accesskey").toString(),
				jData.toString());
		//return jData.toString();
		return x;
	}
 	
 	@RequestMapping(value = "/execdb", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String execDb(HttpSession session, HttpServletRequest request) {
		token.regenToken(session);
		
		String con_db = request.getParameter("dbase").toString();
		String con_constring = request.getParameter("constring").toString();
		String con_query = request.getParameter("qry").toString();
		
		JSONObject jData = new JSONObject();
		jData.put("con_db", con_db);
		jData.put("con_constring", con_constring);
		jData.put("con_query", con_query);
		
		String x =  new RestServiceUnirest().requestPost(this.API_PARAMETER + "/connection/exec_db",
				session.getAttribute("accesskey").toString(),
				jData.toString());
		return x;
	} 	
			
}
