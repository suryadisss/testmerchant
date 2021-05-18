package org.idx.lms.controllers;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.InetAddress;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.UnknownHostException;
import java.text.DateFormat; //tambahan
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.regex.Pattern;

import org.idx.lms.libs.ConfigApps;
import org.idx.lms.libs.EncryptDiggest;
import org.idx.lms.libs.RestServiceUnirest;
import org.idx.lms.libs.TokenRegen;
import org.idx.lms.libs.TripleDESEncryption;
import org.idx.lms.model.DataPassword;
import org.idx.lms.model.login.DataLogin;
import org.json.JSONObject;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping

public class Login {

	@Autowired
	private ServletContext context;
	private ServletConfig config;
	private String strActivityLog;

	private ConfigApps con = new ConfigApps();
	private String API_SERVER = con.getConfigValue("ServerAPI");
	private String API_SERVER_CORE = con.getConfigValue("ServerAPI-CORE");
	private String API_SERVER_PARAMETER = con.getConfigValue("ServerAPI-PARAMETER");
	private String API_SERVER_NICEPAY = con.getConfigValue("ServerAPI-NICEPAY");
	private String LOCAL_SERVER = con.getConfigValue("ServerLocal");
	private String ID_TOKEN = con.getConfigValue("ID-TOKEN");
	private String PASS_TOKEN = con.getConfigValue("PASS-TOKEN");
	private String DES_IVSTRING = con.getConfigValue("DESivString");
	private String DES_KEYSTRING = con.getConfigValue("DESkeyString");

	private String ID_TOKEN_MID = con.getConfigValue("ID-TOKEN-MIDTRANS");
	private String PASS_TOKEN_MID = con.getConfigValue("PASS-TOKEN-MIDTRANS");

	TokenRegen token = new TokenRegen();

	@RequestMapping(value = "/login/token_status", method = RequestMethod.GET)
	public @ResponseBody String checkToken(HttpSession session, HttpServletRequest req) {
		if (session.getAttribute("accesskey") != null) {
			return new JSONObject().put("success", true).put("key", session.getAttribute("accesskey").toString())
					.toString();
		} else {
			return new JSONObject().put("success", false).toString();
		}
	}

	@RequestMapping(value = "/login/do_logout", method = RequestMethod.GET)
	public ModelAndView checkToken1(HttpSession session, HttpServletRequest req) {

		JSONObject message = new JSONObject();
		String USER_AGENT = req.getHeader("user-agent");
		String BROWSER_NAME = "";
		String BROWSER_VER = "";

		if (USER_AGENT.contains("Chrome")) { // checking if Chrome
			String substring = USER_AGENT.substring(USER_AGENT.indexOf("Chrome")).split(" ")[0];
			BROWSER_NAME = substring.split("/")[0];
			BROWSER_VER = substring.split("/")[1];
		} else if (USER_AGENT.contains("Firefox")) { // Checking if Firefox
			String substring = USER_AGENT.substring(USER_AGENT.indexOf("Firefox")).split(" ")[0];
			BROWSER_NAME = substring.split("/")[0];
			BROWSER_VER = substring.split("/")[1];
		}

		String os = System.getProperty("os.name").toLowerCase();
		String urlclinet = req.getRequestURI().toString();
		URI myuri = null;
		try {
			myuri = new URI(urlclinet);
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		String http = myuri.getScheme();
		if (http == null) {
			http = "OFF";
		}
		InetAddress ipAddress = null;
		try {
			ipAddress = InetAddress.getLocalHost();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}

		JSONObject joActivityLog = new JSONObject();
		joActivityLog.put("plcd", "ua");
		joActivityLog.put("plusr", session.getAttribute("session_id"));
		joActivityLog.put("plhtt", http);
		joActivityLog.put("plsvrn", ipAddress.getHostName());
		joActivityLog.put("plact", "Logout By User");
		joActivityLog.put("plpgur", urlclinet);
		joActivityLog.put("plqry", "-");
		joActivityLog.put("plbro", BROWSER_NAME + " " + BROWSER_VER);
		joActivityLog.put("plos", os);
		joActivityLog.put("plcli", ipAddress.toString());

		JSONArray jaActivityLog = new JSONArray();
		jaActivityLog.put(joActivityLog);
		try {
			JSONObject jActLog1 = new JSONObject(
					new RestServiceUnirest().requestPost(this.API_SERVER_CORE + "/logactivity/postDataLogUserTracking/",
							session.getAttribute("accesskey").toString(), jaActivityLog.toString()));
		} catch (Exception e) {
			// TODO: handle exception
		}

		session.invalidate();
		return new ModelAndView("redirect:/");
	}
	

	@RequestMapping(value = "/login/v4", method = RequestMethod.POST)
	public @ResponseBody String loginV4(@ModelAttribute("login") DataLogin login, HttpSession session,
			HttpServletRequest req) throws Exception {
		EncryptDiggest en = new EncryptDiggest();
		// session.invalidate();
		JSONObject message = new JSONObject();
		JSONObject passStatus = new JSONObject();
		String USER_AGENT = req.getHeader("user-agent");
		String BROWSER_NAME = "";
		String BROWSER_VER = "";
		String ENC_PASSWORD = en.hashing(login.getTxtPassword());
		String USER = login.getTxtUserID();
		
		String usrpass = req.getParameter("txtPassword").toString();

		String CAPTCHA = login.getTxtCaptcha();
		String base64capcasecurity = session.getAttribute("captcha_security").toString();
		byte[] decodedBytes = Base64.getDecoder().decode(base64capcasecurity);
		String  dcdStr =  new String(decodedBytes);
		String[] decodedString = dcdStr.toString().split("\\|");

		if (decodedString[0].toString().equals(CAPTCHA)) {
			if (this.checkExpiredCaptcha(decodedString[1].toString())) {
				if (USER_AGENT.contains("Chrome")) { // checking if Chrome
					String substring = USER_AGENT.substring(USER_AGENT.indexOf("Chrome")).split(" ")[0];
					BROWSER_NAME = substring.split("/")[0];
					BROWSER_VER = substring.split("/")[1];
				} else if (USER_AGENT.contains("Firefox")) { // Checking if Firefox
					String substring = USER_AGENT.substring(USER_AGENT.indexOf("Firefox")).split(" ")[0];
					BROWSER_NAME = substring.split("/")[0];
					BROWSER_VER = substring.split("/")[1];
				}

				String os = System.getProperty("os.name").toLowerCase();
				String urlclinet = req.getRequestURI().toString();
				URI myuri = null;
				try {
					myuri = new URI(urlclinet);
				} catch (URISyntaxException e) {
					e.printStackTrace();
				}
				String http = myuri.getScheme();
				if (http == null) {
					http = "OFF";
				}
				InetAddress ipAddress = null;
				try {
					ipAddress = InetAddress.getLocalHost();
				} catch (UnknownHostException e) {
					e.printStackTrace();
				}

				JSONObject jToken = new JSONObject(new RestServiceUnirest()
						.requestToken(this.API_SERVER_CORE + "/token", this.ID_TOKEN, this.PASS_TOKEN).toString());
				System.out.println(jToken.toString());
				if (jToken.getBoolean("success")) {

					session.setAttribute("accesskey", jToken.getString("access_token"));
					session.setAttribute("userloginid", login.getTxtUserID());
					session.setAttribute("ipaddress", ipAddress.toString());

					/*JSONObject jTokenMid = new JSONObject(new RestServiceUnirest()
							.requestToken(this.API_SERVER_NICEPAY + "/token", this.ID_TOKEN_MID, this.PASS_TOKEN_MID)
							.toString());

					session.setAttribute("accesskey_mid", jTokenMid.getString("access_token"));*/

					JSONObject jActLog = new JSONObject(
							new RestServiceUnirest().requestGet(this.API_SERVER_CORE + "/login/getPasswordUser/" + USER,
									session.getAttribute("accesskey").toString()));
					System.out.println(jActLog.toString());
					if (jActLog.getBoolean("success")) {
						JSONArray jaData = jActLog.getJSONArray("data");
						String chkDate = isDateValid(jaData.getJSONObject(0).getString("changeddate"));
						if (jaData.length() > 0) {
								if (jaData.getJSONObject(0).getBoolean("usrstatus")) {
									if (jaData.getJSONObject(0).getInt("usrislogin") == 0) {
										if (this.check_efective(jaData.getJSONObject(0).getString("usrefectivedate"))
												&& jaData.getJSONObject(0).getString("usrefectivedate") != null) {
	
											String password = jaData.getJSONObject(0).getString("uslpassword");
											if (ENC_PASSWORD.equals(password)) {
												if (chkDate == "valid" && !(usrpass.equals("kl123"))) {
													System.out.println(jaData.toString());
													session.setAttribute("branchcode",
															jaData.getJSONObject(0).getString("branch"));
													session.setAttribute("tenant",
															jaData.getJSONObject(0).get("tenantalias").toString());
													session.setAttribute("usrname",
															jaData.getJSONObject(0).getString("usrname"));
													session.setAttribute("usremail",
															jaData.getJSONObject(0).getString("usremail"));
													session.setAttribute("group",
															jaData.getJSONObject(0).getString("groupalias"));
													session.setAttribute("partner",
															jaData.getJSONObject(0).getString("partneralias"));
													session.setAttribute("usernip",
															jaData.getJSONObject(0).getString("usrnip"));
		
													if (jaData.getJSONObject(0).getString("branch").equals("0000601")) {
														session.setAttribute("branchname", "NON BRANCH");
													} else {
														JSONObject jBranch = new JSONObject(new RestServiceUnirest().requestGet(
																this.API_SERVER_PARAMETER + "/branch/list_branch/"
																		+ jaData.getJSONObject(0).getString("branch"),
																session.getAttribute("accesskey").toString()));
		
														if (jBranch.getString("status").equals("Success")) {
															if (jBranch.getJSONArray("data").length() > 0) {
																session.setAttribute("branchname", jBranch.getJSONArray("data")
																		.getJSONObject(0).getString("b_name"));
															}
														}
													}
		
													JSONObject jLevelDetail = new JSONObject(
															new RestServiceUnirest().requestGet(
																	this.API_SERVER_CORE + "/login/getDataUserLevelDetail/"
																			+ USER,
																	session.getAttribute("accesskey").toString()));
													System.out.println(jLevelDetail.toString());
													if (jLevelDetail.getBoolean("success")) {
														if (jLevelDetail.getJSONArray("data").length() > 0) {
		
															session.setAttribute("session_menu",
																	jLevelDetail.getJSONArray("data").toString());
		
														}
													}
		
													try {
														JSONObject joActivityLog = new JSONObject();
														joActivityLog.put("plcd", "ua");
														joActivityLog.put("plusr", login.getTxtUserID());
														joActivityLog.put("plhtt", http);
														joActivityLog.put("plsvrn", ipAddress.getHostName());
														joActivityLog.put("plact", "Login Success");
														joActivityLog.put("plpgur", urlclinet);
														joActivityLog.put("plqry", "-");
														joActivityLog.put("plbro", BROWSER_NAME + " " + BROWSER_VER);
														joActivityLog.put("plos", os);
														joActivityLog.put("plcli", ipAddress.toString());
		
														JSONArray jaActivityLog = new JSONArray();
														jaActivityLog.put(joActivityLog);
		
														JSONObject jActLog1 = new JSONObject(
																new RestServiceUnirest().requestPost(
																		this.API_SERVER_CORE
																				+ "/logactivity/postDataLogUserTracking/",
																		session.getAttribute("accesskey").toString(),
																		jaActivityLog.toString()));
		
													} catch (Exception e) {
														// TODO: handle exception
													}
		
													session.setAttribute("session_position",
															jaData.getJSONObject(0).getString("usraccesslevel").toString());
													session.setAttribute("session_id",
															jaData.getJSONObject(0).getString("usruserid").toString());
													session.setAttribute("session_name",
															jaData.getJSONObject(0).getString("usrname").toString());
		
													message.put("success", true).put("url",
															this.LOCAL_SERVER + req.getContextPath() + "/dashboard");
												}else{// disini untuk validasi tanggal lewat dari 90 hari
													message.put("success", true).put("message","Sorry, the username has not been changed password for 90 days please change immediately").put("passStatus","invalid");
													//passStatus.put("passStatus","invalid");
												}// disini untuk tutup validasi tanggal lewat dari 90 hari
											} else {
												message.put("success", false).put("message",
														"You have entered an invalid password");
											}
										} else {
											try {
												JSONObject joActivityLog = new JSONObject();
												joActivityLog.put("plcd", "ua");
												joActivityLog.put("plusr", login.getTxtUserID());
												joActivityLog.put("plhtt", http);
												joActivityLog.put("plsvrn", ipAddress.getHostName());
												joActivityLog.put("plact", "User is cannot login before effective date ");
												joActivityLog.put("plpgur", urlclinet);
												joActivityLog.put("plqry", "-");
												joActivityLog.put("plbro", BROWSER_NAME + " " + BROWSER_VER);
												joActivityLog.put("plos", os);
												joActivityLog.put("plcli", ipAddress.toString());
	
												JSONArray jaActivityLog = new JSONArray();
												jaActivityLog.put(joActivityLog);
	
												JSONObject jActLog1 = new JSONObject(new RestServiceUnirest().requestPost(
														this.API_SERVER_CORE + "/logactivity/postDataLogUserTracking/",
														session.getAttribute("accesskey").toString(),
														jaActivityLog.toString()));
											} catch (Exception e) {
												// TODO: handle exception
											}
	
											message.put("success", false).put("message",
													"Sorry, the username has not been activated or is blocked");
										}
	
									} else {
										try {
											JSONObject joActivityLog = new JSONObject();
											joActivityLog.put("plcd", "ua");
											joActivityLog.put("plusr", login.getTxtUserID());
											joActivityLog.put("plhtt", http);
											joActivityLog.put("plsvrn", ipAddress.getHostName());
											joActivityLog.put("plact", "User is already login");
											joActivityLog.put("plpgur", urlclinet);
											joActivityLog.put("plqry", "-");
											joActivityLog.put("plbro", BROWSER_NAME + " " + BROWSER_VER);
											joActivityLog.put("plos", os);
											joActivityLog.put("plcli", ipAddress.toString());
	
											JSONArray jaActivityLog = new JSONArray();
											jaActivityLog.put(joActivityLog);
	
											JSONObject jActLog1 = new JSONObject(new RestServiceUnirest().requestPost(
													this.API_SERVER_CORE + "/logactivity/postDataLogUserTracking/",
													session.getAttribute("accesskey").toString(),
													jaActivityLog.toString()));
	
										} catch (Exception e) {
											// TODO: handle exception
										}
	
										message.put("success", false).put("message",
												"Sorry, the username is already login");
									}
	
								} else {
									try {
										JSONObject joActivityLog = new JSONObject();
										joActivityLog.put("plcd", "ua");
										joActivityLog.put("plusr", login.getTxtUserID());
										joActivityLog.put("plhtt", http);
										joActivityLog.put("plsvrn", ipAddress.getHostName());
										joActivityLog.put("plact", "User is not active or disable by adminstrator");
										joActivityLog.put("plpgur", urlclinet);
										joActivityLog.put("plqry", "-");
										joActivityLog.put("plbro", BROWSER_NAME + " " + BROWSER_VER);
										joActivityLog.put("plos", os);
										joActivityLog.put("plcli", ipAddress.toString());
	
										JSONArray jaActivityLog = new JSONArray();
										jaActivityLog.put(joActivityLog);
	
										JSONObject jActLog1 = new JSONObject(new RestServiceUnirest().requestPost(
												this.API_SERVER_CORE + "/logactivity/postDataLogUserTracking/",
												session.getAttribute("accesskey").toString(), jaActivityLog.toString()));
	
									} catch (Exception e) {
										// TODO: handle exception
									}
	
									message.put("success", false).put("message",
											"Sorry, the username has not been activated or is blocked");
								}
								
							} else {  // (jaData.length() > 0)
								message.put("success", false).put("message", "You have entered an invalid username");
	
							}	
					} else { //saat sukses hit api getPasswordUser
						message.put("success", false).put("message",
								"Sorry, we have trouble getting data, please contact administrator.");
					}

				} else {
					message.put("success", false).put("message",
							"Sorry, we have trouble getting token, please contact administrator.");
				}
			} else {
				message.put("success", false).put("message", "Captcha Expired");
			}
		} else {
			message.put("success", false).put("message", "Invalid Captcha");
		}

		return message.toString();
	}

	@RequestMapping(value = "/login/getmenu", method = RequestMethod.GET)
	public @ResponseBody String submitData(HttpSession session) {
		if (session.getAttribute("session_menu") != null) {
			return session.getAttribute("session_menu").toString();
		} else {
			return "";
		}
	}

	private boolean checkSession(HttpSession session) {
		boolean bol = false;
		if (session.getAttribute("session_id") != null) {

			bol = true;

		}
		return bol;
	}

	@RequestMapping(value = "/change_password", method = RequestMethod.GET)
	public ModelAndView changepassword(ModelMap model, HttpSession session, HttpServletRequest req) {

		if (checkSession(session)) {
			token.regenToken(session);
			model.addAttribute("api_server", this.API_SERVER);
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());

			return new ModelAndView("ChangePasswordMainView", model);
		} else {
			return new ModelAndView("redirect:/");
		}
	}
	
	@RequestMapping(value = "/change_email", method = RequestMethod.GET)
	public ModelAndView changeEmail(ModelMap model, HttpSession session, HttpServletRequest req) {

		if (checkSession(session)) {
			token.regenToken(session);
			model.addAttribute("api_server", this.API_SERVER);
			model.addAttribute("local_server", this.LOCAL_SERVER + req.getContextPath());

			return new ModelAndView("ChangeEmailMainView", model);
		} else {
			return new ModelAndView("redirect:/");
		}
	}
	
	@RequestMapping(value = "change_email/dopost", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String changeEmailPost(HttpSession session, HttpServletRequest request) throws Exception {
		token.regenToken(session);
		
		String email = request.getParameter("new_email").toString();
		
		RestServiceUnirest objRest = new RestServiceUnirest();
		
		return objRest.requestPost(this.API_SERVER + "/user/updateemail",
				session.getAttribute("accesskey").toString(),
				new JSONObject()
				.put("username", session.getAttribute("session_id").toString())
				.put("email", email)
				.toString());

	}

	@RequestMapping(value = "change_email/showData", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String changeEmailShowData(@ModelAttribute("login") DataLogin login, HttpSession session) {
		token.regenToken(session);
		
		String USER = session.getAttribute("session_id").toString();
		
		return new RestServiceUnirest().requestGet(this.API_SERVER_CORE + "/login/getPasswordUser/" + USER,
				session.getAttribute("accesskey").toString());

	}

	@RequestMapping(value = "/change_password/post", method = RequestMethod.POST)
	public @ResponseBody String postPassword(@ModelAttribute("DataPassword") DataPassword ps, HttpSession session,
			HttpServletRequest req) throws Exception {
		// TripleDESEncryption desEnc = new TripleDESEncryption(this.DES_KEYSTRING,
		// this.DES_IVSTRING);
		token.regenToken(session);
		EncryptDiggest en = new EncryptDiggest();

		String ENC_PASSWORD_OLD = en.hashing(ps.getOld_password());
		String ENC_PASSWORD_NEW = en.hashing(ps.getNew_password());
		String message = "";
		JSONObject jActLog = new JSONObject(new RestServiceUnirest().requestGet(
				this.API_SERVER_CORE + "/login/getPasswordUser/" + session.getAttribute("session_id"),
				session.getAttribute("accesskey").toString()));
		if (jActLog.getBoolean("success")) {
			JSONArray jaData = jActLog.getJSONArray("data");
			if (jaData.length() > 0) {
				String old_password = jaData.getJSONObject(0).getString("uslpassword");
				if (ps.getOld_password() != "" && ps.getNew_password() != "") {
					if (old_password.trim().equals(ENC_PASSWORD_OLD.trim())) {
						String chkPass = isValid(ps.getNew_password());
						String[] parts = chkPass.split("\\|");
						boolean flag = Boolean.parseBoolean(parts[0]);
						if (flag == true) {
							if (ps.getNew_password().equals(ps.getConfirm_new_password())) {
								JSONObject jaDt = new JSONObject().put("p_usr", session.getAttribute("session_id"))
										.put("p_pwd", ENC_PASSWORD_NEW);
								JSONObject result = new JSONObject(new RestServiceUnirest().requestPost(
										this.API_SERVER_CORE + "/login/postJDataChangePassword",
										session.getAttribute("accesskey").toString(), "[" + jaDt.toString() + "]"));
								if (result.getBoolean("success")) {
									message = new JSONObject().put("status", "Success")
											.put("message", "New password has been saved").toString();

								}

							} else {
								message = new JSONObject().put("status", "Error/Failed")
										.put("message", "The new password you entered does not match").toString();
							}
						} else {
							message = new JSONObject().put("status", "Error/Failed").put("message", parts[1].toString())
									.toString();
						}

					} else {
						message = new JSONObject().put("status", "Error/Failed")
								.put("message", "The new password you entered does not match").toString();
					}

				} else {
					message = new JSONObject().put("status", "Error/Failed")
							.put("message", "Old password and new password is required").toString();
				}

			}
		}

		return message;
	}
	
	@RequestMapping(value = "login/forgotPassword", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String ForgotPassword(HttpSession session, HttpServletRequest request) throws Exception {
		token.regenToken(session);
		
		String username = request.getParameter("nipUser").toString();
		
		JSONObject jToken = new JSONObject(new RestServiceUnirest()
				.requestToken(this.API_SERVER_CORE + "/token", this.ID_TOKEN, this.PASS_TOKEN).toString());
		System.out.println(jToken.toString());
		
		RestServiceUnirest objRest = new RestServiceUnirest();
		
		if (jToken.getBoolean("success")) {

			session.setAttribute("accesskey", jToken.getString("access_token"));
			
		}
		
	//	JSONObject j = new JSONObject(new RestServiceUnirest().requestPost(this.API_SERVER + "/Login/forgotpassword",
	//			session.getAttribute("accesskey").toString(),
	//			new JSONObject()
	//			.put("username", username)
	//			.toString()));
		
		
		return objRest.requestPost(this.API_SERVER + "/Login/forgotpassword",
				session.getAttribute("accesskey").toString(),
				new JSONObject()
				.put("username", username)
				.toString());

	}

	
	
	@RequestMapping(value = "/change_password/post2", method = RequestMethod.POST)
	public @ResponseBody String postPassword2(@ModelAttribute("DataPassword") DataPassword ps, HttpSession session,
			HttpServletRequest req) throws Exception {
		// TripleDESEncryption desEnc = new TripleDESEncryption(this.DES_KEYSTRING,
		// this.DES_IVSTRING);
		token.regenToken(session);
		EncryptDiggest en = new EncryptDiggest();

		String ENC_PASSWORD_OLD = en.hashing(ps.getOld_password());
		String ENC_PASSWORD_NEW = en.hashing(ps.getNew_password());
		String username = req.getParameter("usernameLogin").toString().trim();
		String message = "";
		JSONObject jActLog = new JSONObject(new RestServiceUnirest().requestGet(
				this.API_SERVER_CORE + "/login/getPasswordUser/" + username/*session.getAttribute("session_id")*/,
				session.getAttribute("accesskey").toString()));
		if (jActLog.getBoolean("success")) {
			JSONArray jaData = jActLog.getJSONArray("data");
			if (jaData.length() > 0) {
				String old_password = jaData.getJSONObject(0).getString("uslpassword");
				if (ps.getOld_password() != "" && ps.getNew_password() != "") {
					if (old_password.trim().equals(ENC_PASSWORD_OLD.trim())) {
						String chkPass = isValid(ps.getNew_password());
						String[] parts = chkPass.split("\\|");
						boolean flag = Boolean.parseBoolean(parts[0]);
						if (flag == true) {
							if (ps.getNew_password().equals(ps.getConfirm_new_password())) {
								JSONObject jaDt = new JSONObject().put("p_usr", username/*session.getAttribute("session_id")*/)
										.put("p_pwd", ENC_PASSWORD_NEW);
								JSONObject result = new JSONObject(new RestServiceUnirest().requestPost(
										this.API_SERVER_CORE + "/login/postJDataChangePassword",
										session.getAttribute("accesskey").toString(), "[" + jaDt.toString() + "]"));
								if (result.getBoolean("success")) {
									message = new JSONObject().put("status", "Success")
											.put("message", "New password has been saved").toString();

								}

							} else {
								message = new JSONObject().put("status", "Error/Failed")
										.put("message", "The new password you entered does not match").toString();
							}
						} else {
							message = new JSONObject().put("status", "Error/Failed").put("message", parts[1].toString())
									.toString();
						}

					} else {
						message = new JSONObject().put("status", "Error/Failed")
								.put("message", "The new password you entered does not match").toString();
					}

				} else {
					message = new JSONObject().put("status", "Error/Failed")
							.put("message", "Old password and new password is required").toString();
				}

			}
		}

		return message;
	}

	private boolean check_efective(String date_efective) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		Date efect = sdf.parse(date_efective);
		Date today = sdf.parse(sdf.format(date));
		boolean ret = false;
		if (today.after(efect)) {
			ret = true;
		}

		if (today.before(efect)) {
			ret = false;
		}

		if (today.equals(efect)) {
			ret = true;
		}

		return ret;

	}

	public static String isDateValid(String datechanged) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
		String currentDate = format.format(new Date());
		String lastChangedDate = datechanged;
		String[] split1 = currentDate.split("T",2);
		String[] split2 = lastChangedDate.split("T",2);
		
		String[] sepCurrentDate = split1[0].split("-", 3);
		String[] sepLastDateChanged = split2[0].split("-", 3);
		
		String currentYear = sepCurrentDate[0];
		String currentMonth = sepCurrentDate[1];
		
		String lastChangedYear = sepLastDateChanged[0];
		String lastChangedMonth = sepLastDateChanged[1];

		int curYear = Integer.parseInt(currentYear);
		int curMonth = Integer.parseInt(currentMonth);
		int lcYear = Integer.parseInt(lastChangedYear);
		int lcMonth = Integer.parseInt(lastChangedMonth);
		
		boolean flag = true;
		String res = "";
		if(curYear - lcYear >=1) {
			flag = false;
			res = "invalid";
		}else{
			if(curMonth - lcMonth >=3) {
				flag = false;
				res = "invalid";
			}else {
				res = "valid";
			}
		}
		
		
		return res;
	}
	
	public static String isValid(String passwordhere) {

		Pattern specailCharPatten = Pattern.compile("[^a-z0-9 ]", Pattern.CASE_INSENSITIVE);
		Pattern UpperCasePatten = Pattern.compile("[A-Z ]");
		Pattern lowerCasePatten = Pattern.compile("[a-z ]");
		Pattern digitCasePatten = Pattern.compile("[0-9 ]");
		String msg = "";
		String res = "";
		boolean flag = true;

		if (passwordhere.length() < 8) {
			msg = "Kata sandi memuat minimal 8 karakter termasuk angka, huruf besar, huruf kecil dan tanda baca !!";
			flag = false;
		}
		if (!specailCharPatten.matcher(passwordhere).find()) {
			msg = "Kata sandi memuat minimal 8 karakter termasuk angka, huruf besar, huruf kecil dan tanda baca !!";
			flag = false;
		}
		if (!UpperCasePatten.matcher(passwordhere).find()) {
			msg = "Kata sandi memuat minimal 8 karakter termasuk angka, huruf besar, huruf kecil dan tanda baca !!";
			flag = false;
		}
		if (!lowerCasePatten.matcher(passwordhere).find()) {
			msg = "Kata sandi memuat minimal 8 karakter termasuk angka, huruf besar, huruf kecil dan tanda baca !!";
			flag = false;
		}
		if (!digitCasePatten.matcher(passwordhere).find()) {
			msg = "Kata sandi memuat minimal 8 karakter termasuk angka, huruf besar, huruf kecil dan tanda baca !!";
			flag = false;
		}
		res = flag + "|" + msg;
		return res;

	}

	private boolean checkExpiredCaptcha(String input) throws ParseException {

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		simpleDateFormat.setLenient(false);
		Date expiry = simpleDateFormat.parse(input);
		Date now  = new Date();
		boolean expired = now.before(expiry);

		return expired;
	}

}
