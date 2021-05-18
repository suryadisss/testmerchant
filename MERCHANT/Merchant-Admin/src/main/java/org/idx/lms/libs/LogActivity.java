package org.idx.lms.libs;

import java.net.InetAddress;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

public class LogActivity {

	private ConfigApps con = new ConfigApps();
	private String API_SERVER_CORE = con.getConfigValue("ServerAPI-CORE");

	public String insertLogCore(HttpServletRequest httpservletreques, HttpSession session,String code_log, String act, String query) {

		String USER_AGENT = httpservletreques.getHeader("user-agent");
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
		String urlclinet = httpservletreques.getRequestURI().toString();
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
		joActivityLog.put("plcd", code_log);
		joActivityLog.put("plusr", (String)session.getAttribute("session_id"));
		joActivityLog.put("plhtt", http);
		joActivityLog.put("plsvrn", ipAddress.getHostName());
		joActivityLog.put("plact", act);
		joActivityLog.put("plpgur", urlclinet);
		joActivityLog.put("plqry", query);
		joActivityLog.put("plbro", BROWSER_NAME + " " + BROWSER_VER);
		joActivityLog.put("plos", os);
		joActivityLog.put("plcli", ipAddress.toString());

		JSONArray jaActivityLog = new JSONArray();
		jaActivityLog.put(joActivityLog);

		JSONObject jActLog1 = new JSONObject(
				new RestServiceUnirest().requestPost(this.API_SERVER_CORE + "/logactivity/postDataLogUserTracking/v2/",
						session.getAttribute("accesskey").toString(), jaActivityLog.toString()));
		
		return jActLog1.toString();

	}

}
