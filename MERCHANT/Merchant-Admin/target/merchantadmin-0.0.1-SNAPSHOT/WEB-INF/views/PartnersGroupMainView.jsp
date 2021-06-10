<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Partners Group" />
	<jsp:param name="datatables" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
	<jsp:param name="jquerydatepicker" value="1" />
	<jsp:param name="noityjs" value="1" />
	<jsp:param name="treemenu" value="1" />
	<jsp:param name="ass" value="1" />

</jsp:include>
<style>
.switch {
  position: relative;
  display: inline-block;
  width: 30px;
  height: 17px;
  padding-top: 10px;
}

.switch input { 
  opacity: 0;
  width: 0;
  height: 0;
}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 13px;
  width: 13px;
  left: 2px;
  bottom: 2px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(13px);
  -ms-transform: translateX(13px);
  transform: translateX(13px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 17px;
}

.slider.round:before {
  border-radius: 50%;
}
</style>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">

			<jsp:include page='_Side_Navigation.jsp' />
			<jsp:include page='_Top_Navigation.jsp' />

			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<form id="formInput">
							<div class="modal-header">

								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel"></h4>
							</div>
							<div class="modal-body">
								<div class="form-horizontal">

									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Kode Grup</label>
										<div class="col-sm-6">
											<input type="text" name="grp_alias" id="grp_alias" min=0
												maxlength=3 class="form-control" required="required" />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Nama Grup</label>
										<div class="col-sm-6">
											<input type="text" name="grp_name" id="grp_name" min=0
												class="form-control" required="required" />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Grup Data HR</label>
										<div class="col-sm-6">
											<select name="grouptype" class="form-control" required
												onChange="getType(this)" id="grouptype">
												<option value="XLS">XLS</option>
												<option value="Service">Service</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Lokasi Grup</label>
										<div class="col-sm-6">
											<textarea type="text" name="grp_location" id="grp_location"
												class="form-control" required="required"></textarea>
											<!-- <input type="text" name="grp_location" id="grp_location"
												min=0 class="form-control" required="required" /> -->
											<input type="hidden" name="isedit" id="isedit" value="">
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Konfirmasi Pinjaman Partner</label>
										<div class="col-sm-6" id="styleFelix1">
											<label class="switch">
											  <input type="checkbox" id="grp_loan_conf_c" name="grp_loan_conf_c" onclick="checkVal(this.id)">
											  <span class="slider round"></span>
											</label>&nbsp;&nbsp;
											<label class="switch" id="labelConf">Aktif</label>
											<input type="hidden" id="grp_loan_conf" name="grp_loan_conf" value="">
										</div>
										
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Dokumen wajib</label>
										<div class="col-sm-6" id="styleFelix2">
											<label class="switch">
											  <input type="checkbox" id="grp_ads_doc_c" name="grp_ads_doc_c" onclick="checkVal(this.id)">
											  <span class="slider round"></span>
											</label>&nbsp;&nbsp;
											<label class="switch" id="labelMandatory">Aktif</label>
											<input type="hidden" id="grp_ads_doc" name="grp_ads_doc" value="">
										</div>
									</div>
									<div id="dvHrType" style="display: none;">
										<div class="form-group">
											<label for="scc_code" class="col-sm-4 control-label">
												Tipe Service</label>
											<div class="col-sm-6">
												<select name="grp_type" class="form-control" id="grp_type">
													<option value="POST">POST</option>
													<option value="GET">GET</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label for="scc_code" class="col-sm-4 control-label">
												Service Header</label>
											<div class="col-sm-6">
												<input type="text" name="grp_header" id="grp_header" min=0
													class="form-control" />
											</div>
										</div>
										<div class="form-group">
											<label for="scc_code" class="col-sm-4 control-label">
												Permintaan Service</label>
											<div class="col-sm-6">
												<textarea type="text" name="grp_request" id="grp_request"
													class="form-control"></textarea>
												<!-- <input type="text" name="grp_request" id="grp_request" min=0
													class="form-control" required="required" /> -->
											</div>
										</div>
									</div>


								</div>

								<!-- 	<div class="form-group" id="dvHrType" style="display: none;">
									<label for="scc_code" class="col-sm-4 control-label">
										Type</label>
									<div class="col-sm-6">

										<select name="grouptype" class="form-control" required
											id="grp_type">
											<option value="POST">POST</option>
											<option value="GET">GET</option>
										</select>
									</div>
								</div> -->

							</div>
							<div class="modal-footer">
								<button class="btn btn-default" data-dismiss="modal">Tutup</button>
								<button type="submit" id="submit" class="btn btn-primary">Simpan perubahan</button>
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="right_col" role="main">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-lg-12d">
						<div class="x_panel">
							<div class="x_title">
								<h2 id="breadhead">Grup Partner</h2>
								<script type="text/javascript">
									var context = "${local_server}";
									document.getElementById("breadhead").innerHTML = getBread(encodeURI(String(
											window.location.href)
											.split(context)[1]));
								</script>
								<ul class="nav navbar-right panel_toolbox">

								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<button class="btn btn-sm btn-primary" id="addnew">Tambah baru</button>
								<table class="table table-bordered table-hover" id="tableprmcol"
									width="100%">
									<thead>
										<tr>
											<td width="15%">Kode Grup</td>
											<td width="15%">Nama Grup</td>
											<td width="10%">Grup Data HR</td>
											<td width="45%">Lokasi Grup</td>
											<td width="5%">Tindakan</td>
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
	<jsp:param name="title" value="Disbursement" />
	<jsp:param name="datatables" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
	<jsp:param name="jquerydatepicker" value="1" />
	<jsp:param name="noityjs" value="1" />
	<jsp:param name="inputmask" value="1" />
	<jsp:param name="ass" value="1" />
</jsp:include>

<script>
	/* 	function bindHRData(value) {
	 if (value == "Service") {
	 //  $('#drprojecttype').val("Dedicated");
	 $("#grouptype option[value='Service']")
	 .attr("selected", "selected");
	 //  $("#drprojecttype").val("Dedicated");
	 } else {
	 // $("#drprojecttype").val("Adhoc");
	 //$("#grouptype option[value='XLS']").attr("selected", "selected");
	 $("#grouptype option[value='XLS']").attr("selected", "selected");
	 }
	 } */
	function bindHRData(value) {
		if (value == "Service") {
			$('#grouptype option').removeAttr('selected').filter(
					'[value=Service]').attr('selected', true)
		} else {
			$('#grouptype option').removeAttr('selected').filter(
			'[value=XLS]').attr('selected', true)
		}
	}
	 
	function checkboxConf(obj){
		if(obj==true){
			document.getElementById("grp_loan_conf_c").checked = true;
			document.getElementById("labelConf").style.color = "#73879C"; 
			//document.getElementById("labelConf").style.display = 'block';
			//document.getElementById("styleFelix1").removeProperty('padding-top');
		}else if(obj==false){
			document.getElementById("grp_loan_conf_c").checked = false;
			document.getElementById("labelConf").style.color = "#ffffff";
			//document.getElementById("labelConf").style.display = 'none';
			//document.getElementById("styleFelix1").style.setProperty('padding-top', '10px');
		}else{
			document.getElementById("grp_loan_conf_c").checked = false;
			document.getElementById("labelConf").style.color = "#ffffff";
			//document.getElementById("labelConf").style.display = 'none';
			//document.getElementById("styleFelix1").style.setProperty('padding-top', '10px');
		}
	}
	
	function checkboxMandatory(obj){
		if(obj==true){
			document.getElementById("grp_ads_doc_c").checked = true;
			document.getElementById("labelMandatory").style.color = "#73879C";  
			//document.getElementById("labelMandatory").style.display = 'block';
			//document.getElementById("styleFelix2").removeProperty('padding-top');
		}else if(obj==false){
			document.getElementById("grp_ads_doc_c").checked = false;
			document.getElementById("labelMandatory").style.color = "#ffffff"; 
			//document.getElementById("labelMandatory").style.display = 'none';
			//document.getElementById("styleFelix2").style.setProperty('padding-top', '10px');
		}else{
			document.getElementById("grp_ads_doc_c").checked = false;
			document.getElementById("labelMandatory").style.color = "#ffffff"; 
			//document.getElementById("labelMandatory").style.display = 'none';
			//document.getElementById("styleFelix2").style.setProperty('padding-top', '10px');
		}
	}
	
	function checkVal(obj){
		if(obj=="grp_ads_doc_c"){
			var tes = $('#'+obj+':checked').prop("checked");
			if(tes == true){
				$('#grp_ads_doc').val("true");
				document.getElementById("labelMandatory").style.color = "#73879C"; 
				//document.getElementById("styleFelix2").removeProperty('padding-top');
				//document.getElementById("labelMandatory").removeProperty('display');
			}else{
				$('#grp_ads_doc').val("false");
				document.getElementById("labelMandatory").style.color = "#ffffff"; 
				//document.getElementById("labelMandatory").style.display = 'none';
				//document.getElementById("styleFelix2").style.setProperty('padding-top', '10px');
			}
		}else if(obj=="grp_loan_conf_c"){
			var tes = $('#'+obj+':checked').prop("checked");
			if(tes == true){
				$('#grp_loan_conf').val("true");
				document.getElementById("labelConf").style.color = "#73879C"; 
				//document.getElementById("styleFelix1").removeProperty('padding-top');
				//document.getElementById("labelConf").removeProperty('display');
			}else{
				$('#grp_loan_conf').val("false");
				document.getElementById("labelConf").style.color = "#ffffff";  
				//document.getElementById("labelConf").style.display = 'none';
				//document.getElementById("styleFelix1").style.setProperty('padding-top', '10px');
			}
		}
	}
	function getDetCharge(id) {
		$.get("${local_server}/PartnersGroup/list/" + id, function(data) {
			var x = JSON.parse(data);
			console.log(x);
			$.each(x.data[0], function(i, o) {
				if(i=="cch_charge"){
					toRp(o);
					$("#" + i).val(o);
				}
				else if(i == "grp_loan_conf"){
					checkboxConf(o);
					$("#" + i).val(o);
					
				}
				else if(i == "grp_ads_doc"){
					checkboxMandatory(o);
					$("#" + i).val(o);
					
				}
				else{
					$("#" + i).val(o);
				}
				//o = (i == "cch_charge") ? toRp(o) : o;
				//$("#" + i).val(o);

			});
		})
	}

	function getType(obj) {
		var val = obj.value;

		if (val == "Service") {
			$("#dvHrType").css("display", "");
		} else {
			$("#dvHrType").css("display", "none");
		}
	}
	function toRp(angka) {
		if (angka != null) {
			var angkaPositif = (angka < 0) ? String(angka).replace("-", "")
					: angka;
			var ang = String(angkaPositif).split('.');
			var rev = parseInt(ang[0], 10).toString().split('').reverse().join(
					'');
			var rev2 = '';
			for (var i = 0; i < rev.length; i++) {
				rev2 += rev[i];

				if ((i + 1) % 3 === 0 && i !== (rev.length - 1)) {

					rev2 += ',';

				}
			}

			var x = (angka < 0) ? "-" : "";
			//ang[1] = (ang[1] != null) ? "," + ang[1] : ",00"
			return x + rev2.split('').reverse().join('');
		} else {
			return '0'
		}

	}

	function dlt(x) {
		$.get("${local_server}/PartnersGroup/delete/" + x, function(data) {
			var n = JSON.parse(data);
			if (n.status == "Success") {
				$.confirm({
					title : '',
					content : n.message,
					type : 'green',
					typeAnimated : true,
					buttons : {
						reload : {
							text : 'OK',
							btnClass : 'btn-green',
							action : function() {
								$('#tableprmcol').DataTable().ajax.reload();
								//generateLevel();
							}
						}
					}
				});

			}
		});
	}
	$(document)
			.ready(
					function() {

								$("#cch_charge").inputmask("numeric", {
									radixPoint : ".",
									groupSeparator : ",",
									digits : 2,
									autoGroup : !0,
									prefix : "",
									rightAlign : !0,
									oncleared : function() {
									}
								}),

								$("#addnew")
										.on(
												"click",
												function() {
													$("#myModalLabel")
															.html(
																	"Partners Group <span class='label label-default'>New</span>");

													$("#myModal").modal("show");
													$("#formInput")[0].reset();
													$("#isedit").val(1);
													bindHRData('XLS');
													getType("XLS");

												});

						$('#tableprmcol')
								.on(
										"click",
										"button.edit",
										function() {
											$("#myModalLabel")
													.html(
															"Partners Group <span class='label label-default'>Edit</span>");

											$("#myModal").modal("show");
											$("#formInput")[0].reset();
											$("#isedit").val(0);
											getDetCharge(this.id);
											bindHRData(this.value);
											getType(this);
										});

						$('#tableprmcol')
								.on(
										"click",
										"button.delete",
										function() {
											var x = this.value;
											var idx = this.id;
											$
													.confirm({
														title : 'Confirm',
														content : 'Are you sure want to delete group "'
																+ x + '"',
														type : 'red',
														typeAnimated : true,
														buttons : {
															Cancel : {
																text : 'Cancel',
																action : function() {

																}
															},
															tryAgain : {
																text : 'Delete',
																btnClass : 'btn-red',
																action : function() {
																	dlt(idx);
																}
															}

														}
													});
										});
						$("#formInput")
								.submit(
										function(e) {

											$
													.ajax({
														type : "POST",
														url : "${local_server}/PartnersGroup/dopost",
														data : $(this)
																.serialize(),
														cache : !1,
														beforeSend : function() {
															$(
																	'button[type=submit]')
																	.prop(
																			'disabled',
																			true);
														},
														complete : function(e,
																t) {
															$(
																	'button[type=submit]')
																	.prop(
																			'disabled',
																			false);
															if ("error" !== t
																	&& e.responseText) {
																var n = JSON
																		.parse(e.responseText);
																if (n.status == "Success") {
																	$(
																			"#myModal")
																			.modal(
																					"hide");
																	$
																			.confirm({
																				title : '',
																				content : n.message,
																				type : 'green',
																				typeAnimated : true,
																				buttons : {
																					reload : {
																						text : 'OK',
																						btnClass : 'btn-green',
																						action : function() {
																							$(
																									'#tableprmcol')
																									.DataTable().ajax
																									.reload();
																							//generateLevel();
																						}
																					}
																				}
																			});

																} else {
																	var x = (n.message != null) ? n.message
																			: "Failed to saving data";
																	$.alert(x);
																}
															}
														}
													});
											e.preventDefault();
										});

						$('#tableprmcol')
								.DataTable(
										{
											ajax : {
												url : '${local_server}/PartnersGroup/list',
												type : 'GET'
											},

											columns : [
													{

														data : 'grp_alias'
													//className : 'txtRigth'
													},

													{
														data : 'grp_name'
													//className : 'txtRigth'
													},
													/* {
														data : 'grp_hr_data',
														className : 'txtRigth',
														render : function(x, y,
																z) {
															return toRp(x);
														}
													}, */

													{
														data : 'grp_hr_data',
													//className : 'txtRigth'
													},
													{
														data : 'grp_location'
													//className : 'txtRigth'
													},
													/* {
														data : 'cch_isactive',
														className : 'txtCenter',
														render : function(data,
																type, row) {
															return (data) ? '<i class="fa fa-check-circle green"></i>'
																	: '<i class="fa fa-times-circle"></i>';
														}
													}, */

													{
														render : function(data,
																type, row) {
															var edit = '';

															edit = '<button class="edit btn btn-xs btn-success" id="'+row.grp_alias+'" value="'+row.grp_hr_data+'"><i class=" fa fa-edit"></i> '
																	+ '</button>';
															edit += '<button class="delete btn btn-xs btn-danger" id="'+row.grp_alias+'" value="'+row.grp_alias+'-'+row.grp_name+'"><i class=" fa fa-trash"></i> '
																	+ '</button>';

															return edit;
														}

													} ]

										});
					});
</script>

</html>

