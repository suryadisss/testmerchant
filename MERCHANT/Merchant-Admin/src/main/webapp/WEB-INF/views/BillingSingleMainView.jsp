<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Billing Single" />
	<jsp:param name="datatables" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
	<jsp:param name="jquerydatepicker" value="1" />
	<jsp:param name="noityjs" value="1" />
</jsp:include>
<body id="body" class="nav-md">
	<div class="container body">
		<div class="main_container">

			<jsp:include page='_Side_Navigation.jsp' />
			<jsp:include page='_Top_Navigation.jsp' />


			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" style="z-index: 9999;">
				<div class="modal-dialog" role="document">
					<form id="formInput">
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
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">ACC
											No.</label>
										<div class="col-sm-6">
											<input type="text" readonly="readonly" readonly="readonly"
												name="lst_acc_no" id="lst_acc_no" class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Periode Pembayaran</label>
										<div class="col-sm-6">
											<input type="text" name="lst_period"  readonly="readonly" id="lst_period"
												class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Bayar dibulan</label>
										<div class="col-sm-6">
											<input type="text" name="lst_month" id="lst_month"  readonly="readonly"
												class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Jumlah Bayar</label>
										<div class="col-sm-6">
											<input type="text" name="lst_total_amount"  readonly="readonly"
												id="lst_total_amount" class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Tanggal Bayar</label>
										<div class="col-sm-6">
											<input type="text" maxlength="10"
												data-date-format="YYYY-MM-DD" name="lbi_req_date"
												id="lbi_req_date" class="form-control datepicker11" />
										</div>
									</div>

									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Channel Pembayaran</label>
										<div class="col-sm-6">
											<input type="text" id="channel" name="channel"
												class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Catatan</label>
										<div class="col-sm-6">
											<textarea name="notes" id="notes" class="form-control"></textarea>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button class="btn btn-default" data-dismiss="modal">Tutup</button>
								<button type="submit" id="submit" class="btn btn-primary">Simpan
									Perubahan</button>
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
											window.location.href)
											.split(context)[1]));
								</script>
							<ul class="nav navbar-right panel_toolbox">
							</ul>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">

							<table id="tblPayment" class="table table-hover" width="100%">
								<thead>
									<tr>
										<td width="15%">ACC</td>
										<td width="5%">Nama</td>
										<td width="5%">Periode</td>
										<td width="5%">Bulan </td>
										<td width="10%">Jumlah Total</td>
										<td width="10%">Tanggal Permintaan</td>
										<td width="10%">Status</td>
										<td width="10%">Tindakan</td>
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
	<jsp:param name="jquerydatepicker" value="1" />
	<jsp:param name="inputmask" value="1" />
	<jsp:param name="noityjs" value="1" />
</jsp:include>
<script>
	$(document)
			.ready(
					function() {
						

						$('#tblDetDis').DataTable();

						$('.datepicker11').datetimepicker();
						$('#lst_period, #lst_month').inputmask("numeric", {
							radixPoint : "",
							groupSeparator : "",
							digits : 2,
							autoGroup : true,
							prefix : '',
							rightAlign : true,
							oncleared : function() {
								self.Value('');
							}
						});

						$('#lst_total_amount').inputmask("numeric", {
							radixPoint : ",",
							groupSeparator : ".",
							digits : 2,
							autoGroup : true,
							prefix : '',
							rightAlign : true,
							oncleared : function() {
								self.Value('');
							}
						});

						$("#formInput")
								.submit(
										function(e) {
											var url = "billing_single/dopost";

											$
													.ajax({
														type : "POST",
														url : url,
														data : $("#formInput")
																.serialize(),
														cache : false,
														complete : function(
																xhr, status) {
															if (status === 'error'
																	|| !xhr.responseText) {
																console
																		.log(status);
															} else {
																$('#myModal')
																		.modal(
																				'hide');
																var data = xhr.responseText;
																$
																		.confirm({
																			title : "",
																			content : data,
																			buttons : {
																				somethingElse : {
																					text : 'OK',
																					btnClass : 'btn-success',
																					keys : [ 'enter' ],
																					action : function() {

																						$(
																								'#tblPayment')
																								.DataTable().ajax
																								.reload();
																					}
																				}

																			}
																		});
															}
														}
													});
											e.preventDefault();
										});

						$('#tblPayment')
								.DataTable(
										{
											ajax : "${local_server}/billing_single/getbillsingle",
											columns : [
													{

														data : 'lst_acc_no'
													},

													{
														data : 'cst_name'
													}, 
													{
														data : 'lst_period'
													},
													{
														data : 'lst_month'
													},

													{
														data : 'lst_total_amount',
														className : 'txtRigth',
														render : function(data,
																type, row) {

															return toRp(row.lst_total_amount);
														}
													},

													{
														data : 'lbi_req_date',
														render : function(data,
																type, row) {
															return row.lbi_req_date
																	.replace(
																			"T",
																			" ");
														}
													},
													{
														data : 'status'
													},

													{
														render : function(data,
																type, row) {
															var edit = '<button class="edit btn btn-xs btn-success" id="'+row.lst_acc_no+'" value="'+row.lst_acc_no+'" ><i class=" fa fa-edit"></i></button>';
															//var edit = '<button class="edit" id="'+row.prd_code+'" >Edit</button>';
															return edit;
														},
														orderable : false
													} ]

										});

						$('#tblPayment').on('click', 'button.edit',
								function(e) {
									$("#myModal").modal("show");
									$('#formInput')[0].reset();
									getDetailPayment(this.id);
								});

					});

	

	function getDetailPayment(val) {
		var response = $.ajax({
			type : "GET",
			url : "${local_server}/billing_single/getbillsingle/" + val,
			async : false,
			success : function(data) {
				console.log(data)
			}
		}).responseText;
		var dt = JSON.parse(response);
		$.each(dt.data, function(i, o) {
			$.each(o.loan[0], function(i, o) {
				var TagHtml = "#" + i
				if (checkExists(String(TagHtml))) {
					o = (i == "lbi_req_date") ? o.substr(0, 10) : o;
					$(String(TagHtml)).val(o);

				}
			});
			$.each(o.profile[0], function(i, o) {
				var TagHtml = "#" + i
				if (checkExists(String(TagHtml))) {
					$(String(TagHtml)).val(o);
				}
			});
		});

	}

	/* function generateDatatables() {
		var response = $.ajax({
			type : "GET",
			url : "${local_server}/billing_single/getbillsingle",
			async : false,
			success : function(data) {
				console.log(data)
			}
		}).responseText;
		var dt = JSON.parse(response);
		var data = [], x = 0;
		if (dt.success = true) {
			$.each(dt.data, function(i, o) {
					obj.lst_id = o.lst_id;
					obj.lst_acc_no = o.lst_acc_no;
					obj.lst_period = o.lst_period;
					obj.lst_month = o.lst_month;
					obj.lst_total_amount = o.lst_total_amount;
					obj.pdi_req_date = o.lbi_req_date;
					obj.status = o.status;
					obj.cst_name = o.cst_name
				data[x] = obj;
				x++;

			});
		}

		return data;
	} */
	function checkExists(sel) {
		var status = false;
		if ($(sel).length)
			status = true;
		return status;
	}

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