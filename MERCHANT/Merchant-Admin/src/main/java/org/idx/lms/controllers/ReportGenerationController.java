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
@RequestMapping("ReportGeneration")
public class ReportGenerationController {
	private ConfigApps con = new ConfigApps();
	private String SESSION_ID = "";
	private String API_SERVER = con.getConfigValue("ServerAPI");
	private String API_SERVER_REPORT = con.getConfigValue("ServerAPI-REPORT");
	private String API_SERVER_REPORT2 = con.getConfigValue("ServerAPI-REPORT2");
	private String API_CUSTOMER = con.getConfigValue("ServerAPI-CUST");
	private String API_LMS = con.getConfigValue("ServerAPI-LMS");
	private String LOCAL_SERVER = con.getConfigValue("ServerLocal");
	private String ID_TOKEN = con.getConfigValue("ID-TOKEN");
	private String PASS_TOKEN = con.getConfigValue("PASS-TOKEN");                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
	
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
	
	@RequestMapping(value = "/view/{code}")
	public ModelAndView CustomerDetail(ModelMap model, HttpSession session, HttpServletRequest req, @PathVariable("code") String code) {
		if (checkSession(session,"lvl_rpt_dyn")) {
			token.regenToken(session);
			model.addAttribute("api_server", this.API_SERVER);
			model.addAttribute("api_customer", this.API_CUSTOMER);
			model.addAttribute("api_lms", this.API_LMS);
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			return new ModelAndView("ReportGenerationDet", model);

		} else {
			return new ModelAndView("redirect:/");
		}
	}
	
	@RequestMapping(value = "/viewAudit/{code}")
	public ModelAndView CustomerDetailAudit(ModelMap model, HttpSession session, HttpServletRequest req, @PathVariable("code") String code) {
		if (checkSession(session,"lvl_rpt_dyn_nd")) {
			token.regenToken(session);
			model.addAttribute("api_server", this.API_SERVER);
			model.addAttribute("api_customer", this.API_CUSTOMER);
			model.addAttribute("api_lms", this.API_LMS);
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			return new ModelAndView("ReportGenerationDet", model);

		} else {
			return new ModelAndView("redirect:/");
		}
	}
	
	@RequestMapping(value = "/New")
	public ModelAndView AddNewRportGeneration(ModelMap model, HttpSession session, HttpServletRequest req) {
		if (checkSession(session,"lvl_rpt_dyn")) {
			token.regenToken(session);
			model.addAttribute("api_server", this.API_SERVER);
			model.addAttribute("api_customer", this.API_CUSTOMER);
			model.addAttribute("api_lms", this.API_LMS);
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			return new ModelAndView("ReportGenerationNew", model);

		} else {
			return new ModelAndView("redirect:/");
		}
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView dis_single(ModelMap model, HttpSession session, HttpServletRequest req) {
		if (checkSession(session, "lvl_rpt_dyn")) {
			token.regenToken(session);
			this.SESSION_ID = session.getAttribute("session_id").toString();
			model.addAttribute("api_server", this.API_SERVER);
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			return new ModelAndView("ReportGenerationMainView", model);
		} else {
			return new ModelAndView("redirect:/");
		}

	}
	
	@RequestMapping(value = "/nd", method = RequestMethod.GET)
	public ModelAndView dis_single_Audit2(ModelMap model, HttpSession session, HttpServletRequest req) {
		if (checkSession(session, "lvl_rpt_dyn_nd")) {
			token.regenToken(session);
			this.SESSION_ID = session.getAttribute("session_id").toString();
			model.addAttribute("api_server", this.API_SERVER);
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			return new ModelAndView("ReportGenerationMainViewAudit", model);
		} else {
			return new ModelAndView("redirect:/");
		}

	}
	
	@RequestMapping(value = "/ggetAllReport", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String ggetAllReport(HttpSession session, HttpServletRequest request) {
		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_SERVER_REPORT2 + "/Viewer/ViewerAllReport",
				session.getAttribute("accesskey").toString());
	}
	
	@RequestMapping(value = "/getAllReport", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String getAllReport(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		//String cif = req.getParameter("hdcif").toString();
		JSONObject jData = new JSONObject();
		
		jData.put("p_level_code", session.getAttribute("session_position").toString());
		
		/*
		 * JSONObject j = new JSONObject(new RestServiceUnirest().requestPost(
		 * "http://api5.danakini.co.id:30964/idcreport/ReportGeneration/ViewerReportbyLevel",
		 * session.getAttribute("accesskey").toString(), jData.toString()));
		 */
		
		return new RestServiceUnirest().requestPost(this.API_SERVER_REPORT2 + "/ReportGeneration/ViewerReportbyLevel",
				session.getAttribute("accesskey").toString(), jData.toString());
				
	}
	
	@RequestMapping(value = "/getAllReport2", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String getAllReportaudit(HttpSession session, HttpServletRequest request) {
		token.regenToken(session);
		JSONObject j = new JSONObject(new RestServiceUnirest().requestGet(this.API_SERVER_REPORT2 + "/Viewer/ViewerAllReport",
				session.getAttribute("accesskey").toString()));
		JSONArray jObj = j.getJSONArray("data");
		JSONArray test = new JSONArray();
		for (int i = 0, len = jObj.length(); i < len; i++) {
			JSONObject obj = jObj.getJSONObject(i);
			
			if(obj.getString("rpthname").endsWith("(A)")) {
				test.put(obj);
			 }
	       
		}
		String retStatus1 = j.getString("status");
		String retMsg1 = j.getString("message");
		String ret1 = "{\"status\":\""+retStatus1+"\","
				+ "\"message\":\""+retMsg1+"\","
				+ "\"data\":"
				+ test
				+ "}";
		
		return ret1;
		//return new RestServiceUnirest().requestGet(this.API_SERVER_REPORT + "/Viewer/ViewerAllReport",
		//		session.getAttribute("accesskey").toString());

	}
	
	
	@RequestMapping(value = "/getReportDet/{code}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String GetContact(@PathVariable("code") String code, HttpSession session,
			HttpServletRequest request) {
		token.regenToken(session);
		/*JSONObject result = new JSONObject( 
				new RestServiceUnirest().requestGet(this.API_SERVER_REPORT + "/Viewer/ViewerByCode/" + code, 
						session.getAttribute("accesskey").toString()));*/
		return new RestServiceUnirest().requestGet(
				this.API_SERVER_REPORT2 + "/Viewer/ViewerByCode/" + code, 
				session.getAttribute("accesskey").toString()
				);

	}
	
	@RequestMapping(value = "/getReportTable", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String getCustomerInfo(HttpSession session, HttpServletRequest request) {
		token.regenToken(session);
		String code = request.getParameter("code").toString();
		String filter = request.getParameter("condition").toString();
		System.out.println(code.toString());
		System.out.println(filter.toString());
		return new RestServiceUnirest().requestPost(this.API_SERVER_REPORT2 + "/Viewer/Exec",
				session.getAttribute("accesskey").toString(), 
				new JSONObject()
				.put("code", code)
				.put("condition", filter).toString());

	}
	
}
