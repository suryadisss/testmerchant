package org.idx.lms.libs;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.JSONObject;

public class lConn {
	public String sendPostRequest(String requestUrl, JSONObject jsonData) {
		String res;
	    try {
	    	StringBuffer result = new StringBuffer();
	        HttpPost post = new HttpPost(requestUrl);
	        post.setEntity(new StringEntity(jsonData.toString(), "UTF-8"));
	        post.setHeader("Content-Type", "application/json");
	        HttpClient client = HttpClientBuilder.create().build();
	        HttpResponse response = client.execute(post);
	        BufferedReader reader = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
	        String line;
	        res = result.toString();
	        while ((line = reader.readLine()) != null){ result.append(line); }
	        res = result.toString();
	        
	    } catch (Exception e) {
	            //throw new RuntimeException(e.getMessage());
	            res = e.getMessage();
	    }
	    return res;
	}
	
	public JSONObject sendPostRequestJson(String requestUrl, JSONObject jsonData) {
		JSONObject json = new JSONObject();
	    try {
	    	StringBuffer result = new StringBuffer();
	        HttpPost post = new HttpPost(requestUrl);
	        post.setEntity(new StringEntity(jsonData.toString(), "UTF-8"));
	        post.setHeader("Content-Type", "application/json");
	        HttpClient client = HttpClientBuilder.create().build();
	        HttpResponse response = client.execute(post);
	        BufferedReader reader = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
	        String line;
	        while ((line = reader.readLine()) != null){ 
	        	result.append(line); 
	        }
	        JSONObject jsonTemp = new JSONObject(result.toString());
	        json = jsonTemp;
	        
	    } catch (Exception e) {
	            //throw new RuntimeException(e.getMessage());
	            json.getString(e.getMessage());
	    }
	    return json;
	}
}
