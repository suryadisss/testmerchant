<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Cashier" />
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
								<form id="formInputSearching">
									<div class="modal-body">
										<div class="form-horizontal">
											<div class="form-group">
												<label for="scc_code" class="col-sm-4 control-label">Telusuri Berdasarkan</label>
												<div class="col-sm-6">
													<select id="SBY" name="SBY" class="form-control">
														<option value="booking">Kode Pesanan</option>
														<option value="phone">Nomor Ponsel</option>
													</select>
												</div>
											</div>

											<div class="form-group">
												<label for="scc_code" class="col-sm-4 control-label">Isi</label>
												<div class="col-sm-6">
													<input type="text" name="SBYV" id="SBYV"
														class="form-control" />
												</div>
											</div>

										</div>
									</div>
									<div class="modal-footer">
										<button type="button" id="btnSearch" class="btn btn-primary">Telusuri</button>
									</div>
								</form>
								<table id="ListTable" name="ListTable"
									class="table table-hover hidden" width="100%">
									<thead>
										<tr>
											<td>Kode Pesanan</td>
											<td>Email/Surel</td>
											<td>Nomor Ponsel</td>
											<td>ReferalID</td>
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
	<jsp:param name="title" value="Disbursement" />
	<jsp:param name="datatables" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
	<jsp:param name="jquerydatepicker" value="1" />
	<jsp:param name="noityjs" value="1" />
</jsp:include>

<script>
	$(document).ready(function() {

		$("#btnSearch").on("click", function() {
			var x = $("#SBY").val();
			if (x == "booking") {
				cekBookingCode(x);
			} else if (x == "phone") {
				cekPhoneNumber(x);
			}
		});
	});

	function cekBookingCode(val) {
		var arr = {}
		arr['booking'] = $('#SBYV').val();
		arr['field'] = val;

		$
				.ajax({
					type : "POST",
					url : '${local_server}/Cashier/searchingBookingCode',
					data : arr,
					cache : false,
					complete : function(xhr, status) {
						if (status === 'error' || !xhr.responseText) {
							console.log(error);
						} else {
							var mdata = JSON.parse(xhr.responseText);
							console.log(mdata);
							$("#ListTable").removeClass("hidden");
							$('#ListTable').DataTable().destroy();
							$('#ListTable')
									.DataTable(
											{
												data : mdata.data,
												columns : [
														{
															data : 'booking_code'
														},
														{
															data : 'rsh_email'
														},
														{
															data : 'phone_number'
														},
														{
															data : 'referral_id'
														},
														{
															render : function(
																	data, type,
																	row) {

																var chk = '';
																chk = '<button class="edit btn btn-xs btn-primary" id="'+row.rshid_en+'">Check</button>';
																return chk;
															},
														} ]
											});
						}
					}
				});

	}

	$('#ListTable').on('click', 'button.edit', function(e) {
		summaryForm(this.id);
	});

	function summaryForm(id) {
		window.location.href = "${local_server}/Cashier/getSummary/" + id;
	}

	function cekPhoneNumber(val) {
		var arr = {}
		arr['phone'] = $('#SBYV').val();
		arr['field'] = val;

		$
				.ajax({
					type : "POST",
					url : '${local_server}/Cashier/searchingPhoneNumber',
					data : arr,
					cache : false,
					complete : function(xhr, status) {
						if (status === 'error' || !xhr.responseText) {
							console.log(error);
						} else {
							var mdata = JSON.parse(xhr.responseText);
							console.log(mdata);
							$("#ListTable").removeClass("hidden");
							$('#ListTable').DataTable().destroy();
							$('#ListTable')
									.DataTable(
											{
												data : mdata.data,
												columns : [
														{
															data : 'booking_code'
														},
														{
															data : 'rsh_email'
														},
														{
															data : 'phone_number'
														},
														{
															data : 'referral_id'
														},
														{
															render : function(
																	data, type,
																	row) {

																var chk = '';
																chk = '<button class="edit btn btn-xs btn-primary" id="'+row.rshid_en+'">Check</button>';
																return chk;
															},
														} ]
											});
						}
					}
				});
	}

	function generateHTML(data) {

		$.each(data, function(i, o) {
			var TagHtml = "#" + i;
			o = (o != null) ? o : "-";
			$(String(TagHtml)).html(o);
		});
	}

	function generateHTMLKopkari(data) {
		var html = "";
		var x = 1;
		$.each(data, function(i, o) {
			html += "<table class='table table-bordered' width='100%'>";
			html += "<tr><td><span class='badge badge-pill badge-default'>" + x
					+ "</span></td></tr>";
			html += "<tr><td>";
			html += "<table width='100%'>";
			html += "<tr><td width='50%'>Pinjaman ID</td><td><label>"
					+ o.pinjamanID + "</label></td></tr>";
			html += "<tr><td width='50%'>NIK</td><td><label>" + o.empID
					+ "</label></td></tr>";
			html += "<tr><td width='50%'>Nama</td><td><label>" + o.empName
					+ "</label></td></tr>";
			html += "<tr><td width='50%'>ID Pengguna</td><td><label>" + o.userID
					+ "</label></td></tr>";
			html += "<tr><td width='50%'>No. Pinjaman</td><td><label>"
					+ o.pinjamanNo + "</label></td></tr>";
			html += "<tr><td width='50%'>Status</td><td><label>"
					+ o.pinjamanStatus + "</label></td></tr>";
			html += "<tr><td width='50%'>Amount</td><td><label>"
					+ o.pinjamanAmount + "</label></td></tr>";
			html += "<tr><td width='50%'>Paid</td><td><label>" + o.pinjamanPaid
					+ "</label></td></tr>";
			html += "<tr><td width='50%'>Tenor Paid</td><td><label>"
					+ o.pinjamanTenorPaid + "</label></td></tr>";
			html += "<tr><td width='50%'>Tenor</td><td><label>"
					+ o.pinjamanTenor + "</label></td></tr>";
			html += "<tr><td width='50%'>Cicilan Pokok</td><td><label>"
					+ o.pinjamanCicilanPokok + "</label></td></tr>";
			html += "<tr><td width='50%'>Bunga</td><td><label>"
					+ o.pinjamanBunga + "</label></td></tr>";
			html += "<tr><td width='50%'>Txn Date</td><td><label>" + o.txnDate
					+ "</label></td></tr>";
			html += "<tr><td width='50%'>Disburse Date	</td><td><label>"
					+ o.disburseDate + "</label></td></tr>";
			html += "</table>"
			html += "</tr></td>";
			html += "</table>";
			x++;
		});
		$("#result2").html(html);
	}
</script>

</html>

