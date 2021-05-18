<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Partners Detail" />
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
								<h4 class="modal-title" id="myModalLabel"></h4>
							</div>
							<div class="modal-body">
								<div class="form-horizontal">

									<!-- <div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Group Code</label>
										<div class="col-sm-6">
											<input type="text" name="grp_alias" id="grp_alias" min=0
												maxlength=3 class="form-control" required="required" />
										</div>
									</div> -->

									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Grup
											Partner</label>
										<div class="col-sm-6">
											<select name="ddlGroupPartner" id="ddlGroupPartner"
												class="form-control selectpicker" data-show-subtext="true"
												data-live-search="true" title="--Select One--">
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Kode Partner</label>
										<div class="col-sm-6">
											<input type="text" name="gpt_alias" id="gpt_alias" min=0
												maxlength=3 class="form-control" required="required" />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Nama Partner</label>
										<div class="col-sm-6">
											<input type="text" name="gpt_name" id="gpt_name" min=0
												class="form-control" required="required" /> <input
												type="hidden" name="isedit" id="isedit" value="">
										</div>
									</div>
								</div>
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
								<button class="btn btn-sm btn-primary" id="addnew">Tambah Baru</button>
								<table class="table table-bordered table-hover" id="tableprmcol"
									width="100%">
									<thead>
										<tr>
											<td width="15%">Kode Grup</td>
											<td width="15%">Kode Partner</td>
											<td width="15%">Nama Partner</td>
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
	function bindDDLGroupPartner(id) {
		$.get("${local_server}/PartnersDetail/GetGroupPartner", function(data) {
			var x = JSON.parse(data);
			console.log(x);
			var ht = "";
			//$("#ddlGroupPartner").empty().append(a).selectpicker("refresh")
			/* ht += "<option value='NON' "+">" + "NON GROUP"
					+ "</option>"; */

			if (id == "NON") {
				ht = "<option value='NON'selected"+">" + "NON GROUP"
						+ "</option>";
			}
			/* $.each(x.data, function(i, o) {
				var sl = (o.grp_alias == id) ? "selected" : "";
				ht += "<option value='"+o.grp_alias+"' "+">" + o.grp_name
						+ "</option>"; */
			$.each(x.data, function(i, o) {
				var sl = (o.grp_alias == id) ? "selected" : "";
				ht += "<option value='"+o.grp_alias+"' "+sl+">" + o.grp_name
						+ "</option>";
			});

			$("#ddlGroupPartner").empty().append(ht).selectpicker("refresh");
			;
		})
	}
	function bindHRData(value) {
		if (value == "Service") {
			$('#grouptype option').removeAttr('selected').filter(
					'[value=Service]').attr('selected', true)
		} else {
			$('#grouptype option').removeAttr('selected').filter('[value=XLS]')
					.attr('selected', true)
		}
	}
	function getDetCharge(id) {
		$.get("${local_server}/PartnersDetail/list/" + id, function(data) {
			var x = JSON.parse(data);
			console.log(x);
			$.each(x.data[0], function(i, o) {

				o = (i == "cch_charge") ? toRp(o) : o;
				$("#" + i).val(o);

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
		$.get("${local_server}/PartnersDetail/delete/" + x, function(data) {
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
													bindDDLGroupPartner("");
													//bindHRData('XLS');
													//getType("XLS");

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
											bindDDLGroupPartner(this.value);
											//bindHRData(this.value);
											//getType(this);
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
														url : "${local_server}/PartnersDetail/dopost",
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
												url : '${local_server}/PartnersDetail/list',
												type : 'GET'
											},

											columns : [
													{

														data : 'gpt_grp_alias'
													//className : 'txtRigth'
													},

													{
														data : 'gpt_alias'
													//className : 'txtRigth'
													},
													{
														data : 'gpt_name',
													//className : 'txtRigth'
													},
													{
														render : function(data,
																type, row) {
															var edit = '';

															edit = '<button class="edit btn btn-xs btn-success" id="'+row.gpt_alias+'" value="'+row.gpt_grp_alias+'"><i class=" fa fa-edit"></i> '
																	+ '</button>';
															edit += '<button class="delete btn btn-xs btn-danger" id="'+row.gpt_alias+'" value="'+row.gpt_alias+'-'+row.gpt_name+'"><i class=" fa fa-trash"></i> '
																	+ '</button>';

															return edit;
														}

													} ]

										});
					});
</script>

</html>

