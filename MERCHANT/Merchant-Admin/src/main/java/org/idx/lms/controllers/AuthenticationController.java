package org.idx.lms.controllers;

import java.net.InetAddress;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.UnknownHostException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.idx.lms.libs.ConfigApps;
import org.idx.lms.libs.RestServiceUnirest;
import org.idx.lms.model.login.DataLogin;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

@Controller
public class AuthenticationController {
	@Autowired
	private ServletContext context;
	private ServletConfig config;
	private String strActivityLog;

	private ConfigApps con = new ConfigApps();
	private String API_SERVER = con.getConfigValue("ServerAPI");
	private String API_SERVER_CORE = con.getConfigValue("ServerAPI-CORE");
	private String LOCAL_SERVER = con.getConfigValue("ServerLocal");

	@RequestMapping(value = "/log/token_status", method = RequestMethod.GET)
	public @ResponseBody String checkToken(HttpSession session, HttpServletRequest req) {
		JSONObject json = new JSONObject();
		RestServiceUnirest objRest = new RestServiceUnirest();
		if (session.getAttribute("accesskey") != null && session.getAttribute("ipaddress") != null
				&& session.getAttribute("users") != null) {
			return objRest.requestPost(this.API_SERVER_CORE + "/login/postJDataUserIsLogin/",
					session.getAttribute("accesskey").toString(),
					new JSONArray().put(new JSONObject().put("p_usr", session.getAttribute("users").toString())
							.put("p_ipaddress", session.getAttribute("ipaddress"))).toString());
		} else {
			return new JSONObject().put("success", false).toString();
		}
	}

	@RequestMapping(value = "/v2", method = RequestMethod.POST)
	public @ResponseBody JSONObject submit( @ModelAttribute("login") DataLogin login,
			HttpSession session, HttpServletRequest req) {
		RestTemplate restTemplate = new RestTemplate();

		String infoMsg = "";
		String userAgent = req.getHeader("user-agent");
		String browserName = "";
		String browserVer = "";

		if (userAgent.contains("Chrome")) { // checking if Chrome
			String substring = userAgent.substring(userAgent.indexOf("Chrome")).split(" ")[0];
			browserName = substring.split("/")[0];
			browserVer = substring.split("/")[1];
		} else if (userAgent.contains("Firefox")) { // Checking if Firefox
			String substring = userAgent.substring(userAgent.indexOf("Firefox")).split(" ")[0];
			browserName = substring.split("/")[0];
			browserVer = substring.split("/")[1];
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

		JSONObject message = new JSONObject();
		JSONObject jToken = new JSONObject(new RestServiceUnirest()
				.requestToken(this.API_SERVER_CORE + "/token", "idctoken", "idctoken1234").toString());
		if (jToken.getBoolean("success")) {

			session.setAttribute("accesskey", jToken.getString("access_tokenp"));
			session.setAttribute("userloginid", login.getTxtUserID());
			session.setAttribute("ipaddress", ipAddress.toString());

			JSONObject jUser = new JSONObject(new RestServiceUnirest().requestGet(
					this.API_SERVER_CORE + "/login/getDataUser/" + login.getTxtUserID(),
					session.getAttribute("accesskey").toString()));
			JSONArray jaDataUser = jUser.getJSONArray("data");

			if (jUser.getBoolean("success")) {
				if (jaDataUser.length() > 0) {
					if (jaDataUser.getJSONObject(0).getInt("usrislogin") == 1) {
						message.put("success", false).put("message", "User ID is logi");

					} else {
						if (jaDataUser.getJSONObject(0).getInt("usrstatus") == 0) {
							message.put("success", false).put("message", "User ID is inactive or disabled");

							JSONObject jLog = new JSONObject(new RestServiceUnirest().requestPost(
									this.API_SERVER_CORE + "/login/postJDataLoginLog/",
									session.getAttribute("accesskey").toString(),
									new JSONArray().put(
											new JSONObject().put("p_usr", login.getTxtUserID()).put("p_typ", "Login"))
											.toString()));

							if (jLog.getBoolean("success")) {

								JSONObject joActivityLog = new JSONObject();
								joActivityLog.put("plcd", "ua");
								joActivityLog.put("plusr", login.getTxtUserID());
								joActivityLog.put("plhtt", http);
								joActivityLog.put("plsvrn", ipAddress.getHostName());
								joActivityLog.put("plact", "Login Failure - User ID is inactive or disabled");
								joActivityLog.put("plpgur", urlclinet);
								joActivityLog.put("plqry", "-");
								joActivityLog.put("plbro", browserName + " " + browserVer);
								joActivityLog.put("plos", os);
								joActivityLog.put("plcli", ipAddress.toString());

								JSONArray jaActivityLog = new JSONArray();
								jaActivityLog.put(joActivityLog);

								JSONObject jActLog = new JSONObject(new RestServiceUnirest().requestPost(
										this.API_SERVER_CORE + "/logactivity/postDataLogUserTracking/",
										session.getAttribute("accesskey").toString(), jaActivityLog.toString()));

								if (jActLog.getBoolean("success")) {

								}
							}

						} else {

							message.put("success", true).put("url", "dashboard");

							JSONObject jLog = new JSONObject(new RestServiceUnirest().requestPost(
									this.API_SERVER_CORE + "/login/postJDataLoginLog/",
									session.getAttribute("accesskey").toString(),
									new JSONArray().put(
											new JSONObject().put("p_usr", login.getTxtUserID()).put("p_typ", "Login"))
											.toString()));

							if (jLog.getBoolean("success")) {

								JSONObject joActivityLog = new JSONObject();
								joActivityLog.put("plcd", "ua");
								joActivityLog.put("plusr", session.getAttribute("userloginid"));
								joActivityLog.put("plhtt", http);
								joActivityLog.put("plsvrn", ipAddress.getHostName());
								joActivityLog.put("plact", "Login Success");
								joActivityLog.put("plpgur", urlclinet);
								joActivityLog.put("plqry", "-");
								joActivityLog.put("plbro", browserName + " " + browserVer);
								joActivityLog.put("plos", os);
								joActivityLog.put("plcli", ipAddress.toString());

								JSONArray jaActivityLog = new JSONArray();
								jaActivityLog.put(joActivityLog);

								JSONObject jActLog = new JSONObject(new RestServiceUnirest().requestPost(
										this.API_SERVER_CORE + "/logactivity/postDataLogUserTracking/",
										session.getAttribute("accesskey").toString(), jaActivityLog.toString()));

								if (jActLog.getBoolean("success")) {

								}
							}

						}
					}
				} else {
					message.put("success", false).put("message", "User not found");
				}

			} else {
				message.put("success", false).put("message", "Can't send Authorize Token");
			}

		} else {
			message.put("success", false).put("message", "Can't send Authorize Token");

		}

		return message;

	}
}
