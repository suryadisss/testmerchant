<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Pengelolaan Grup Toko" />
	<jsp:param name="datatables" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
	<jsp:param name="jquerydatepicker" value="1" />
	<jsp:param name="noityjs" value="1" />
	<jsp:param name="treemenu" value="1" />
	<jsp:param name="ass" value="1" />

</jsp:include>

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
								<h4 class="modal-title" id="myModalLabel">Pengolaan Grup Toko</h4>
							</div>
							<div class="modal-body">
								<div class="form-horizontal">

									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Grup Alias</label>
										<div class="col-sm-6">
											<div class="input-group">
												<input type="text" class="form-control"
													name="tag_group_alias" id="tag_group_alias" maxlength="3"minlength="3"
													required="required"> <span class="input-group-btn">
													<button class="btn btn-default" type="button" id="btnvalid"
														onclick="validityTenant(this);return false;">Validasi</button>
													<input type="hidden" name="tag_group_alias_valid"
													id="tag_group_valid" /> <input type="hidden"
													name="tag_group_alias_first" id="tag_group_alias_first" />
													<input type="hidden" name="hdedit" id="hdedit" />
													<input type="hidden" name="isedit" id="isedit" />
													<input type="hidden" name="tag_id" id="tag_id" />
												</span>
											</div>

										</div>
									</div>

									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Nama Grup</label>
										<div class="col-sm-6">
											<input type="text" name="tap_group_name"
												id="tap_group_name" class="form-control"
												required="required" />

										</div>
									</div>


								</div>


							</div>
							<div class="modal-footer">
								<button class="btn btn-default" data-dismiss="modal">Tutup</button>
								<button type="submit" id="submitFile" class="btn btn-primary">Simpan perubahan</button>
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
								<h2 id="breadhead">Pengolaan Grup Toko</h2>
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
								<table class="table" id="tableTenant" width="100%">
									<thead>
										<tr>
											<td width="">Grup Alias</td>
											<td width="">Nama Grup</td>
											<td width="">Tindakan</td>
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
	<jsp:param name="ass" value="1" />
</jsp:include>

<script>
	function getDetailTenant(id) {
		var j = $.ajax({
			type : "GET",
			url : "${local_server}/tenant_management/tenant/Group/" + id,
			dataType : "json",
			async : false,
			succcess : function(x) {

			}
		}).responseText;
		console.log(j);
		j = JSON.parse(j);
		//isHr(j.data[0].tnt_chk)
		$.each(j.data[0], function(i, o) {

			if (i == "tag_group_alias") {
				$("#tag_group_alias_valid").val(o)
				$("#tag_group_alias_first").val(o)
				$("#hdedit").val(true);
				$("#btnvalid").prop("disabled", true).html(
						"<i class='fa fa-check green'></i> valid");
			}
			$("#" + i).val(o);
		});

	}

	function validityTenant(a) {
		var isedit = $("#isedit").val();
		var tnt = $("#tag_group_alias").val();
		var tntf = $("#tag_group_alias_first").val();
		var dt = {}
		dt['galias'] = tnt
		if (tnt != "") {
			$
					.ajax({
						type : "POST",
						url : "${local_server}/tenant_management/validate/tenant/group",
						data : dt,
						async : false,
						dataType : "json",
						beforSend : function() {
							$(a).prop("disabled", true)
						},
						success : function(response) {
							$(a).prop("disabled", false)
							if (Object.keys(response.data).length > 0) {
								if (response.data[0].info_status == "available") {
									$(a)
											.prop("disabled", true)
											.html(
													"<i class='fa fa-check green'></i> valid");
									$("#hdedit").val(true);
									$("#tag_group_alias_valid").val(
											$("#tag_group_alias").val())
								} else {
									if (isedit == "0" && tntf == tnt) {
										$("#btnvalid")
												.prop("disabled", true)
												.html(
														"<i class='fa fa-check green'></i> valid");
										$("#hdedit").val(true)
									} else {
										$.alert("Tenant alias is already used");
										$("#hdedit").val(false);
									}

								}
							} else {
								$("#hdedit").val(false);
							}
						}
					});
		}

	}
	$(function() {
		$("#tag_group_alias")
				.keyup(
						function() {
							var tntval = $("#tag_group_alias_valid").val();
							var tnt = $("#tag_group_alias").val();
							if (tntval != tnt) {
								$("#btnvalid").prop("disabled", false).html(
										"validate");
								$("#hdedit").val(false)
							} else if (tntval === tnt && tnt != "") {

								$("#btnvalid")
										.prop("disabled", true)
										.html(
												"<i class='fa fa-check green'></i> valid");
								$("#hdedit").val(true)
							}
						});

	});

	$(document)
			.ready(
					function() {

						$("#tableTenant")
								.DataTable(
										{
											ajax : {
												url : '${local_server}/tenant_management/tenant/Group',
												type : 'GET'
											},
											order : [ [ 0, 'asc' ],
													[ 1, 'asc' ] ],

											columns : [
													{
														data : 'tag_group_alias'
													},												
													{
														data : 'tap_group_name'
													},

													{
														render : function(data,
																type, row) {
															var edit = '';

															edit = '<button class="edit btn btn-xs btn-success" id="'+row.tag_id+'" value="'+row.tap_group_name+'"><i class=" fa fa-edit"></i> '
																	+ '</button>';
															/* edit += '<button class="delete btn btn-xs btn-danger" id="'+row.tnt_id+'" value="'+row.tnt_name+'"><i class=" fa fa-trash"></i> ' 
																	+ '</button>'; */

															return edit;
														}

													} ]

										});

						$("#addnew")
								.on(
										"click",
										function() {
											$("#myModalLabel")
													.html(
															"Pengolaan Toko <span class='label label-default'>Baru</span>");

											$("#myModal").modal("show");
											$("#formInput")[0].reset();
											$("#isedit").val(1);
											$("#btnvalid").prop("disabled",
													false).html("Validate");
											$("#hdedit").val(false);
											$("#tag_id").val("0");
											$("#tag_group_alias").prop("readonly",false);
											$("#tag_group_alias_first").val("");
											//getDDLGroup("");
										})

						$('#tableTenant')
								.on(
										"click",
										"button.edit",
										function() {
											$("#myModalLabel")
													.html(
															"Pengolaan Toko <span class='label label-default'>Ubah</span>");

											$("#myModal").modal("show");
											$("#formInput")[0].reset();
											$("#isedit").val(0);
											$("#hdedit").val(false);
											$("#tag_group_alias").prop("readonly",true);
											getDetailTenant(this.id);
										})

						$('#tablebranch')
								.on(
										"click",
										"button.delete",
										function() {
											var x = this.value;
											var idx = this.id;
											$
													.confirm({
														title : 'Confirm',
														content : 'Are you sure want to delete branch "'
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
										})

						$("#formInput")
								.submit(
										function(e) {
											var x = $("#hdedit").val();
											if (x == "true") {
											
													$
															.ajax({
																url : "${local_server}/tenant_management/dopost/group",
																type : "POST",
																data : new FormData(
																		this),
																processData : !1,
																contentType : !1,
																cache : !1,
																dataType : "json",
																beforeSend : function() {
																	$(
																			"#submitFile")
																			.html(
																					"<i class='fa fa-circle-o-notch fa-spin'></i>  Please wait ..")

																			.prop(
																					"disabled",
																					false);
																},
																success : function(
																		e) {
																	$(
																			"#submitFile")
																			.html(
																					"Save Changes")
																			.prop(
																					"disabled",
																					false);
																	if (e.status == "Success") {
																		$(
																				"#myModal")
																				.modal(
																						"hide");
																		$("#formInput")[0]
																				.reset();

																		$
																				.confirm({
																					title : '',
																					content : e.message,
																					buttons : {
																						somethingElse : {
																							text : 'OK',
																							btnClass : 'btn-success',
																							keys : [ 'enter' ],
																							action : function() {
																								$(
																										"#tableTenant")
																										.DataTable().ajax
												.reload()
																							}
																						}
																					}
																				});
																	}

																},
																error : function() {
																	$(
																			"#submitFile")
																			.html(
																					"Save Changes")
																			.prop(
																					"disabled",
																					false);
																}
															});

												

											} else {
												$
														.alert("Please validating tenant alias first")
											}

											e.preventDefault();
										});

					});
</script>

</html>

