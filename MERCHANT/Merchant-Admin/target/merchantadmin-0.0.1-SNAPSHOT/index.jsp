<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Login</title>
<link rel="icon" href="<c:url value="/resources/images/favicon.ico"/>"
	type="image/x-icon" />

<link
	href="<c:url value="/resources/libs/font-awesome/css/font-awesome.min.css"/>"
	rel="stylesheet" />
<link
	href="<c:url value="/resources/libs/bootstrap1/dist/css/bootstrap.min.css"/>"
	rel="stylesheet" />
<link href="<c:url value="/resources/libs/build/css/login.css"/>"
	rel="stylesheet" />
<link
	href="<c:url value="/resources/libs/jquery-confirm/jquery-confirm.min.css"/>"
	rel="stylesheet">
</head>
<body style="bottom: 0; height: 1900px">

			<div class="modal fade" id="myModal">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<form id="formInput">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Change Password</h4>
							</div>
							<div class="modal-body"> 
								<div class="form-horizontal">
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Nama Pengguna </label>
										<div class="col-sm-6">
											<input type="text" name="usernameLogin" id="usernameLogin" readonly
												class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Kata sandi lama </label>
										<div class="col-sm-6">
											<input type="password" name="old_password" id="old_password"
												class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Kata sandi baru</label>
										<div class="col-sm-6">
											<input type="password" name="new_password" id="new_password"
												class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Konfirmasi sandi baru</label>
										<div class="col-sm-6">
											<input type="password" name="confirm_new_password"
												id="confirm_new_password" class="form-control" />
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<!-- <button class="btn btn-default" data-dismiss="modal">Close</button> ini harus dihapus-->
								<button type="submit" id="submit" class="btn btn-primary">Simpan perubahan</button>
							</div>
						</form>
					</div>
				</div>
			</div>

			

			<div class="modal fade" id="myModalForgotPassword" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<form id="formInputForgotPassword">
							<div class="modal-header">

								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<div class="x_title">
									<h4>Lupa Kata Sandi</h4>								
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="modal-body">
								<div class="form-horizontal">
								
								    <p class="text-center">Masukkan UserID Anda di bawah ini untuk mengatur ulang kata sandi Anda. </p>

									<div class="form-group">
										<label for="" class="col-sm-4 control-label">User ID </label>
										<div class="col-sm-6">
											<input type="text" name="nipUser" id="nipUser"
												class="form-control" required/>
										</div>
									</div>
									<div class="modal-footer">
										<button type="submit" id="submitForgotPassword" class="btn btn-primary">Kirim Password Baru</button>
									</div>

								</div>


							</div>
						</form>
					</div>
				</div>
			</div>

	<section class="container login-form"> <section>
	<form method="post" action="" id="formLogin" autocomplete="off">
		<img src="<c:url value="/resources/images/iDecisionCRM.png"/>" alt=""
			class="img-responsive" />
		<div id="msg"
			style="padding-top: 10px; padding-bottom: 10px; width: 100%"></div>
		<div class="form-group">
			<input type="text" id="txtUserID" name="txtUserID"
				class="form-control" placeholder="Masukan ID Pengguna" required="required"
				MaxLength="10" />
		</div>
		<div class="form-group">
			<input type="password" id="txtPassword" name="txtPassword"
				required="required" class="form-control"
				placeholder="Masukan Kata Sandi" MaxLength="15" />
		</div>

		<div style="display: inline; margin-bottom: 20px; ">
			<img id="captchaOK" src="<c:url value="/captcha"/>" style="margin-bottom: 5px; margin-left: 5px; float:left;">
			<button class="btn btn-default btn-xs" style="margin-top:5px; margin-left:10px; float:left;" onclick="javascript:reloadImg()" type="button" >
				<i class="fa fa-refresh"></i>
			</button>
			<input type="text" id="txtCaptcha" name="txtCaptcha"
				class="form-control" placeholder="Masukan Kode unik" required="required" style="width:45%; height:40px; float:left;  margin-left:10px;"/>
			
		</div>
		
		<button id="btnLogin" Text="Login" class="btn btn-primary btn-block" onclick="selectUserId()">Masuk</button>
		
		<div class="span5">
           <div class="pull-right">
                   <a href="#" id="forgot-password" style="color: grey">
                      Lupa Kata Sandi ?
                   </a>
           </div>
        </div>
	</form>
	
	</section> <!-- <div class="privy-login-btn" data-size="medium" data-style="solid"
		data-color="red" data-lang="en"></div>
	<script src="https://unpkg.com/privy-sdk"></script> <script>
		Privy.init({
			merchantKey : 'BG0zNf20G4Mh7I8NRQ9m',
		})
	</script> </section> -->
</body>
<script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/> "></script>
<script
	src="<c:url value="/resources/libs/bootstrap/js/bootstrap.js"/> "></script>
<script
	src="<c:url value="/resources/libs/jquery-confirm/jquery-confirm.min.js"/>"></script>

<script type="text/javascript">
	function reloadImg(){
		document.getElementById("captchaOK").src = "<c:url value="/captcha"/>?d="+new Date().getTime();;
	}
	
	function forgotPassword(){
		$("#forgot-password")
		.on(
				"click",
				function() {
					$("#myModalForgotPassword").modal("show");

				})
	}
	
	$(document)
			.ready(
					function() {
						reloadImg();
						forgotPassword();
						$("#formLogin")
								.submit(
										function(e) {
											$
													.ajax({
														type : 'POST',
														url : 'login/v4',
														data : $("#formLogin")
																.serialize(),
														beforeSend : function() {
															$("#msg")
																	.html(
																			"<h4><span class='label label-default'><i class=' fa fa-circle-o-notch fa-spin'></i> Login on progress, please wait .. </span></h4>");
														},
														success : function(
																response) {
															var x = JSON
																	.parse(response);
															
															if (x.success) {
																
																if(x.passStatus =="invalid"){
																	$("#myModal").modal("show");
																}else{
																	$("#msg")
																			.html(
																					"<h4><span class='label label-success'><i class=' fa fa-circle-o-notch fa-spin'></i> Redirecting .. </span> </h4>");
	
																	window.location.href = x.url;
																}//else untuk invalid
															} else {
																$("#msg")
																		.html(
																				"<h4><span class='label label-warning'><i class=' fa fa-exclamation-circle'></i> "
																						+ x.message
																						+ "</span></h4>");
																
																reloadImg();
																$("#txtCaptcha").val("");
																/* $.confirm({
																    title: '',
																    content: x.message,
																    type: 'red',
																    typeAnimated: true,
																    buttons: {
																        OK: function () {
																        }
																    }
																}); */
															}
															
														

														},
														error : function(xhr,
																textStatus,
																errorThrown) {
															$("#msg")
																	.html(
																			"<h5><span class='label label-danger'><i class=' fa fa-exclamation-circle'></i> Oops, we getting problems, please contact administrator</span></h5>");

														}
													});
											e.preventDefault();
										});
						
						$("#formInput").submit(function(e) {
							var x = document.getElementById('txtUserID').value;
							$.ajax({
								type : "POST",
								url : "change_password/post2",
								data : $("#formInput").serialize(),
								cache : false,
								complete : function(xhr, status) {
									if (status === 'error' || !xhr.responseText) {
										console.log(status);
									} else {
										var data = JSON.parse(xhr.responseText);
										console.log(data);
										if(data.status ==  "Success") {
											$.confirm({
												title : data.status,
												content : data.message,
												buttons : {
													somethingElse : {
														text : 'OK',
														btnClass : 'btn-success',
														keys : [ 'enter' ],
														action : function() {
															location.reload();
															/* window.location.href = "${local_server}/login/v4"; */
														}
													}

												}
											});
										} else {
											$.alert(data.message);
										}
										
									}
								}
							});
							e.preventDefault();
						});
						
						$("#formInputForgotPassword").submit(function(e) {

							$.ajax({
								type : "POST",
								url : "login/forgotPassword",
								data : $("#formInputForgotPassword").serialize(),
								beforeSend : function() {
									$("#submitForgotPassword")
											.html(
													"Mohon Tunggu ...");
								},
								cache : false,
								complete : function(xhr, status) {
									if (status === 'error' || !xhr.responseText) {
										console.log(status);
									} else {
										var data = JSON.parse(xhr.responseText);
										console.log(data);
										if(data.status ==  "Success"){
											if(data.message == "username doesnt exist"){
												$("#submitForgotPassword").html(
												"Gagal Diproses!");
												$.confirm({
													title : "Failed",
													content : data.message,
													buttons : {
														somethingElse : {
															text : 'OK',
															btnClass : 'btn-danger',
															keys : [ 'enter' ],
															action : function() {	
																//$.alert("BERHASIL!");
																
																location.reload();
																//window.location.href = "${local_server}/login/do_logout";
															}
														}

													}
												});
											}
											else if(data.message ==  "Processed") {
												$("#submitForgotPassword").html(
												"Perubahan Telah Diproses!");
												$.confirm({
													title : data.status,
													content : "Password baru anda telah di kirim ke email terdaftar",
													buttons : {
														somethingElse : {
															text : 'OK',
															btnClass : 'btn-success',
															keys : [ 'enter' ],
															action : function() {	
																//$.alert("BERHASIL!");
																
																location.reload();
																//window.location.href = "${local_server}/login/do_logout";
															}
														}

													}
												});
											} else {
												$.alert(data.message);
											}
										}
									}
								}
							});
							e.preventDefault();
						});
					});
	function selectUserId() {
		var idUser = document.getElementById("txtUserID").value;
		$("#usernameLogin").val(idUser);
		
	}
	
	function myFunction() {
		  var x = document.getElementById("old_password");
		  if (x.type === "password") {
		    x.type = "text";
		  } else {
		    x.type = "password";
		  }
		} 
</script>
</html>
