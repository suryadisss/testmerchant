<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Perjanjian" />
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
						<form id="formInput" action="">
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
								<button type="submit" id="submit" class="btn btn-primary">Simpan perubahan</button>
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
								<h2>KiniCintaku - Perjanjian</h2>
								<ul class="nav navbar-right panel_toolbox">
									<!-- <li><a class="collapse-link"><i
											class="fa fa-chevron-up"></i></a></li>
									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-expanded="false"><i
											class="fa fa-wrench"></i></a>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#">Settings 1</a></li>
											<li><a href="#">Settings 2</a></li>
										</ul></li>
									<li><a class="close-link"><i class="fa fa-close"></i></a>
									 -->
									<li></li>
								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<div id="note"></div>
								<div id="content">
									<div class="container">

										<div class="row">

											<div class="col-xs-12 col-sm-12 col-lg-12 clearfix"
												id="checkout">

												<div class="box">
													<!--Steps-->
													<div class="stepwizard">
														<div class="stepwizard-row setup-panel">
															<!--step 1-->
															<div class="stepwizard-step">
																<a
																	href="${local_server}/KiniCintaku/getKiniCintaku/det/${id}"
																	type="button" class="btn btn-primary btn-circle">1</a>
																<p>Info Nasabah</p>
															</div>
															<!--step 2-->
															<div class="stepwizard-step">
																<a
																	href="${local_server}/KiniCintaku/getKiniCintaku2/det/${id}"
																	type="button" class="btn btn-primary btn-circle">2</a>
																<p>Info Pembelian</p>
															</div>
															<!--step 3-->
															<div class="stepwizard-step">
																<a
																	href="${local_server}/KiniCintaku/getKiniCintaku4/det/${id}"
																	type="button"
																	class="btn btn-default btn-primary btn-circle">3</a>
																<p>Jenis Pinjaman</p>
															</div>
															<!--step 4-->
															<div class="stepwizard-step">
																<a
																	href="${local_server}/KiniCintaku/getKiniCintaku4/det/${id}"
																	type="button"
																	class="btn btn-default btn-primary btn-circle">4</a>
																<p>Unggah Dokumen</p>
															</div>
															<!--step 5-->
															<div class="stepwizard-step">
																<a href="kinicintaku-register6.html" type="button"
																	class="btn btn-default btn-primary btn-circle">5</a>
																<p>Perjanjian</p>
															</div>
															<!--step 6-->
															<div class="stepwizard-step">
																<a href="kinicintaku-register6.html" type="button"
																	class="btn btn-default btn-circle" disabled="disabled">6</a>
																<p>Summary</p>
															</div>

															<!--EOF step 6-->
														</div>
													</div>

													<div
														style="padding: 15px; border: 1px dashed #bdbebf; background-color: #eff0f2; border-radius: 0.5em;">

														<table width="100%" style="margin-top: 10px;">
															<tbody>
																<tr><td align="center"><h5>Surat Pernyataan</h5></td></tr>
																<tr>
																	<td>
																		<p style="font-size: 11px;">Saya yang
																			bertanda-tangan di bawah ini:</p>
																		<table style="margin-left: 15px; font-size: 11px;"
																			width="100%" border="0" class="">
																			<tbody>


																				<tr>
																					<td width="70%" valign="top">
																						<table width="80%" border="0" class="">

																							<tr>
																								<td width="30%">Nama lengkap sesuai
																									identitas</td>
																								<td width="2%">:</td>
																								<td width="38%" align="left"><span
																									id="cst_fname" class="cst_fname"></span>&nbsp;<span
																									id="cst_lname" class="cst_lname"></span></td>
																							</tr>

																							<tr>
																								<td width="30%">No. KTP</td>
																								<td width="2%">:</td>
																								<td width="38%" align="left"><span
																									id="cst_ktp"></span></td>
																							</tr>
																							<tr>
																								<td width="30%">Umur</td>
																								<td width="2%">:</td>
																								<td width="38%" align="left"><span id="age"></span>
																									Tahun</td>
																							</tr>
																							<tr>
																								<td width="30%">Alamat Email/Surel</td>
																								<td width="2%">:</td>
																								<td width="38%" align="left"><span
																									id="cst_email"></span></td>
																							</tr>
																							<tr>
																								<td width="30%">Nomor telepon seluler</td>
																								<td width="2%">:</td>
																								<td width="38%" align="left"><span
																									id="cst_phone_mobile"></span></td>
																							</tr>
																						</table>



																					</td>
																					<td width="30%" ></td>
																				</tr>

																			</tbody>
																		</table>
																		<p
																			style="margin-left: 15px; font-size: 11px; margin-top: 20px;">-
																			berikut dengan segala data dan informasi baik yang
																			tersedia secara elektronik maupun secara fisik (untuk
																			selanjutnya disebut "Penerima Pinjaman")</p>
																	</td>
																</tr>

																<tr>
																	<td>
																		<p style="font-size: 11px;">Dengan ini saya
																			menyatakan bahwa :</p>
																		<table style="margin-left: 15px; font-size: 11px;"
																			width="100%">
																			<tr>
																				<td valign="top">1.</td>
																				<td valign="top">Saya telah mengajukan
																					permohonan pinjaman KiniCintaku serta telah membaca
																					dan memahami sepenuhnya segala persyaratan pinjaman
																					KiniCintaku.</td>
																			</tr>
																			<tr>
																				<td valign="top">2.</td>
																				<td valign="top">Saya bersedia dilakukan
																					pemeriksaan latar belakang baik secara langsung
																					atau tidak langsung atas data kredit saya
																					sehubungan dengan permohonan pinjaman KiniCintaku.</td>
																			</tr>
																			<tr>
																				<td valign="top">3.</td>
																				<td valign="top">Saya telah menerima sejumlah
																					uang sebagai pinjaman.</td>
																			</tr>

																			<tr>
																				<td valign="top"></td>
																				<td valign="top">
																					<table
																						style="margin-left: 15px; font-size: 11px; margin-top: 15px;"
																						width="60%">
																						<tr>
																							<td width="35%">Harga pembelian barang</td>
																							<td width="5%">:</td>
																							<td width="5%">Rp.&nbsp;</td>
																							<td align="right"><span id="tot_pembelian"></span></td>
																						</tr>
																						<tr>
																							<td width="35%">Uang muka pembelian barang</td>
																							<td width="5%">:</td>
																							<td width="5%">Rp.&nbsp;</td>
																							<td align="right"><span id="dp_paid"></span></td>
																						</tr>
																						<tr>
																							<td width="35%"><b>Nilai pembiayaan /
																									pinjaman</b><b></b></td>
																							<td width="5%"><b>:</b></td>
																							<td width="5%"><b>Rp.&nbsp;</b></td>
																							<td align="right"><b><span
																									id="r_purpose"></span></b></td>

																						</tr>

																					</table>
																					<table
																						style="margin-left: 15px; font-size: 11px; margin-top: 15px;"
																						width="60%">
																						<tr>
																							<td width="35%">Biaya Proses</td>
																							<td width="5%">:</td>
																							<td width="5%">Rp.&nbsp;</td>
																							<td align="right"><span id="admin"></span></td>
																						</tr>
																						<tr>
																							<td width="35%">Biaya Asuransi (apabila ada)</td>
																							<td width="5%">:</td>
																							<td width="5%">Rp.&nbsp;</td>
																							<td align="right"><span>0</span></td>
																						</tr>
																						<tr>
																							<td width="35%"><b>Biaya Penagihan
																									(apabila perlu)</b></td>
																							<td width="5%"><b>:</b></td>
																							<td width="5%"><b>Rp.&nbsp;</b></td>
																							<td align="right"><b><span>0</span></b></td>
																						</tr>

																					</table>
																					<table
																						style="margin-left: 15px; font-size: 11px; margin-top: 15px; margin-bottom: 15px;"
																						width="60%">
																						<tr>
																							<td width="35%">Jangka Waktu Pinjaman</td>
																							<td width="5%">:</td>
																							<td width="5%"></td>
																							<td align="right"><span id="r_tenor"></span>
																								bulan</td>
																						</tr>
																						<tr>
																							<td width="35%">Suku Bunga</td>
																							<td width="5%">:</td>
																							<td width="5%"></td>
																							<td align="right"><span
																								id="interest_amount_promo"></span> % <span
																								id="interest_calc"></span></td>
																						</tr>
																						<tr>
																							<td width="35%">Biaya Administrasi Angsuran</td>
																							<td width="5%">:</td>
																							<td width="5%">Rp.&nbsp;</td>
																							<td align="right"><span
																								id="cost_monthly_value"></span></td>
																						</tr>
																						<tr>
																							<td width="35%"><b>Angsuran /bulan</b></td>
																							<td width="5%"><b>:</b></td>
																							<td width="5%"><b>Rp.&nbsp;</b></td>
																							<td align="right"><b><span
																									id="r_installment"></span>&nbsp; </b>setiap
																								pembayaran</td>
																						</tr>

																						<tr>
																							<td width="35%">Tanggal Pembayaran / Bulan</td>
																							<td width="5%">:</td>
																							<td width="5%"></td>
																							<td align="right"><span id="datepayment"></span></td>
																						</tr>
																						<tr>
																							<td width="28%">Denda keterlambatan</td>
																							<td width="5%">:<b></b></td>
																							<td width="5%">Rp.</td>
																							<td align="right"><span id="denda"></span>/Hari</td>
																						</tr>
																					</table>

																				</td>
																			</tr>
																			<tr>
																				<td valign="top">4.</td>
																				<td valign="top">Saya sanggup untuk melakukan
																					jadwal pembayaran sesuai dengan jadwal yang
																					ditetapkan dalam butir 3 diatas, dengan perhitungan
																					pokok dan bunga sebagaimana tertera dalam akun saya
																					di KiniCintaku.</td>
																			</tr>
																			<tr>
																				<td valign="top">5.</td>
																				<td valign="top">Saya setuju dan sepakat
																					terhadap Perjanjian Pembiayaan sebagaimana ternyata
																					dalam Perjanjian Pembiayaan No. <span
																					id="va_number"></span>, Syarat dan Ketentuan Umum,
																					dan berikut Surat Pernyataan ini beserta dengan
																					seluruh dokumen terkait lainnya yang merupakan satu
																					kesatuan dengan Perjanjian Pembiayaan.
																				</td>
																			</tr>
																			<tr>
																				<td valign="top">6.</td>
																				<td valign="top">Atas pinjaman KiniCintaku,
																					saya telah menggunakannya untuk melakukan pembelian
																					barang sesuai dengan Bukti Pembelian yang merupakan
																					bagian tidak terpisahkan dengan Surat Pernyataan
																					ini, dengan Rincian Pembelian sebagai berikut :</td>
																			</tr>
																			<tr>
																				<td valign="top"></td>
																				<td valign="top">
																					<table style="font-size: 11px;" width="60%">
																						<tr>
																							<td width="28%">Nama Toko</td>
																							<td width="5%">:</td>
																							<td align="left"><span id="branch_name"></span></td>
																						</tr>
																						<tr>
																							<td width="28%">Nama Barang</td>
																							<td width="5%">:</td>
																							<td align="left"><span id="prdPrc"></span></td>
																						</tr>
																						<tr>
																							<td width="28%"><b>Harga pembelian
																									barang</b><b></b></td>
																							<td width="5%"><b>:</b></td>
																							<td align="left"><b>Rp.&nbsp;<span
																									id="total"></span></b></td>
																						</tr>

																					</table>
																				</td>
																			</tr>
																			<tr>
																				<td valign="top">7.</td>
																				<td valign="top">Atas pembelian barang
																					sebagaimana dimaksud dalam butir 6 diatas, saya
																					telah membayar sejumlah:</td>
																			</tr>
																			<tr>
																				<td valign="top"></td>
																				<td valign="top">
																					<table style="font-size: 11px;" width="100%">
																						<tr>
																							<td>a).</td>
																							<td align="left">Rp. <span id="biayaProses"></span>
																								kepada PT Dana Kini Indonesia, untuk biaya
																								proses;
																							</td>
																						</tr>
																						<tr>
																							<td>b).</td>
																							<td align="left">Rp. <span id="DpProses"></span>
																								kepada PT HCI, untuk uang muka pembelian barang;
																							</td>
																						</tr>
																					</table>
																				</td>
																			</tr>
																			<tr>
																				<td valign="top">8.</td>
																				<td valign="top">Saya telah menerima barang
																					sebagaimana dimaksud dalam butir 5 diatas, dalam
																					keadaan baik, lengkap, dan berfungsi sebagaimana
																					layaknya.</td>
																			</tr>
																		</table>
																		<p style="font-size: 11px; margin-top: 10px;">Surat
																			Pernyataan ini dibuat sebagai kelengkapan pinjaman
																			program KiniCintaku, terkait pembiayaan melalui
																			perusahaan pinjam meminjam yang berbasis teknologi
																			(Peer to Peer Lending) melalui PT Dana Kini
																			Indonesia, berkedudukan di Jakarta Barat.</p>
																		<p style="font-size: 11px;">Surat Pernyataan ini
																			saya buat dengan sebenarnya, dalam keadaan sadar, dan
																			tanpa paksaan dari pihak manapun</p>
																	</td>
																</tr>

															</tbody>
														</table>


														<table width="30%"
															style="margin-top: 10px; font-size: 11px;">
															<tr>
																<td align="left"><span id="ads_field_1"></span>,<span
																	id="dateTtd"></span><br>Penerima Pinjaman<br>
																	<br> <br></td>
																<td></td>
																<td align="left"></td>
															</tr>
															<tr>
																<td align="left" valign="top">Materai 6000<br>
																	<br> <br></td>
																<td></td>
																<td align="left">
																	<%-- <b style="border-bottom: 1.5px solid black;">&nbsp;${name}</b> --%>
																</td>
															</tr>
															<tr>
																<td align="left"><b
																	style="border-bottom: 1.5px solid black;"><span
																		id="cst_fname" class="cst_fname"></span>&nbsp;<span
																		id="cst_lname" class="cst_lname"></span></b></td>
																<td></td>
																<td align="left"></td>
															</tr>

														</table>
														<a
															href="${local_server}/print_doc/${id}/surat_pernyataan/${booking_code}"
															target="_blank" class="btn btn-success center"><i
															class="fa fa-print "></i> Cetak Surat Pernyataan</a>
															

													</div>
													<!--EOF Steps-->



													<div class="row">
														<div class="simplebox" align="right">
															<button type="button" id="btnCancel"
																class="btn btn-danger btn-lg">Batal</button>

															<a id="btnSave" onclick="loadding(this.id);"
																href="${local_server}/KiniCintaku/getKiniCintaku6/det/${id}"
																class="btn btn-primary btn-lg">Simpan</a>
														</div>
													</div>




												</div>
												<!-- /.box -->


											</div>
											<!-- /.col-md-9 -->



										</div>
										<!-- /.row -->

									</div>
									<!-- /.container -->
								</div>

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

<script type="text/javascript">
	function loadding(id) {
		$("#" + id)
				.html("<i class='fa fa-circle-o-notch fa-spin'></i>  Simpan")
				.addClass("Disabled");
	}
	$(document)
			.ready(
					function() {
						var currentDate = new Date();
						var day = currentDate.getDate();
						var month = currentDate.getMonth();
						var year = currentDate.getFullYear();
						var monthNames = ["Januari", "Februari", "Maret", "April", "Mei", "Juni",
							  "Juli", "Agustus", "September", "Oktober", "November", "Desember"
							];

						$("#dateTtd").html(
								" " + day + " " + monthNames[month] + " " + year + "");
						getData();
						getTempTable();
						$("#formInput2")
								.submit(
										function(e) {
											$
													.ajax({
														url : '${local_server}/print_doc/file/${id}/sp',
														type : 'POST',
														data : new FormData(
																this),
														processData : false,
														contentType : false,
														cache : false,
														success : function(data) {
															$("#formInput2")[0]
																	.reset();
															$.alert(data);

														}
													});
											e.preventDefault();
										});

						$("#formInput3")
								.submit(
										function(e) {
											$
													.ajax({
														url : '${local_server}/print_doc/file/${id}/spb',
														type : 'POST',
														data : new FormData(
																this),
														processData : false,
														contentType : false,
														cache : false,
														success : function(data) {
															$("#formInput3")[0]
																	.reset();
															$.alert(data);

														}
													});
											e.preventDefault();
										});

						$("#btnCancel")
								.click(
										function() {
											$
													.confirm({
														title : "Confirm",
														content : "Dengan membatalkan pinjaman, semua data pengajuan nasabah akan dihapus, please confirm ?",
														buttons : {
															cancel : function() {
																$
																		.alert('Canceled!');
															},
															somethingElse : {
																text : 'Hapus Pengajuan',
																btnClass : 'btn-danger',
																keys : [ 'enter' ],
																action : function() {

																	var url = "${local_server}/KiniCintaku/cancelKiniCintaku/${rshid}";

																	$
																			.ajax({
																				type : "POST",
																				url : url,
																				data : "rshid=${id}",
																				cache : false,
																				complete : function(
																						xhr,
																						status) {
																					if (status === 'error'
																							|| !xhr.responseText) {
																						console
																								.log(status);
																					} else {

																						var data = JSON
																								.parse(xhr.responseText);
																						console
																								.log(data);
																						$
																								.confirm({
																									title : "",
																									content : data.message,
																									buttons : {
																										somethingElse : {
																											text : 'OK',
																											btnClass : 'btn-success',
																											keys : [ 'enter' ],
																											action : function() {

																												window.location.href = "${local_server}/KiniCintaku";

																											}
																										}

																									}
																								});
																					}
																				}
																			});

																}
															}

														}
													});
										});
					});

	function getTempTable() {
		$
				.ajax({
					type : 'GET',
					asyn : true,
					url : '${local_server}/KiniCintaku/gettemptable/${id}',
					dataType : "json",
					success : function(data) {
						console.log(data);
						if (data.status == "Success") {
							if (Object.keys(data.data3).length > 0) {
								var html = '<div class="alert alert-warning">';

								html += '<strong><i class="fa fa-pencil-square-o "></i> Chasier '
										+ data.data3[0].rsr_cashier_id
										+ ' Catatan :</strong><br> ';

								html += '<i>' + data.data3[0].rsr_notes
										+ '</i>';

								html += "</div>";
								$("#note").html(html);
							}

						}
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
														o = o.substring(5);
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
												+ '" class="img-responsive" width="150px">';
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
						
						 var branch_code = "${booking_code}";
						 
						if(branch_code!=""){
							getPurchase(branch_code);
						}else if(response.data[0].booking_code!=null&& response.data[0].booking_code!=null){
							getPurchase(response.data[0].booking_code);
						}
						
						

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

			return '' + rev2.split('').reverse().join('')
		} else {
			return '0'
		}

	}

	function getPurchase(id) {
		$.ajax({
			type : "GET",
			url : "${local_server}/print_doc/${id}/product/"+id,
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
					//getParse();

				}

			},
			complete : function() {

			}

		});
	}
	function getParse() {
		$.ajax({
			type : "GET",
			url : "${local_server}/print_doc/${id}/parse",
			async : false,
			dataType : "json",
			success : function(response) {
				console.log(response.data);
				if (response.status == "Success") {
					if (Object.keys(response.data).length > 0) {
						var x = (response.data[0].rhs_date != null&&response.data[0].rhs_date!="")?response.data[0].rhs_date:response.data[0].rhs_date;
						$("#datepayment").html(x);
					}
					//window.print();

				}

			},
			complete : function() {

			}

		});
	}
	
	function convertDateAPI(val) {

		var monthNames = [ "Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli",
				"Agustus", "September", "Oktober", "November", "Desember" ];
		var value = new Date(val.replace(/(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3"));
		var tgl = value.getDate();
		var bln = value.getMonth(); //+1;
		var thn = value.getFullYear();
		var dat = tgl + " " + monthNames[bln] + " " + thn;
		return dat;
	}
</script>


<html></html>

