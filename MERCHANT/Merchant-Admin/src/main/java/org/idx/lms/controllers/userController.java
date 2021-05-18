package org.idx.lms.controllers;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.idx.lms.libs.ConfigApps;
import org.idx.lms.libs.EncryptDiggest;
import org.idx.lms.libs.LibsGeneral;
import org.idx.lms.libs.LogActivity;
import org.idx.lms.libs.RestServiceUnirest;
import org.idx.lms.libs.TokenRegen;
import org.idx.lms.model.user.PostUser;
import org.idx.lms.model.user.userManagement;
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
import com.google.gson.Gson;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;

@Controller
@RequestMapping("user")
public class userController {
	// lConn dbConn = new lConn();
	private ConfigApps con = new ConfigApps();
	private String API_SERVER = con.getConfigValue("ServerAPI");
	private String API_SERVER_CORE = con.getConfigValue("ServerAPI-CORE");
	private String API_SERVER_PARAMETER = con.getConfigValue("ServerAPI-PARAMETER");
	private String LOCAL_SERVER = con.getConfigValue("ServerLocal");
	private String DEFAULT_PASSWORD = con.getConfigValue("DeafaulPasswordNewUser");
	private String SESSION_ID = "";
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
	public ModelAndView main(ModelMap model, HttpSession session, HttpServletRequest req,
			@ModelAttribute("userManagement") userManagement us) {
		if (checkSession(session, "lvl_adm_mgt")) {
			token.regenToken(session);
			this.SESSION_ID = session.getAttribute("session_id").toString();

			model.addAttribute("API_SERVER_CORE", this.API_SERVER_CORE);
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			model.addAttribute("session_id", this.SESSION_ID);
			return new ModelAndView("user", model);

		} else {
			return new ModelAndView("redirect:/");
		}

	}
	// untuk menu Other
	@RequestMapping(value = "/management_nd",method = RequestMethod.GET)
	public ModelAndView main2(ModelMap model, HttpSession session, HttpServletRequest req,
			@ModelAttribute("userManagement") userManagement us) {
		if (checkSession(session, "lvl_other_usr_mng")) {
			token.regenToken(session);
			this.SESSION_ID = session.getAttribute("session_id").toString();

			model.addAttribute("API_SERVER_CORE", this.API_SERVER_CORE);
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());
			model.addAttribute("session_id", this.SESSION_ID);
			return new ModelAndView("userOther", model);

		} else {
			return new ModelAndView("redirect:/");
		}

	}
	// untuk menu Other
	@RequestMapping(value = "/getListUser", method = RequestMethod.GET)
	public @ResponseBody String getListOfUser(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		String x = "";
		try {
			HttpResponse<String> postResponse = Unirest.get(this.API_SERVER_CORE + "/user/getDataSetUser")
					.header("accept", "application/json")
					.header("Authorization", "Bearer " + session.getAttribute("accesskey")).asString();
			x = postResponse.getBody();
		} catch (Exception e) {
			// TODO: handle exception
			x = e.getMessage();
		}
		return x;

	}

	@RequestMapping(value = "/PostCallParameterGetDDL", method = RequestMethod.POST)
	public @ResponseBody String getListOfDropdownlist(HttpSession session, HttpServletRequest req) {
		String x = "";
		token.regenToken(session);
		HttpResponse<JsonNode> postResponse = null;
		JSONObject jParam = new JSONObject();
		jParam.put("p_type", req.getParameter("p_type"));
		jParam.put("p_usr", req.getParameter("p_usr"));
		JSONArray jaDtLoginLog = new JSONArray();
		jaDtLoginLog.put(jParam);

		try {
			postResponse = Unirest.post(this.API_SERVER_CORE + "/user/postJDataCallParameterDDL")
					.header("Content-Type", "application/json")
					.header("Authorization", "Bearer " + (String) session.getAttribute("accesskey"))
					// .field("p_type",req.getParameter("p_type")).field("p_usr",
					// req.getParameter("p_usr")).asJson();
					.body(jaDtLoginLog).asJson();

			x = postResponse.getBody().toString();
		} catch (Exception e) {
			// TODO: handle exception
			x = e.getMessage();
		}
		return x;
	}

	@RequestMapping(value = "/getRegionArea/{val}", method = RequestMethod.GET)
	public @ResponseBody String getRegionAndArea(@PathVariable("val") String id, HttpSession session,
			HttpServletRequest req) {
		token.regenToken(session);
		String x = "";
		try {
			HttpResponse<String> postResponse = Unirest.get(this.API_SERVER_CORE + "/user/getRegionLabel/" + id)
					.header("accept", "application/json")
					.header("Authorization", "Bearer " + session.getAttribute("accesskey")).asString();
			x = postResponse.getBody();
		} catch (Exception e) {
			// TODO: handle exception
			x = e.getMessage();
		}
		return x;

	}

	@RequestMapping(value = "/getDataUser/{val}", method = RequestMethod.GET)
	public @ResponseBody String getDataUser(@PathVariable("val") String usrid, HttpSession session,
			HttpServletRequest req) {
		token.regenToken(session);
		String x = "";
		try {
			HttpResponse<String> postResponse = Unirest.get(this.API_SERVER_CORE + "/login/getDataUser/" + usrid)
					.header("accept", "application/json")
					.header("Authorization", "Bearer " + session.getAttribute("accesskey")).asString();
			x = postResponse.getBody();
		} catch (Exception e) {
			// TODO: handle exception
			x = e.getMessage();
		}
		return x;

	}

	// Existing code before enhancement loguser
/*	@RequestMapping(value = "/insertUser", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String submitData(@ModelAttribute("userManagement") userManagement us, HttpSession session,
			HttpServletRequest request) {
		token.regenToken(session);
		String x = "";

		try {
			if (us.getNew_edit_status().equals("new")) {

				// TripleDESEncryption desEnc = new TripleDESEncryption(this.DES_KEYSTRING,
				// this.DES_IVSTRING);
				EncryptDiggest en = new EncryptDiggest();
				String DEF_PASS = en.hashing(this.DEFAULT_PASSWORD);

				PostUser PostItem = new PostUser();
				PostItem.setP_usrid(us.getTxtUserID().trim());
				PostItem.setP_name(us.getTxtName());
				PostItem.setP_nip(us.getTxtNIP());
				PostItem.setP_email(us.getTxtEmail());
				PostItem.setP_branchcode(us.getDdlBranch());
				PostItem.setP_tnt_alias(us.getDdlTenant());
				PostItem.setP_spv(us.getDdlSupervisor());
				PostItem.setP_position(us.getDdlPosition());
				PostItem.setP_acclevel(us.getDdlAccessLevel());
				PostItem.setP_efectivedate(us.getTxtEffectiveDate());
				PostItem.setP_status(new LibsGeneral().getTrueFalseStringUp(us.isChkStatus()));
				// PostItem.setP_group_alias(us.getDdlGroupAlias());
				PostItem.setP_group_alias(request.getParameter("ddlGroupPartner"));
				PostItem.setP_parter_alias(request.getParameter("ddlPartnerDetail"));
				// PostItem.setP_parter_alias(us.getDdlPartnerAlias());
				PostItem.setP_usr(session.getAttribute("session_id").toString());
				PostItem.setP_defaultpwd(DEF_PASS);

				String[] cmb_status = null;
				if (us.getCmb_notif() != null && us.getCmb_notif() != "") {
					cmb_status = us.getCmb_notif().split(",");
				}

				Gson gson = new Gson();
				String data = "[" + gson.toJson(PostItem).toString() + "]";

				HttpResponse<JsonNode> postResponse = Unirest
						.post(this.API_SERVER_CORE + "/user/postJDataInsertRecord/")
						.header("Content-Type", "application/json")
						.header("Authorization", "Bearer " + session.getAttribute("accesskey").toString())
						.body(data.toString()).asJson();
				if (postResponse.getStatus() == 200) {
					JSONObject json = new JSONObject(postResponse.getBody().toString());
					if (json.getBoolean("success")) {
						if (us.getCmb_notif() != null && us.getCmb_notif() != "") {

							for (int i = 0; i < cmb_status.length; i++) {
								JSONObject jsonR;

								jsonR = new JSONObject(new RestServiceUnirest().requestPost(
										this.API_SERVER_CORE + "/inbox/user/authorization",
										session.getAttribute("accesskey").toString(),
										new JSONObject().put("usr_id", us.getTxtUserID()).put("ntf_typ", cmb_status[i])
												.toString()));
							}

						}
						x = "Success";
					} else {
						x = "Failed";
					}

				}

			} else if (us.getNew_edit_status().equals("edit")) {

				JSONObject jParam = new JSONObject();
				PostUser PostItem = new PostUser();
				PostItem.setP_usrid(us.getTxtUserID().trim());
				PostItem.setP_name(us.getTxtName());
				PostItem.setP_nip(us.getTxtNIP());
				PostItem.setP_email(us.getTxtEmail());
				PostItem.setP_branchcode(us.getDdlBranch());
				PostItem.setP_tnt_alias(us.getDdlTenant());
				PostItem.setP_spv(us.getDdlSupervisor());
				PostItem.setP_position(us.getDdlPosition());
				PostItem.setP_acclevel(us.getDdlAccessLevel());
				PostItem.setP_efectivedate(us.getTxtEffectiveDate());
				PostItem.setP_group_alias(request.getParameter("ddlGroupPartner"));
				PostItem.setP_parter_alias(request.getParameter("ddlPartnerDetail"));
				// PostItem.setP_parter_alias(us.getDdlPartnerAlias());
				// PostItem.setP_group_alias(us.getDdlGroupAlias());
				PostItem.setP_status(new LibsGeneral().getTrueFalseStringUp(us.isChkStatus()));
				PostItem.setP_usr(session.getAttribute("session_id").toString());
				PostItem.setP_defaultpwd("");
				String[] cmb_status = null;
				if (us.getCmb_notif() != null && us.getCmb_notif() != "") {
					cmb_status = us.getCmb_notif().split(",");
				}
				Gson gson = new Gson();
				String data = "[" + gson.toJson(PostItem).toString() + "]";

				ObjectMapper mapper = new ObjectMapper();
				HttpResponse<JsonNode> postResponse = Unirest.post(this.API_SERVER_CORE + "/user/postJDataEditRecord/")
						.header("Content-Type", "application/json")
						.header("Authorization", "Bearer " + session.getAttribute("accesskey").toString())
						.body(data.toString()).asJson();
				if (postResponse.getStatus() == 200) {
					JSONObject json = new JSONObject(postResponse.getBody().toString());
					if (json.getBoolean("success")) {
						if (us.getCmb_notif() != null && us.getCmb_notif() != "") {

							for (int i = 0; i < cmb_status.length; i++) {
								JSONObject jsonR;

								jsonR = new JSONObject(new RestServiceUnirest().requestPost(
										this.API_SERVER_CORE + "/inbox/user/authorization",
										session.getAttribute("accesskey").toString(),
										new JSONObject().put("usr_id", us.getTxtUserID()).put("ntf_typ", cmb_status[i])
												.toString()));
							}

						}
						x = "Success";
					} else {
						x = "Failed";
					}

				}
			}
		} catch (Exception e) {
			x = e.getMessage();
		}
		return x;
	}*/
	// Existing code before enhancement loguser

	@RequestMapping(value = "/insertUser", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String submitData(@ModelAttribute("userManagement") userManagement us, HttpSession session,
			HttpServletRequest request) {
		token.regenToken(session);
		String x = "";

		try {
			if (us.getNew_edit_status().equals("new")) {

				EncryptDiggest en = new EncryptDiggest();
				String DEF_PASS = en.hashing(this.DEFAULT_PASSWORD);

				PostUser PostItem = new PostUser();
				PostItem.setP_usrid(us.getTxtUserID().trim());
				PostItem.setP_name(us.getTxtName());
				PostItem.setP_nip(us.getTxtNIP());
				PostItem.setP_email(us.getTxtEmail());
				PostItem.setP_branchcode(us.getDdlBranch());
				PostItem.setP_tnt_alias(us.getDdlTenant());
				PostItem.setP_spv(us.getDdlSupervisor());
				PostItem.setP_position(us.getDdlPosition());
				PostItem.setP_acclevel(us.getDdlAccessLevel());
				PostItem.setP_efectivedate(us.getTxtEffectiveDate());
				PostItem.setP_status(new LibsGeneral().getTrueFalseStringUp(us.isChkStatus()));
				PostItem.setP_group_alias(request.getParameter("ddlGroupPartner"));
				PostItem.setP_parter_alias(request.getParameter("ddlPartnerDetail"));
				PostItem.setP_usr(session.getAttribute("session_id").toString());
				PostItem.setP_defaultpwd(DEF_PASS);

				String[] cmb_status = null;
				if (us.getCmb_notif() != null && us.getCmb_notif() != "") {
					cmb_status = us.getCmb_notif().split(",");
				}

				Gson gson = new Gson();
				JSONObject log = new JSONObject(new LogActivity().insertLogCore(request, session, "user_management",
						"Insert", "-"));
				if (log.getBoolean("success")) {
					if (log.getJSONArray("data").length() > 0) {
						JSONArray jObj = log.getJSONArray("data");
						JSONObject d = jObj.getJSONObject(0);
						Integer id = d.getInt("resultprocess");
						PostItem.setP_log_id(id);
						String data = "[" + gson.toJson(PostItem).toString() + "]";
						HttpResponse<JsonNode> postResponse = Unirest
								.post(this.API_SERVER_CORE + "/user/postJDataInsertRecord/")
								.header("Content-Type", "application/json")
								.header("Authorization", "Bearer " + session.getAttribute("accesskey").toString())
								.body(data.toString()).asJson();
						if (postResponse.getStatus() == 200) {
							JSONObject json = new JSONObject(postResponse.getBody().toString());
							if (json.getBoolean("success")) {
								if (us.getCmb_notif() != null && us.getCmb_notif() != "") {

									for (int i = 0; i < cmb_status.length; i++) {
										JSONObject jsonR;

										jsonR = new JSONObject(new RestServiceUnirest().requestPost(
												this.API_SERVER_CORE + "/inbox/user/authorization",
												session.getAttribute("accesskey").toString(),
												new JSONObject().put("usr_id", us.getTxtUserID()).put("ntf_typ", cmb_status[i])
														.toString()));
									}

								}
								x = "Success";
							} else {
								x = "Failed";
							}

						}
					} else {
						x = new JSONObject().put("status", "Failed").put("message", "Failed to get log").toString();
					}

				} else {
					x = new JSONObject().put("status", "Failed").put("message", "Upload Failed").toString();
				}
			} else if (us.getNew_edit_status().equals("edit")) {

				JSONObject jParam = new JSONObject();
				PostUser PostItem = new PostUser();
				PostItem.setP_usrid(us.getTxtUserID().trim());
				PostItem.setP_name(us.getTxtName());
				PostItem.setP_nip(us.getTxtNIP());
				PostItem.setP_email(us.getTxtEmail());
				PostItem.setP_branchcode(us.getDdlBranch());
				PostItem.setP_tnt_alias(us.getDdlTenant());
				PostItem.setP_spv(us.getDdlSupervisor());
				PostItem.setP_position(us.getDdlPosition());
				PostItem.setP_acclevel(us.getDdlAccessLevel());
				PostItem.setP_efectivedate(us.getTxtEffectiveDate());
				PostItem.setP_group_alias(request.getParameter("ddlGroupPartner"));
				PostItem.setP_parter_alias(request.getParameter("ddlPartnerDetail"));

				PostItem.setP_status(new LibsGeneral().getTrueFalseStringUp(us.isChkStatus()));
				PostItem.setP_usr(session.getAttribute("session_id").toString());
				PostItem.setP_defaultpwd("");
				String[] cmb_status = null;
				if (us.getCmb_notif() != null && us.getCmb_notif() != "") {
					cmb_status = us.getCmb_notif().split(",");
				}
				Gson gson = new Gson();

				ObjectMapper mapper = new ObjectMapper();
				JSONObject log = new JSONObject(new LogActivity().insertLogCore(request, session, "user_management",
						"Edit", "-"));
				if (log.getBoolean("success")) {
					if (log.getJSONArray("data").length() > 0) {
						JSONArray jObj = log.getJSONArray("data");
						JSONObject d = jObj.getJSONObject(0);
						Integer id = d.getInt("resultprocess");
						PostItem.setP_log_id(id);
						String data = "[" + gson.toJson(PostItem).toString() + "]";
						HttpResponse<JsonNode> postResponse = Unirest.post(this.API_SERVER_CORE + "/user/postJDataEditRecord/")
								.header("Content-Type", "application/json")
								.header("Authorization", "Bearer " + session.getAttribute("accesskey").toString())
								.body(data.toString()).asJson();
						if (postResponse.getStatus() == 200) {
							JSONObject json = new JSONObject(postResponse.getBody().toString());
							if (json.getBoolean("success")) {
								if (us.getCmb_notif() != null && us.getCmb_notif() != "") {

									for (int i = 0; i < cmb_status.length; i++) {
										JSONObject jsonR;

										jsonR = new JSONObject(new RestServiceUnirest().requestPost(
												this.API_SERVER_CORE + "/inbox/user/authorization",
												session.getAttribute("accesskey").toString(),
												new JSONObject().put("usr_id", us.getTxtUserID()).put("ntf_typ", cmb_status[i])
														.toString()));
									}

								}
								x = "Success";
							} else {
								x = "Failed";
							}

						}
					} else {
						x = new JSONObject().put("status", "Failed").put("message", "Failed to get log").toString();
					}

				} else {
					x = new JSONObject().put("status", "Failed").put("message", "Upload Failed").toString();
				}
			}
		} catch (Exception e) {
			x = e.getMessage();
		}
		return x;
	}

	// Existing code before enhancement loguser
/*	@RequestMapping(value = "/deleteUser/{val}", method = RequestMethod.GET)
	public @ResponseBody String deleteDataUser(@PathVariable("val") String usrid, HttpSession session,
			HttpServletRequest req) {
		token.regenToken(session);
		String x = "";
		try {
			PostUser PostItem = new PostUser();
			PostItem.setP_usr(usrid);

			Gson gson = new Gson();
			String data = "[" + gson.toJson(PostItem).toString() + "]";

			HttpResponse<JsonNode> postResponse = Unirest.post(this.API_SERVER_CORE + "/user/postJDataDelRecord")
					.header("Content-Type", "application/json")
					.header("Authorization", "Bearer " + session.getAttribute("accesskey").toString())
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

	}*/
	// Existing code before enhancement loguser
	
	@RequestMapping(value = "/deleteUser/{val}", method = RequestMethod.GET)
	public @ResponseBody String deleteDataUser(@PathVariable("val") String usrid, HttpSession session,
			HttpServletRequest req) {
		token.regenToken(session);
		String x = "";
		try {
			PostUser PostItem = new PostUser();
			PostItem.setP_usr(usrid);

			Gson gson = new Gson();
			JSONObject log = new JSONObject(new LogActivity().insertLogCore(req, session, "user_management",
					"Delete", "-"));
			if (log.getBoolean("success")) {
				if (log.getJSONArray("data").length() > 0) {
					JSONArray jObj = log.getJSONArray("data");
					JSONObject d = jObj.getJSONObject(0);
					Integer id = d.getInt("resultprocess");
					PostItem.setP_log_id(id);
					String data = "[" + gson.toJson(PostItem).toString() + "]";
					HttpResponse<JsonNode> postResponse = Unirest.post(this.API_SERVER_CORE + "/user/postJDataDelRecord")
							.header("Content-Type", "application/json")
							.header("Authorization", "Bearer " + session.getAttribute("accesskey").toString())
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
				} else {
					x = new JSONObject().put("status", "Failed").put("message", "Failed to get log").toString();
				}

			} else {
				x = new JSONObject().put("status", "Failed").put("message", "Upload Failed").toString();
			}
		} catch (Exception e) {
			x = e.getMessage();
		}
		return x;

	}

	@RequestMapping(value = "/getbranch", method = RequestMethod.GET)
	public @ResponseBody String getnotif(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		JSONObject jResult = new JSONObject(new RestServiceUnirest().requestGet(this.API_SERVER + "/ddlen/branch",
				session.getAttribute("accesskey").toString()));
		ArrayList<String> branchCode = new ArrayList<String>();

		JSONArray array = new JSONArray(jResult.getJSONArray("data").toString());
		for (int i = 0; i < array.length(); i++) {
			JSONObject row = array.getJSONObject(i);
			if (!branchCode.contains(row.getString("brc_group"))) {
				branchCode.add(row.getString("brc_group"));
			}
		}

		JSONArray jRsx = new JSONArray();
		for (String bc : branchCode) {
			JSONObject jRo = new JSONObject();
			JSONArray jRs = new JSONArray();

			for (int i = 0; i < array.length(); i++) {
				JSONObject row = array.getJSONObject(i);
				if (bc.equals(row.getString("brc_group"))) {

					jRs.put(row);
				}

			}
			jRo.put(bc, jRs);
			jRsx.put(jRo);
		}

		return jRsx.toString();
	}

	@RequestMapping(value = "/getDDLTenant", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String getDDLTenant(HttpSession session, HttpServletRequest request) {
		token.regenToken(session);
		return new RestServiceUnirest().requestGet(this.API_SERVER_PARAMETER + "/EngineParam/list/TenantOnly",
				session.getAttribute("accesskey").toString());

	}

	@RequestMapping(value = "/GetGroupPartner", method = RequestMethod.GET)
	public @ResponseBody String GetGroupPartner(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		JSONObject jResult = new JSONObject(new RestServiceUnirest()
				.requestGet(this.API_SERVER + "/ddlen/GetGroupPartner", session.getAttribute("accesskey").toString()));

		return jResult.toString();
	}

	@RequestMapping(value = "/GetPartnerDetail", method = RequestMethod.GET)
	public @ResponseBody String GetPartnerDetail(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		JSONObject jResult = new JSONObject(new RestServiceUnirest()
				.requestGet(this.API_SERVER + "/ddlen/GetPartnerDetail", session.getAttribute("accesskey").toString()));
		return jResult.toString();
	}

	@RequestMapping(value = "/GetGroupPartnerDisburse", method = RequestMethod.GET)
	public @ResponseBody String GetGroupPartnerDisburse(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		JSONObject jResult = new JSONObject(new RestServiceUnirest().requestGet(
				this.API_SERVER_PARAMETER + "/PartnersDetail/DdlGroup", session.getAttribute("accesskey").toString()));

		return jResult.toString();
	}

	@RequestMapping(value = "/GetPartnerDetailDisburse/{id}", method = RequestMethod.GET)
	public @ResponseBody String GetPartnerDetailDisburse(@PathVariable("id") String id, HttpSession session,
			HttpServletRequest req) {
		token.regenToken(session);
		JSONObject jResult = new JSONObject(new RestServiceUnirest().requestGet(
				this.API_SERVER_PARAMETER + "/PartnersDetail/DdlPartnertByAlias/" + id,
				session.getAttribute("accesskey").toString()));
		return jResult.toString();
	}

	@RequestMapping(value = "/GetPartnerDetailDisburse", method = RequestMethod.GET)
	public @ResponseBody String GetPartnerDetailDisburs(HttpSession session, HttpServletRequest req) {
		token.regenToken(session);
		JSONObject jResult = new JSONObject(new RestServiceUnirest().requestGet(
				this.API_SERVER_PARAMETER + "/PartnersDetail/DdlPartnertByAlias/" + "",
				session.getAttribute("accesskey").toString()));
		return jResult.toString();
	}

	@RequestMapping(value = "/reset/password/{code}", method = RequestMethod.GET)
	public @ResponseBody String resetPasswordUser(@PathVariable("code") String code, HttpSession session,
			HttpServletRequest request) {
		token.regenToken(session);
		String x = "";

		try {
			EncryptDiggest en = new EncryptDiggest();
			String DEF_PASS = en.hashing(this.DEFAULT_PASSWORD);
			JSONObject jUpdate = new JSONObject();
			jUpdate.put("usrid", code);
			jUpdate.put("password", DEF_PASS);
			jUpdate.put("usr", session.getAttribute("session_id"));
			
			JSONObject log = new JSONObject(new LogActivity().insertLogCore(request, session, "reset_password",
					"Reset Password", jUpdate.toString()));
			if (log.getBoolean("success")) {
				if (log.getJSONArray("data").length() > 0) {

					if (code != null) {
						String id = log.getJSONArray("data").getJSONObject(0).get("resultprocess").toString();
						jUpdate.put("logid", id);
						JSONObject jsonUpdate = new JSONObject(
								new RestServiceUnirest().requestPost(this.API_SERVER_CORE + "/user/reset/password",
										session.getAttribute("accesskey").toString(), jUpdate.toString()));
						x = jsonUpdate.toString();
					} else {
						x = new JSONObject().put("status", "Error/Failed").put("message", "User not found").toString();
					}
				} else {
					x = new JSONObject().put("status", "Failed").put("message", "Failed to get log").toString();
				}

			} else {
				x = new JSONObject().put("status", "Failed").put("message", "Upload Failed").toString();
			}

		} catch (Exception e) {
			x = e.getMessage();
		}

		return x;
	}
}
