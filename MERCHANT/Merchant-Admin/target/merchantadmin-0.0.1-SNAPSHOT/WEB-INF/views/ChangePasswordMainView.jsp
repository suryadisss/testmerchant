<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Change Password" />
	<jsp:param name="jqueryconfirm" value="1" />
</jsp:include>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">

			<jsp:include page='_Side_Navigation.jsp' />
			<jsp:include page='_Top_Navigation.jsp' />

			<div class="right_col" role="main">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-lg-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>Change Password</h2>								
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<form id="formInput" class="form-horizontal">


									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Old
											Password </label>
										<div class="col-sm-6">
											<input type="password" name="old_password" id="old_password"
												class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">New
											Password</label>
										<div class="col-sm-6">
											<input type="password" name="new_password" id="new_password"
												class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Confirm New Password</label>
										<div class="col-sm-6">
											<input type="password" name="confirm_new_password"
												id="confirm_new_password" class="form-control" />
										</div>
									</div>
									<div class="modal-footer">
										<button type="submit" id="submit" class="btn btn-primary">Simpan perubahan</button>
									</div>
								</form>

							</div>

						</div>
					</div>
				</div>
			</div>

		</div>

		<jsp:include page='_Footer_Note.jsp'></jsp:include>
	</div>
</body>
<jsp:include page='_Footer_Gentellela.jsp'>
	<jsp:param name="jqueryconfirm" value="1" />
</jsp:include>
<script>
	$(document).ready(function() {
	
		$("#formInput").submit(function(e) {

			$.ajax({
				type : "POST",
				url : "change_password/post",
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
											window.location.href = "${local_server}/login/do_logout";
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

	});
	
</script>
</html>

