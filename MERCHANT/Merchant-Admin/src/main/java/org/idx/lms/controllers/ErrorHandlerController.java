package org.idx.lms.controllers;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("error")
public class ErrorHandlerController {
	@RequestMapping(method = RequestMethod.GET)
	public @ResponseBody String error() {
		return "this error page, you wrong direction, please go back.";
	}
	
	@RequestMapping(value= "400",method = RequestMethod.GET)
	public ModelAndView error400(ModelMap model, HttpServletRequest httpRequest) {
		model.addAttribute("errorCode","400");
		model.addAttribute("errorHead","Http Error Code: 400");
		model.addAttribute("errorMsg","This page you are looking for is bad request");
		return new ModelAndView("ErrorView",model);
	}
	
	@RequestMapping(value= "404",method = RequestMethod.GET)
	public ModelAndView error404(ModelMap model, HttpServletRequest httpRequest) {
		model.addAttribute("errorCode","404");
		model.addAttribute("errorHead","Http Error Code: 404");
		model.addAttribute("errorMsg","This page you are looking for does not exist");
		return new ModelAndView("ErrorView",model);
	}
	
	@RequestMapping(value= "403",method = RequestMethod.GET)
	public ModelAndView error403(ModelMap model, HttpServletRequest httpRequest) {
		model.addAttribute("errorCode","403");
		model.addAttribute("errorHead","Http Error Code: 403");
		model.addAttribute("errorMsg","This page you are looking for is forbiden");
		return new ModelAndView("ErrorView",model);
	}
	@RequestMapping(value= "401",method = RequestMethod.GET)
	public ModelAndView error401(ModelMap model, HttpServletRequest httpRequest) {
		model.addAttribute("errorCode","401");
		model.addAttribute("errorHead","Http Error Code: 401");
		model.addAttribute("errorMsg","This page you are looking for is Unauthorized");
		return new ModelAndView("ErrorView",model);
	}
	
	@RequestMapping(value= "405",method = RequestMethod.GET)
	public ModelAndView error405(ModelMap model, HttpServletRequest httpRequest) {
		model.addAttribute("errorCode","405");
		model.addAttribute("errorHead","Http Error Code: 405");
		model.addAttribute("errorMsg","This page you are looking for is  Method Not Allowed");
		return new ModelAndView("ErrorView",model);
	}
	@RequestMapping(value= "500",method = RequestMethod.GET)
	public ModelAndView error500(ModelMap model, HttpServletRequest httpRequest) {
		model.addAttribute("errorCode","500");
		model.addAttribute("errorHead","Http Error Code: 500");
		model.addAttribute("errorMsg","This page you are looking for is  Internal Server Error");
		return new ModelAndView("ErrorView",model);
	}
	@RequestMapping(value= "503",method = RequestMethod.GET)
	public ModelAndView error503(ModelMap model, HttpServletRequest httpRequest) {
		model.addAttribute("errorCode","503");
		model.addAttribute("errorHead","Http Error Code: 503");
		model.addAttribute("errorMsg","This page you are looking for is  Internal Server Error (Unsupported servlet method)");
		return new ModelAndView("ErrorView",model);
	}
	
}
