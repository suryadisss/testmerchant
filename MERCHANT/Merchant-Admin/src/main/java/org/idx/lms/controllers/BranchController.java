package org.idx.lms.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.idx.lms.libs.ConfigApps;
import org.idx.lms.libs.LogActivity;
import org.idx.lms.libs.RestServiceUnirest;
import org.idx.lms.libs.TokenRegen;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.session.jdbc.JdbcOperationsSessionRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("branch_management")
public class BranchController {
	private ConfigApps con = new ConfigApps();
	private String API_PARAMETER = con.getConfigValue("ServerAPI-PARAMETER");
	private String API_CUST = con.getConfigValue("ServerAPI-CUST");
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
		
		if(checkSession(session,"lvl_adm_brc")){
			token.regenToken(session);
			
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());

			return new ModelAndView("BranchManagementMainView", model);
		}else{
			return new ModelAndView("redirect:/");
		}
		
	}
	
	@RequestMapping(value = "/Approval")
	public ModelAndView ApprovalPayorPRO_PO(ModelMap model, HttpSession session, HttpServletRequest req) {
		if (checkSession(session, "lvl_adm_brc_apr")) {
			token.regenToken(session);
			session.getAttribute("session_id").toString();
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			return new ModelAndView("BranchApprovalMainView", model);
		} else {
			return new ModelAndView("redirect:/");
		}

	} 
	

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public @ResponseBody String getListOfAccessLevel(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestGet(this.API_PARAMETER + "/branch/list_branch",
				session.getAttribute("accesskey").toString());

	}
	
	@RequestMapping(value = "/listapprove", method = RequestMethod.GET)
	public @ResponseBody String getListApproveOfbranch(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestGet(this.API_PARAMETER + "/branch/list_branch_draft",
				session.getAttribute("accesskey").toString());

	}
	
	@RequestMapping(value = "/approveBranch", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String approveBranch(HttpSession session, HttpServletRequest request) {
		token.regenToken(session);
		String x = "";

	try {

		JSONObject jData = new JSONObject();

		
		jData.put("p_status","approve");	
		jData.put("p_bcode", request.getParameter("b_code"));
		
		JSONObject log = new JSONObject(new LogActivity().insertLogCore(request, session,"branch", "Approve Branch Management", jData.toString()));
		if(log.getBoolean("success")) {
			if(log.getJSONArray("data").length()>0) {
				String id = log.getJSONArray("data").getJSONObject(0).get("resultprocess").toString();
				jData.put("p_logid", id);
				JSONObject json = new JSONObject(new RestServiceUnirest().requestPost(this.API_PARAMETER + "/branch/approval",
							session.getAttribute("accesskey").toString(), jData.toString()));

				x = json.toString();
			}else {
			x=new JSONObject().put("status", "Failed").put("message", "Failed to get log").toString();	
			}
		}else {
			x=new JSONObject().put("status", "Failed").put("message", "Failed to get log").toString();
		}
		
			
	} catch (Exception e) {
		x = e.getMessage();
	}
	return x;
	}

	@RequestMapping(value = "/rejectBranch", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String rejectProduct(HttpSession session, HttpServletRequest request) {
		token.regenToken(session);
		String x = "";

	try {

		JSONObject jData = new JSONObject();

		
		jData.put("p_status","reject");
		jData.put("p_bcode", request.getParameter("b_code"));
		JSONObject log = new JSONObject(new LogActivity().insertLogCore(request, session,"branch", "Reject Branch Management", jData.toString()));
		if(log.getBoolean("success")) {
			if(log.getJSONArray("data").length()>0) {
				String id = log.getJSONArray("data").getJSONObject(0).get("resultprocess").toString();
				jData.put("p_logid", id);
		JSONObject json = new JSONObject(new RestServiceUnirest().requestPost(this.API_PARAMETER + "/branch/approval",
							session.getAttribute("accesskey").toString(), jData.toString()));

		x = json.toString();
			}else {
				x=new JSONObject().put("status", "Failed").put("message", "Failed to get log").toString();	
				}
			}else {
				x=new JSONObject().put("status", "Failed").put("message", "Failed to get log").toString();
			}
		
			
	} catch (Exception e) {
		x = e.getMessage();
	}
	return x;
	}
	
	@RequestMapping(value = "/list/{id}", method = RequestMethod.GET)
	public @ResponseBody String getListOfAccessLevel(@PathVariable("id")String id,HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestGet(this.API_PARAMETER + "/branch/list_branch/"+id,
				session.getAttribute("accesskey").toString());

	}
	@RequestMapping(value = "/list_draft/{id}", method = RequestMethod.GET)
	public @ResponseBody String getListBranchOfDraft(@PathVariable("id")String id,HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		return objRest.requestGet(this.API_PARAMETER + "/branch/list_branch_draft/"+id,
				session.getAttribute("accesskey").toString());

	}
	
	@RequestMapping(value = "/list_group", method = RequestMethod.GET)
	public @ResponseBody String list_group(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
//		return objRest.requestGet(this.API_PARAMETER + "/branch/list_branch_group",
//				session.getAttribute("accesskey").toString());
		return objRest.requestGet(this.API_PARAMETER + "/EngineParam/list/Tenant",
				session.getAttribute("accesskey").toString());		

	}
	
	@RequestMapping(value = "/list_bank", method = RequestMethod.GET)
	public @ResponseBody String list_bank(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		JSONObject jresult = new JSONObject();
		
		JSONObject jsonx = new JSONObject(objRest.requestGet(this.API_CUST + "/ddown/BankName",
				session.getAttribute("accesskey").toString()));
		if(jsonx.getString("status").equalsIgnoreCase("success")) {
			jresult.put("all_bank", jsonx.getJSONArray("data"));
		}else {
			jresult.put("all_bank", new JSONArray().toString());
		}
		
		JSONObject jsony = new JSONObject(objRest.requestGet(this.API_PARAMETER + "/branch/list_bank",
				session.getAttribute("accesskey").toString()));
		if(jsony.getString("status").equalsIgnoreCase("success")) {
			jresult.put("bank_existing", jsony.getJSONArray("data"));
		}else {
			jresult.put("bank_existing", new JSONArray().toString());
		}
		
		return jresult.toString();

	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public @ResponseBody String delete(@PathVariable("id")String id,HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		RestServiceUnirest objRest = new RestServiceUnirest();
		JSONObject log = new JSONObject(new LogActivity().insertLogCore(req, session,"branch", "Delete Branch Management", id));
		if(log.getBoolean("success")) {
			String logid = log.getJSONArray("data").getJSONObject(0).get("resultprocess").toString();
			return objRest.requestPost(this.API_PARAMETER + "/branch/delete",
					session.getAttribute("accesskey").toString(), new JSONObject().put("p_bcode", id).put("p_logid", logid).toString());
		}else {
			return new JSONObject().put("status", "Failed").put("message", "Failed to get log").toString();
		}
		

	}
	
	@RequestMapping(value = "/dopost", method = RequestMethod.POST)
	public @ResponseBody String dopost(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		
		String bx = req.getParameter("isedit");
		
		JSONObject jData = new JSONObject();
		jData.put("p_bcode", req.getParameter("b_code"));
		jData.put("p_bgroup", req.getParameter("b_group"));
		jData.put("p_bname", req.getParameter("b_name"));
		jData.put("p_baddress", req.getParameter("b_address"));
		jData.put("p_bbank", req.getParameter("b_bank"));
		jData.put("p_bbank_name", req.getParameter("b_bank_name"));
		jData.put("p_bnorek", req.getParameter("b_norek"));
		jData.put("p_bcity", req.getParameter("b_city"));
		jData.put("p_pos_flag", req.getParameter("sales_system"));
		RestServiceUnirest objRest = new RestServiceUnirest();
		if(bx.equals("1")) {
			//addnew
			
			JSONObject log = new JSONObject(new LogActivity().insertLogCore(req, session,"branch", "Insert Branch Management", jData.toString()));
			if(log.getBoolean("success")) {
				if(log.getJSONArray("data").length()>0) {
					String id = log.getJSONArray("data").getJSONObject(0).get("resultprocess").toString();
					jData.put("p_logid", id);
					return objRest.requestPost(this.API_PARAMETER + "/branch/insert",
							session.getAttribute("accesskey").toString(),jData.toString());
				}else {
					return new JSONObject().put("status", "Failed").put("message", "Failed to get log").toString();
				}
			}else {
				return new JSONObject().put("status", "Failed").put("message", "Failed to get log").toString();
			}
			
			

		}else if(bx.equals("0")) {
			//update
			
			JSONObject log = new JSONObject(new LogActivity().insertLogCore(req, session,"branch", "Update Branch Management", jData.toString()));
			if(log.getBoolean("success")) {
				if(log.getJSONArray("data").length()>0) {
					String id = log.getJSONArray("data").getJSONObject(0).get("resultprocess").toString();
					jData.put("p_logid", id);
					return objRest.requestPost(this.API_PARAMETER + "/branch/update",
							session.getAttribute("accesskey").toString(),jData.toString());
				}else {
					return new JSONObject().put("status", "Failed").put("message", "Failed to get log").toString();
				}
			}else {
				return new JSONObject().put("status", "Failed").put("message", "Failed to get log").toString();
			}
			
		}else {
			return "";
		}
		
		
	}
}
