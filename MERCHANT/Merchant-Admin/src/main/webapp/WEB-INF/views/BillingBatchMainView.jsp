<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Billing Batch" />
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
				aria-labelledby="myModalLabel" style="z-index: 9999;">
				<div class="modal-dialog modal-lg" role="document">
					<form id="formInput" method="post" action="product/dopost">
						<input type="hidden" name="new_edit_status" id="new_edit_status" />
						<div class="modal-content">

							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Rincian Tagihan</h4>
							</div>
							<div class="modal-body">
								<div class="form-horizontal">
									<!-- <table class="table table-hover" width="100%" id="tblDetPay">
										<thead>
											<tr>
												<td>ACC</td>
												<td>Name</td>
												<td>Period</td>
												<td>Total Amount</td>
												<td>Status</td>
												<td>Installment Date</td>
												<td>Due Date</td>
											</tr>
										</thead>
									</table> 
									<hr />-->
									<fieldset style="margin-top: 25px;">
										<div class="form-group">
											<label for="scc_code" class="col-sm-4 control-label">Berkas</label>
											<div class="col-sm-6">
												<input type="file" name="files[0]" id="file"
													class="form-control" />
											</div>
										</div>
									</fieldset>
								</div>
							</div>
							<div class="modal-footer">
								<button class="btn btn-default" data-dismiss="modal">Tutup</button>
								<button type="submit" id="submitFile" class="btn btn-primary">Simpan Perubahan</button>
							</div>
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
							<h2 id="breadhead"></h2>
							<script type="text/javascript">
								var context = "${local_server}";
								document.getElementById("breadhead").innerHTML = getBread(encodeURI(String(
										window.location.href).split(context)[1]));
							</script>
							<ul class="nav navbar-right panel_toolbox">

							</ul>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<table id="tblPayment" class="table table-hover" width="100%">
								<thead>
									<tr>
										<td width="30%">Nama Berkas</td>
										<td width="20%">Tanggal dibuat</td>
										<td width="10%">Baris</td>
										<td width="25%">Jumlah</td>
										<td width="15%">Tindakan</td>
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
	$(document)
			.ready(
					function() {
						$("#formInput")
								.submit(
										function(e) {
											$
													.ajax({
														url : 'billing_batch/file/payroll',
														type : 'POST',
														data : new FormData(
																this),
														processData : false,
														contentType : false,
														cache : false,
														beforeSend : function() {
															$("#submitFile")
																	.html(
																			"<i class='fa fa-circle-o-notch fa-spin'></i>  Please wait ..");

															$("#submitFile")
																	.addClass(
																			"disabled");

														},
														success : function(data) {
															$("#submitFile")
																	.html(
																			"Save changes");

															$("#submitFile")
																	.removeClass(
																			"disabled");
															$("#myModal")
																	.modal(
																			"hide");
															$('#formInput')[0]
																	.reset();
															$.alert(data);

														}
													});
											e.preventDefault();
										});
						$('#tblDetPay').DataTable();
						$('#tblPayment')
								.DataTable(
										{
											ajax : '${local_server}/billing_batch/getbillbatch',
											columns : [
													{

														data : 'lbi_file_name'
													},
													{
														data : 'lbi_create_date',
														render : function(data,
																type, row) {
															return row.lbi_create_date
																	.replace(
																			"T",
																			" ");
														}
													},
													{
														data : 'lbi_total_row',
														className : 'txtRigth'
													},

													{
														data : 'lbi_total_amount',
														className : 'txtRigth',
														render : function(data,
																type, row) {
															return toRp(row.lbi_total_amount);
														}
													},
													{
														render : function(data,
																type, row) {
															var edit = '<button class="edit btn btn-xs btn-success" id="'+row.lbi_id+'" value="'+row.lbi_id+'" ><i class=" fa fa-edit"></i></button><a href="${local_server}/billing_batch/down_load/'+row.lbi_id+'" target="_blank"  class="download btn btn-xs btn-info" id="'+row.lbi_id+'" value="'+row.lbi_id+'" ><i class=" fa fa-download"></i></a>';
															//var edit = '<button class="edit" id="'+row.prd_code+'" >Edit</button>';
															return edit;
														},
														orderable : false
													} ]

										});

						$('#tblPayment').on(
								'click',
								'button.download',
								function(e) {
									window.open(
											"${local_server}/billing_batch/download/csv/"
													+ this.id, "_blank");
								});

						$('#tblPayment')
								.on(
										'click',
										'button.edit',
										function(e) {
											var id = this.id;

											$("#myModal").modal("show");
											$('#tblDetPay').DataTable()
													.destroy();
											$('#tblDetPay')
													.DataTable(
															{
																ajax : '${local_server}/billing_batch/getbilldet/'
																		+ id,
																columns : [
																		{

																			data : 'lst_acc_no'
																		},
																		{
																			data : 'cst_name'
																		},
																		{
																			data : 'lst_periode'
																		},
																		{
																			data : 'lst_total_amount',
																			className : 'txtRigth',
																			render : function(
																					data,
																					type,
																					row) {
																				return toRp(row.lst_total_amount);
																			}

																		},
																		{
																			data : 'lst_status'
																		},
																		{
																			data : 'lst_installment_date',
																			render : function(
																					data,
																					type,
																					row) {
																				return row.lst_installment_date
																						.replace(
																								"T",
																								" ");
																			}
																		},
																		{
																			data : 'lni_due_date',
																			render : function(
																					data,
																					type,
																					row) {
																				return row.lni_due_date
																						.replace(
																								"T",
																								" ");
																			}

																		},

																]

															});

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
			ang[1] = (ang[1] != null) ? "." + ang[1] : ".00"
			return '' + rev2.split('').reverse().join('') + ang[1];
		} else {
			return '0.00'
		}

	}
</script>

</html>

