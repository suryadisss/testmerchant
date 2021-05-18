package org.idx.lms.model.login;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)

public class DataUser {
	private boolean success;
    private String data;
    
    public DataUser() {
	}
    
    public boolean getSuccess() {
        return this.success;
    }
    
    public void setSuccess(boolean _success) {
        this.success = _success;
    }
    
    public String getData() {
        return this.data;
    }
    
    public void setData(String _data) {
        this.data = _data;
    }
    
    @Override
    public String toString() {
        return "DataUser{" +
                "success=" + success +
                ", data='" + data + '\'' +
                '}';
    }
}

