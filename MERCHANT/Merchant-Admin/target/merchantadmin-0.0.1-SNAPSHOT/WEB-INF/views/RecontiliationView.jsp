<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Reconciliation" />
	<jsp:param name="datatables" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
	<jsp:param name="jquerydatepicker" value="1" />
	<jsp:param name="noityjs" value="1" />
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
							<input type="hidden" name="new_edit_status" id="new_edit_status" />
							<input type="hidden" name="rul_id" id="rul_id" />
							<div class="modal-header">

								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							</div>
							<div class="modal-body"></div>
							<div class="modal-footer">
								<button class="btn btn-default" data-dismiss="modal">Tutup</button>
								<button type="submit" id="submit" class="btn btn-primary">Simpan Perubahan</button>
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="right_col" role="main">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-lg-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>Rekonsiliasi</h2>
								<ul class="nav navbar-right panel_toolbox">

								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<div class="col-xs-12 col-sm-12 col-lg-12"
									style="background: #f7f8f9; border: 1px solid #eff0f2; margin-bottom: 50px;">
									<div class="pull-left">
										<div id="msg"></div>
									</div>


									<form id="formReport" autocomplete="off">
										<div class="modal-body">
											<div class="form-horizontal">
												<div class="form-group">
													<label for="staticEmail2" class="sr-only">Email/Surel</label><label
														for="scc_code" class="col-sm-4 control-label">Gerbang Pembayaran</label>
													<div class="col-sm-6">
														<select id="cmbRpt" name="cmbReport" class="form-control"
															onchange="onReport(this.options[this.selectedIndex].value)"><option
																value="midtrans">Midtrans</option>
															<option value="nicepay">NicePay</option>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label for="scc_code" class="col-sm-4 control-label">Tanggal</label>
													<div class="col-sm-6">
														<label for="inputPassword2" class="sr-only">Mulai</label>
														<input type="text" class="form-control datepicker11"
															required="required" placeholder="Dari Tanggal"
															name="date_from" id="date_from" title="(YYYY-MM-DD)"
															data-date-format="YYYY-MM-DD" />
													</div>
												</div>
												<div class="form-group">
													<label for="scc_code" class="col-sm-4 control-label">Pilih berkas</label>
													<div class="col-sm-6">
														<input type="file" name="files[0]" id="file"
															required="required" class="form-control" />
													</div>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button type="submit" id="btnShow" class="btn btn-primary">Bandingkan</button>
										</div>
										<div id="downloadExcel"></div>
									</form>


								</div>
								<table id="rptMidtrans" class="table table-hover hide"
									width="100%">
									<thead>
										<tr>
											<td>Id Pesanan</td>
											<td>Id Transaksi</td>
											<td>Email/Surel</td>
											<td>Jumlah</td>
											<td>Status</td>
											<td>Jumlah PG</td>
											<td>Status PG</td>
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
</jsp:include>

<script>
	$(document).ready(function() {
		//$('#rptMidtrans').DataTable()
		$('.datepicker11').datetimepicker({
			useCurrent : false
		});

		$("#formReport").submit(function(e) {

			var x = $("#cmbRpt");
			switch (x.val()) {
			case "midtrans":
				doRecontiliation(this);
				break;
			case "nicepay":
				doRecontiliationNicePay(this);
				break;
			default:
				doRecontiliation(this);
			}
			e.preventDefault();
		});

	});

	function toRp(angka) {
		if (angka != null) {
			var ang = String(angka).split('.');
			var rev = parseInt(ang[0], 10).toString().split('').reverse().join(
					'');
			var rev2 = '';
			for (var i = 0; i < rev.length; i++) {
				rev2 += rev[i];
				if ((i + 1) % 3 === 0 && i !== (rev.length - 1)) {
					rev2 += ',';
				}
			}
			return '' + rev2.split('').reverse().join('');
		}
		else {
			return '0'
		}
	}
	
	function doRecontiliationNicePay(a) {
		$
				.ajax({
					type : 'POST',
					data : new FormData(a),
					processData : false,
					contentType : false,
					cache : false,
					url : 'recontiliation/file/nicepay',
					dataType : 'json',
					beforeSend : function() {
						$("#msg").html("");
						$("#msg")
								.html(
										"<h3><i class='fa fa-circle-o-notch fa-spin'></i>  </h3>")
					},
					success : function(data) {
						$("#msg").html("");
						if (data.message == "recon_different") {
							$('#rptMidtrans').removeClass("hide");
							$('#rptMidtrans').DataTable().destroy();
							var page = data.total_rows / 10;
							//Paging(page);
							$('#rptMidtrans')
									.dataTable(
											{
												data : $
														.parseJSON(JSON
																.stringify(data.failedrecon)),
												"searching" : false,
												"scrollX" : true,
												"bPaginate" : true,
												"bInfo" : false,
												columns : [
														{
															data : 'crn_order_id'
														},
														{
															data : 'crn_transaction_id'
														},
														{
															data : 'crn_email'
														},

														{
															data : 'crn_amount',
															className : "txtRigth",
															render : function(data,type,row)
															{
																return toRp(data);
															}
														},
														
														
														{
															data : 'crn_transaction_status'
														},
														{
															data : 'crn_md_dif_amount'
														},
														{
															data : 'crn_md_dif_transaction_status'
														}, ],
												dom : 'Bfrtip',
												buttons : [ 'excel' ]
											});
							$.confirm({
								title : 'Failed',
								content : 'Found Difference',
								type : 'red',
								typeAnimated : true,
								buttons : {
									tryAgain : {
										text : 'OK',
										btnClass : 'btn-failed',
										action : function() {
										}
									},
								}
							});
						} else if (data.message == "recon_failed") {
							$('#rptMidtrans').addClass("hide");
							$('#rptMidtrans').DataTable().destroy();
							$
									.confirm({
										title : 'Failed',
										content : 'Reconciliation Failed. Please check whether file or date is valid',
										type : 'red',
										typeAnimated : true,
										buttons : {
											tryAgain : {
												text : 'OK',
												btnClass : 'btn-failed',
												action : function() {
												}
											},
										}
									});
						} else {
							$('#rptMidtrans').addClass("hide");
							$('#rptMidtrans').DataTable().destroy();
							$.confirm({
								title : 'Success',
								content : 'Reconciliation has been succeed',
								type : 'green',
								typeAnimated : true,
								buttons : {
									tryAgain : {
										text : 'OK',
										btnClass : 'btn-success',
										action : function() {
										}
									},
								}
							});
						}

					},
					failure : function(errMsg) {
						$.alert("call failed");
					}
				});

	}
	function doRecontiliation(a) {
		$
				.ajax({
					type : 'POST',
					data : new FormData(a),
					processData : false,
					contentType : false,
					cache : false,
					url : 'recontiliation/file',
					dataType : 'json',
					beforeSend : function() {
						$("#msg").html("");
						$("#msg")
								.html(
										"<h3><i class='fa fa-circle-o-notch fa-spin'></i>  </h3>")
					},
					success : function(data) {
						$("#msg").html("");
						if (data.message == "recon_different") {
							$('#rptMidtrans').removeClass("hide");
							$('#rptMidtrans').DataTable().destroy();
							var page = data.total_rows / 10;
							//Paging(page);
							$('#rptMidtrans')
									.dataTable(
											{
												data : $
														.parseJSON(JSON
																.stringify(data.failedrecon)),
												"searching" : false,
												"scrollX" : true,
												"bPaginate" : true,
												"bInfo" : false,
												columns : [
														{
															data : 'crn_order_id'
														},
														{
															data : 'crn_transaction_id'
														},
														{
															data : 'crn_email'
														},
														{
															data : 'crn_amount',
															className : "txtRigth",
															render : function(data,type,row)
															{
																return toRp(data);
															}
														},
														{
															data : 'crn_transaction_status'
														},
														{
															data : 'crn_md_dif_amount',
															className : "txtRigth",
															render : function(data,type,row)
															{
																return toRp(data);
															}
														},
														{
															data : 'crn_md_dif_transaction_status'
														}, ],
												dom : 'Bfrtip',
												buttons : [ 'excel' ]
											});
							$.confirm({
								title : 'Failed',
								content : 'Found Difference',
								type : 'red',
								typeAnimated : true,
								buttons : {
									tryAgain : {
										text : 'OK',
										btnClass : 'btn-failed',
										action : function() {
										}
									},
								}
							});
						} else if (data.message == "recon_failed") {
							$('#rptMidtrans').addClass("hide");
							$('#rptMidtrans').DataTable().destroy();
							$
									.confirm({
										title : 'Failed',
										content : 'Reconciliation Failed. Please check whether file or date is valid',
										type : 'red',
										typeAnimated : true,
										buttons : {
											tryAgain : {
												text : 'OK',
												btnClass : 'btn-failed',
												action : function() {
												}
											},
										}
									});
						} else {
							$('#rptMidtrans').addClass("hide");
							$('#rptMidtrans').DataTable().destroy();
							$.confirm({
								title : 'Success',
								content : 'Reconciliation has been succeed',
								type : 'green',
								typeAnimated : true,
								buttons : {
									tryAgain : {
										text : 'OK',
										btnClass : 'btn-success',
										action : function() {
										}
									},
								}
							});
						}

					},
					failure : function(errMsg) {
						$.alert("call failed");
					}
				});

	}
</script>

</html>

