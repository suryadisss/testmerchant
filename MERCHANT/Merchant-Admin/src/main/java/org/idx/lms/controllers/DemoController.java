package org.idx.lms.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.idx.lms.libs.ConfigApps;
import org.idx.lms.libs.TokenRegen;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("Demo")

public class DemoController {
	private ConfigApps con = new ConfigApps();
	private String SESSION_ID = "";
	private String API_SERVER_CUST = con.getConfigValue("ServerAPI-CUST");
	private String LOCAL_SERVER = con.getConfigValue("ServerLocal");
	
	TokenRegen token = new TokenRegen();

	@RequestMapping(value = "/Withdraw")
	public ModelAndView Withdraw(ModelMap model, HttpSession session, HttpServletRequest req) {
		token.regenToken(session);

		model.addAttribute("api_server_cust", this.API_SERVER_CUST);
		model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			return new ModelAndView("WithdrawMainView", model);
		
	}
	
	@RequestMapping(value = "/MarketStatus")
	public ModelAndView MarketStatus(ModelMap model, HttpSession session, HttpServletRequest req) {
		token.regenToken(session);

		model.addAttribute("api_server_cust", this.API_SERVER_CUST);
		model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			return new ModelAndView("MarketStatusMainView", model);
		
	}
	
	@RequestMapping(value = "/ParameterFunding")
	public ModelAndView ParameterKiniDanaku(ModelMap model, HttpSession session, HttpServletRequest req) {
		token.regenToken(session);

		model.addAttribute("api_server_cust", this.API_SERVER_CUST);
		model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			return new ModelAndView("ParameterFundingMainView", model);
		
	}
	
	@RequestMapping(value = "/Deposit")
	public ModelAndView Deposit(ModelMap model, HttpSession session, HttpServletRequest req) {
		token.regenToken(session);

		model.addAttribute("api_server_cust", this.API_SERVER_CUST);
		model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			return new ModelAndView("DepositMainView", model);
		
	}
	
	@RequestMapping(value = "/templateApproval")
	public ModelAndView template_approval(ModelMap model, HttpSession session, HttpServletRequest req) {
		token.regenToken(session);

		model.addAttribute("api_server_cust", this.API_SERVER_CUST);
		model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			return new ModelAndView("template_lender_approval_bk", model);
		
	}
	
	
	
}
