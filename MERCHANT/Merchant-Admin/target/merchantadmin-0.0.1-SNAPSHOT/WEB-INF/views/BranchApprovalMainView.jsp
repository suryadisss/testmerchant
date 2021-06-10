<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Branch Approval" />
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
											<input type="text" disabled name="b_name" id="b_name"
												class="form-control" required="required" />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Grup</label>
										<div class="col-sm-6">
											<div id="groupht" style="margin-bottom: 5px;">
												<select name="b_group" disabled id="b_group"
													class="form-control selectpicker" data-show-subtext="true"
													data-live-search="true" required="required"></select>

											</div>
											
											<script type="text/javascript">
												function changeInput() {
													$("#groupht")
															.html(
																	"<input id='b_group' disabled name='b_group' class='form-control' required='required'/>")
												}
											</script>
										</div>

									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Alamat</label>
										<div class="col-sm-6">
											<textarea type="text" disabled name="b_address" id="b_address"
												class="form-control" required="required" maxlength="100"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Bank</label>
										<div class="col-sm-6">
											<div id="bankht" style="margin-bottom: 5px;">
												<select disabled name="b_bank" id="b_bank"
													class="form-control selectpicker" data-show-subtext="true"
													data-live-search="true" required="required"></select>
											</div>
											
											<script type="text/javascript">
												function changeInputBank() {
													$("#bankht")
															.html(
																	"<input id='b_bank'  disabled name='b_bank' class='form-control' required='required'/>")
												}
											</script>

										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Nama Bank</label>
										<div class="col-sm-6">
											<input type="text" disabled name="b_bank_name" id="b_bank_name"
												class="form-control" required="required" />
										</div>
									</div>

									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											No. Rekening</label>
										<div class="col-sm-6">
											<input type="text" disabled name="b_norek" id="b_norek"
												class="form-control" required="required" />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Kota</label>
										<div class="col-sm-6">
											<input type="text" disabled name="b_city" id="b_city"
												class="form-control" required="required" />
										</div>
									</div>
									<div class="form-group">
										<input type="hidden" value=1 name="sales_system" id="sales_system">
										<div class="col-sm-6 text-right">
											<input type="radio" disabled name="sales_system1" id="sales_system1"
												class="" required="required" onclick="salesSystem('1');"checked> <label>POS</label>
										</div>
										<div class="col-sm-6">
											<input type="radio" disabled name="sales_system1" id="sales_system2"
												class="" required="required" onclick="salesSystem('0');"> <label>Non POS</label>
										</div>
										
									</div>

								</div>


							</div>
							<div class="modal-footer">
								<button class="btn btn-default" data-dismiss="modal">Tutup</button>
								<button id="rejectbcl" type="button" class="btn btn-danger" onclick="setReject()">Tolak</button>
								<button type="submit" id="submit" class="btn btn-primary">Setuju</button>
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
		$.get("${local_server}/branch_management/list_draft/" + id, function(data) {
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
						"<select name='b_bank' id='b_bank' disabled class='form-control selectpicker' data-show-subtext='true' data-live-search='true' required='required'></select>");

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
						"<select name='b_group' id='b_group' disabled class='form-control selectpicker' data-show-subtext='true' data-live-search='true' required='required'></select>");

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
	
	function setReject(){
		$
		.confirm({
			title : 'Confirm!',
			content : 'Are you sure, want to reject this branch?',
			buttons : {
				cancel : function() {
					$
							.alert('Canceled!');
				},
				somethingElse : {
					text : 'Yes',
					btnClass : 'btn-warning',
					keys : [ 'enter' ],
					action : function() {
						rejectBCL();
					}
				}
			}
		});
	}
	
	function rejectBCL(){
		var dtm = {}
		dtm['b_code'] = $("#b_code").val();
		
		$
		.ajax({
			type : "POST",
			url : "${local_server}/branch_management/rejectBranch",
			data : dtm,
			cache : false,
			beforeSend : function() {
				$("#rejectbcl")
						.html(
								"<i class='fa fa-circle-o-notch fa-spin'></i>  Processing ..");

				$("#rejectbcl").prop("disabled", true);

			},
			complete : function(xhr, status) {
				
				if (status === 'error' || !xhr.responseText) {
					console.log(status);
				} else {
					$("#rejectbcl").html("Reject");
					$("#myModal").modal("hide");
					var data = JSON.parse(xhr.responseText);
					if (data.status == "Success") {
						$("#bcl").html("");
						$.confirm({
							title : "Success",
							content : "Reject Branch Successfully",
							buttons : {
								somethingElse : {
									text : 'OK',
									btnClass : 'btn-success',
									keys : [ 'enter' ],
									action : function() {
										location.reload();
									}
								}

							}
						});
					} else {
						$.alert(data.message);
						$("#rejectbcl").prop("disabled", false);
					}

				}
			}

		});
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
												url : '${local_server}/branch_management/listapprove',
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
															
															return edit;
														}

													} ]

										});

					

						$('#tablebranch')
								.on(
										"click",
										"button.edit",
										function() {
											$("#myModalLabel")
													.html(
															"Branch Approval");

											$("#myModal").modal("show");
											$("#formInput")[0].reset();
											$("#isedit").val(0);
											$("#b_code").prop("readonly", true);
											getDetBranch(this.id);
										})

					
						$("#formInput")
								.submit(
										function(e) {
											
											$
													.ajax({
														type : "POST",
														url : "${local_server}/branch_management/approveBranch",
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
																							
																									location.reload();
																							//generateLevel();
																						}
																					}
																				}
																			});

																} else {
																	var x = (n.message != null) ? n.message
																			: "Failed to approve branch";
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

