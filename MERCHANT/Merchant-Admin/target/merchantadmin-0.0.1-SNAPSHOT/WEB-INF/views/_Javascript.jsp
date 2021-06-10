<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
function isNumber(n) {
	    return !isNaN(parseFloat(n)) && isFinite(n);
	}
	function isNumberKey(evt) {
		var charCode = (evt.which) ? evt.which : event.keyCode;
	    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 46 && charCode != 45){
	    	return false;	
	    }
	    return true;
	}
	function formatCurrency(num) {
        num = num.toString().replace(/\$|\,/g, '');
        if (num == "-"){
            return num;
        }
        else{
            if (isNaN(num))
                num = "";
            sign = (num == (num = Math.abs(num)));
	        num = Math.floor(num * 100 + 0.50000000001);
	        num = Math.floor(num / 100).toString();
	        for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
	            num = num.substring(0, num.length - (4 * i + 3)) + ',' + num.substring(num.length - (4 * i + 3));
	        return (((sign) ? '' : '-') + num);
        }
    }
	function isDate(value){
		var d = new Date(value);
  	  	var str = ('0' + d.getDate()).slice(-2) + '-' + ('0' + (d.getMonth() + 1)).slice(-2) + '-' + d.getFullYear();
  	  	return str;
	}
	function isDateTime(value){
		var d = new Date(value);
  	  	var str = ('0' + d.getDate()).slice(-2) + '-' + ('0' + (d.getMonth() + 1)).slice(-2) + '-' + d.getFullYear();
  	  	var str2 = checkTime(d.getHours()) + ":" + checkTime(d.getMinutes()) + ":" + checkTime(d.getSeconds());
  	  	return str + " " + str2;
	}
	function checkTime(i) {
		if (i < 10) {
		    i = "0" + i;
		}
		return i;
	}
</script>