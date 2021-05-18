package org.idx.lms.controllers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.idx.lms.libs.ConfigApps;
import org.idx.lms.libs.LogActivity;
import org.idx.lms.libs.RestServiceUnirest;
import org.idx.lms.libs.TokenRegen;
import org.idx.lms.model.inquiry.InquiryItem;
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

@Controller
@RequestMapping("unblock_submission")
public class UnblockSubmissionController {
	private ConfigApps con = new ConfigApps();
	private String API_SERVER = con.getConfigValue("ServerAPI");
	private String API_CUSTOMER = con.getConfigValue("ServerAPI-CUST");
	private String API_IMS = con.getConfigValue("ServerAPI-IMS");
	private String API_LMS = con.getConfigValue("ServerAPI-LMS");
	private String LOCAL_SERVER = con.getConfigValue("ServerLocal");
	private String SERVER_PHP = con.getConfigValue("ServerPHP");
	private String SERVER_IMG = con.getConfigValue("URL_ACCESS_IMG");
	private String SESSION_ID;
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
	public ModelAndView main(ModelMap model, HttpSession session, @ModelAttribute("InquiryItem") InquiryItem inq,
			HttpServletRequest req) {
		if (checkSession(session,"lvl_unb_sub")) {
			token.regenToken(session);
			this.SESSION_ID = session.getAttribute("session_id").toString();
			model.addAttribute("api_server", this.API_SERVER);
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			model.addAttribute("SERVER_PHP", this.SERVER_PHP);
			//return new ModelAndView("UnblockSubmissionMainView", model);
			return new ModelAndView("UnblockSubmissionSearchingView", model);

		} else {
			return new ModelAndView("redirect:/");
		}

	}
	
	@RequestMapping(value = "/dopost", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String SearchData(@ModelAttribute("InquiryItem") InquiryItem inq, HttpSession session) {	
		token.regenToken(session);
		
		String x = "";
		try {
			JSONObject jData = new JSONObject();
			if (inq.getMobile() != "") {
				jData.put("key", "phone").put("val", inq.getMobile().trim());
			} else if (inq.getEmail() != "") {
				jData.put("key", "email").put("val", inq.getEmail().trim());
			}			
			
			
			JSONObject jReturn = new JSONObject();
			JSONObject jResult = new JSONObject(
					new RestServiceUnirest().requestPost(this.API_CUSTOMER + "/Unblock/CustomerDetailInfo",
							session.getAttribute("accesskey").toString(), jData.toString()));
			//x =  jResult.toString();
			if(jResult.getString("message").equalsIgnoreCase("Processed")) {
			
				if (jResult.getString("status").equalsIgnoreCase("success")) {
					JSONArray jLoop = jResult.getJSONArray("data");
					int jl =jLoop.length();
					for (int i = 0; i < jl; i++) {
						JSONObject jo = jLoop.getJSONObject(i);
						byte[] encodedBytes = Base64.getEncoder().encode(jo.get("cst_cif").toString().getBytes());
						jResult.put("cst_cif_en", new String(encodedBytes));
						
					}
					x =  jResult.toString();
					
				} else {
					
				}	
			}else {
				x =  jResult.toString();
			}
		} catch (Exception e) {
			x = e.getMessage();
		}
		return x;
	}
	
	
	@RequestMapping(value = "/getsub/{cif}", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String DataSub(@ModelAttribute("InquiryItem") InquiryItem inq, HttpSession session,  @PathVariable("cif") String cif) {	
		token.regenToken(session);
		this.SESSION_ID = session.getAttribute("session_id").toString();
			String x;
			JSONObject jData = new JSONObject();
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ssZ");
			String date = df.format(new Date());
			jData.put("key", "cif").put("val", cif);
							
			JSONObject jReturn = new JSONObject();
			JSONObject jResult = new JSONObject(
					new RestServiceUnirest().requestPost(this.API_CUSTOMER + "/Unblock/CustomerDetailInfo",
							session.getAttribute("accesskey").toString(), jData.toString()));
			jResult.put("cst_username", SESSION_ID.toString().trim()).put("cst_created_date_his", date);

			x = jResult.toString();
			/*return new RestServiceUnirest().requestPost(this.API_CUSTOMER + "/Unblock/CustomerDetailInfo",
					session.getAttribute("accesskey").toString(), jData.toString());*/
			return x;
	}
	
	@RequestMapping(value = "/getUnblockHistory/{cif}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String checkUnblockHistory(@PathVariable("cif") String cif, HttpSession session) {
		token.regenToken(session);
		JSONObject o = new JSONObject(new RestServiceUnirest().requestGet(this.API_CUSTOMER + "/Unblock/getUnblockHistory/" + cif,
				session.getAttribute("accesskey").toString()));
		return new RestServiceUnirest().requestGet(this.API_CUSTOMER + "/Unblock/getUnblockHistory/" + cif,
				session.getAttribute("accesskey").toString());
	}
	
	@RequestMapping(value = "/unblock_main_view/{cif}", method = RequestMethod.GET)
	public ModelAndView mainhr(ModelMap model, HttpSession session, @ModelAttribute("InquiryItem") InquiryItem inq,
			HttpServletRequest req, @PathVariable("cif") String cif) {
		if (checkSession(session,"lvl_unb_sub")) {
			token.regenToken(session);
			byte[] decodedBytes = Base64.getDecoder().decode(cif);
			model.addAttribute("cif", new String(decodedBytes));
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			return new ModelAndView("UnblockSubmissionMainView", model);

		} else {
			return new ModelAndView("redirect:/");
		}

	}
	
  	@RequestMapping(value = "/setUnblock/{cif}", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String setUnblock(@PathVariable("cif") String cif, HttpSession session,
			HttpServletRequest req) {
		token.regenToken(session);

		JSONObject jData = new JSONObject();

		jData.put("cif", cif);
		jData.put("status", "UnblockApproval");
		jData.put("user", session.getAttribute("session_id").toString());
		jData.put("reason", req.getParameter("reason"));

				return new RestServiceUnirest().requestPost(this.API_CUSTOMER + "/Unblock/setUnblock",
						session.getAttribute("accesskey").toString(), jData.toString());

	}
  	

    @RequestMapping(value = "/getUnblock", method = RequestMethod.GET, produces = "application/json")
  	public @ResponseBody String getUnblock(HttpSession session) {
  		token.regenToken(session);
  		JSONObject j = new JSONObject(new RestServiceUnirest().requestGet(this.API_CUSTOMER + "/Unblock/getUnblock",
  				session.getAttribute("accesskey").toString()));
  		return new RestServiceUnirest().requestGet(this.API_CUSTOMER + "/Unblock/getUnblock",
  				session.getAttribute("accesskey").toString());
  	}

    @RequestMapping(value = "/getUnblock/{cif}", method = RequestMethod.GET, produces = "application/json")
  	public @ResponseBody String cek_unblock(@PathVariable("cif") String cif, HttpSession session) {
  		token.regenToken(session);
  		return new RestServiceUnirest().requestGet(this.API_CUSTOMER + "/Unblock/getUnblock/" + cif,
  				session.getAttribute("accesskey").toString());
  	}

	@RequestMapping(value = "/setUnblockReject", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String setUnblockRejected(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		String cif = req.getParameter("hdcif").toString();
		JSONObject jData = new JSONObject();
		
		jData.put("cif", cif);
		jData.put("status", "Decline");
		jData.put("approval_user", session.getAttribute("session_id").toString());
				
				return new RestServiceUnirest().requestPost(this.API_CUSTOMER + "/Unblock/setUnblockApproved",
						session.getAttribute("accesskey").toString(), jData.toString());
				
	}
	
	@RequestMapping(value = "/setUnblockApproved", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String setUnblockApproved(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		String cif = req.getParameter("hdcif").toString();
		JSONObject jData = new JSONObject();
		
		jData.put("cif", cif);
		jData.put("status", "Unblock");
		jData.put("approval_user", session.getAttribute("session_id").toString());
				
				return new RestServiceUnirest().requestPost(this.API_CUSTOMER + "/Unblock/setUnblockApproved",
						session.getAttribute("accesskey").toString(), jData.toString());

		
	}
	

  	@RequestMapping(value = "/approval", method = RequestMethod.GET)
	public ModelAndView mainv(ModelMap model, HttpSession session, @ModelAttribute("InquiryItem") InquiryItem inq,
			HttpServletRequest req) {
		if (checkSession(session, "lvl_unb_sub_app")) {
			token.regenToken(session);
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			return new ModelAndView("UnblockSubmissionApprovalMainView", model);

		} else {
			return new ModelAndView("redirect:/");
		}
	}



}