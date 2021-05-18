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
	padding: 100px;
	margin-left: 15px; |
	margin-right: 15px;
	margin-top: 40px;
	margin-bottom: 40px;
}

.img {
	background: grey;
}
</style>
<style type="text/css">
@media all {
	.page-break {
		display: none;
	}
}

@media print {
	.page-break {
		display: block;
		page-break-before: always;
	}
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
	href='<c:url value="/resources/libs/bootstrap/dist/css/bootstrap.min.css"/>'
	rel="stylesheet" />
<link media="all"
	href='<c:url value="/resources/libs/font-awesome/css/font-awesome.min.css"/>'
	rel="stylesheet" />
</head>
<body>
	<div id="msg"></div>
	<div style="padding: 15px;" id="SP">
		<table width="100%" style="margin-top: 10px; margin-bottom: 10px;">
			<tr>
				<td width="20%"><img alt=""
					src="${local_server}/resources/images/background1.png" class="img"
					width="60%""></td>
				<td align="center"><h4>
						<b>Surat Pernyataan</b>
					</h4></td>

			</tr>
		</table>
		<table width="100%" style="margin-top: 10px;">
			<tbody>

				<tr>
					<td>
						<p style="font-size: 10pt;">Saya yang bertanda-tangan di bawah
							ini:</p>
						<table style="margin-left: 15px; font-size: 10pt;" width="100%"
							border="0" class="">
							<tbody>


								<tr>
									<td width="70%" valign="top">
										<table width="80%" border="0" class="">

											<tr>
												<td width="45%">Nama lengkap sesuai identitas</td>
												<td width="2%">:</td>
												<td align="left"><span id="cst_fname" class="cst_fname"></span>&nbsp;<span
													id="cst_lname" class="cst_lname"></span></td>
											</tr>

											<tr>
												<td width="45%">Indentitas, Nomor</td>
												<td width="2%">:</td>
												<td align="left">KTP, <span id="cst_ktp"></span></td>
											</tr>
											<tr>
												<td width="45%">Umur</td>
												<td width="2%">:</td>
												<td align="left"><span id="age"></span> Tahun</td>
											</tr>
											<tr>
												<td width="45%">Alamat Email</td>
												<td width="2%">:</td>
												<td align="left"><span id="cst_email"></span></td>
											</tr>
											<tr>
												<td width="45%">Nomor telepon seluler</td>
												<td width="2%">:</td>
												<td align="left"><span id="cst_phone_mobile"></span></td>
											</tr>
										</table>



									</td>
									<td width="30%" id="c_pic_img"></td>
								</tr>

							</tbody>
						</table>
						<p style="margin-left: 15px; font-size: 10pt; margin-top: 10px;">-
							berikut dengan segala data dan informasi baik yang tersedia
							secara elektronik maupun secara fisik (untuk selanjutnya disebut
							"Penerima Pinjaman")</p>
					</td>
				</tr>

				<tr>
					<td>
						<p style="font-size: 10pt;">Dengan ini saya menyatakan bahwa :</p>
						<table style="margin-left: 15px; font-size: 10pt;" width="100%">
							<tr>
								<td valign="top">1.</td>
								<td valign="top">Saya telah mengajukan permohonan pinjaman
									KiniCintaku serta telah membaca dan memahami sepenuhnya segala
									persyaratan pinjaman KiniCintaku.</td>
							</tr>
							<tr>
								<td valign="top">2.</td>
								<td valign="top">Saya bersedia dilakukan pemeriksaan latar
									belakang baik secara langsung atau tidak langsung atas data
									kredit saya sehubungan dengan permohonan pinjaman KiniCintaku
									termasuk pelaporan data pinjaman saya sesuai ketentuan
									regulator.</td>
							</tr>
							<tr>
								<td valign="top">3.</td>
								<td valign="top">Saya telah menerima sejumlah uang sebagai
									pinjaman pembiayaan KiniCintaku, dengan perhitungan sebagai
									berikut:</td>
							</tr>

							<tr>
								<td valign="top"></td>
								<td valign="top">
									<table
										style="margin-left: 15px; font-size: 10pt; margin-top: 5px;"
										width="60%">
										<tr>
											<td width="45%">Harga pembelian barang</td>
											<td width="5%">:</td>
											<td width="5%">Rp.&nbsp;</td>
											<td align="right"><span id="tot_pembelian"></span></td>
										</tr>
										<tr>
											<td width="45%">Uang muka pembelian barang</td>
											<td width="5%">:</td>
											<td width="5%">Rp.&nbsp;</td>
											<td align="right"><span id="dp_paid"></span></td>
										</tr>
										<tr>
											<td width="45%"><b>Nilai pembiayaan / pinjaman</b><b></b></td>
											<td width="5%"><b>:</b></td>
											<td width="5%"><b>Rp.&nbsp;</b></td>
											<td align="right"><b><span id="r_purpose"></span></b></td>

										</tr>

									</table>
									<table
										style="margin-left: 15px; font-size: 10pt; margin-top: 5px;"
										width="60%">
										<tr>
											<td width="45%">Biaya Proses</td>
											<td width="5%">:</td>
											<td width="5%">Rp.&nbsp;</td>
											<td align="right"><span id="admin"></span></td>
										</tr>
										<tr>
											<td width="45%">Biaya Asuransi (apabila ada)</td>
											<td width="5%">:</td>
											<td width="5%">Rp.&nbsp;</td>
											<td align="right"><span>0</span></td>
										</tr>
										<tr>
											<td width="45%"><b>Biaya Penagihan (apabila perlu)</b></td>
											<td width="5%"><b>:</b></td>
											<td width="5%"><b>Rp.&nbsp;</b></td>
											<td align="right"><b><span>0</span></b></td>
										</tr>

									</table>
									<table
										style="margin-left: 15px; font-size: 10pt; margin-top: 5px; margin-bottom: 15px;"
										width="60%">
										<tr>
											<td width="45%">Jangka Waktu Pinjaman</td>
											<td width="5%">:</td>
											<td width="5%"></td>
											<td align="right"><span id="r_tenor"></span> bulan</td>
										</tr>
										<tr>
											<td width="45%">Suku Bunga</td>
											<td width="5%">:</td>
											<td width="5%"></td>
											<td align="right"><span id="interest_amount_promo"></span>
												% <span id="interest_calc"></span></td>
										</tr>
										<tr>
											<td width="45%">Biaya Administrasi Angsuran</td>
											<td width="5%">:</td>
											<td width="5%">Rp.&nbsp;</td>
											<td align="right"><span id="cost_monthly_value"></span> setiap pembayaran</td>
										</tr>
										<tr>
											<td width="45%"><b>Angsuran /bulan</b></td>
											<td width="5%"><b>:</b></td>
											<td width="5%"><b>Rp.&nbsp;</b></td>
											<td align="right"><b><span id="r_installment"></span>&nbsp;
											</b> </td>
										</tr>

										<tr>
											<td width="45%">Tanggal Pembayaran / Bulan</td>
											<td width="5%">:</td>
											<td width="5%"></td>
											<td align="right"><span id="datepayment"></span></td>
										</tr>
										<tr>
											<td width="45%">Denda keterlambatan</td>
											<td width="5%">:<b></b></td>
											<td width="5%">Rp.</td>
											<td align="right"><span id="denda"></span>/Hari</td>
										</tr>
									</table>

								</td>
							</tr>
							<tr>
								<td valign="top">4.</td>
								<td valign="top">Saya sanggup untuk melakukan jadwal
									pembayaran sesuai dengan jadwal yang ditetapkan dalam butir 3
									diatas, dengan perhitungan pokok dan bunga sebagaimana tertera
									dalam akun saya di KiniCintaku.</td>
							</tr>
							<tr>
								<td valign="top">5.</td>
								<td valign="top">Setiap pembayaran kembali pinjaman
									ditujukan ke Rekening Virtual Account sebagai berikut:<br>
									<table
										style="margin-left: 15px; font-size: 10pt; margin-top: 5px; margin-bottom: 5px;"
										width="60%">
										<tr>
											<td width="45%">Nama Bank</td>
											<td width="5%">:</td>
											<td width="5%"></td>
											<td align="left">BANK CENTRAL ASIA</td>
										</tr>
										<tr>
											<td width="45%">Nomor Virtual Account</td>
											<td width="5%">:</td>
											<td width="5%"></td>
											<td align="left"><span id="va_number"></span></td>
										</tr>
									</table>

								</td>
							</tr>
							<tr>
								<td valign="top">6.</td>
								<td valign="top">Saya setuju dan sepakat terhadap
									Perjanjian Pembiayaan sebagaimana ternyata dalam <span
									id="va_number2"></span>, Syarat dan Ketentuan <br>Umum, dan berikut
									Surat Pernyataan ini yang berlaku sebagai Lampiran I atas
									Perjanjian Pembiayaan tersebut, beserta bukti pembelian
									("receipt") dengan seluruh dokumen terkait lainnya dalam bentuk
									cetak atau elektronik yang merupakan satu kesatuan dengan
									Perjanjian Pembiayaan.


								</td>
							</tr>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
		<table>
			<tbody>
				<tr>
					<td>
						<table>
							<tr style="page-break-after: always;">
								<td valign="top">7.</td>
								<td valign="top">Atas pinjaman KiniCintaku, saya telah
									menggunakannya untuk melakukan pembelian barang sesuai dengan
									Bukti Pembelian yang merupakan bagian tidak terpisahkan dengan
									Surat Pernyataan ini, dengan Rincian Pembelian sebagai berikut
									:</td>
							</tr>
							<tr>
								<td valign="top"></td>
								<td valign="top">

									<table style="font-size: 10pt;" width="60%">
										<tr>
											<td width="45%">Nama Toko</td>
											<td width="5%">:</td>
											<td align="left"><span id="branch_name"></span></td>
										</tr>
										<tr>
											<td width="45%">Receipt No.</td>
											<td width="5%">:</td>
											<td align="left"><span id=""></span></td>
										</tr>
										<tr>
											<td width="45%">Nama Barang</td>
											<td width="5%">:</td>
											<td align="left"><span id="prdPrc"></span></td>
										</tr>
										<tr>
											<td width="45%"><b>Harga pembelian barang</b><b></b></td>
											<td width="5%"><b>:</b></td>
											<td align="left"><b>Rp.&nbsp;<span id="total"></span></b></td>
										</tr>
										<tr>
											<td width="45%">Tanggal Pembelian</td>
											<td width="5%">:</td>
											<td align="left"><span id="datePem"></span></td>
										</tr>

									</table>
								</td>
							</tr>
							<tr>
								<td valign="top">8.</td>
								<td valign="top">Atas pembelian barang sebagaimana dimaksud
									dalam butir 6 diatas, saya telah membayar sejumlah:</td>
							</tr>
							<tr>
								<td valign="top"></td>
								<td valign="top">
									<table style="font-size: 10pt;" width="100%">
										<tr>
											<td>a).</td>
											<td align="left">Rp. <span id="biayaProses"></span>
												kepada PT Dana Kini Indonesia, untuk biaya proses;
											</td>
										</tr>
										<tr>
											<td>b).</td>
											<td align="left">Rp. <span id="DpProses"></span> kepada
												PT HCI, untuk uang muka pembelian barang;
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td valign="top">9.</td>
								<td valign="top">Saya telah menerima barang sebagaimana
									dimaksud dalam butir 5 diatas, dalam keadaan baik, lengkap, dan
									berfungsi sebagaimana layaknya.</td>
							</tr>
						</table>
						<p style="font-size: 10pt; margin-top: 5px;">Surat Pernyataan
							ini dibuat sebagai kelengkapan pinjaman program KiniCintaku,
							terkait pembiayaan melalui perusahaan pinjam meminjam yang
							berbasis teknologi (Peer to Peer Lending) melalui PT Dana Kini
							Indonesia, berkedudukan di Jakarta Barat.</p>
						<p style="font-size: 10pt;">Surat Pernyataan ini saya buat
							dengan sebenarnya, dalam keadaan sadar, dan tanpa paksaan dari
							pihak manapun</p>
					</td>
				</tr>

			</tbody>
		</table>


		<table width="30%" style="margin-top: 10px; font-size: 10pt;">
			<tr>
				<td align="left"><b></b><span id="ads_field_1"></span></b>,<span
					id="dateTtd"></span><br>Penerima Pinjaman<br> <br> <br></td>
				<td></td>
				<td align="left"></td>
			</tr>
			<tr>
				<td align="left" valign="top">Materai 6000<br> <br> <br></td>
				<td></td>
				<td align="left">
					<%-- <b style="border-bottom: 1.5px solid black;">&nbsp;${name}</b> --%>
				</td>
			</tr>
			<tr>
				<td align="left"><b style="border-bottom: 1.5px solid black;"><span
						id="cst_fname" class="cst_fname"></span>&nbsp;<span id="cst_lname"
						class="cst_lname"></span></b></td>
				<td></td>
				<td align="left"></td>
			</tr>

		</table>
	</div>
</body>


<!-- jQuery -->
<script src='<c:url value="/resources/libs/jquery/dist/jquery.min.js"/>'
	type="text/javascript" /></script>
<!-- Bootstrap -->
<script
	src='<c:url value="/resources/libs/bootstrap/dist/js/bootstrap.min.js"/>'
	type="text/javascript" /></script>
<!-- FastClick -->
<script
	src='<c:url value="/resources/libs/fastclick/lib/fastclick.js"/>'
	type="text/javascript" /></script>
<!-- NProgress -->
<script src='<c:url value="/resources/libs/nprogress/nprogress.js"/>'
	type="text/javascript" /></script>
<!-- jQuery custom content scroller -->
<script
	src='<c:url value="/resources/libs/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"/>'
	type="text/javascript" /></script>

<script type="text/javascript">
	$(document).ready(
			function() {
				getData();
				//getTempTable();
				var currentDate = new Date();
				var day = currentDate.getDate();
				var month = currentDate.getMonth();
				var year = currentDate.getFullYear();
				var monthNames = [ "Januari", "Februari", "Maret", "April",
						"Mei", "Juni", "Juli", "Agustus", "September",
						"Oktober", "November", "Desember" ];

				$("#dateTtd,#datePem").html(
						" " + day + " " + monthNames[month] + " " + year + "");

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
			/*ang[1] = (ang[1] != null) ? "," + ang[1] : ",00"*/
			return '' + rev2.split('').reverse().join('');
		} else {
			return '0'
		}

	}

	function getParse() {
		$
				.ajax({
					type : "GET",
					url : "${local_server}/print_doc/${id}/parse",
					async : false,
					dataType : "json",
					success : function(response) {
						console.log(response.data);
						if (response.status == "Success") {
							if (Object.keys(response.data).length > 0) {
								var x = (response.data[0].rsh_date != null && response.data[0].rsh_date != "") ? response.data[0].rsh_date
										: response.data[0].rsh_date;
								$("#datepayment").html(x);
							}
							window.print();

						}

					},
					complete : function() {

					}

				});
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
					var length = response.data.detail.length;
					$.each(response.data.detail, function(i, o) {
						if (i == (length - 1)) {
							html += "" + o.category + "";
						} else {
							html += "" + o.category + ",";
						}
						total += parseInt(o.amount);
					});
					$("#total").html(toRp(total));
					$("#prdPrc").html(html);
					//window.print();
					getParse();

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
													if (i == "r_installment") {
														var x = 0;
														x = o * 0.001;
														//o = toRp(o);
														$("#denda").html(
																toRp(x));
													}
													if (i == "dp_paid") {
														$("#DpProses").html(
																toRp(o));
													}

													if (i != "interest_amount_promo"
															&& i != "ask_tenor"
															&& i != "ads_field_1"
															&& i != "penalty_type"
															&& i != "no_ktp"
															&& i != "cst_lname"
															&& i != "cst_fname"
															&& i != "cst_dob"
															&& i != "cst_email"
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
															&& i != "va_number"
															&& i != "interest_calc"
															&& i != "age") {
														o = toRp(o);
													}
													if (i == "va_number") {
														$(".va_number").html(o);
														$("#va_number2").html(
																o.substring(5));
													}
													if (i == "cst_dob") {
														o = convertDateID(o
																.substr(0, 10));
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

													if (i == "referral_code") {
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
												+ '" class="img-responsive" width="100px">';
													}
													o = (o == null) ? "" : o;
													$(String(TagHtml)).html(o);
												}

											});
							$("#tot_pembelian").html(
									toRp((response.data[0].r_amount)));
							var AdminFee = response.data[0].cost_onetime_value
									.split(";");
							$("#admin,#biayaProses").html(toRp(AdminFee[0]));

						}
						getPurchase();

					},
					complete : function() {

					}
				});
	}

	function convertDateID(date) {
		if (date != null && date != "") {
			date = date.substring(0, 10);
			var d = new Date(date);
			return d.toLocaleString("en-GB").substring(0, 10).replace(/\//g,
					"-");
		} else {
			return "";
		}

	}

	function getNow() {

	}

	function checkExists(sel) {
		var status = false;
		if ($(sel).length)
			status = true;
		return status;
	}

	function convertDateAPI(val) {

		var monthNames = [ "Januari", "Februari", "Maret", "April", "Mei",
				"Juni", "Juli", "Agustus", "September", "Oktober", "November",
				"Desember" ];
		var value = new Date(val.replace(/(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3"));
		var tgl = value.getDate();
		var bln = value.getMonth();
		var thn = value.getFullYear();
		var dat = tgl + " " + monthNames[bln] + " " + thn;
		return dat;
	}
</script>

</html>