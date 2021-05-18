<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Restructure" />
	<jsp:param name="datatables" value="1" />
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
								<h2 id="breadhead"></h2>
								<script type="text/javascript">
									var context = "${local_server}";
									document.getElementById("breadhead").innerHTML = getBread(encodeURI(String(
											window.location.href)
											.split(context)[1]));
								</script>
								<ul class="nav navbar-right panel_toolbox">
									<!-- <li><a class="collapse-link"><i
											class="fa fa-chevron-up"></i></a></li>
									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-expanded="false"><i
											class="fa fa-wrench"></i></a>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#">Settings 1</a></li>
											<li><a href="#">Settings 2</a></li>
										</ul></li>
									<li><a class="close-link"><i class="fa fa-close"></i></a>
									</li>
								 -->
								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<form id="formInput">
									<div class="modal-body">
										<div class="form-horizontal">
											<div class="form-group">
												<label for="scc_code" class="col-sm-4 control-label">Nama</label>
												<div class="col-sm-6">
													<input type="text" name="name" id="name" class="form-control" onkeypress="return runSearch(event)" />
												</div>
											</div>
											<div class="form-group">
												<label for="scc_code" class="col-sm-4 control-label">No Ponsel</label>
												<div class="col-sm-6">
													<input type="text" name="mobile" id="mobile" class="form-control" onkeypress="return runSearch(event)" />
												</div>
											</div>
											<div class="form-group">
												<label for="scc_code" class="col-sm-4 control-label">Email/Surel
												</label>
												<div class="col-sm-6">
													<input type="text" name="email" id="email" class="form-control" onkeypress="return runSearch(event)" />
												</div>
											</div>
											<div class="form-group">
												<label for="scc_code" class="col-sm-4 control-label">NIK
												</label>
												<div class="col-sm-6">
													<input type="text" name="nik" id="nik" class="form-control" onkeypress="return runSearch(event)" />
												</div>
											</div>
											<div class="form-group">
												<label for="scc_code" class="col-sm-4 control-label">No Kontrak
												</label>
												<div class="col-sm-6">
													<input type="text" name="rshID" id="rshID" class="form-control" onkeypress="return runSearch(event)" />
												</div>
											</div>
											<div class="form-group">
												<label for="scc_code" class="col-sm-4 control-label">Restructure
												</label>
												<div class="col-sm-6">
													<!-- <select class="form-control" id="cmbAction"> -->
														<!-- <option value="repayment">Restrukturisasi</option> -->
														<input type="text" class="form-control" value="Restrukturisasi" disabled/>
													
													<!-- </select> -->
												
												</div>
											</div>
										</div> 
									</div>
									<div class="modal-footer">
										<button type="button" id="btnSearch" class="btn btn-primary">Telusuri</button>
									</div>
								</form>
								<table id="Inquiry_Table" class="table table-hover" width="100%">
									<thead>
										<tr>
											<td>CIF</td>
											<td>Nama Depan</td>
											<td>Nama Belakang</td>
											<td>Alamat</td>
											<td>Tanggal Lahir</td>
											<td>Ponsel</td>
											<td>Tindakan</td>
										</tr>
									</thead>
								</table>
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
	<jsp:param name="datatables" value="1" />
	<jsp:param name="validate" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
</jsp:include>
<script>
	//start : action search
	$(document)
			.ready(
					function() {
						$("#btnSearch")
								.click(
										function(e) {
											var url = "${local_server}/inquiry/dopost";
											$
													.ajax({
														type : "POST",
														url : url,
														data : $("#formInput")
																.serialize(),
														cache : false,
														beforeSend:function(){
															$("#btnSearch").html("<i class='fa fa-circle-o-notch fa-spin'></i> Searching");
														},
														complete : function(
																xhr, status) {
															$("#btnSearch").html("Search");
															if (status === 'error'
																	|| !xhr.responseText) {
																console.log(status);
																//$("#btnSearch").html("Search");
															} else {
																//$("#btnSearch").html("Search");
																var data = xhr.responseText;
																console.log(data);
																$(
																		'#Inquiry_Table')
																		.DataTable()
																		.destroy();
																$(
																		'#Inquiry_Table')
																		.dataTable(
																				{
																					data : $
																							.parseJSON(data),
																					columns : [
																							{
																								data : 'cst_cif'
																							},
																							{
																								data : 'cst_fname'
																							},
																							{
																								data : 'cst_lname'
																							},
																							{
																								data : 'cst_address'
																							},
																							{
																								data : 'cst_dob',

																								render : function(
																										data,
																										type,
																										row) {
																									return spTgl(data);
																								}
																							},
																							{
																								data : 'cst_phone'
																							},
																							{
																								render : function(
																										data,
																										type,
																										row) {
																									var edit = "";
																									var cmb = $("#cmbAction").val();
																									if (cmb == "repayment"){
																										edit = '<button class="repayment btn btn-xs btn-success" id="'+row.cst_cif+'" value="'+row.cst_cif+'" ><i class=" fa fa-edit"></i></button>';
																									}else{
																										edit = '<button class="edit btn btn-xs btn-success" id="'+row.cst_cif+'" value="'+row.cst_cif+'" ><i class=" fa fa-edit"></i></button>';
																										
																									}
																									
																									return edit;
																								},
																								orderable : false
																							} ]
																				});
															}
														}
													});
										});
						$('#Inquiry_Table').on('click', 'button.edit',
								function(e) {
									editRule(this.id);
								});
						$('#Inquiry_Table').on('click', 'button.repayment',
								function(e) {
							repaymentURL(this.id);
								});
						
					});

	function editRule(val) {
		window.location.href = "${local_server}/restructure/detail/" + val;
	}
	
	function repaymentURL(val) {
		window.location.href = "${local_server}/restructure/detail/" + val;
	}
	
	
	function runSearch(e) {
	    if (e.keyCode == 13) {
	    	$("#btnSearch")
			.click();
	        return false;
	    }
	}
	
	function spTgl(val) {
		if (val != null) {
			var x = val.split("T");
			var date = x[0];
			var time = x[1];
			return date;
		} else {
			return "";
		}
	}

	//end edit
</script>
</html>