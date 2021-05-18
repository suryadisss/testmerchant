<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="resources/css/libs/bootstrap/bootstrap.min.css" rel="stylesheet" />
<link href="resources/css/libs/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
<link href="resources/css/libs/sweetalert/sweetalert.css" rel="stylesheet" />
<link href="resources/css/app/login.css" rel="stylesheet" />

<script src="resources/js/libs/jquery-3.2.1.min.js"></script>
<script src="resources/js/libs/sweetalert.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
		
			loadDataGet();
		});
		
		function loadDataGet() {
			$.get("http://localhost:52452/idccore/login/index" , function(result,status) {
				console.log(result[0],result.length);
				$.each(result[0], function(key, value){
				    console.log(key," and ", value);
				});
				var html = "";
				html +="<table>";
				for (i = 0; i < result.length; i++) { 
				    if(i == 0){
				    	html +="<tr>";
				    	$.each(result[i], function(key, value){				    		
				    		html +="<td>" + key +"</td>";				    		
						});
				    	html +="</tr>";
				    	html +="<tr>";
				    	$.each(result[i], function(key, value){				    		
				    		html +="<td>" + value +"</td>";				    		
						});
				    	html +="</tr>";
				    }else{
				    	html +="<tr>";
				    	$.each(result[i], function(key, value){				    		
				    		html +="<td>" + value +"</td>";				    		
						});
				    	html +="</tr>";
				    }
				}
				html +="</table>";
				$("div #test1").html(html);
				console.log(html);
			});
		}
	</script>
<body>
	<div id='test1'>	
	</div>
	 <section class="container login-form">
	
	    <section>
			<form:form method="POST" action="login/get" id="ctl01">
				<img src="resources/images/iDecisionCRM.png" alt="" class="img-responsive" />
			
				<div class="form-group">
                    <input name="txtUserID" type="text" id="txtUserID" class="form-control" required="required" placeholder="Masukan ID Pengguna" />
				</div>
				
				<div class="form-group">
                    <input name="txtPassword" type="password" id="txtPassword" class="form-control" required="required" placeholder="Masukan kata sandi" />
				</div>
				<input type="submit" name="btnLogin" value="Login" id="btnLogin" class="btn btn-primary btn-block" />
			
</form:form>
		</section>
	</section>
	    
    <div style="text-align:center;color:#000">
         <b>PERHATIAN</b> :<br />
                    Silahkan log in menggunakan user ID dan password PC anda.<br />
                    <br /><br />
                    Berhati-hatilah saat meng-input password.<br />
                    Kesalahan input password 3x secara berturut-turut, dapat menyebabkan password PC anda terblokir secara otomatis.<br />
                    Anda dapat menggunakan browser Internet Explorer versi 7 atau Google Chrome untuk mendapatkan tampilan terbaik.
                    <br /><br /><br />
                     

    </div>
    <div style="text-align:center;color:#000;padding:0 20%; font-size:10px">
                    This system contains information that is the property of Idx Partners 
                    and is for the use of authorized users only. Idx Partners monitors the activities of users on this system. <br />
                    By entering this site, you certify that you are a Idx Partners                    
                    employee and that you agree to comply with its Information and Data Protection Policy.
    </div>   
	
</body>
</html>