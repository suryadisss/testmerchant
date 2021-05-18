package org.idx.lms.libs;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;

public class TokenRegen {
	private ConfigApps con = new ConfigApps();
	private String ID_TOKEN = con.getConfigValue("ID-TOKEN");
	private String PASS_TOKEN = con.getConfigValue("PASS-TOKEN");
	private String API_SERVER_CORE = con.getConfigValue("ServerAPI-CORE");

	private String tokeIsActive(HttpSession session) {
		if (session.getAttribute("accesskey") != null) {
			HttpResponse<JsonNode> responseDataLog = null;
			try {
				responseDataLog = Unirest
						.get(this.API_SERVER_CORE + "/login/getPasswordUser/"
								+ session.getAttribute("session_id").toString())
						.header("accept", "application/json").header("Content-Type", "application/json")
						.header("Authorization", "Bearer " + session.getAttribute("accesskey").toString()).asJson();
				if (responseDataLog.getStatus() == 200) {
					JSONObject jActLog = new JSONObject(responseDataLog.getBody().toString());
					
					if (!jActLog.isNull("success")) {
						if(jActLog.getBoolean("success")) {
							return "active";
						}else {
							return "inactive";
						}
						
					} else {
						return "inactive";
					}
				}else if (responseDataLog.getStatus() == 401) {
					return "unauthorized";
				}else {
					return "bad_request";
				}
			} catch (UnirestException e) {
				e.printStackTrace();
				return "error";
			} catch (Exception e) {
				e.printStackTrace();
				return "error";
			}

		} else {
			return "access_key_not_found";
		}
	}

	public void regenToken(HttpSession session) {
		try {
			String token = this.tokeIsActive(session);
			if (token.equalsIgnoreCase("inactive")
					||token.equalsIgnoreCase("unauthorized")) {
				JSONObject jToken = new JSONObject(new RestServiceUnirest()
						.requestToken(this.API_SERVER_CORE + "/token", this.ID_TOKEN, this.PASS_TOKEN)
						.toString());
				if (jToken.getBoolean("success")) {
					session.setAttribute("accesskey", jToken.getString("access_token"));
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

}
