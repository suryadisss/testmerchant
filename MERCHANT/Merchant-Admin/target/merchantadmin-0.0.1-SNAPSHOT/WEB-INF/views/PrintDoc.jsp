<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%><%@ taglib
	uri="http://www.springframework.org/tags/form" prefix="form"%><%@ taglib
	prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css" media="print">
@page {
	size: auto; /* auto is the initial value */
	margin: 0; /* this affects the margin in the printer settings */
	padding: 50px;
	margin-top: 40px;
	margin-bottom: 150px;
}

.img {
	background: grey;
}
</style>
<style type="text/css" media="all">
.table-borderless>tbody>tr>td, .table-borderless>tbody>tr>th,
	.table-borderless>tfoot>tr>td, .table-borderless>tfoot>tr>th,
	.table-borderless>thead>tr>td, .table-borderless>thead>tr>th {
	border: none;
}
</style>

<link media="all"
	href="<c:url value="/resources/libs/bootstrap/dist/css/bootstrap.min.css"/>"
	rel="stylesheet" />
<link media="all"
	href="<c:url value="/resources/libs/font-awesome/css/font-awesome.min.css"/>"
	rel="stylesheet" />
</head>
<body>
	<div id="msg"></div>
	<div style="padding: 15px;" id="SP">
		<table width="100%" style="margin-top: 10px; margin-bottom: 10px;">
			<tr>
				<td width="20%"><img alt=""
					src="${local_server}/resources/images/background1.png" class="img"
					width="80%"></td>
				<td><h5>
						<b>Kontrak Pembiayaan</b>
					</h5></td>
			</tr>
		</table>
		<table width="100%" style="margin-top: 10px;">
			<tbody>
				<tr>
					<td><h5 style="font-weight: bold;">Informasi Nasabah</h5></td>
				</tr>
				<tr>
					<td>
						<table width="100%" border="0" class="" style="font-size: 11px;">
							<tbody>
								<tr>
									<td width="70%" valign="top">
										<table width="100%" border="0" class="">
											<tr>
												<td width="30%"><b>No. KTP</b></td>
												<td width="40%"><span id="cst_ktp"></span></td>
											</tr>
											<tr>
												<td width="30%"><b>Nama</b></td>
												<td width="40%"><span id="cst_fname"></span>&nbsp;<span
													id="cst_lname"></span></td>
											</tr>
											<tr>
												<td width="30%"><b>Tanggal Lahir</b></td>
												<td width="40%"><span id="cst_dob"></span></td>
											</tr>
											<tr>
												<td width="30%"><b>Jenis Kelamin</b></td>
												<td width="40%"><span id="cst_sex"></span></td>
											</tr>
											<tr>
												<td width="30%"><b>Alamat</b></td>
												<td width="40%"><span id="cst_address"></span></td>
											</tr>
											<tr>
												<td width="30%"><b>No. Handphone</b></td>
												<td width="40%"><span id="cst_phone_mobile"></span></td>
											</tr>
										</table>



									</td>
									<td width="30%" id="c_pic_img"></td>
								</tr>

							</tbody>
						</table>


					</td>

				</tr>
				<tr>
					<td><h5 style="font-weight: bold;">Informasi Pekerjaan</h5></td>


				</tr>
				<tr>
					<td><table width="100%" border="0" " style="font-size: 11px;">
							<tbody>
								<tr>
									<td width="30%"><b>Perusahaan</b></td>
									<td width="70%"><span id="cst_business_unit"></span></td>
								</tr>
								<tr>
									<td width="30%"><b>Jabatan</b></td>
									<td width="70%"><span id="cst_job_position"></span></td>
								</tr>
								<tr>
									<td width="30%"><b>Status Pekerjaan</b></td>
									<td width="70%"><span id="cst_employment_type"></span></td>
								</tr>
							</tbody>
						</table></td>
				</tr>
				<tr>
					<td><h5 style="font-weight: bold;">Produk Yang Dibeli</h5></td>


				</tr>
				<tr>
					<td><table width="100%" class="table table-bordered"
							style="margin-top: 20px; font-size: 11px;">
							<thead>
								<tr class="">
									<td width="40%"><b>Kategori</b></td>
									<td width="40%"><b>Produk</b></td>
									<td width="30%"><b>Harga</b></td>
								</tr>
							</thead>
							<tbody id="prdPrc">

							</tbody>
							<tfoot>
								<tr>
									<td colspan="2">Total</td>
									<td id="total" align="right"></td>
								</tr>
							</tfoot>
						</table></td>
				</tr>

				<tr>
					<td><h5 style="font-weight: bold;">Informasi Toko</h5></td>


				</tr>
				<tr>
					<td><table width="100%" border="0" style="font-size: 11px;">
							<tbody>
								<tr>
									<td width="30%"><b>Nama Toko</b></td>
									<td width="70%"><span id="branch_name"></span></td>
								</tr>
								<tr>
									<td width="30%"><b>Alamat</b></td>
									<td width="70%"><span id="branch_address"></span></td>
								</tr>
								<tr>
									<td width="30%"><b>Customer Service</b></td>
									<td width="70%">${name}</td>
								</tr>
							</tbody>
						</table></td>
				</tr>
			</tbody>
		</table>
		<table width="100%" style="margin-top: 10px;">
			<tbody>

				<tr>
					<td><h5 style="font-weight: bold;">Rincian Pinjaman</h5></td>


				</tr>
				<tr>
					<td><table width="100%" border="0" style="font-size: 11px;">
							<tbody>
								<tr>
									<td width="30%"><b>Total Pembelian</b></td>
									<td width="30%" align="right"><span id="tot_pembelian"></span></td>
									<td width="40%">&nbsp;</td>
								</tr>
								<tr>
									<td width="30%"><b>Biaya Administrasi</b></td>
									<td width="30%" align="right"><span id="admin"></span></td>
									<td width="40%">&nbsp;</td>
								</tr>
								<!-- <tr>
										<td width="30%"><b>Biaya Provisi</b></td>
										<td width="30%" align="right"><span id="provisi"></span></td>
										<td width="40%">&nbsp;</td>
									</tr> -->
								<tr>
									<td width="30%"><b>Biaya Uang Muka</b></td>
									<td width="30%" align="right"><span id="dp_paid"></span></td>
									<td width="40%">&nbsp;</td>
								</tr>
							</tbody>
						</table> <br> <br>
						<table width="100%" border="0" style="font-size: 11px;">
							<tbody>
								<tr>
									<td width="30%"><b>Pinjaman kinicintaku</b></td>
									<td width="30%" align="right"><span id="r_purpose"></span></td>
									<td width="40%">&nbsp;</td>
								</tr>
								<tr>
									<td width="30%"><b>Bunga Perbulan</b></td>
									<td width="30%" align="right"><span
										id="interest_amount_promo"></span> %</td>
									<td width="40%">&nbsp;</td>
								</tr>
								<tr>
									<td width="30%"><b>Tenor Yang Disetujui</b></td>
									<td width="30%" align="right"><span id="ask_tenor"></span></td>
									<td width="40%">&nbsp;</td>
								</tr>
							</tbody>
						</table> <br> <br>
						<table width="100%" border="0" style="font-size: 11px;">
							<tbody>
								<tr>
									<td width="30%"><b>Cicilan Perbulan</b></td>
									<td width="30%" align="right"><span id="r_installment"></span></td>
									<td width="40%">&nbsp;</td>
								</tr>
								<tr>
									<td width="30%"><b>Biaya Proses Angsuran</b></td>
									<td width="30%" align="right"><span id="memberFee"></span></td>
									<td width="40%">&nbsp;</td>
								</tr>
								<tr>
									<td width="30%"><b>Jumlah Cicilan Perbulan</b></td>
									<td width="30%" align="right"><span id="JumCilBln"></span></td>
									<td width="40%">&nbsp;</td>
								</tr>
							</tbody>
						</table></td>
				</tr>
				<tr>
					<td><h5 style="font-weight: bold;">Rincian Pembayaran</h5></td>


				</tr>
				<tr>
					<td>
						<table width="100%" border="0" style="font-size: 11px;">
							<tbody>
								<tr>
									<td width="30%"><b>Jumlah Cicilan Perbulan</b></td>
									<td width="30%" align="right"><span id="JumCilBln2"></span></td>
									<td width="40%">&nbsp;</td>
								</tr>
								<tr>
									<td width="30%"><b>Tanggal Cetak Tagihan</b></td>
									<td width="30%" align="right"><span id="tgl_pembayaran"></span></td>
									<td width="40%">&nbsp;</td>
								</tr>
								<tr>
									<td width="30%"><b>Tanggal Jatuh Tempo</b></td>
									<td width="30%" align="right"><span id="tgl_tempo"></span></td>
									<td width="40%">&nbsp;</td>
								</tr>
								<tr>
									<td width="30%"><b>Denda yang dikenakan</b></td>
									<td width="30%" align="right"><span id="Rppen"></span><span
										id="penalty_value"></span><span id="Pctpen"></span>
									<td width="40%">&nbsp;</td>
								</tr>
								<tr>
									<td width="30%"><b>Pembayaran di transfer ke BCA
											Virtual Account</b></td>
									<td width="30%" align="right"><span id="va_number"></span>
									<td width="40%">&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>

		<table width="100%" style="margin-top: 50px;">
			<tr>
				<td align="center">TTD<br /> <br /> <br /></td>
				<td></td>
				<td align="center">TTD<br /> <br /> <br /></td>
			</tr>
			<tr>
				<td align="center"><b style="border-bottom: 1.5px solid black;"><span
						id="cst_fname" class="cst_fname"></span>&nbsp;<span id="cst_lname"
						class="cst_lname"></span></b></td>
				<td></td>
				<td align="center"><b style="border-bottom: 1.5px solid black;">&nbsp;${name}</b>
				</td>
			</tr>
			<tr>
				<td align="center">Nasabah</td>
				<td></td>
				<td align="center">Customer Service</td>
			</tr>

		</table>
		<table>
			<tbody>
				<tr>
					<td><h5 style="font-weight: bold;">Lampiran Dokumen :</h5></td>


				</tr>
				<tr>
					<table width="100%" border="0"">
						<tbody>
							<tr>
								<td id="c_ktp_img"></td>

							</tr>
							<tr>
								<td id="c_other_img"></td>
							</tr>
						</tbody>
					</table>
				</tr>

			</tbody>

		</table>
	</div>
</body>


<!-- jQuery -->
<script src="<c:url value="/resources/libs/jquery/dist/jquery.min.js"/>" /></script>
<!-- Bootstrap -->
<script
	src="<c:url value="/resources/libs/bootstrap/dist/js/bootstrap.min.js"/>" /></script>
<!-- FastClick -->
<script
	src="<c:url value="/resources/libs/fastclick/lib/fastclick.js"/>" /></script>
<!-- NProgress -->
<script src="<c:url value="/resources/libs/nprogress/nprogress.js"/>" /></script>
<!-- jQuery custom content scroller -->
<script
	src="<c:url value="/resources/libs/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"/>" /></script>

<script type="text/javascript">
	$(document).ready(function() {
		getData();
		//getTempTable();

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
					rev2 += '.';
				}
			}
			ang[1] = (ang[1] != null) ? "," + ang[1] : ",00"
			return '' + rev2.split('').reverse().join('') + ang[1];
		} else {
			return '0,00'
		}

	}

	function getPurchase() {
		$.ajax({
			type : "GET",
			url : "${local_server}/print_doc/${id}/product/${booking_code}",
			async : false,
			dataType : "json",
			success : function(response) {
				console.log(response.data.detail);
				if (response.status == "Success") {
					var html = "";
					var total = 0;
					$.each(response.data.detail,
							function(i, o) {
								html += '<tr>';
								html += '<td>' + o.category + '</td>';
								html += '<td>' + o.item + '</td>';
								html += '<td align="right">' + toRp(o.amount)
										+ '</td>';
								html += '</tr>';
								total += parseInt(o.amount);
							});
					$("#total").html(toRp(total));
					$("#prdPrc").html(html);
					window.print();

				}

			},
			complete : function() {

			}

		});
	}

	function getData() {
		$
				.ajax({
					type : "GET",
					url : "${local_server}/print_doc/${id}/temp",
					async : false,
					dataType : "json",
					beforSend : function() {

					},
					success : function(response) {
						console.log(response);
						if (response.status == "Success") {
							$
									.each(
											response.data[0],
											function(i, o) {
												var TagHtml = i
												TagHtml = "#" + TagHtml;
												if (checkExists(String(TagHtml))) {
													if (i == "penalty_type") {
														o = (o == "Pct") ? "%"
																: "";
													}
													if (i == "cst_fname"
															|| i == "cst_lname") {
														$("." + i).html(o);
													}
													if (i != "interest_amount_promo"
															&& i != "ask_tenor"
															&& i != "penalty_type"
															&& i != "no_ktp"
															&& i != "cst_lname"
															&& i != "cst_fname"
															&& i != "cst_dob"
															&& i != "cst_sex"
															&& i != "cst_ktp"
															&& i != "cst_phone_mobile"
															&& i != "cst_business_unit"
															&& i != "cst_job_position"
															&& i != "cst_address"
															&& i != "cst_employment_type"
															&& i != "branch_name"
															&& i != "branch_address"
															&& i != "referral_id"
															&& i != "penalty_value"
															&& i != "c_ktp_img"
															&& i != "c_other_img"
															&& i != "c_pic_img"
															&& i != "va_number") {
														o = toRp(o);
													}

													if (i == "penalty_type"
															&& o == "Pct") {
														$("#Rppen")
																.html("Rp. ");
														$("#Pctpen").empty();
													} else {
														$("#Rppen").empty();
														$("#Pctpen").html(" %");
													}

													if (i == "referral_id") {
														$(".referral_id").html(
																o);
													}

													if (i == "c_ktp_img") {
														o = "<img src='"+o+"' width='350px'/>";
													}
													if (i == "c_other_img") {
														o = "<img src='"+o+"' width='350px'/>";
													}
													if (i == "c_pic_img") {
														o = '<img alt="" src="' + o
												+ '" class="img-responsive" width="250px">';
													}
													o = (o == null) ? "" : o;
													$(String(TagHtml)).html(o);
												}

											});
							$("#tot_pembelian").html(
									toRp((response.data[0].r_amount)));
							var AdminFee = response.data[0].cost_onetime_value
									.split(";");
							$("#admin").html(toRp(AdminFee[0]));
							$("#provisi").html(toRp(AdminFee[1]));

							var memberFee = response.data[0].cost_monthly_value
									.split(";");
							$("#memberFee").html(toRp(memberFee[0]));

							$("#JumCilBln, #JumCilBln2")
									.html(
											toRp((parseInt(response.data[0].r_installment) + parseInt(memberFee[0]))));
							Date.prototype.addDays = function(days) {
								this.setDate(this.getDate() + parseInt(days));
								return this;
							};
							var actualDate = new Date();
							var nextMonth = new Date(actualDate.getFullYear(),
									actualDate.getMonth() + 1, actualDate
											.getDate());

							console.log(nextMonth.getFullYear() + '-'
									+ (nextMonth.getMonth() + 1) + '-'
									+ nextMonth.getDate());
							$("#tgl_pembayaran").html(
									nextMonth.getFullYear() + '-'
											+ (nextMonth.getMonth() + 1) + '-'
											+ nextMonth.getDate());
							var tempo = new Date(actualDate.getFullYear(),
									actualDate.getMonth() + 1, actualDate
											.getDate());
							tempo
									.addDays(parseInt(response.data[0].penalty_tolerance));
							$("#tgl_tempo").html(
									tempo.getFullYear() + '-'
											+ ((tempo.getMonth() + 1)) + '-'
											+ tempo.getDate());

						}
						getPurchase();

					},
					complete : function() {

					}
				});
	}

	function checkExists(sel) {
		var status = false;
		if ($(sel).length)
			status = true;
		return status;
	}
</script>

</html>