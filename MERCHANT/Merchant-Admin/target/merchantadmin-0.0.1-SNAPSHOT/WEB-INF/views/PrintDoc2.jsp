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
	margin-bottom: 120px;
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
				<td align="left"><h5>
						<b>Instruksi Penyerahan Barang</b>
					</h5>
					<table>
						<tr>
							<td>Nomor Kontrak</td>
							<td>:</td>
							<td>&nbsp;<span id="va_number"></span></td>
						</tr>
						<tr>
							<td>Tanggal</td>
							<td>:</td>
							<td>&nbsp;<span class="tglCetak">-</span></td>
						</tr>
						<tr>
							<td>Berlaku sampai :</td>
							<td>:</td>
							<td><span>-</span></td>
						</tr>
					</table></td>
			</tr>
		</table>
		<table width="100%" style="margin-top: 10px; font-size: 11px;">
			<tbody>
				<tr>
					<td>Kepada Yth :</td>
				</tr>
				<tr>
					<td><table width="100%" border="0"">
							<tbody>
								<tr>
									<td width="30%"><b>Nama Toko</b></td>
									<td width="70%"><span id="branch_name"></span></td>
								</tr>
								<tr>
									<td width="30%"><b>Alamat</b></td>
									<td width="70%"><span id="branch_address"></span></td>
								</tr>
								<!-- 
								<tr>
									<td width="30%"><b>Customer Service</b></td>
									<td width="70%"><span id="referral_id"></span></td>
								</tr> -->
							</tbody>
						</table></td>
				</tr>
				<tr>
					<td><br />Untuk menyerahkan BARANG kepada :<br /> <br /></td>
				</tr>
				<tr>

					<td>
						<table width="100%" border="0" class="" style="font-size: 11px;">
							<tbody>
								<tr>
									<td width="70%" valign="top">
										<table width="100%" border="0" class="">
											<tr>
												<td width="30%"><b>Nama Konsumen/Debitur</b></td>
												<td width="40%"><span id="cst_fname" class="cst_fname"></span>&nbsp;<span
													id="cst_lname" class="cst_lname"></span></td>
											</tr>
											<tr>
												<td width="30%"><b>Alamat</b></td>
												<td width="40%"><span id="cst_address"></span></td>
											</tr>
										</table>



									</td>

								</tr>

							</tbody>
						</table>


					</td>

				</tr>

				<tr>
					<td><br>sebagaimana rincian sebagai berikut :</td>


				</tr>
				<tr>
					<td><table width="100%" class="table table-bordered"
							style="margin-top: 20px;font-size: 11px;">
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
					<td><p>Intruksi Penyerahan Barang ini adalah bagian yang
							tidak terpisahkan dengan Kesepakatan Pembiayaan.</p></td>
				</tr>


			</tbody>
		</table>
		<table width="100%" style="margin-top: 20px; font-size: 11px;">
			<tr>
				<td valign="top">Hormat kami,<br />PT. Dana Kini Indonesia
					(Penyelenggara)<br /> <br /> <br /></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td valign="top">Diterima dan disetujui oleh, <br /> <span
					id="bc">Informa</span><br /> <br /></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td><b style="border-bottom: 1.5px solid black;">&nbsp;${name }</b>
				</td>
			</tr>
			<tr>
				<td>Admin Danakini</td>
				<td></td>
				<td></td>
				<td><b>Customer Service</b></td>
			</tr>

		</table>
	</div>
	<div style="padding: 15px;" id="SP" class="page-break">
		<table width="100%" style="margin-top: 10px; margin-bottom: 10px;">
			<tr>
				<%-- <td width="20%"><img alt=""
					src="${local_server}/resources/images/background1.png" class="img"
					width="80%"></td> --%>
				<td align="left"><h5>
						<b>Pernyataan Penerimaan Barang</b>
					</h5></td>
			</tr>
		</table>
		<br>
		<table width="100%" style="margin-top: 10px; font-size: 11px;" >
			<tr>
				<td>
					<p>
						Saya yang bertanda tangan dibawah ini <b><span
							class="cst_fname"></span>&nbsp;<span class="cst_lname"></span></b>,
						dengan ini menyatakan bahwa BARANG, sebagaimana dijelaskan di
						atas, telah diterima dengan baik sesuai dengan No. Kontrak : <span
							id="va_number2"></span> tertanggal &nbsp;<span class="tglCetak">-</span>.
						Saya telah memeriksa BARANG tersebut dengan seksama dan dengan ini
						menyatakan bahwa BARANG tersebut telah di terima dalam keadaan
						baik dan sempurna dalam segala hal. Pernyataan ini ditandatangani
						di Jakarta pada tanggal &nbsp;<span class="tglCetak">-</span>.
					</p>
				</td>
			</tr>
		</table>
		<table width="100%" style="margin-top: 10px;font-size: 11px;">
			<tr>
				<td valign="top">Nasabah,</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td valign="top"></td>
			</tr>
			<tr>
				<td><br><br><b><span
							class="cst_fname"></span>&nbsp;<span class="cst_lname"></span></b></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>

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
	$(document).ready(
			function() {
				getData();
				getData();
				var currentDate = new Date();
				var day = currentDate.getDate();
				var month = currentDate.getMonth() + 1;
				var year = currentDate.getFullYear();
				$("#tglCetak,.tglCetak").html(
						"<b>" + day + "/" + month + "/" + year + "</b>");
			});

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
					async : true,
					dataType : "json",
					success : function(response) {
						console.log(response);
						if (response.status == "Success") {
							$.each(response.data[0], function(i, o) {
								var TagHtml = i
								TagHtml = "#" + TagHtml;
								if (checkExists(String(TagHtml))) {
									o = (o == null) ? "" : o;
									$(String(TagHtml)).html(o);
									if (i == "penalty_type") {
										o = (o == "Pct") ? "%" : "";
									}
									if (i == "cst_fname" || i == "cst_lname") {
										$("." + i).html(o);
									}
									if (i == "branch_name") {
										$("#bc").html(o);
									}
									if (i == "va_number") {
										$("#va_number,#va_number2").html(o.substring(5));
									}
								
								}

							});
							$("#tot_pembelian").html(response.data[0].r_amount);
							$("#JumCilBln")
									.html(response.data[0].r_installment);
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
							$("#tgl_tempo")
									.html(
											nextMonth.getFullYear()
													+ '-'
													+ ((nextMonth.getMonth() + 1) + response.data[0].penalty_tolerance)
													+ '-' + nextMonth.getDate());

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
</script>

</html>