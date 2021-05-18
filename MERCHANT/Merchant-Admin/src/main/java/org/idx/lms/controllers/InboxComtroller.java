package org.idx.lms.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.idx.lms.libs.ConfigApps;
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
import org.unbescape.html.HtmlEscape;

@Controller
@RequestMapping("inbox")
public class InboxComtroller {
	private ConfigApps con = new ConfigApps();
	private String LOCAL_SERVER = con.getConfigValue("ServerLocal");
	private String API_SERVER_CORE = con.getConfigValue("ServerAPI-CORE");
	private String API_NOTIF = con.getConfigValue("ServerAPI-NOTIF");

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
		if (checkSession(session, "lvl_act_inbox")) {
			token.regenToken(session);
			model.addAttribute("id", session.getAttribute("session_id").toString());
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			return new ModelAndView("InboxMainView", model);

		} else {
			return new ModelAndView("redirect:/");
		}

	}

	@RequestMapping(value = "/getinboxuser/{id}", method = RequestMethod.GET)
	public @ResponseBody String main(@PathVariable("id")String id,HttpSession session, HttpServletRequest req) {
		return new RestServiceUnirest().requestGet(this.API_SERVER_CORE + "/inbox/user/"+id,
				session.getAttribute("accesskey").toString());
	}
	
	@RequestMapping(value = "/getdetailmsg/{id}", method = RequestMethod.GET)
	public @ResponseBody String getdetailmsg(@PathVariable("id")String id,HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_SERVER_CORE + "/inbox/detail/"+id,
				session.getAttribute("accesskey").toString());
	}
	
	@RequestMapping(value = "/setreadmsg/{id}", method = RequestMethod.GET)
	public @ResponseBody String setreadmsg(@PathVariable("id")String id,HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_SERVER_CORE + "/inbox/read/"+id,
				session.getAttribute("accesskey").toString());
	}
	@RequestMapping(value = "/deletemsg/{id}", method = RequestMethod.GET)
	public @ResponseBody String deletemsg(@PathVariable("id")String id,HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_SERVER_CORE + "/inbox/deleted/"+id,
				session.getAttribute("accesskey").toString());
	}
	
	@RequestMapping(value = "/getnotif", method = RequestMethod.GET)
	public @ResponseBody String getnotif(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_SERVER_CORE + "/inbox/type/",
				session.getAttribute("accesskey").toString());
	}
	@RequestMapping(value = "/getnotif/{id}", method = RequestMethod.GET)
	public @ResponseBody String getnotif(@PathVariable("id")String id, HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_SERVER_CORE + "/inbox/type/"+id,
				session.getAttribute("accesskey").toString());
	}
	
	/*
	 * NOTIF USER
	 */
	
	
	@RequestMapping(value = "/getinbox/inquiry", method = RequestMethod.POST)
	public @ResponseBody String inboxInquiry(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		String email = req.getParameter("email");
		
		return new RestServiceUnirest().requestPost(this.API_NOTIF + "/notification/all/user",
				session.getAttribute("accesskey").toString(), new JSONObject().put("email", email).toString());
	}
	
	
	@RequestMapping(value = "/getinbox/read", method = RequestMethod.POST)
	public @ResponseBody String read(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		String id = req.getParameter("id");
		
		return new RestServiceUnirest().requestPost(this.API_NOTIF + "/notification/detail",
				session.getAttribute("accesskey").toString(), new JSONObject().put("ntf_id", id).toString());
	}
	
	@RequestMapping(value = "/getinbox/mail/{id}", method = RequestMethod.GET)
	public @ResponseBody String read(@PathVariable("id")String id, HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
	
		
		
		try {
			JSONObject json = new JSONObject(new RestServiceUnirest().requestPost(this.API_NOTIF + "/notification/detail",
					session.getAttribute("accesskey").toString(), new JSONObject().put("ntf_id", id).toString()));
			if(json.getString("status").equalsIgnoreCase("success")) {
				JSONArray jr = json.getJSONArray("data");
				if( jr.length()>0) {
					JSONObject k = jr.getJSONObject(0);
					String unescapedText = HtmlEscape.unescapeHtml(k.getString("ntf_body")); 
					return unescapedText;
				}else {
					return "Content Not Found";
				}
				
			}else {
				return "Content Not Found";
			}
		} catch (Exception e) {
			// TODO: handle exception
			return "Content Not Found";
		}
	}
	
}
