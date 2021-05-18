<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Change Email" />
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
								<h2>Change Email</h2>								
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<form id="formInput" class="form-horizontal">
									<div class="form-group">
										<label for="" class="col-sm-4 control-label">Nama</label>
										<div class="col-sm-6">
											<div id=nama></div>
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-4 control-label">NIP</label>
										<div class="col-sm-6">
											<div id=nip></div>
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-4 control-label">Email Lama</label>
										<div class="col-sm-6">
											<div id=old_email></div>
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-4 control-label">Email Baru</label>
										<div class="col-sm-6">
											<input type="email" name="new_email" id="new_email"
												class="form-control" />
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
		
		showData();
	
		$("#formInput").submit(function(e) {

			$.ajax({
				type : "POST",
				url : "change_email/dopost",
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
			});
			e.preventDefault();
		});

	});
	
	function showData(){
		console.log("masuk func showData");
		$
		.ajax({
			type : 'GET',
			url : 'change_email/showData',
			success : function(
					response) {
				console.log("masuk sukses");
				
				console.log(response, "ini response");
				console.log(response.success, "ini response.success");
				
				if (response.success == true) {
					console.log(response.data[0].usrname, "ini response.username");
					
					$("#nama").html('<input type="text" class="form-control" value= "'+response.data[0].usrname+'" disabled />');
					$("#nip").html('<input type="text" class="form-control" value= "'+response.data[0].usrnip+'" disabled />');
					$("#old_email").html('<input type="text" class="form-control" value= "'+response.data[0].usremail+'" disabled />');
				} else {
					
				}
			}
		});
	}
	
</script>
</html>

