<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Reassignment" />
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

			<div class="modal fade" id="myModalSimulasi" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog modal-lg	" role="document">
					<div class="modal-content">
						<form id="formInput">
							<input type="hidden" name="new_edit_status" id="new_edit_status" />
							<input type="hidden" name="rul_id" id="rul_id" />
							<div class="modal-header">

								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Simulasi</h4>
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

			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog modal-lg	" role="document">
					<div class="modal-content">
						<form id="formInput">
							<input type="hidden" name="new_edit_status" id="new_edit_status" />
							<input type="hidden" name="rul_id" id="rul_id" />
							<div class="modal-header">

								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Detail</h4>
							</div>
							<div class="modal-body">

								<table width="100%" class="table table-bordered">
									<tbody>
										<tr>
											<td width="50%">
												<h5>Detail Customer</h5>
												<table width="100%">
													<tbody>
														<tr>
															<td>Nama</td>
															<td align="left"><label id="cst_fname">JOKOWI</label>&nbsp;<label
																id="cst_lname"></label></td>
														</tr>
														<tr>
															<td>Email/Surel</td>
															<td align="left"><label id="cst_email">jokowi123@gmail.com</label></td>
														</tr>
														<tr>
															<td>Alamat</td>
															<td align="left"><label id="cst_address">jl.raya
																	solo 14</label></td>
														</tr>

														<tr>
															<td>Tgl. Lahir</td>
															<td align="left"><label id="cst_dob">9
																	Agustus 1988</label></td>
														</tr>
														<tr>
															<td>Jenis Kelamin</td>
															<td align="left"><label id="cst_sex">M</label></td>
														</tr>
														<tr>
															<td>No. HP</td>
															<td align="left"><label id="cst_phone_mobile">085780251809</label></td>
														</tr>

													</tbody>
												</table>

											</td>
											<td>
												<h5>Detail Pinjaman</h5>
												<table width="100%">
													<tbody>

														<tr>
															<td>Produk</td>
															<td align="left"><label id="product_code">KiniCintaku</label></td>
														</tr>


														<tr>
															<td>Pinjaman</td>
															<td align="left"><label id="loan_amount">8,000,000</label></td>
														</tr>
														<tr>
															<td>Sisa Pinjaman</td>
															<td align="left"><label id="loan_oth_cost">3,000,000</label></td>
														</tr>
														<tr>
															<td>Sisa Tenor</td>
															<td align="left"><label id="loan_disb_amount">3
																	Bulan</label></td>
														</tr>
														<tr>
															<td>Total Tagihan</td>
															<td align="left"><label id="loan_tenor">3,500,000</label>
															</td>
														</tr>




													</tbody>
												</table>
											</td>

										</tr>
									</tbody>
								</table>
								<table width="100%" style="margin-top: :10px;"
									class="table table-bordered">

									<tbody>
										<tr>
											<td width="50%" align="center"><button id="btnsimulasi"
													class="btn btn-info">Simulasi</button></td>
										</tr>
									</tbody>
								</table>
								<table width="100%" style="margin-top: :10px;"
									class="table table-bordered">

									<tbody>
										<tr>
											<td width="50%">
												<h5>Action</h5>
												<form class="form-horizontal">
													<div class="form-group">
														<label for="exampleInputEmail1">Aktifitas</label> <select
															class="form-control">
															<option>Call</option>
															<option>Appointment</option>
														</select>
													</div>
													<div class="form-group">
														<label for="exampleInputPassword1">Catatan</label>
														<textarea rows="2" class="form-control"></textarea>
													</div>
													<div class="form-group">
														<label for="exampleInputFile">Reminder</label>
														<div class="input-group">
															<input type="text" class="form-control"
																id="exampleInputAmount">
															<div class="input-group-addon">
																<i class="fa fa-calendar"></i>
															</div>
														</div>
													</div>

													<button type="submit" style="margin-bottom: 0px;"
														class="btn btn-default">Kirim</button>
												</form>

											</td>
											<td width="50%"><h5>Reassign</h5>
												<form class="form-horizontal">

													<div class="form-group">
														<label for="exampleInputPassword1">Catatan</label>
														<textarea rows="6" class="form-control"></textarea>
													</div>
													<div class="form-group">
														<label for="exampleInputFile">Collector</label>
														<div class="input-group">
															<input type="text" class="form-control"
																id="exampleInputAmount">
															<div class="input-group-btn">
																<button class="btn"
																	style="margin-bottom: 0px; border-radius: 3px; height: 34px;">
																	<i class="fa fa-search"></i>
																</button>
															</div>
														</div>
													</div>
													<button type="submit" style="margin-bottom: 0px;"
														class="btn btn-default">Kirim</button>
												</form></td>
										</tr>
									</tbody>
								</table>


							</div>
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
								<h2>Tasklist Monitoring</h2>
								<ul class="nav navbar-right panel_toolbox">

								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">

								<table class="table" id="tblReassign">
									<thead>
										<tr>
											<td><input type="checkbox"></td>
											<td>CIF</td>
											<td>No Akun</td>
											<td>Nama</td>
											<td>Produk</td>
											<td>Jumlah Hari Tunggakan</td>
											<td>Last Respon</td>
											<td>Last Action</td>
											<td>Last Action Date</td>
											<td>Action</td>
										</tr>

									</thead>
									<tbody>
										<tr>
											<td><input type="checkbox"></td>
											<td>000000000123131</td>
											<td>00000000000021312</td>
											<td>Jokowi</td>
											<td>KiniCintaku</td>
											<td>90</td>
											<td>Nasabah Janji bayar</td>
											<td>Call</td>
											<td>19-02-2018</td>
											<td><button id="1" class="viewDet btn btn-xs btn-succes">
													<i class="fa fa-edit"></i>
												</button></td>
										</tr>

									</tbody>
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
						$("#tblReassign").DataTable();
						$("#tblReassign_filter")
								.append(
										"<button class='btn btn-sm btn-default'>Ditugaskan kembali (Bulk/ganda)</button>");
						$('#tblReassign').on('click', 'button.viewDet',
								function(e) {
									$("#myModal").modal("show");
								});
						$("#btnsimulasi").on("click", function(e) {
							$("#myModalSimulasi").modal("show");
							e.preventDefault()
						})

					});
</script>

</html>

