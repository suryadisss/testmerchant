<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Branch Management" />
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
								<h4 class="modal-title" id="myModalLabel">Namai ulang</h4>
							</div>
							<div class="modal-body">
								<div class="form-horizontal">

									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Kode Branch</label>
										<div class="col-sm-6">
											<input type="text" name="b_code" id="b_code"
												class="form-control" required="required" /> <input
												type="hidden" name="isedit" id="isedit" value="">
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Nama</label>
										<div class="col-sm-6">
											<input type="text" name="b_name" id="b_name"
												class="form-control" required="required" />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Grup</label>
										<div class="col-sm-6">
											<div id="groupht" style="margin-bottom: 5px;">
												<select name="b_group" id="b_group"
													class="form-control selectpicker" data-show-subtext="true"
													data-live-search="true" required="required"></select>

											</div>
											<button type="button" class="btn btn-xs btn-success"
												onclick="getDDLGroup('')">
												<i class="fa fa-refresh"></i> Pilih dari daftar
											</button>
											<button type="button" class="btn btn-xs btn-primary"
												onclick="changeInput()">
												<i class="fa fa-plus"></i> Tambah value baru
											</button>
											<script type="text/javascript">
												function changeInput() {
													$("#groupht")
															.html(
																	"<input id='b_group' name='b_group' class='form-control' required='required'/>")
												}
											</script>
										</div>

									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Alamat</label>
										<div class="col-sm-6">
											<textarea type="text" name="b_address" id="b_address"
												class="form-control" required="required" maxlength="99"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Bank</label>
										<div class="col-sm-6">
											<div id="bankht" style="margin-bottom: 5px;">
												<select name="b_bank" id="b_bank"
													class="form-control selectpicker" data-show-subtext="true"
													data-live-search="true" required="required"></select>
											</div>
											<button type="button" class="btn btn-xs btn-success"
												onclick="getDDLBank('')">
												<i class="fa fa-refresh"></i> Pilih dari daftar
											</button>
											<button type="button" class="btn btn-xs btn-primary"
												onclick="changeInputBank()">
												<i class="fa fa-plus"></i> Tambah value baru
											</button>
											<script type="text/javascript">
												function changeInputBank() {
													$("#bankht")
															.html(
																	"<input id='b_bank' name='b_bank' class='form-control' required='required'/>")
												}
											</script>

										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Nama Bank</label>
										<div class="col-sm-6">
											<input type="text" name="b_bank_name" id="b_bank_name"
												class="form-control" required="required" />
										</div>
									</div>

									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											No. Rekening</label>
										<div class="col-sm-6">
											<input type="text" name="b_norek" id="b_norek"
												class="form-control" required="required" />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Kota</label>
										<div class="col-sm-6">
											<input type="text" name="b_city" id="b_city"
												class="form-control" required="required" />
										</div>
									</div>
									<div class="form-group">
										<input type="hidden" value=1 name="sales_system" id="sales_system">
										<div class="col-sm-6 text-right">
											<input type="radio" name="sales_system1" id="sales_system1"
												class="" required="required" onclick="salesSystem('1');"checked> <label>POS</label>
										</div>
										<div class="col-sm-6">
											<input type="radio" name="sales_system1" id="sales_system2"
												class="" required="required" onclick="salesSystem('0');"> <label>Non POS</label>
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
								<h2 id="breadhead">Pengaturan Branch</h2>
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
								<table class="table" id="tablebranch" width="100%">
									<thead>
										<tr>
											<td width="5%">Kode Branch</td>
											<td width="10%">Grup</td>
											<td width="15%">Nama</td>
											<td width="15%">Alamat</td>
											<td width="15%">Bank</td>
											<td width="15%">Nama Bank</td>
											<td width="10%">No. Rekening</td>
											<td width="10%">Kota</td>
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
	<jsp:param name="ass" value="1" />
</jsp:include>

<script>
	function salesSystem(x){
		$("#sales_system").val(x.toString());
	}
	function getDetBranch(id) {
		$.get("${local_server}/branch_management/list/" + id, function(data) {
			var x = JSON.parse(data);
			console.log(x);
			$.each(x.data[0], function(i, o) {
				if (i == "b_bank") {
					getDDLBank(o)
				}
				if (i == "b_group") {
					getDDLGroup(o)
				}
				if(i=="b_pos_flag"){
				console.log(o);
					if(o==0||o=="0"){
						var a=document.getElementById('sales_system2');
						a.setAttribute("checked","");
						$("#sales_system").val(0);
						
					}
					else{
						$("#sales_system2").removeAttr("checked");
						var b=document.getElementById('sales_system1');
						b.setAttribute("checked","");
						$("#sales_system").val(1);
					}
				}
				$("#" + i).val(o);
			});
		})
	}

	function getDDLBank(id) {
		$("#bankht")
				.html(
						"<select name='b_bank' id='b_bank' class='form-control selectpicker' data-show-subtext='true' data-live-search='true' required='required'></select>");

		$.get("${local_server}/branch_management/list_bank", function(data) {
			var x = JSON.parse(data);
			console.log(x);
			var ht = "<optgroup label='Existing Bank'>";

			$.each(x.bank_existing, function(i, o) {
				var sl = (o.b_bank == id) ? "selected" : "";
				ht += "<option value='"+o.b_bank+"' "+sl+">" + o.b_bank
						+ "</option>";
			});
			ht += "</optgroup>";
			ht += "<optgroup label='All Bank'>";

			$.each(x.all_bank, function(i, o) {
				var sl = (o.ddl_value == id) ? "selected" : "";
				ht += "<option value='"+o.ddl_value+"' "+sl+">" + o.ddl_name
						+ "</option>";
			});
			ht += "</optgroup>";
			$("#b_bank").empty().append(ht).selectpicker("refresh");
			;
		})
	}

	function getDDLGroup(id) {
		$("#groupht")
				.html(
						"<select name='b_group' id='b_group' class='form-control selectpicker' data-show-subtext='true' data-live-search='true' required='required'></select>");

		$.get("${local_server}/branch_management/list_group", function(data) {
			var x = JSON.parse(data);
			console.log(x);
			var ht = "";
			$.each(x.data, function(i, o) {
				//var sl = (o.b_group == id) ? "selected" : "";
				//ht += "<option value='"+o.b_group+"' "+sl+">" + o.b_group
				//var sl = (o.tag_group_alias == id) ? "selected" : "";
				//ht += "<option value='"+o.tag_group_alias+"' "+sl+">" + o.tap_group_name
				var sl = (o.tnt_alias == id) ? "selected" : "";
				ht += "<option value='"+o.tnt_alias+"' "+sl+">" + o.tnt_name
						+ "</option>";
			});

			$("#b_group").empty().append(ht).selectpicker("refresh");
			;
		})
	}

	function dlt(x) {
		$.get("${local_server}/branch_management/delete/" + x, function(data) {
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
								$('#tablebranch').DataTable().ajax.reload();
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
						$('#tablebranch')
								.DataTable(
										{
											ajax : {
												url : '${local_server}/branch_management/list',
												type : 'GET'
											},
											order : [ [ 1, 'asc' ],
													[ 2, 'asc' ] ],

											columns : [
													{

														data : 'b_code'
													},

													{
														data : 'b_group'
													},
													{
														data : 'b_name'
													},
													{
														data : 'b_address'
													},

													{
														data : 'b_bank'
													},
													{
														data : 'b_bank_name'
													},

													{
														data : 'b_norek'
													},
													{
														data : 'b_city'
													},

													{
														render : function(data,
																type, row) {
															var edit = '';

															edit = '<button class="edit btn btn-xs btn-success" id="'+row.b_code+'" value="'+row.b_name+'"><i class=" fa fa-edit"></i> '
																	+ '</button>';
															edit += '<button class="delete btn btn-xs btn-danger" id="'+row.b_code+'" value="'+row.b_name+'"><i class=" fa fa-trash"></i> '
																	+ '</button>';

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
															"Branch Management <span class='label label-default'>New</span>");

											$("#myModal").modal("show");
											$("#formInput")[0].reset();
											$("#isedit").val(1);
											getDDLBank("");
											getDDLGroup("");
											$("#b_code")
													.prop("readonly", false);

										})

						$('#tablebranch')
								.on(
										"click",
										"button.edit",
										function() {
											$("#myModalLabel")
													.html(
															"Branch Management <span class='label label-default'>Edit</span>");

											$("#myModal").modal("show");
											$("#formInput")[0].reset();
											$("#isedit").val(0);
											$("#b_code").prop("readonly", true);
											getDetBranch(this.id);
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
											$
													.ajax({
														type : "POST",
														url : "${local_server}/branch_management/dopost",
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
																									'#tablebranch')
																									.DataTable().ajax
																									.reload();
																									location.reload();
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

					});
</script>

</html>

