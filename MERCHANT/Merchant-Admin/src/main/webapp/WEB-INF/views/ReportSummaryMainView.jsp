<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Report" />
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
								<h2 id="breadhead"></h2>
								<script type="text/javascript">
									var context = "${local_server}";
									document.getElementById("breadhead").innerHTML = getBread(encodeURI(String(
											window.location.href)
											.split(context)[1]));
								</script>
								<ul class="nav navbar-right panel_toolbox">
									Versi Laporan :
									<small><i id="updatedate">n/a</i></small>
								
									<button class="btn btn-info btn-xs" id="btnRpt">
										<i class="fa fa-refresh"> </i> Sinkronisasi Laporan
									</button>
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
										<fieldset class="form-inline pull-right">

											<div class="form-group">
												<label for="staticEmail2" class="sr-only">Email/Surel</label><select
													id="cmbRpt" name="cmbReport" class="form-control"
													onchange="onReport(this.options[this.selectedIndex].value)"><option
														value="customer">Customer Register Summary</option>
													<option value="history">Loan Status Summary</option>
													<option value="history_range">Loan Amount Summary
														(Range)</option>

													<option value="histAmount">Loan Amount Summary
														(Status)</option>
													<option value="detail">History Pengajuan (by Date)</option>
													<option value="detailbu">History Pengajuan (by
														Business Unit)</option>
												</select>
											</div>
											<div class="form-group mx-sm-2 divdate">
												<input type="hidden" id="offset" name="offset" value="0">
												<input type="hidden" id="limit" name="limit" value="10">
												<label for="inputPassword2" class="sr-only">Mulai</label> <input
													type="text" class="form-control datepicker11"
													placeholder="Dari Tanggal" name="date_from" id="date_from"
													title="(YYYY-MM-DD)" data-date-format="YYYY-MM-DD" />
											</div>
											<div class="form-group mx-sm-2 divdate">
												<label for="inputPassword2" class="sr-only">Sampai</label> <input
													type="text" class="form-control datepicker11"
													placeholder="To Date" name="date_to" title="(YYYY-MM-DD)"
													id="date_to" data-date-format="YYYY-MM-DD" />
											</div>

											<div class="form-group mx-sm-4 divbu hide">
												<label for="inputPassword2" class="sr-only">Unit Bisnis</label><select style="width: 400px;" class="form-control"
													name="business_unit" id="business_unit"></select>
											</div>
											<div class="form-group mx-sm-3">
												<label for="inputPassword2" class="sr-only">Kata sandi</label>
												<button type="submit" id="btnShow" class="btn btn-primary "
													style="margin-top: 5px;">Tampilkan laporan</button>
											</div>
										</fieldset>
									</form>


								</div>
								
								<div id="downloadExcel"></div>
								
								<table id="rptCustomer" class="table table-hover hidden">
									<thead>
										<tr>
											<td>Tanggal Registrasi</td>
											<td>Total Registrasi</td>
											<td>Total Aktif</td>
											<td>Total Tidak aktif</td>
										</tr>
									</thead>
								</table>

								<table id="rptHistoryRange" class="table table-hover hidden">
									<thead>
										<tr>
											<td>Tanggal Pengajuan</td>
											<td>Total App</td>
											<td>Total 5</td>
											<td>Total 5-10</td>
											<td>Total 10-20</td>
											<td>Total 20</td>
										</tr>
									</thead>
								</table>

								<table id="rptHistory" class="table table-hover hidden">
									<thead>
										<tr>
											<td>Tanggal Pengajuan</td>
											<td>Total Analis</td>
											<td>Total Persetujuan</td>
											<td>Total Batal</td>
											<td>Total Konfirmasi</td>
											<td>Total Tolak</td>
											<td>Total Permintaan</td>
											<td>Total Close</td>
										</tr>
									</thead>
								</table>

								<table id="rptHistoryAmount" class="table table-hover hidden">
									<thead>
										<tr>
											<td>Tanggal Pengajuan</td>
											<td>Total Pinjaman</td>
											<td>Total Disetujui</td>
											<td>Total Terkonfirmasi</td>
										</tr>
									</thead>
								</table>

								<form id="formReportCustom" class="hidden" action="${local_server}/report_summary/downloadFile/xlsx" target="_blank" method="POST">
										<input type="submit" id="btnSubmitExcel">
								</form>
								
								<table id="rptDetail" class="table table-hover hidden">
									<thead>
										<tr>
											<td>CIF</td>
											<td>NIK</td>
											<td>Nama</td>
											<td>Umur</td>
											<td>Tanggal Lahir</td>
											<td>Email/Surel</td>
											<td>Jumlah</td>
											<td>Tenor</td>
											<td>Bunga</td>
											<td>Status Pengajuan</td>
											<td>Tanggal Pengajuan</td>
											<td>Disb. Status</td>
											<td>ACC</td>
											<td>ACC Behaf Of</td>
											<td>ACC Bank</td>
											<td>Tipe Emp</td>
											<td>Tanggal Emp</td>
											<td>Emp. Mulai Kontrak</td>
											<td>Emp. Kontrak berakhir</td>
											<td>Emp. Durasi kontrak</td>
											<td>Level jabatan</td>
											<td>Jabatan</td>
											<td>Lokasi Kantor</td>
											<td>Pengeluaran lain</td>
											<td>Jumlah Disb</td>
											<td>Bunga</td>
											<td>Tanggal diubah</td>
											<td>Plafon Rec</td>
											<td>Cicilan Rec</td>
											<td>ACC Pinjaman</td>
											<td>Kode Prod Pinjaman</td>
											<td>Nama Prod Pinjaman</td>
											<td>Status ACC pinjaman</td>
											<td>Int. per bulan</td>
											<td>Baya lain</td>
											<td>Tanggal Pinjaman</td>
											<td>Jumlah Disb Pinjaman</td>
											<td>Tanggal Disb Pinjaman</td>
											<td>Periode pinjaman</td>
											<td>Jumlah Pinjaman</td>
											<td>Status Pinjaman</td>
											<td>Guna Pinjaman</td>
											<td>Bisnis Unit</td>


										</tr>
									</thead>
								</table>
								<ul id="pagination"></ul>
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
		$('.datepicker11').datetimepicker({
            useCurrent: false
        });
		
		$("#date_from").on("dp.change", function (e) {
			
	    	endDate = new Date(e.date);
	    	endDate.setDate(endDate.getDate() + 30);
	    	/* endDateString = endDate.getFullYear() + '-'
            + ('0' + (endDate.getMonth()+1)).slice(-2) + '-'
            + ('0' + endDate.getDate()).slice(-2); */
	    	
	    	
              $("#date_to").data("DateTimePicker").minDate(e.date).maxDate(endDate);
              
         });      
            
        $("#date_to").on("dp.change", function (e) {
        	
        	startDate = new Date(e.date);
        	startDate.setDate(startDate.getDate() - 30);
        	/* startDateString = startDate.getFullYear() + '-'
            + ('0' + (endDate.getMonth()+1)).slice(-2) + '-'
            + ('0' + endDate.getDate()).slice(-2);	 */				    	
            
            $("#date_from").data("DateTimePicker").minDate(startDate).maxDate(e.date);
        });	
        
        
		getLogDate();
		loadDDLParam();
		
		
		$("#formReport").submit(function(e) {
			//$("#pagination").hide();
			//$("#offset").val(0);
			var x = $("#cmbRpt");
			switch (x.val()) {
			case "customer":
				getCustomerReport();
				break;
			case "history_range":
				getHistoryRange();
				break;
			case "histAmount":
				getHistoryAmountReport();
				break;
			case "detail":
				
				getDetailReport("getreport_detail_post_by_date");
				break;
			case "detailbu":
				getDetailReport("getreport_detail_post_by_bu");
				break;
			case "history":
				getHistory();
				break;
			default:
				getCustomerReport();
			}
			e.preventDefault();
		});
		
		

		$("#btnRpt").on("click", function() {
			$.confirm({
				title : 'Confirm',
				content : 'Are you sure you want to process sync report ?',
				buttons : {
					cancel : function() {
						$.alert('Canceled');
					},
					somethingElse : {
						text : 'Yes',
						btnClass : 'btn-success',
						keys : [ 'enter' ],
						action : function() {
							batchReporting();
						}
					}
				}
			});
		});

	});

	function batchReporting() {

		$.ajax({
			type : 'GET',
			asyn : true,
			contentType : 'application/json',
			url : '${local_server}/system/sync',
			dataType : 'json',
			beforeSend : function() {

				$("#btnRpt").html(
						"<i class='fa fa-refresh fa-spin'></i> On process")
			},
			success : function(data) {
				console.log("Response");
				console.log(data);
				$("#btnRpt")
						.html("<i class='fa fa-refresh'> </i>  Sync Report");
				if (data.status == "Success") {
					$.alert("Batching report successfully")
					getLogDate();
				}
			},
			failure : function(errMsg) {
				$.alert("call failed");
				getLogDate();
			}
		});
	}

	function getHistoryAmountReport() {
		$
				.ajax({
					type : 'POST',
					asyn : true,
					data : $("#formReport").serialize(),
					url : '${local_server}/report_summary/getreport_historyAmount_post',
					dataType : 'json',
					beforeSend : function() {
						resetAllTable();
						$("#msg").html("");
						$("#msg")
								.html(
										"<h3><i class='fa fa-circle-o-notch fa-spin'></i>  </h3>")
					},
					success : function(data) {
						console.log("Summary History Amount");
						console.log(data);
						$("#msg").html("");
						$('#rptHistoryAmount').removeClass("hidden");
						$('#rptHistoryAmount').DataTable().destroy();
						if (data.status == "Success") {
							$('#rptHistoryAmount')
									.dataTable(
											{
												data : $.parseJSON(JSON
														.stringify(data.data)),
												"searching" : false,
												"lengthMenu" : [
														[ 10, 25, 50, -1 ],
														[ 10, 25, 50, "All" ] ],
												columns : [
														{
															data : 'rsh_action_date',
															render : function(
																	data, type,
																	val) {
																var tglAct = "";
																if (val.rsh_action_date != "") {
																	tglAct = convertDateAPI(val.rsh_action_date);
																} else {
																	tglAct = "0";
																}

																return tglAct;
															}
														},
														{
															data : 'total_loan',
															render : function(
																	data, type,
																	val) {
																var loan = "";
																if (val.total_loan != "") {
																	loan = val.total_loan;
																} else {
																	loan = "0";
																}

																return loan;
															}
														},
														{
															data : 'total_approve',
															render : function(
																	data, type,
																	val) {
																var appr = "";
																if (val.total_approve != "") {
																	appr = val.total_approve;
																} else {
																	appr = "0";
																}

																return appr;
															}
														},
														{
															data : 'total_confirm',
															render : function(
																	data, type,
																	val) {
																var conf = "";
																if (val.total_confirm != "") {
																	conf = val.total_confirm;
																} else {
																	conf = "0";
																}

																return conf;
															}
														} ],
												dom : 'Bfrtip',
												buttons : [ 'excel' ]
											});
						} else {
							$('#rptHistoryAmount').DataTable(
									{
										"searching" : false,
										"scrollX" : true,
										"lengthMenu" : [ [ 10, 25, 50, -1 ],
												[ 10, 25, 50, "All" ] ],
										dom : 'Bfrtip',
										buttons : [ 'excel' ]
									});
						}

					},
					failure : function(errMsg) {
						$.alert("call failed");
					}
				});
	}

	function getDetailReport(url) {
		$
				.ajax({
					type : 'POST',
					asyn : true,
					data : $("#formReport").serialize(),
					url : '${local_server}/report_summary/' + url,
					dataType : 'json',
					beforeSend : function() {
						resetAllTable();
						$("#msg").html("");
						$("#msg")
								.html(
										"<h3><i class='fa fa-circle-o-notch fa-spin'></i>  </h3>")
					},
					success : function(data) {
						console.log("Summary Detail");
						console.log(data);
						console.log($("#formReport").serialize());
						$("#msg").html("");
						$('#rptDetail').removeClass("hidden");
						$('#rptDetail').DataTable().destroy();
						if (data.status == "Success") {
							/* var page = data.total_rows/10;
							$("#pagination").twbsPagination('destroy');
							Paging(page);
							$("#pagination").show(); */
							viewDownloadAll();
							
							
							
							
							$('#rptDetail')
									.dataTable(
											{
												data : $.parseJSON(JSON
														.stringify(data.data)),
												"searching" : false,
												"scrollX" : true,
												"lengthMenu" : [
													[ 10, 25, 50, -1 ],
													[ 10, 25, 50, "All" ] ],
												columns : [
														{
															data : 'cst_cif'
														},
														{
															data : 'cst_nik'
														},
														{
															data : 'cst_fname',
															render : function(
																	data, type,
																	val) {
																var name = "";
																if (val.cst_fname != ""
																		&& val.cst_lname == "") {
																	name = val.cst_fname;
																} else {
																	name = val.cst_fname
																			+ ' '
																			+ val.cst_lname;
																}
																return name;
															}
														},
														{
															data : 'cst_age'
														},
														{
															data : 'cst_dob',
															render : function(
																	data, type,
																	val) {
																var tglAct = "";
																if (val.cst_dob != "") {
																	tglAct = convertDateAPI(val.cst_dob);
																} else {
																	tglAct = "0";
																}

																return tglAct;
															}
														},
														{
															data : 'cst_email'
														},
														{
															data : 'loan_amount',
															render : function(
																	data, type,
																	val) {
																var loan = "";
																if (val.loan_amount != "") {
																	loan = val.loan_amount;
																} else {
																	loan = "0";
																}

																return loan;
															}
														},
														{
															data : 'loan_tenor'
														},
														{
															data : 'rsh_interest'
														},
														{
															data : 'rsh_decision'
														},
														{
															data : 'rsh_action_date',
															render : function(
																	data, type,
																	val) {
																var tglAct = "";
																if (val.rsh_action_date != "") {
																	tglAct = convertDateAPI(val.rsh_action_date);
																} else {
																	tglAct = "0";
																}

																return tglAct;
															}
														},
														{
															data : 'loan_disburse_status'
														},
														{
															data : 'cst_trf_acc'
														},

														{
															data : 'cst_trf_acc_behalf_of'
														},

														{
															data : 'cst_trf_acc_bank'
														},
														{
															data : 'cst_employment_type'
														},
														{
															data : 'cst_employment_date',
															render : function(
																	data, type,
																	val) {
																var tglAct = "";
																if (val.cst_employment_date != "") {
																	tglAct = convertDateAPI(val.cst_employment_date);
																} else {
																	tglAct = "0";
																}

																return tglAct;
															}
														},
														{
															data : 'cst_employment_contract_start_date',
															render : function(
																	data, type,
																	val) {
																var tglAct = "";
																if (val.cst_employment_contract_start_date != "") {
																	tglAct = convertDateAPI(val.cst_employment_contract_start_date);
																} else {
																	tglAct = "0";
																}

																return tglAct;
															}
														},

														{
															data : 'cst_employment_contract_end_date',
															render : function(
																	data, type,
																	val) {
																var tglAct = "";
																if (val.cst_employment_contract_end_date != "") {
																	tglAct = convertDateAPI(val.cst_employment_contract_end_date);
																} else {
																	tglAct = "0";
																}

																return tglAct;
															}
														},
														{
															data : 'cst_employment_contract_duration'
														},
														{
															data : 'cst_job_grade'
														},
														{
															data : 'cst_job_position'
														},
														{
															data : 'cst_work_location'
														},

														{
															data : 'rsh_other_cost',
															render : function(
																	data, type,
																	val) {
																var loan = "";
																if (val.rsh_other_cost != "") {
																	loan = val.rsh_other_cost;
																} else {
																	loan = "0";
																}

																return loan;
															}
														},
														{
															data : 'rsh_disburse_amount',
															render : function(
																	data, type,
																	val) {
																var loan = "";
																if (val.rsh_disburse_amount != "") {
																	loan = val.rsh_disburse_amount;
																} else {
																	loan = "0";
																}

																return loan;
															}
														},
														{
															data : 'rsh_interest'
														},
														{
															data : 'rsh_update_date',
															render : function(
																	data, type,
																	val) {
																if (val.rsh_update_date != null) {
																	return val.rsh_update_date
																			.replace(
																					"T",
																					" ");
																} else {
																	return val.rsh_update_date;
																}

															}
														},
														{
															data : 'rsh_r_purpose',
															render : function(
																	data, type,
																	val) {
																var loan = "";
																if (val.rsh_r_purpose != "") {
																	loan = val.rsh_r_purpose;
																} else {
																	loan = "0";
																}

																return loan;
															}
														},
														{
															data : 'rsh_r_installment',
															render : function(
																	data, type,
																	val) {
																var loan = "";
																if (val.rsh_r_installment != "") {
																	loan = val.rsh_r_installment;
																} else {
																	loan = "0";
																}

																return loan;
															}
														},

														{
															data : 'loan_acc_no'
														},

														{
															data : 'loan_prd_code'
														},

														{
															data : 'loan_prd_name'
														},
														{
															data : 'loan_acc_status'
														},
														{
															data : 'loan_intr_per_month'
														},
														{
															data : 'loan_oth_cost',
															render : function(
																	data, type,
																	val) {
																var loan = "";
																if (val.loan_oth_cost != "") {
																	loan = val.loan_oth_cost;
																} else {
																	loan = "0";
																}

																return loan;
															}
														},
														{
															data : 'loan_date',
															render : function(
																	data, type,
																	val) {
																if (val.loan_date != null) {
																	return val.loan_date
																			.replace(
																					"T",
																					" ");
																} else {
																	return val.loan_date;
																}

															}
														},
														{
															data : 'loan_disb_amount',
															render : function(
																	data, type,
																	val) {
																var loan = "";
																if (val.loan_disb_amount != "") {
																	loan = val.loan_disb_amount;
																} else {
																	loan = "0";
																}

																return loan;
															}
														},
														{
															data : 'loan_disburse_date',
															render : function(
																	data, type,
																	val) {
																if (val.loan_disburse_date != null) {
																	return val.loan_disburse_date
																			.replace(
																					"T",
																					" ");
																} else {
																	return val.loan_disburse_date;
																}

															}
														},
														{
															data : 'rsh_loan_period'
														},
														{
															data : 'rsh_loan_amount',
															render : function(
																	data, type,
																	val) {
																var loan = "";
																if (val.rsh_loan_amount != "") {
																	loan = val.rsh_loan_amount;
																} else {
																	loan = "0";
																}

																return loan;
															}
														}

														,
														{
															data : 'loan_is_open'
														},
														{
															data : 'loan_request'
														},

														{
															data : 'cst_business_unit'
														} ],
												dom : 'Bfrtip',
												buttons : [ 'excel' ]
											});
							
							
						} else {
							$('#rptDetail').DataTable(
									{
										"searching" : false,
										"scrollX" : true,
										"lengthMenu" : [
											[ 10, 25, 50, -1 ],
											[ 10, 25, 50, "All" ] ],
										dom : 'Bfrtip',
										buttons : [ 'excel' ]
									});
						}

					},
					failure : function(errMsg) {
						$.alert("call failed");
					}
				});

	}
	
	function getDetailReportNext(url) {
		$
				.ajax({
					type : 'POST',
					asyn : true,
					data : $("#formReport").serialize(),
					url : '${local_server}/report_summary/' + url,
					dataType : 'json',
					beforeSend : function() {
						$("#msg").html("");
						$("#msg")
								.html(
										"<h3><i class='fa fa-circle-o-notch fa-spin'></i>  </h3>")
					},
					success : function(data) {
						$("#msg").html("");
						$('#rptDetail').removeClass("hidden");
						$('#rptDetail').DataTable().destroy();
						if (data.status == "Success") {
							var page = data.total_rows/10;
							Paging(page);
							$('#rptDetail')
									.dataTable(
											{
												data : $.parseJSON(JSON
														.stringify(data.data)),
												"searching" : false,
												"scrollX" : true,
												"bPaginate": false,
												"bInfo": false,
												columns : [
														{
															data : 'cst_cif'
														},
														{
															data : 'cst_nik'
														},
														{
															data : 'cst_fname',
															render : function(
																	data, type,
																	val) {
																var name = "";
																if (val.cst_fname != ""
																		&& val.cst_lname == "") {
																	name = val.cst_fname;
																} else {
																	name = val.cst_fname
																			+ ' '
																			+ val.cst_lname;
																}
																return name;
															}
														},
														{
															data : 'cst_age'
														},
														{
															data : 'cst_dob',
															render : function(
																	data, type,
																	val) {
																var tglAct = "";
																if (val.cst_dob != "") {
																	tglAct = convertDateAPI(val.cst_dob);
																} else {
																	tglAct = "0";
																}

																return tglAct;
															}
														},
														{
															data : 'cst_email'
														},
														{
															data : 'loan_amount',
															render : function(
																	data, type,
																	val) {
																var loan = "";
																if (val.loan_amount != "") {
																	loan = val.loan_amount;
																} else {
																	loan = "0";
																}

																return loan;
															}
														},
														{
															data : 'loan_tenor'
														},
														{
															data : 'rsh_interest'
														},
														{
															data : 'rsh_decision'
														},
														{
															data : 'rsh_action_date',
															render : function(
																	data, type,
																	val) {
																var tglAct = "";
																if (val.rsh_action_date != "") {
																	tglAct = convertDateAPI(val.rsh_action_date);
																} else {
																	tglAct = "0";
																}

																return tglAct;
															}
														},
														{
															data : 'loan_disburse_status'
														},
														{
															data : 'cst_trf_acc'
														},

														{
															data : 'cst_trf_acc_behalf_of'
														},

														{
															data : 'cst_trf_acc_bank'
														},
														{
															data : 'cst_employment_type'
														},
														{
															data : 'cst_employment_date',
															render : function(
																	data, type,
																	val) {
																var tglAct = "";
																if (val.cst_employment_date != "") {
																	tglAct = convertDateAPI(val.cst_employment_date);
																} else {
																	tglAct = "0";
																}

																return tglAct;
															}
														},
														{
															data : 'cst_employment_contract_start_date',
															render : function(
																	data, type,
																	val) {
																var tglAct = "";
																if (val.cst_employment_contract_start_date != "") {
																	tglAct = convertDateAPI(val.cst_employment_contract_start_date);
																} else {
																	tglAct = "0";
																}

																return tglAct;
															}
														},

														{
															data : 'cst_employment_contract_end_date',
															render : function(
																	data, type,
																	val) {
																var tglAct = "";
																if (val.cst_employment_contract_end_date != "") {
																	tglAct = convertDateAPI(val.cst_employment_contract_end_date);
																} else {
																	tglAct = "0";
																}

																return tglAct;
															}
														},
														{
															data : 'cst_employment_contract_duration'
														},
														{
															data : 'cst_job_grade'
														},
														{
															data : 'cst_job_position'
														},
														{
															data : 'cst_work_location'
														},

														{
															data : 'rsh_other_cost',
															render : function(
																	data, type,
																	val) {
																var loan = "";
																if (val.rsh_other_cost != "") {
																	loan = val.rsh_other_cost;
																} else {
																	loan = "0";
																}

																return loan;
															}
														},
														{
															data : 'rsh_disburse_amount',
															render : function(
																	data, type,
																	val) {
																var loan = "";
																if (val.rsh_disburse_amount != "") {
																	loan = val.rsh_disburse_amount;
																} else {
																	loan = "0";
																}

																return loan;
															}
														},
														{
															data : 'rsh_interest'
														},
														{
															data : 'rsh_update_date',
															render : function(
																	data, type,
																	val) {
																if (val.rsh_update_date != null) {
																	return val.rsh_update_date
																			.replace(
																					"T",
																					" ");
																} else {
																	return val.rsh_update_date;
																}

															}
														},
														{
															data : 'rsh_r_purpose',
															render : function(
																	data, type,
																	val) {
																var loan = "";
																if (val.rsh_r_purpose != "") {
																	loan = val.rsh_r_purpose;
																} else {
																	loan = "0";
																}

																return loan;
															}
														},
														{
															data : 'rsh_r_installment',
															render : function(
																	data, type,
																	val) {
																var loan = "";
																if (val.rsh_r_installment != "") {
																	loan = val.rsh_r_installment;
																} else {
																	loan = "0";
																}

																return loan;
															}
														},

														{
															data : 'loan_acc_no'
														},

														{
															data : 'loan_prd_code'
														},

														{
															data : 'loan_prd_name'
														},
														{
															data : 'loan_acc_status'
														},
														{
															data : 'loan_intr_per_month'
														},
														{
															data : 'loan_oth_cost',
															render : function(
																	data, type,
																	val) {
																var loan = "";
																if (val.loan_oth_cost != "") {
																	loan = val.loan_oth_cost;
																} else {
																	loan = "0";
																}

																return loan;
															}
														},
														{
															data : 'loan_date',
															render : function(
																	data, type,
																	val) {
																if (val.loan_date != null) {
																	return val.loan_date
																			.replace(
																					"T",
																					" ");
																} else {
																	return val.loan_date;
																}

															}
														},
														{
															data : 'loan_disb_amount',
															render : function(
																	data, type,
																	val) {
																var loan = "";
																if (val.loan_disb_amount != "") {
																	loan = val.loan_disb_amount;
																} else {
																	loan = "0";
																}

																return loan;
															}
														},
														{
															data : 'loan_disburse_date',
															render : function(
																	data, type,
																	val) {
																if (val.loan_disburse_date != null) {
																	return val.loan_disburse_date
																			.replace(
																					"T",
																					" ");
																} else {
																	return val.loan_disburse_date;
																}

															}
														},
														{
															data : 'rsh_loan_period'
														},
														{
															data : 'rsh_loan_amount',
															render : function(
																	data, type,
																	val) {
																var loan = "";
																if (val.rsh_loan_amount != "") {
																	loan = val.rsh_loan_amount;
																} else {
																	loan = "0";
																}

																return loan;
															}
														}

														,
														{
															data : 'loan_is_open'
														},
														{
															data : 'loan_request'
														},

														{
															data : 'cst_business_unit'
														} ],
												dom : 'Bfrtip',
												buttons : [ 'excel' ]
											});
						} else {
							$('#rptDetail').DataTable(
									{
										"searching" : false,
										"scrollX" : true,
										"bPaginate": false,
										"bInfo": false,
										dom : 'Bfrtip',
										buttons : [ 'excel' ]
									});
						}

					},
					failure : function(errMsg) {
						$.alert("call failed");
					}
				});

	}

	
	function Paging(totalPage) {
        var obj = $("#pagination").twbsPagination({
            totalPages: totalPage,
            visiblePages: 5,
            onPageClick: function (event, page) {
                var getRow = page * 10;
                var start = getRow - 10;
                $("#offset").val(start);
                getDetailReportNext("getreport_detail_post_by_date");
            }
        });
    }
	

	function getCustomerReport() {
		console.log($("#formReport").serialize());
		$
				.ajax({
					type : 'POST',
					asyn : true,
					url : '${local_server}/report_summary/getreport_customer_post',
					data : $("#formReport").serialize(),
					dataType : 'json',
					beforeSend : function() {
						resetAllTable();
						$("#msg").html("");
						$("#msg")
								.html(
										"<h3><i class='fa fa-circle-o-notch fa-spin'></i>  </h3>")
					},
					success : function(data) {
						console.log("Product List");
						console.log(data);
						$("#msg").html("");
						$('#rptCustomer').removeClass("hidden");
						$('#rptCustomer').DataTable().destroy();
						if (data.status == "Success") {
							$('#rptCustomer')
									.dataTable(
											{
												data : $.parseJSON(JSON
														.stringify(data.data)),
												"searching" : false,
												"lengthMenu" : [
														[ 10, 25, 50, -1 ],
														[ 10, 25, 50, "All" ] ],
												columns : [
														{
															data : 'usr_created_date',
															render : function(
																	data, type,
																	val) {
																var tglAct = "";
																if (val.usr_created_date != "") {
																	tglAct = convertDateAPI(val.usr_created_date);
																} else {
																	tglAct = "0";
																}

																return tglAct;
															}
														},
														{
															data : 'total_register'
														},
														{
															data : 'total_active'
														},
														{
															data : 'total_inactive'
														} ],
												dom : 'Bfrtip',
												buttons : [ 'excel' ]
											});
						} else {
							$('#rptCustomer').DataTable(
									{
										"searching" : false,
										"scrollX" : true,
										"lengthMenu" : [ [ 10, 25, 50, -1 ],
												[ 10, 25, 50, "All" ] ],
										dom : 'Bfrtip',
										buttons : [ 'excel' ]
									});
						}

					},
					failure : function(errMsg) {
						$.alert("call failed");
					}
				});
	}

	function getLogDate() {
		$.ajax({
			type : 'GET',
			asyn : true,
			contentType : 'application/json',
			url : '${local_server}/report_summary/getdate',
			dataType : 'json',
			success : function(data) {
				console.log(data.data[0]);
				$.each(data.data[0], function(i, o) {
					$(String("#" + i)).html(o.replace("T", " "));
				});
			}
		});
	}

	function getHistory() {

		$
				.ajax({
					type : 'POST',
					asyn : true,
					data : $("#formReport").serialize(),
					url : '${local_server}/report_summary/getreport_history_post',
					dataType : 'json',
					beforeSend : function() {
						resetAllTable();
						$("#msg").html("");
						$("#msg")
								.html(
										"<h3><i class='fa fa-circle-o-notch fa-spin'></i>  </h3>")
					},
					success : function(data) {
						console.log("Product List");
						console.log(data);
						$("#msg").html("");
						$('#rptHistory').removeClass("hidden");
						$('#rptHistory').DataTable().destroy();
						if (data.status == "Success") {
							$('#rptHistory')
									.dataTable(
											{
												data : $.parseJSON(JSON
														.stringify(data.data)),
												"searching" : false,
												"lengthMenu" : [
														[ 10, 25, 50, -1 ],
														[ 10, 25, 50, "All" ] ],
												columns : [
														{
															data : 'rsh_action_date',
															render : function(
																	data, type,
																	val) {
																var tglAct = "";
																if (val.rsh_action_date != "") {
																	tglAct = convertDateAPI(val.rsh_action_date);
																} else {
																	tglAct = "0";
																}

																return tglAct;
															}
														},
														{
															data : 'total_analyst'
														},
														{
															data : 'total_approve'
														},
														{
															data : 'total_cancel'
														},
														{
															data : 'total_confirm'
														},
														{
															data : 'total_decline'
														},
														{
															data : 'total_request'
														},
														{
															data : 'total_close'
														} ],
												dom : 'Bfrtip',
												buttons : [ 'excel' ]
											});
						} else {
							$('#rptHistory').DataTable(
									{
										"searching" : false,
										"scrollX" : true,
										"lengthMenu" : [ [ 10, 25, 50, -1 ],
												[ 10, 25, 50, "All" ] ],
										dom : 'Bfrtip',
										buttons : [ 'excel' ]
									});
						}

					},
					failure : function(errMsg) {
						$.alert("call failed");
					}
				});
	}

	function getHistoryRange() {

		$
				.ajax({
					type : 'POST',
					asyn : true,
					data : $("#formReport").serialize(),
					url : '${local_server}/report_summary/getreport_historyrange_post',
					dataType : 'json',
					beforeSend : function() {
						resetAllTable();
						$("#msg").html("");
						$("#msg")
								.html(
										"<h3><i class='fa fa-circle-o-notch fa-spin'></i>  </h3>")
					},
					success : function(data) {
						console.log("Product List");
						console.log(data);
						$("#msg").html("");
						$('#rptHistoryRange').removeClass("hidden");
						$('#rptHistoryRange').DataTable().destroy();
						if (data.status == "Success") {
							$('#rptHistoryRange')
									.dataTable(
											{
												data : $.parseJSON(JSON
														.stringify(data.data)),
												"searching" : false,
												"lengthMenu" : [
														[ 10, 25, 50, -1 ],
														[ 10, 25, 50, "All" ] ],
												columns : [
														{
															data : 'rsh_action_date',
															render : function(
																	data, type,
																	val) {
																var tglAct = "";
																if (val.rsh_action_date != "") {
																	tglAct = convertDateAPI(val.rsh_action_date);
																} else {
																	tglAct = "0";
																}

																return tglAct;
															}
														},
														{
															data : 'total_app'
														},
														{
															data : 'total_5'
														},
														{
															data : 'total_5_10'
														},
														{
															data : 'total_10_20'
														}, {
															data : 'total_20'
														} ],
												dom : 'Bfrtip',
												buttons : [ 'excel' ]
											});
						} else {
							$('#rptHistoryRange').DataTable(
									{
										"searching" : false,
										"scrollX" : true,
										"lengthMenu" : [ [ 10, 25, 50, -1 ],
												[ 10, 25, 50, "All" ] ],
										dom : 'Bfrtip',
										buttons : [ 'excel' ]
									});
						}

					},
					failure : function(errMsg) {
						$.alert("call failed");
					}
				});
	}

	function onReport(val) {
		if (val == "detailbu") {
			$(".divdate").addClass("hide");
			$(".divbu").removeClass("hide");
		} else {
			$(".divdate").removeClass("hide");
			$(".divbu").addClass("hide");
		}
	}

	function resetAllTable() {
		$("#msg").html("");
		$("#downloadExcel").empty();
		$('#rptCustomer').addClass("hidden");
		$('#rptCustomer').DataTable().destroy();
		$('#rptHistory').addClass("hidden");
		$('#rptHistory').DataTable().destroy();
		$('#rptHistoryRange').addClass("hidden");
		$('#rptHistoryRange').DataTable().destroy();
		$('#rptHistoryAmount').addClass("hidden");
		$('#rptHistoryAmount').DataTable().destroy();
		$('#rptDetail').addClass("hidden");
		$('#rptDetail').DataTable().destroy();
	}

	function formatCurrency(num) {
		num = num.toString().replace(/\$|\,/g, '');
		if (isNaN(num))
			num = "0";
		sign = (num == (num = Math.abs(num)));
		num = Math.floor(num * 100 + 0.50000000001);
		num = Math.floor(num / 100).toString();
		for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
			num = num.substring(0, num.length - (4 * i + 3)) + ','
					+ num.substring(num.length - (4 * i + 3));
		return (((sign) ? '' : '-') + num);
	}

	function convertDateAPI(val) {
		date = new Date(val);
		month = date.getMonth() + 1;
		year = date.getFullYear();
		tgl = date.getDate();
		j = date.getHours();
		m = date.getMinutes();
		d = date.getSeconds();

		if (tgl < 10) {
			tgl = '0' + tgl;
		}
		if (month < 10) {
			month = '0' + month;
		}

		return year + '-' + month + '-' + tgl;
	}

	function loadDDLParam() {
		$.ajax({
			type : 'GET',
			asyn : true,
			dataType:"json",
			url : '${local_server}/report_summary/getcompany' ,
			success : function(response) {
				console.log(response.data);
				var toAppend = "<option value='0'>--Select One--</option>";
				$.each(response.data, function(i, o) {
					console.log(o.cst_business_unit);
					toAppend += '<option value="' + o.cst_business_unit + '">'
							+ o.cst_business_unit + ' </option>';
				});
				$("#business_unit").empty();
				$('#business_unit').append(toAppend);
			}
		});
	}
	
	function viewDownloadAll() {
		var html ='';
		html += '<button type="button" class="btn btn-success btn-sm" id="downloadall">';
		html += '<i class="fa fa-file-excel-o"></i> Unduh semua ke Excel</button>';
		
		$("#downloadExcel").empty();
		$("#downloadExcel").append(html);
		
		$("#downloadall")
		.click(function(e) {
			$("#formReportCustom").submit();	
		});
	}
</script>

</html>

