package org.idx.lms.libs;

import java.text.DecimalFormat;

public class lGeneral {
	DecimalFormat numberSeparator = new DecimalFormat("#,###");
	DecimalFormat numberSeparatorWithDecimal = new DecimalFormat("#,###.00");
	
	public String getTrueFalseStringUP(boolean val){
		String ret ="";
		if(val){
			ret = "TRUE";
		}
		else{
			ret = "FALSE";
		}
		return ret;
	}
	
	public String checkNullString(Object obj){
		 if (obj == null) {
	        return "";
		 }
	     else {
	     	return obj.toString();
	     }
	}
	
	public String moneyFormatTextbox(String parVal){
		String str = "";
		if(parVal == "")
			parVal = "0";
		
		if (parVal == "0"){
			str = "0";
		}
		else{
			double amount = Double.parseDouble(parVal);
			str = numberSeparator.format(amount);
		}
		return str;
	}
	
	public String moneyFormatLabel(String parVal){
		String str = "";
		if(parVal == "")
			parVal = "0";
		
		if (parVal == "0"){
			str = "0.00";
		}
		else{
			double amount = Double.parseDouble(parVal);
			str = numberSeparatorWithDecimal.format(amount);
		}
		return str;
	}
}
