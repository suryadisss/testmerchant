package org.idx.lms.libs;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;


import java.net.HttpURLConnection;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import com.mashape.unirest.request.body.Body;

public class RestServiceUnirest {
	public String requestGet(String URL, String token) {
		String x = "";
		try {
			HttpResponse<String> postResponse = Unirest.get(URL).header("accept", "application/json")
					.header("Authorization", "Bearer " + token).asString();
			x = postResponse.getBody();
		} catch (Exception e) {
			// TODO: handle exception
			x = e.getMessage();
		}
		return x;
	}

	public String requestPost(String URL, String token, String Data) {
		String x = "";
		HttpResponse<JsonNode> responseDataLog = null;
		try {
			responseDataLog = Unirest.post(URL).header("accept", "application/json")
					.header("Content-Type", "application/json").header("Authorization", "Bearer " + token).body(Data)
					.asJson();
			x = responseDataLog.getBody().toString();
		} catch (UnirestException e) {
			x = e.getMessage();
		}
		return x;

	}

	public String requestPost(String URL, String token, Object object) {
		String x = "";
		HttpResponse<JsonNode> responseDataLog = null;
		ObjectMapper maper = new ObjectMapper();
		try {
			responseDataLog = Unirest.post(URL).header("accept", "application/json")
					.header("Content-Type", "application/json").header("Authorization", "Bearer " + token)
					.body(maper.writeValueAsString(object)).asJson();
			x = responseDataLog.getBody().toString();
		} catch (UnirestException e) {
			x = e.getMessage();
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return x;

	}

	public String requestGet_NTO(String URL, String token) {
		String x = "";
		try {
			Unirest.setTimeouts(0, 0);
			HttpResponse<String> postResponse = Unirest.get(URL).header("accept", "application/json")
					.header("Authorization", "Bearer " + token).asString();
			x = postResponse.getBody();
		} catch (Exception e) {
			// TODO: handle exception
			x = e.getMessage();
		}
		return x;
	}

	public String requestPost_NTO(String URL, String token, String Data) {
		String x = "";
		HttpResponse<JsonNode> responseDataLog = null;
		try {
			Unirest.setTimeouts(0, 0);
			responseDataLog = Unirest.post(URL).header("accept", "application/json")
					.header("Content-Type", "application/json").header("Authorization", "Bearer " + token).body(Data)
					.asJson();
			x = responseDataLog.getBody().toString();
		} catch (UnirestException e) {
			x = e.getMessage();
		}
		return x;

	}

	public String requestPost_NTO(String URL, String token, Object object) {
		String x = "";
		HttpResponse<JsonNode> responseDataLog = null;
		ObjectMapper maper = new ObjectMapper();
		try {
			Unirest.setTimeouts(0, 0);
			responseDataLog = Unirest.post(URL).header("accept", "application/json")
					.header("Content-Type", "application/json").header("Authorization", "Bearer " + token)
					.body(maper.writeValueAsString(object)).asJson();
			x = responseDataLog.getBody().toString();
		} catch (UnirestException e) {
			x = e.getMessage();
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return x;

	}

	private final String USER_AGENT = "Mozilla/5.0";

	public String sendPost(String serverAddress, String token, String data)

			throws  IOException, Exception {
		URL url = new URL(serverAddress);

		HttpURLConnection con = (HttpURLConnection) url.openConnection();

		// add reuqest header
		con.setRequestMethod("POST");
		con.setRequestProperty("Content-Type", "application/json");
		con.setRequestProperty("Authorization", "Bearer " + token);


		// Send post request
		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(data);
		wr.flush();
		wr.close();

		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();

		// print result
		System.out.println(response.toString());

		return response.toString();

	}

	public String requestToken(String URL, String username, String password) {
		String x = "";
		HttpResponse<JsonNode> responseDataLog = null;
		ObjectMapper maper = new ObjectMapper();

		try {
			responseDataLog = Unirest.post(URL).header("accept", "application/json")
					.header("Content-Type", "application/x-www-form-urlencoded").header("username", username)
					.header("password", password).asJson();
			x = responseDataLog.getBody().toString();
		} catch (UnirestException e) {
			x = e.getMessage();
		}
		return x;

	}
}
