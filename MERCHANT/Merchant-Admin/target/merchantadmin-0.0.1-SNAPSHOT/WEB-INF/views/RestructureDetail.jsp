<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Inquiry" />
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
			
			<div class="modal fade" id="myModalRPY" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" style="z-index: 9999;">
				<div class="modal-dialog modal-lg" role="document">
					
						<input type="hidden" name="new_edit_status" id="new_edit_status" />
						<input type="hidden" name="accNO" id="accNO" />
						<input type="hidden" name="tot" id="tot" />
						<div class="modal-content">

							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Rincian</h4>
							</div>
							<div class="modal-body">
								<div id="detailPayment"></div>

							</div>
							<div class="modal-footer">
								<button class="btn btn-default" data-dismiss="modal">Tutup</button>
							</div>
						</div>

				</div>
			</div>
			
			<div class="modal fade" id="view-modal-ManPay" style="z-index: 99999;"
				tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog modal-lg" role="document">
				<form method="post" id="formInputPayment">
					<div class="modal-content">
						<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
			                <h5>Rincian Restructure</h5>			                
			            </div>
			            <div class="modal-body">
			            	<input type="hidden" id="accNoHid" name="accNoHid">
			            	<input type="hidden" id="amountHid" name="lstPeriodHid">
			            	<input type="hidden" id="befJumBar" name="befJumBar" value=0>
			            	
							<div id="billingDetailPriorityFilter"></div>
							<br />
							<div id="billingDetailPriority">		
							</div>
							
							<div id="sisNote" style="display:none;">	
								<div class="row">
	                                <div class="col-md-4">
	                                    <div class="form-group">
	                                        <label><b>Tenor After Restructure</b></label>
	                                        <!-- <input type="text" class="form-control datepicker11" autocomplete="off" maxlength="10" data-date-format="YYYY-MM-DD" required id="TangYar" name="TangYar"> -->
	                                        <input type="text" class="form-control" required id="tenAftRes" name="tenAftRes" onkeypress="return isNumberKey(event)" onchange="tenorAftChange()">
	                                    </div>
	                                </div> 								
								</div>					
								<div class="row">
									<div class="col-md-4">
											<div class="form-group">
													<label><b>Bunga After Restructure (%)</b></label>
													<!-- <input type="text" class="form-control datepicker11" autocomplete="off" maxlength="10" data-date-format="YYYY-MM-DD" required id="TangYar" name="TangYar"> -->
													<input type="text" class="form-control" required id="bungAftRes" name="bungAftRes" onkeypress="return isNumberKey(event)" onchange="bungaAftChange()"> 
											</div>
									</div> 								
								</div>	
								<div class="row">
									<div class="col-md-4">
											<div class="form-group">
													<label><b>First Statement Date</b></label>
													<input type="text" class="form-control datepicker11" autocomplete="off" maxlength="10" data-date-format="YYYY-MM-DD" id="firstStDate" name="firstStDate" value="" disabled>

											</div>
									</div> 								
								</div>			
								<!-- <div class="row">
	                                <div class="col-md-4">
	                                    <div class="form-group">
	                                        <label><b>Catatan</b></label>
	                                        <textarea class="form-control" cols="20" rows="5" id="notes" name="notes"></textarea> 
	                                    </div>
	                                </div> 								
								</div> -->
							</div>
							<button type="button" id="btnShowTable" class="btn btn-primary " style="margin-top: 5px;margin-left: 5px;">Simulasi Tabel</button>

							<table id="simulation_table"
															class="table table-hover" width="100%">
															<thead>
																<tr>
																	<td width="5%">Cicilan ke</td>
																	<!-- <td width="20%">Bunga/ Bulan</td> -->
																	<td width="10%">Installment</td>
																	<td width="10%">Pokok</td>
																	<td width="10%">Bunga</td>
																	<td width="10%">Outstanding</td>
																	<td width="10%">Pokok Lama</td>
																	<td width="10%">Bunga Lama</td>
																	<td width="10%">Statement Date</td>
																	<td width="10%">Due Date</td>
																</tr>
															</thead>
														</table>
							
							
							<br/>
							
							<div id="restructureCalculation">
								
							</div> 
							
						</div>
							
						<div id="dvSave" class="modal-footer" style="display:none">
			                <button type="button" id="btnCancel" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
			                <button type="submit" id="btnSave" class="btn btn-primary" disabled>Simpan</button>
							<!-- <button type="button" id="btnSavePriorityBilling" class="btn btn-primary">Simpan</button> -->
			            </div>	
					</div>
					</form>
				</div>
			</div>
			
			
			
			
			<div class="modal fade" id="myModal" style="z-index: 99999;"
				tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<form id="formInput" action="">
							<input type="hidden" name="new_edit_status" id="new_edit_status" />
							<input type="hidden" name="rul_id" id="rul_id" />
							<div class="modal-header">

								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel3">Rincian Cicilan</h4>
							</div>
							<div class="modal-body">

								<table id="tblDetail" class="table table-hover" width="100%">
									<thead>
										<td>Angsuran No.</td>
										<td>Status</td>
										<td>Jumlah Tagihan</td>
										<td>Tanggal Angsuran</td>
										<td>Batas Waktu</td>
										<td>Sisa Pinjaman</td>
										<td>DPD</td> 
										<td>Biaya Keterlambatan</td>
										<td>Biaya Penagihan</td>
									</thead>
									<tbody></tbody>
								</table>
							</div>
							<div class="modal-footer">
								<button class="btn btn-default" data-dismiss="modal">Tutup</button>
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="modal fade" id="myModalRepay" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">x</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">Restrukturisasi </h4>
						</div>
						<div class="modal-body" id="modal-content-repayment">
							<table class="table table-striped table-bordered" width="80%">
								<tbody>
									<tr>
										<td style="width: 25%"><b>Tanggal Pengajuan</b></td>
										<td><div class="row">
												<div class="col-xs-6">
													<input type="text" class="form-control datepicker11"
														name="rpy_date" title="(YYYY-MM-DD)" id="rpy_date"
														data-date-format="YYYY-MM-DD" readonly="readonly" />

												</div>
												<!-- <div class="col-xs-2">
													<input type="button" class="btn btn-primary pull-right"
														onClick="checkSimulation();" value="Check" />
												</div> -->
											</div></td>
									</tr> 
									<tr>
										<td style="width: 25%"><b>No. Pinjaman</b></td>
										<td><span id="spn_1"></span></td>
									</tr>
									<tr>
										<td><b>Jumlah Pinjaman</b></td>
										<td><span id="spn_2" class="rest"></span></td>
									</tr>
									<tr>
										<td><b>Tenor</b></td>
										<td><span id="spn_3" class="rest"></span></td>
									</tr>
									<tr>
										<td><b>Sisa Pokok Pinjaman</b></td>
										<td><span id="spn_4" class="rest"></span></td>
									</tr>
									<tr>
										<td><b>Tagihan Tertunggak</b></td>
										<td><span id="spn_4a" class="rest"></span></td>
									</tr>
									<tr>
										<td><b>Sisa Tenor</b></td>
										<td><span id="spn_5" class="rest"></span></td>
									</tr>
									<!-- <tr>
										<td><b>Biaya Penalti</b></td>
										<td><span id="spn_6" class="rest"></span></td>
									</tr> --> 
									<tr>
										<td><b>Biaya Administrasi</b></td>
										<td><span id="spn_7" class="rest"></span></td>
									</tr>
									<tr></tr>
									<tr>
										<td><b>Biaya Charge</b></td>
										<td><span id="spn_11" class="rest"></span></td>
									</tr>
									<tr>
										<td><b>Bunga Keterlambatan</b></td>
										<td><span id="spn_8" class="rest"></span></td>
									</tr>
									<tr>
										<td><b>Total</b></td>
										<td><span id="spn_9" class="rest"></span></td>
									</tr>
									<tr>
										<td><b>Paling Lambat Dibayarkan</b></td>
										<td><span id="spn_10" class="rest"></span></td>
									</tr>
								</tbody>
							</table>
							<input type="hidden" id="flagmodal-content-repayment"
								value="show"><input type="hidden" id="hid_acc_no"
								value=""><input type="hidden" id="hid_due_date" value="">
						</div>
						<div class="modal-footer" i="">
							<button type="button" class="btn btn-default pull-left"
								data-dismiss="modal">Tutup</button>
							<div id="btnsetuju" class=""></div>


						</div>
					</div>
				</div>
			</div>

			<div class="modal fade" id="view-modal" style="z-index: 99999;"
				tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<form id="formInput" action="">
							<input type="hidden" name="new_edit_status" id="new_edit_status" />
							<input type="hidden" name="rul_id" id="rul_id" />
							<div class="modal-header">

								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabelZ">Tampilkan Rincian</h4>
							</div>
							<div class="modal-body  edit-content">
								<div class="content">
									<div class="row">
										<div class="col-md-8">
											<h5>
												<i class="fa fa-cart-arrow-down "></i> Produk Yang Dibeli
											</h5>
										</div>
									</div>
									<hr class="hrdotted" />

									<div class="row">
										<div class="col-md-12">
											<table id="tblDetail" class="table table-bordered"
												width="100%">
												<thead>
													<tr>
														<td>Kategori</td>
														<td>Produk</td>
														<td>Harga</td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><span id="category1"></span></td>
														<td><span id="product1"></span></td>
														<td>Rp. <span id="amount1"></span></td>
													</tr>
												</tbody>
												<tfoot>
													<tr>
														<td colspan="2">Total</td>
														<td>Rp. <span id="spnTotal"></span></td>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>


									<div class="row">
										<div class="col-md-8">
											<h5>
												<i class="fa fa-institution "></i> Informasi Toko
											</h5>
										</div>
									</div>
									<hr class="hrdotted" />

									<div class="row">
										<div class="col-md-12">
											<table width="100%">
												<tr>
													<td width="40%">Nama Toko</td>
													<td width="60%"><span id="branch_name"></span></td>
												</tr>
												<tr>
													<td>Alamat</td>
													<td><span id="branch_address"></span></td>
												</tr>
												<tr>
													<td>Customer Service</td>
													<td><span id="referral_id"></span></td>
												</tr>
											</table>
										</div>
									</div>

									<div class="row">
										<div class="col-md-8">
											<h5>
												<i class="fa fa-bars "></i> Detail Pengajuan
											</h5>
										</div>
									</div>
									<hr class="hrdotted" />

									<div class="row">
										<div class="col-md-12">
											<table width="100%">
												<tr>
													<td width="40%">Harga Pembelian Barang</td>
													<td width="60%">Rp. <span id="r_amount"></span></td>
												</tr>
												<tr>
													<td>Uang Muka Pembelian Barang</td>
													<td>Rp. <span id="dp_paid"></span></td>
												</tr>
												<tr>
													<td>Nilai Pembiayaan / Pinjaman</td>
													<td>Rp. <span id="r_purpose"></span></td>
												</tr>
												<tr>
													<td>Biaya Proses</td>
													<td>Rp. <span id="cost_onetime_value"></span></td>
												</tr>
												<tr>
													<td>Biaya Asuransi (Apabila Ada)</td>
													<td>Rp. <span id="">0</span></td>
												</tr>
												<tr>
													<td>Biaya Penagihan (Apabila Perlu)</td>
													<td>Rp. <span id="">0</span></td>
												</tr>
												<tr>
													<td>Jangka Waktu Pinjaman</td>
													<td><span id="r_tenor"></span> Bulan</td>
												</tr>
												<tr>
													<td>Suku Bunga</td>
													<td><span id="interest_amount_promo"></span> % Flat</td>
												</tr>
												<tr>
													<td>Biaya Administrasi Angsuran</td>
													<td>Rp. <span id="cost_monthly_value"></span></td>
												</tr>
												<tr>
													<td>Angsuran /Bulan</td>
													<td>Rp. <span id="r_installment"></span></td>
												</tr>
												<tr>
													<td>Tanggal Pembayaran /Bulan</td>
													<td><span id="action_date"></span></td>
												</tr>
												<tr>
													<td>Denda Keterlambatan /Hari</td>
													<td>Rp. <span id="denda"></span></td>
												</tr>
											</table>
										</div>
									</div>

								</div>
							</div>
							<div class="modal-footer">
								<button class="btn btn-default" data-dismiss="modal">Tutup</button>
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="modal fade" id="myModalImage" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span>
							</button>
							<br />
						</div>
						<div class="modal-body"></div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->

			<div class="modal fade" id="myModalRepayment" style="z-index: 99999;"
				tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">

							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel6">Rincian Restrukturisasi</h4>
						</div>
						<div class="modal-body">
							<table id="tableDetRepayment" class="table table-hover"
								width="100%">
								<thead>
									<tr>
										<td>No Akun</td>
										<td>Tipe</td>
										<td>Deskripsi</td>
										<td>Jumlah</td>

									</tr>
								</thead>
							</table>

						</div>
						<div class="modal-footer">
							<button class="btn btn-default" data-dismiss="modal">Tutup</button>
						</div>
					</div>

				</div>
			</div>


			<div class="modal fade" id="myModalBilling" style="z-index: 99999;"
				tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<form id="formInput" action="">
							<input type="hidden" name="new_edit_status" id="new_edit_status" />
							<input type="hidden" name="rul_id" id="rul_id" />
							<div class="modal-header">

								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel2">Rincian Tagihan</h4>
							</div>
							<div class="modal-body">

								<table id="tblDetailBilling" class="table table-hover"
									width="100%">
									<thead>
										<td>Kategori</td>
										<td>Jumlah</td>
										<td>Keterangan</td>
										<td>Tanggal perubahan</td>

									</thead>
									<tbody></tbody>
								</table>
							</div>
							<div class="modal-footer">
								<button class="btn btn-default" data-dismiss="modal">Tutup</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal fade" id="myModalPayment" style="z-index: 99999;"
				tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<form id="formInput" action="">
							<input type="hidden" name="new_edit_status" id="new_edit_status" />
							<input type="hidden" name="rul_id" id="rul_id" />
							<div class="modal-header">

								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel1">Restrukturisasi</h4>
							</div>
							<div class="modal-body"></div>
							<div class="modal-footer">
								<button class="btn btn-default" data-dismiss="modal">Tutup</button>
							</div>
						</form>
					</div>
				</div>
			</div>



			<div class="right_col" role="main">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-lg-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<div class="clearfix"></div>
							</div>
							<div class="x_content">

								<div class="row">
									<div class="col-md-3 col-sm-3 col-xs-12 profile_left">
										<!-- Profile Image -->
										<div class="box box-primary">
											<div class="box-body box-profile">
												<a class="fancybox" href="../img/toon.jpg"> <img
													class="profile-user-img img-responsive img-circle"
													src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg"
													alt="User profile picture"></a>
												<h4 class="profile-username text-center">
													<span id="sName"></span>
												</h4>
												<p class="text-muted text-center">
													<span id="sJob"></span>
												</p>

												<div class="panel panel-default"></div>
												<ul class="list-group list-group-unbordered">
													<li class="list-group-item"><b><i
															class="fa fa-calendar" aria-hidden="true"></i></b> <a><span
															id="sDOB"></span></a></li>
													<li class="list-group-item"><b><i
															class="fa fa-location-arrow" aria-hidden="true"></i></b><a><span
															id="sLocation"></span></a></li>
													<li class="list-group-item"><b><i
															class="fa fa-intersex" aria-hidden="true"></i></b><a><span
															id="sGender"></span></a></li>
													<li class="list-group-item"><b><i
															class="fa fa-intersex" aria-hidden="true"></i></b><a><span
															id="sMaritalStatus"></span></a></li>
													<li class="list-group-item">
														<table border="0">
															<tr>
																<td><b><i class="fa fa-phone"
																		aria-hidden="true"></i></b></td>
																<td>&nbsp;</td>
																<td>Telfon Kantor :</td>
															</tr>
															<tr>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td><span id="sBussinessPhone"></span></td>
															</tr>
															<tr>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>Telfon Rumah :</td>
															</tr>
															<tr>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td><span id="sHomePhone"></span></td>
															</tr>
															<tr>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td>Ponsel :</td>
															</tr>
															<tr>
																<td>&nbsp;</td>
																<td>&nbsp;</td>
																<td><span id="sMobilePhone"></span></td>
															</tr>
														</table>
													</li>
												</ul>
												<!--<div align="right"><a href="#"><i>Detail</i></a></div>-->
											</div>
											<!-- /.box-body -->
										</div>
										<!-- /.box -->
										<!-- 
								    <fieldset class="scheduler-border" style="height:220px;">
								    <legend class="scheduler-border"><a href="#"><i class="fa fa-external-link "></i></a></legend>
								        Customer Just Merried In Few Days Ago
								    </fieldset>
								-->
									</div>


									<div class="col-md-9 col-sm-9 col-xs-12">
										<div class="row">
											<div class="col-sm-12">
												<div>

													<!-- Nav tabs -->
													<ul class="nav nav-tabs" role="tablist">
														<li role="presentation" class="active"><a
															href="#home" aria-controls="home" role="tab"
															data-toggle="tab">Info Profil</a></li>


													</ul>

													<!-- Tab panes -->
													<div class="tab-content">
														<div role="tabpanel" class="tab-pane active" id="home"
															style="padding-top: 2px;">

															<fieldset class="scheduler-border">
																<div id='customer'></div>
															</fieldset>
															<fieldset class="scheduler-border hide">
																<legend class="scheduler-border">
																	<a href="#"><i class="fa fa-credit-card "></i>
																		Pembayaran</a>
																</legend>
																<div id='payment'>
																	<button class="btn btn-primary" id="btnRepayment">
																		<i class="fa fa-credit-card-alt"></i> Pelunasan Dipercepat
																	</button>
																</div>
															</fieldset>
														</div>

													</div>

												</div>

											</div>
											<div class="clearfix"></div>
										</div>
									</div>
									<div class="col-md-9 col-sm-12 col-xs-12">
										<div class="row">
											<div class="" role="tabpanel"
												data-example-id="togglable-tabs">
												<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
													<li role="presentation" class="active"><a
														href="#tab_content1" id="home-tab" role="tab"
														data-toggle="tab" aria-expanded="true">Status Pinjaman Baru</a></li>
														
													<li role="presentation"><a
														href="#tab_content2" id="repayment-tab" role="tab"
														data-toggle="tab" aria-expanded="true">Restructure</a></li>

												</ul>
												<div id="myTabContent" class="tab-content">

													<div role="tabpanel" class="tab-pane fade active in"
														id="tab_content1" aria-labelledby="home-tab">
														<table id="pending_product_table"
															class="table table-hover" width="100%">
															<thead>
																<tr>
																	<td width="20%">No Akun</td>
																	<td width="20%">Produk</td>
																	<td width="10%">Jumlah Pinjaman</td>
																	<td width="10%">Tenor</td>
																	<td width="10%">Tanggal</td>
																	<td width="10%">Angsuran</td>
																	<td width="10%">Status</td>
																	<td width="10%">Tindakan</td>
																</tr>
															</thead>
														</table>
													</div>
													
													<div role="tabpanel" class="tab-pane fade"
														id="tab_content2" aria-labelledby="repayment-tab">
														<table id="repayment_table"
															class="table table-hover" width="100%">
															<thead>
																<tr>
																	<td width="20%">No Akun</td>
																	<td width="20%">Nomor VA</td>
																	<td width="10%">Jumlah</td>
																	<td width="10%">Tanggal buat</td>
																	<td width="10%">Berlaku hingga</td>
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
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page='_Footer_Note.jsp'></jsp:include>
		</div>
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
	//start : load data
	var tdsty = ' valign="top" style="padding:2px;" ';
	var sep = '</td><td ' + tdsty + ' width="2%">:</td><td '+tdsty+'>';
	var customer = $('#customer');
	customer.html('<i class="fa fa-circle-o-notch fa-spin"></i> Loading..');

	$(document).on('click', '[data-toggle="lightbox"]', function(event) {
		event.preventDefault();
		$(this).ekkoLightbox();
	});
	$(document)
			.ready(
					function() {
						getCustomerInfo();
						getRepaymentList();
						//getProductAnalyst();
						
						var d = new Date(),
        				date = (d.getUTCFullYear())+'/'+(d.getUTCMonth()+1)+'/'+(d.getUTCDate());
						$("#firstStDate").val(date);
						$('.datepicker11').datetimepicker({
			                useCurrent: false,  
			                maxDate: moment()
			            });

						$("#pending_product_table").on('click',
								'button.repayment', function(e) {

									isiDataRepayment(this.id)

								});

						$("#pending_product_table")
								.on(
										'click',
										'button.edit',
										function(e) {
											var id = this.id;
											$("#myModal").modal('show');
											$
													.ajax({
														type : 'GET',
														url : '${local_server}/inquiry/getinstallment/'
																+ id,
														dataType : 'json',
														beforeSend : function() {
															$('#tblDetail')
																	.DataTable()
																	.destroy();
															$("#myModalLabel3")
																	.html(
																			"<i class='fa fa-circle-o-notch fa-spin'></i> Loading..")
														},
														success : function(
																mdata) {
															//generateDetailData(mdata.data[0]);
															$("#myModalLabel3")
																	.html(
																			"Installment Detail");
															$('#tblDetail')
																	.DataTable()
																	.destroy();
															$('#tblDetail')
																	.dataTable(
																			{
																				data : mdata.data,
																				columns : [
																						{
																							data : 'lni_month',
																						},
																						{
																							data : 'lni_month',
																							render : function(
																									data,
																									type,
																									row) {
																								return showsStatus(
																										row.lni_payment,
																										row.lni_installment)
																							}
																						},
																						{
																							data : 'lni_installment',
																							className : 'txtRigth',
																							render : function(data,
																									type, row) {
																								return toRp(row.lni_installment);
																							}
																						},

																						{
																							data : 'lni_installment_date'
																						},
																						{
																							data : 'lni_due_date'
																						},
																						{
																							data : 'lni_outstanding',
																							className : 'txtRigth',
																							render : function(data,
																									type, row) {
																								return toRp(row.lni_outstanding);
																							}
																						},
																						{
																							data : 'lsq_dpd'
																						},
																						{
																							data : 'lsq_late_amount',
																							className : 'txtRigth',
																							render : function(
																									data,
																									type,
																									row) {
																								return toRp(data);
																							}

																						},
																						{
																							data : 'collection_cost',
																							className : 'txtRigth',
																							render : function(
																									data,
																									type,
																									row) {
																								return toRp(data);
																							}

																						}

																				]

																			});
														}
													});

										});
					});

	$('#view-modal')
			.on(
					'show.bs.modal',
					function(e) {
						rshID = e.relatedTarget.id;
						actdate = e.relatedTarget.lang;
						$
								.ajax({
									type : 'GET',
									asyn : true,
									url : '${local_server}/inquiry/getViewDetailHistory/'
											+ rshID,
									dataType : 'json',
									beforeSend : function() {

										$('#tableDetRepayment').DataTable()
												.destroy();
										$("#myModalLabelZ")
												.html(
														"<i class='fa fa-circle-o-notch fa-spin'></i> Loading..")
									},
									success : function(mdata) {
										console.log("Detail TTable");
										console.log(mdata.data);
										$("#myModalLabelZ").html("Tampilkan Rincian");
										$('#action_date').html(
												convertDate(actdate));
										$
												.each(
														mdata.data[0],
														function(i, o) {
															var TagHtml = "#"
																	+ i;
															$(String(TagHtml))
																	.html("");
															if (checkExists(String(TagHtml))) {
																o = (i == "r_amount") ? toRp(o)
																		: o;
																o = (i == "dp_paid") ? toRp(o)
																		: o;
																o = (i == "r_purpose") ? toRp(o)
																		: o;
																o = (i == "cost_onetime_value") ? toRp(o)
																		: o;
																o = (i == "cost_monthly_value") ? toRp(o)
																		: o;

																if (i == "r_installment") {
																	$('#denda')
																			.html(
																					toRp(Math
																							.round(o * 0.001)));
																	o = (i == "r_installment") ? toRp(o)
																			: o;

																}

																$(
																		String(TagHtml))
																		.html(o);
															}
														});

										getViewProductList(
												mdata.data[0].booking_code,
												mdata.data[0].branch_code);
									}
								});
					});

	function cekEgibilty(val) {
		var result = $.ajax({
			type : "GET",
			url : "${local_server}/inquiry/cekegibility/" + val,
			async : false,
			success : function(msg) {

			}
		}).responseText;
		var jr = JSON.parse(result);
		var rt
		if(typeof jr.data != "undefined") {
			rt = (jr.data.eligibility != null && jr.data.eligibility != null) ? jr.data.eligibility: false;	
		} else {
			rt = false;
		}
		
		
		//var rt = (jr.data.due_date != null &&jr.data.due_date != null )? $("#hid_due_date").val(jr.data.due_date.substr(0,10)):"";
		return rt;

	}

	function checkSimulation() {
		var due_date = $("#rpy_date").val();
		var val = $("#hid_acc_no").val();
		$(".rest").empty();
		isiDataSimulation(val, due_date);

	}

	function isiDataRepayment(val) {
		/* 	var result = $.ajax({
				type : "GET",
				url : "${local_server}/inquiry/cekegibility/" + val,
				async : false,
				success : function(msg) {

				}
			}).responseText;
			var jr = JSON.parse(result);
			var due_date = (jr.data.due_date != null && jr.data.due_date != null) ? jr.data.due_date
					.substr(0, 10)
					: ""; */
		var due_date = new Date().toJSON().slice(0, 10);
		$("#rpy_date").val(due_date);

		isiDataSimulation(val, due_date)

	}

	function isiDataSimulation(acc_no, due_date) {
		var data = {};

		var accno = acc_no;
		$
				.ajax({
					type : "POST",
					url : '${local_server}/restructure/simulation_repayment', 
					data : "acc_no=" + acc_no + "&terminate_date=" + due_date,
					async : false,
					dataType : "json",
					success : function(data) {
						console.log(data);
						jQuery
								.each(
										data.data,
										function(i, val) {
											if (i == 'acc_no') {
												document
														.getElementById('hid_acc_no').value = val;
												document
														.getElementById('spn_1').innerHTML = val;
											} else if (i == 'loan_amount') {
												document
														.getElementById('spn_2').innerHTML = val
														.toString()
														.replace(
																/(\d)(?=(\d\d\d)+(?!\d))/g,
																"$1,");
												;
											} else if (i == 'loan_tenor') {
												document
														.getElementById('spn_3').innerHTML = val
														+ ' bulan';
											} else if (i == 'outstanding_balance') {
												document
														.getElementById('spn_4').innerHTML = val
														.toString()
														.replace(
																/(\d)(?=(\d\d\d)+(?!\d))/g,
																"$1,");
												;
											} else if (i == 'total_statement') {
												document
												.getElementById('spn_4a').innerHTML = val
												.toString()
												.replace(
														/(\d)(?=(\d\d\d)+(?!\d))/g,
														"$1,");
												;
											} else if (i == 'remaining_tenor') {
												document
														.getElementById('spn_5').innerHTML = val
														+ ' bulan';
											} 
											// else if (i == 'early_cost') {
											// 	document
											// 			.getElementById('spn_6').innerHTML = val
											// 			.toString()
											// 			.replace(
											// 					/(\d)(?=(\d\d\d)+(?!\d))/g,
											// 					"$1,");
											// 	;
											// } 
											else if (i == 'administration_cost') {
												document
														.getElementById('spn_7').innerHTML = val
														.toString()
														.replace(
																/(\d)(?=(\d\d\d)+(?!\d))/g,
																"$1,");
												;
											} else if (i == 'billing_cost') {
												document
														.getElementById('spn_8').innerHTML = val
														.toString()
														.replace(
																/(\d)(?=(\d\d\d)+(?!\d))/g,
																"$1,");
												;
											} else if (i == 'total_repayment') {
												document
														.getElementById('spn_9').innerHTML = val
														.toString()
														.replace(
																/(\d)(?=(\d\d\d)+(?!\d))/g,
																"$1,");

											} else if (i == 'repay_due_date') {
												document
														.getElementById('spn_10').innerHTML = convertDate(val);
												document
														.getElementById('hid_due_date').value = val;

											} else if (i == 'charge_cost') {
												document
														.getElementById('spn_11').innerHTML = val
														.toString()
														.replace(
																/(\d)(?=(\d\d\d)+(?!\d))/g,
																"$1,");
											}
											$("#btnsetuju")
													.html(
															'<button type="button" class="btn btn-success " data-dismiss="modal" onclick="OnBeforeConfirm(); return false;"><i class="fa fa-check-circle"></i> Setuju</button>');
										});

						var due = $("#hid_due_date").val();
						due = due.substr(0, 10);
						$('#rpy_date').datepicker({
							beforeShow : function(input, inst) {
								$(document).off('focusin.bs.modal');
							},
							onClose : function() {
								$(document).on('focusin.bs.modal');
							},
							dateFormat : "yy-mm-dd",
							changeMonth : true,
							changeYear : true,
							minDate : "0d",
							maxDate : due,
							yearRange : "-0:+1",
							showAnim : "clip"
						});
						$("#myModalRepay").modal("show");
					}
				})

	}

	function convertDate(val) {
		var monthNames = [ "January", "February", "March", "April", "May",
				"June", "July", "August", "September", "October", "November",
				"December" ];
		var value = new Date(val.replace(/(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3"));
		var tgl = value.getDate();
		var bln = value.getMonth() + 1; //+1;
		var thn = value.getFullYear();
		var dat = tgl + " " + monthNames[bln - 1] + " " + thn;
		return dat;
	}

	function checkExists(sel) {
		var status = false;
		if ($(sel).length)
			status = true;
		return status;
	}

	function getDetailRepayment(val) {
		$
				.ajax({
					type : 'GET',
					asyn : true,
					url : '${local_server}/inquiry/getrepaymentdet/' + val,
					dataType : 'json',
					beforeSend : function() {

						$('#tableDetRepayment').DataTable().destroy();
						$("#myModalLabel6")
								.html(
										"<i class='fa fa-circle-o-notch fa-spin'></i> Loading..")
					},
					success : function(mdata) {
						console.log("Detail Repayment");
						console.log(mdata);
						$("#myModalLabel6").html("Repayment Detail");

						$('#tableDetRepayment').DataTable().destroy();
						$('#tableDetRepayment').dataTable({
							data : mdata.data,
							columns : [ {
								data : 'rpd_acc_no',
							}, {
								data : 'rpd_type'
							}, {
								data : 'rpd_desc'
							},

							{
								data : 'rpd_amount',
								className : 'txtRigth'
							}

							]

						});
					}
				});
	}

	function generateDetailData(val, sestoken) {
		var divdatadetail = '';
		var disburse = val.loan_disb_amount;
		var numdisburse = disburse;
		var payment = val.pay_amount;
		var numpayment = payment;
		divdatadetail += ''
				+ '<div class="collapse" id="collapsebox'+val.loan_acc_no+'">'
				+ '<div class="card card-body">' + '<div class="row">'
				+ '<div class="col-md-6 lineright"><h5>Disburse Info Pencairan</h5>'
				+ 'Jumlah pencairan : <strong> <a>'
				+ numdisburse
				+ '</a></strong><br />'
				+ 'Tanggal :<strong>'
				+ val.loan_disburse_date
				+ '</strong><br />'
				+ 'Status :<span class="text-danger"><strong>'
				+ val.loan_disburse_status
				+ '</strong></span><br />'
				+ 'Catatan : <strong>'
				+ val.loan_disburse_notes
				+ '</strong>'
				+ '</div>'
				+ '<div class="col-md-6 lineleft"><h5>Pembayaran terakhir</h5>'
				+ 'Jumlah Pembayaran :<strong>Rp '
				+ numpayment
				+ '</strong><br />'
				+ 'Tanggal :<strong>'
				+ val.pay_date
				+ '</strong><br />'
				+ 'Melalui :<strong>'
				+ val.pay_channel
				+ '</strong><br />'
				+ 'Catatan : <strong>'
				+ val.pay_notes
				+ '</strong>'
				+ '</div>'
				+ '</div>'
				+ '<div class="row">'
				+ '<div class="col-xs-12 col-sm-12 col-lg-12 linetop"><h5 class="text-center">Jadwal Pembayaran</h5>'
				+ '<div class="billingbox table-responsive" id="installment'+val.loan_acc_no+'"></div>'
				+ '</div>' + '</div>' + '</div>' + '</div>';
		return divdatadetail;
	}

	function showsStatus(valp, valq) {

		var val = 0;
		if (valp != null && valp != "" && valq != null && valq != "") {
			val = (valq - valp);
			if (Math.round(val) == 0) {
				return "<span class='label label-success'>Lunas</span>";
			} else if (Math.round(val) < 0) {
				return "<span class='label label-warning'>Lebih Bayar</span>";
			} else {
				return "<span class='label label-danger'>Kurang Bayar</span>";
			}
		} else {
			return ""
		}
	}

	function getCustomerInfo() {
		var content = "";
		var content2 = "";
		var content3 = "";
		var content4 = "";
		var list = "<table>";
		var list2 = "<table>";
		var list3 = "<table>";
		var list4 = "<table>";
		var maintable = "";

		$.ajax({
			type : 'POST',
			asyn : true,
			url : '${local_server}/inquiry/getcustinfo',
			data : "key=cif&val=${cif}",
			success : function(data) {
				console.log("Customer Info");
				console.log(data);

				$.each(data.data, function(index, v) {
					maintable += '<table width="100%" ><tr><td valign="top">';
					$('#sName').text(v.cst_fname + ' ' + v.cst_lname);
					$('#sMaritalStatus').text(v.cst_marital_status);
					$('#sGender').text(getGender(v.cst_sex));
					$('#sLocation').text(v.cst_address);
					$('#sDOB').text(spTgl(v.cst_dob));
					$('#sBussinessPhone').text(v.cst_phone);
					$('#sHomePhone').text(v.cst_phone);
					$('#sMobilePhone').text(v.cst_phone_mobile);
					content += '<tr><td'+tdsty+'>NIK'
					+ sep + v.cst_nik
					+ '</td></tr>';
					content += '<tr><td'+tdsty+'>Nama' + sep + v.cst_fname
							+ ' ' + v.cst_lname + '</td></tr>';
					content += '<tr><td'+tdsty+'>Status' + sep
							+ status(v.cst_status) + '</td></tr>';
					content += '<tr><td'+tdsty+'>Email/Surel'
							+ sep
							+ String(chkNull(v.cst_email)).replace(/ /g,
									"<font color='red'>[space]</font>")
							+ '</td></tr>';

					content2 += '<tr><td'+tdsty+'>Sisa Kontrak' + sep
							+ chkNull(v.cst_employment_contract_duration)
							+ '</td></tr>';
					content2 += '<tr><td'+tdsty+'>Lokasi Kantor' + sep
							+ chkNull(v.cst_work_location) + '</td></tr>';
					content2 += '<tr><td'+tdsty+'>Jabatan' + sep
							+ chkNull(v.cst_job_position) + '</td></tr>';
					content += "";

					list += content + "</table>";
					list2 += content2 + "</table>";

					list3 += content3 + "</table>";
					list4 += content4 + "</table>";
					maintable += list + "</td><td valign='top'>" + list2;

					maintable += '</td></tr>';
					maintable += "<tr><td valign='top'>" + list3
							+ "</td><td valign='top'>" + list4
							+ "</td></tr></table>"

					customer.empty();
					customer.html(maintable);

				});
				/* 
				 if (data.data[0].ads_field_2 != ""
				 && data.data[0].ads_field_2 != null) {
				 if (data.data[0].ads_field_2 == "N") {
				 getProductAnalyst();
				 } else {
				 $('#pending_product_table').dataTable();
				 }

				 } */
				getProductAnalyst();
				
			},
			failure : function(errMsg) {
				alert("Panggilan gagal");
			}
		});
	}

	function status(val) {
		if (val == true) {
			return "Active";
		} else {
			return "Inactive";
		}
	}

	function chkNull(val) {
		if (val != null) {
			return val;
		} else {
			return "-";
		}
	}

	function getGender(val) {
		if (val == "M" || val == "Male") {
			return "Laki - Laki";
		} else {
			return "Perempuan";
		}
	}

	function spTgl(val) {
		if (val != null) {
			var x = val.split("T");
			var date = x[0];
			var time = x[1];
			return date;
		} else {
			return "";
		}
	}

	function spTgl2(val) {
		if (val != null) {
			var x = val.split("T");
			var date = x[0];
			var time = x[1].split(".");
			return date + " " + time[0];
		} else {
			return "";
		}
	}
	function OnBeforeConfirm() {
		var noakun = document.getElementById('spn_1').innerHTML;

		$.confirm({
			title : 'Encountered an error!',
			title : "Apakah anda yakin",
			content : "ingin melakukan restructure untuk no pinjaman #" + noakun
					+ " ?",
			type : 'blue',
			typeAnimated : true,
			buttons : {
				batal : function() {
					$("#myModalRepay").modal("show");
				},
				tryAgain : {
					text : 'Ya, Lanjutkan',
					btnClass : 'btn-info',
					action : function() {

						confirm();
					}
				},

			}
		});
	}

	function confirm() {
		var acc_no = $("#hid_acc_no").val();
		var due_date = $('#rpy_date').val()
		$
				.ajax({
					type : "POST",
					url : '${local_server}/inquiry/confirmRestructure',
					data : "acc_no=" + acc_no + "&terminate_date=" + due_date,
					async : false,
					dataType : "json",
					success : function(data) {
						 
						$
								.confirm({
									title : 'Success!',
									type : 'green',
									// content : 'Silahkan untuk membayar via virtual account BCA dengan nomor rekening <br/><h4><span class="label label-success">'
									// 		+ data.data.va_no + "</span></h4>",
									buttons : {
										somethingElse : {
											text : 'OK',
											btnClass : 'btn-success',
											keys : [ 'enter', 'shift' ],
											action : function() {
												location.reload();
											}
										}
									}
								});
					}
				});
	}

	function checkNullString(val) {
		if (typeof val == 'undefined' || typeof val == 'null') {
			val = '';
		}
		if (val == null) {
			val = '';
		}
		return val;
	}

	function getProductAnalyst() {
		$
				.ajax({
					headers : {},
					type : 'GET',
					asyn : true,
					url : '${local_server}/restructure/getloanowner/${cif}',
					dataType : 'json',
					success : function(data) {
						console.log("Analyst");
						console.log(data);
						$('#pending_product_table').DataTable().destroy();
						$('#pending_product_table')
								.dataTable(
										{
											data : $.parseJSON(JSON
													.stringify(data.data)),
											columns : [
													{
														data : 'loan_acc_no'
													},
													{
														data : 'prd_name'
													},
													{
														data : 'loan_amount',
														className : 'txtRigth',
														render : function(data,
																type, row) {
															return toRp(row.loan_amount);
														}
													},
													{
														data : 'loan_tenor'
													},
													{
														data : 'loan_date'
													},
													{
														data : 'loan_remaining_tenor'
													},

													{
														data : 'loan_acc_status'

													},
													{
														render : function(data,
																type, row) {
															var edit = '<button class="edit btn btn-xs btn-success" id="'+row.loan_acc_no+'" value="'+row.loan_acc_no+'" ><i class=" fa fa-external-link" title="Detail"></i></button>';
															//if (cekEgibilty(row.loan_acc_no)) {
																
															if(row.rst_created_date != null){

																var a = row.rst_created_date.toString();
												        		var b = a.substring(0, 10);
																var today = new Date();
																
																var dd = String(today.getDate()).padStart(2, '0');
																var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
																var yyyy = today.getFullYear();

																today = yyyy + '-' + mm + '-' + dd;
																console.log(today);
																console.log(b);
															}else{
																console.log('rst_created_date-nya null');
															} 

																if(row.loan_acc_status == "Closed" || (b == today && row.rst_status == 17) || (b == today && row.rst_status == 31)){
																	edit += '';
																} 
																else{
																  edit += '<button class="repayment btn btn-xs btn-info" id="'+row.loan_acc_no+'" value="'+row.loan_acc_no+'" ><i class="fa fa-credit-card" title="Restructure"></i></button>';

																}

															//}
															return edit;
														},
														orderable : false
													} ]
										});
					},
					failure : function(errMsg) {
						alert("call failed");
					}
				});
	}
	
	
	function getRepaymentList() {
		$
				.ajax({
					headers : {},
					type : 'GET',
					asyn : true,
					url : '${local_server}/restructure/getRepayment/${cif}',
					dataType : 'json',
					success : function(data) {
						console.log("RepaymentList");
						console.log(data.data[0]);
						$('#repayment_table').DataTable().destroy();
						$('#repayment_table')
								.dataTable(
										{
											data : $.parseJSON(JSON
													.stringify(data.data)),
											columns : [
													{
														data : 'rst_acc_no'
													},
													{
														data : 'rst_acc_va'
													},
													{
														data : 'rst_amount',
														className : 'txtRigth',
														render : function(data,
																type, row) {
															return toRp(row.rst_amount);
														}
													}, 
													{
														data : 'rst_created_date',
														render : function(data,
																type, row) {
															var edit = "";

																			if(row.rst_created_date != null){
																				var a = row.rst_created_date.toString();
											                	var b = a.substring(0, 10);
																				edit += b;
																			}else{
																				edit =+ '';
																			}
											                return edit;
														}
													},
													{
														data : 'rst_due_date',
														render : function(data,
																type, row) {
															var edit = "";
																			if(row.rst_due_date != null){
																				var a = row.rst_due_date.toString();
											                	var b = a.substring(0, 10);
																				edit += b;
																			}else{
																				edit =+ '';
																			}
											                return edit;
														} 
													},
													{
														data : 'rst_pay_status'
													},
													{
														render : function(data,
																type, row) {
															var edit = '';

															if(row.rst_created_date != null){

																var a = row.rst_created_date.toString();
												        		var b = a.substring(0, 10);
																var today = new Date();
																
																var dd = String(today.getDate()).padStart(2, '0');
																var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
																var yyyy = today.getFullYear();

																today = yyyy + '-' + mm + '-' + dd;
																console.log(today);
																console.log(b);
															}else{
																console.log('rst_created_date-nya null');
															}
															
															 //if((row.rst_created_by == null || row.rst_created_by == '') && row.rst_pay_status == "Restructure On Progress") {
															 if(row.rst_pay_status == "Expired"){
																 edit += '';
															 }else if((b == today && row.rst_created_by == null && row.rst_status == 17) || (b == today && row.rst_created_by == "" && row.rst_status == 17)){
																edit += '<a href="#myModalManPay" data-toggle="modal" id="'+ row.rst_acc_no +'" name="'+ row.rst_amount +'" data-target="#view-modal-ManPay" class="btn btn-xs btn-info"><i class=" fa fa-external-link"></i> Restructure</a>';
																edit += '<input type="hidden" id="tenorBefore" value="'+row.rst_tenor_before+'">'; 
																edit += '<input type="hidden" id="interestBefore" value="'+row.rst_interest_before+'">'; 
															 }else{
																 edit += '';
															 }
															
															
															return edit;
														},
														orderable : false
													} ]
										});
					},
					failure : function(errMsg) {
						alert("call failed");
					}
				});
	}
	
	$("#repayment_table").on("click", "button.viewRPY", function(e) {
        $("#myModalRPY").modal("show"); 
        getViewDetailRepayment(this.id);
        $("#accNO").val(this.id);
    });
	
	function getViewDetailRepayment(e) {
	    $.ajax({
		    	 type: "POST",
		         url: "${local_server}/repayment_admin/getDetailRepayment",
		         data: "accNO="+e,
		         async: true,
	            success: function(e) {
	            	console.log("getDetailRepayment");
	            	console.log(e);
	                generateDetailPayment(e);                
	            }
	        })
		}
	
	function generateDetailPayment(obj) {
    	var html = '';
    	
    	
    	
    	if(typeof obj.data != "undefined") {
    		
    		for(var n = 0;n<obj.data.length;n++) {
    			var total = 0;
    			html += '<table width="100%">';
    			html += '<tr>';
    			html += '<td width="23%"><strong>Jumlah Pembayaran</strong></td>';
    			html += '<td width="2%"> <strong>:</strong> </td>';
    			html += '<td width="15%"><strong><span>Rp </span><span class="text right">'+ toRp(obj.data[n].rpy_amount) +'</span></strong></td>';
    			html += '<td></td>';
    			html += '</tr>';
    			html += '<tr>';
    			html += '<td><strong>Tanggal Pembayaran</strong></td>';
    			html += '<td> <strong>:</strong> </td>';
    			html += '<td><strong><span>'+ convertDateAPI(obj.data[n].rpy_pay_manual_date) +'</span></strong></td>';
    			html += '<td></td>';
    			html += '</tr>';
    			html += '<tr>';
    			html += '<td><strong>Catatan</strong></td>';
    			html += '<td> <strong>:</strong> </td>';
    			html += '<td colspan="2"><strong><span>'+ obj.data[n].rpy_notes +'</span></strong></td>';
    			html += '</tr>';
    			html += '</table>';
    			html += '<hr />';
    			
    			html += '<table class="table table-hover table-bordered" width="100%">';
    			html += '<thead>';
    			html += '<tr align="center">';
    	    	html += '<th>Deskripsi</th>';
    	    	html += '<th>Tagihan</th>';
    	    	html += '<th>Pembayaran</th>';
    	    	html += '<th>Penghapusan</th>';
    	    	html += '</tr>';
    	    	html += '</thead>';
    	    	html += '<tbody>';
    			for(var i=0;i<obj.detail.length;i++){
    				
          			total += parseFloat(obj.detail[i].rdm_amount);
          			html += '<tr>';
                  	html += '<td>'+ obj.detail[i].rpc_desc +'</td>';
                  	html += '<td><span>Rp </span><span class="text right">'+ toRp(obj.detail[i].rdm_amount) +'</span></td>';
                  	html += '<td><span>Rp </span><span class="text right">'+ toRp(obj.detail[i].rdm_pay_amt) +'</span></td>';
                  	html += '<td><span>Rp </span><span class="text right">'+ toRp(obj.detail[i].rdm_waive_amt) +'</span></td>';
                  	html += '</tr>';
          		                	
            		
            	}
    			html += '</tbody>';
        		html += '<tfoot>';
        		html += '<tr>';
        		html += '<td><strong>Total</strong></td>';
        		html += '<td><strong><span>Rp </span><span class="text right">'+ toRp(total) +'</span></td>';
        		html += '<td><strong><span>Rp </span><span class="text right">'+ toRp(obj.data[n].rpy_total_paid_amt) +'</span></td>';
        		html += '<td><strong><span>Rp </span><span class="text right">'+ toRp(obj.data[n].rpy_total_waive_amt) +'</span></td>';
        		html += '</tr>';
        		html += '</tfoot>';
    			html += '</table>';
    		}
    		
    		
    		$("#tot").val(total);
        	$("#detailPayment").empty();
        	$("#detailPayment").append(html);
    	} else {
    		$.alert(obj.message);
    	}
    	
    }
    
	
$('#view-modal-ManPay').on('show.bs.modal',	function(e) {
	
		$('#btnShowTable').hide();
		$('#simulation_table').hide();
		$('#restructureCalculation').hide();

		var accno = e.relatedTarget.id;
		var amount = e.relatedTarget.name;
		
		var tenBef = document.getElementById("tenorBefore").value;
		var intBef = document.getElementById("interestBefore").value
		
		$("#accNoHid").val(accno);
		
		var filter = '';
		
		
		$("#billingDetailPriorityFilter").empty();
		$("#billingDetailPriority").empty();
		
		$("#dvSave").hide();
		$("#sisNote").hide();
		$("#restructureCalculation").empty();
		$("#restructureCalculation").hide();
		
		$("#notes").val("");
		
		// var dtArr = {};
		// dtArr['acc_no'] = accno;
		//dtArr['total'] = jumlah;

    // $.ajax({
		// 			type : 'POST',
		// 			asyn : true,
		// 			url : '${local_server}/restructure/getRincianRestructure', //ganti
					// data:dtArr,
					// beforeSend : function() {
					// 	$("#billingDetailPriority").empty();
					// 	$("#dvSave").hide();
					// 	$("#sisNote").hide();
					// 	$("#notes").val("");
					// },
					// success : function() {
						
						// generatePaymentDetail(mdata);
		// 			}
		// });

		filter +='<fieldset style="padding:10px" class="scheduler-border">';
		
		// filter +='<div class="row">';
		
		// filter += '<div class="col-md-4"><table width="100%">';					
		
		// filter += '<tr>'
		// 	+ '<td>Total</td>'
		// 	+ '<td> : </td>'
		// 	+ '<td><span style="float:left">Rp </span><span style="float:right">'+ toRp(amount)  +'</span></td>'
		// 	+ '<td><input type="hidden" name="hidAmount" id="hidAmount" value="'+ amount +'"></td>'
		// 	+ '</tr>';								
					
			
		// filter += '</table></div>';
		// filter +='</div>';
		// filter += '<hr />';
		filter += '<div class="form-inline pull-left">';
     filter += '<div class="form-group mx-sm-5">';
		 filter += '<label><strong>Acc No Restructure</strong></label>'
		//filter += '<input type="text" class="form-control text-right" id="" name="" value="0" maxlength="11" onkeypress="return isNumberKey(event)" onkeyup="this.value=formatCurrency(this.value)" >';
     filter += '<label><strong> : ' +accno+ '</strong></label>';
		 filter += '</div><br>';
     filter += '<div class="form-group mx-sm-5">';
		 filter += '<label><strong>Tenor Before Restructure</strong></label>'
		//filter += '<input type="text" class="form-control text-right" id="" name="" value="0" maxlength="11" onkeypress="return isNumberKey(event)" onkeyup="this.value=formatCurrency(this.value)" >';
		filter += '<label><strong> : ' +tenBef+ '</strong></label>';
		filter += '</div><br>';
     filter += '<div class="form-group mx-sm-5">';
		 filter += '<label><strong>Bunga Before Restructure</strong></label>'
		//filter += '<input type="text" class="form-control text-right" id="" name="" value="0" maxlength="11" onkeypress="return isNumberKey(event)" onkeyup="this.value=formatCurrency(this.value)" >';
		 filter += '<label><strong> : ' +intBef+ ' %</strong></label>';
		 filter += '</div><br>';
		filter += '<div class="form-group mx-sm-5">';
		filter += '<label><strong>Jumlah Pembayaran Goodwill</strong></label>'
		filter += '<input type="text" class="form-control text-right" id="jumBar" name="jumBar" value="0" maxlength="11" onkeypress="return isNumberKey(event)" onkeyup="this.value=formatCurrency(this.value)" onchange="goodWillChange()">';
		filter += '</div>';
		filter += '<div class="form-group mx-sm-3">';
		
		// var jumlahBarr = $("#jumBar").val();
		
    // if (jumlahBarr == 0){
		//   filter += '<button type="button" id="btnShow" class="btn btn-primary " style="margin-top: 5px;margin-left: 5px;" disabled>Kirim</button>';
    // }
    // else{
      filter += '<button type="button" id="btnShow" class="btn btn-primary " style="margin-top: 5px;margin-left: 5px;">Kirim</button>';
    // }
		filter += '</div>';
		filter += '</div>';
	
		filter +='</fieldset>';

  // }
	// 	});
		$("#billingDetailPriorityFilter").empty();
		$("#billingDetailPriorityFilter").append(filter);
		
		$("#btnShow").click(function(){
			
			var dt = {};
			var jumlah = $("#jumBar").val();

      if(jumlah == 0){
        $.alert("Field Goodwill tidak boleh koong.");
      }
      else{
        jumlah = jumlah.toString().replace(/\$|\,/g, '');
			$("#befJumBar").val(jumlah);
	
			if(parseFloat(jumlah) > parseFloat(amount)) {
				$("#billingDetailPriority").empty();
				$("#dvSave").hide();
				$("#sisNote").hide();
				$("#restructureCalculation").empty();
				$("#restructureCalculation").hide();
				$("#notes").val("");
				$.alert("Jumlah pembayaran tidak boleh lebih dari total tagihan.");
			} else {
				
				
				var dtArr = {};
				dtArr['acc_no'] = accno;
				dtArr['total'] = jumlah;
				
				$.ajax({
					type : 'POST',
					asyn : true,
					url : '${local_server}/restructure/getRestructureDetail',
					data:dtArr,
					beforeSend : function() {
						$("#billingDetailPriority").empty();
						$("#dvSave").hide();
						$("#sisNote").hide();
						$("#restructureCalculation").empty();
						$("#restructureCalculation").hide();
						$("#notes").val("");
					},
					success : function(mdata) {
						
						generatePaymentDetail(mdata);
					}
				});
				
			}
      }

		});
		
		
	});
	
	function generatePaymentDetail(mdata) {
		$("#billingDetailPriority").empty(); 
		$('#btnShowTable').show();
		$('#simulation_table').hide();
		$('#restructureCalculation').hide();

		var html = '';
		
		var periodDelimeter = "";
		
		if(typeof mdata.data !== "undefined") {
			html +='<table id="tblGenerateDetail" class="table table-hover table-bordered" width="100%">';
			html +='<thead>';
			html +='<tr align="center">';
			html +='<th scope="col">Deskripsi</th>';
			html +='<th scope="col">Tagihan</th>';
			html +='<th scope="col">Good Will</th>';
			html +='<th scope="col">Waiving</th>';
			html +='<th scope="col">Restructure</th>';
			html +='</tr>';
			html +='</thead>';
			html +='<tbody>';
			
			var tot= 0;
			var totPay= 0;
			var resCount = 0;
			var totWai = 0; 
			var totRes = 0;
			var totID = "";
			var period = "";
			var count = 0;
			var waii = 0;
			//var restructureCount = 0;
			
			for(var i = 0;i < mdata.data.length; i++) {
				
				count++;
				//var getValueWai = document.getElementById("wai_").value;


				html +='<tr>';
				
				
				
				html +='<td width="22%"><input type="hidden" name="hidType" id="hidType_'+ count + '" value="'+mdata.data[i].rsd_type+'">'+ mdata.data[i].rsc_desc +'</td>';
				html +='<td width="20%" align="right"><input type="hidden" name="hidTagihan" id="hidTagihan_'+ count + '" value="'+mdata.data[i].rsd_amount+'"><span style="float:left">Rp </span><span id="spnAmount_' + count + '" style="float:right">'+ toRp(mdata.data[i].rsd_amount) +'</span></td>';
				html +='<td width="20%">'
					 + '<input type="text" id="pay_' + count + '" name="payment" class="form-control text-right" value="'+ toRp(mdata.data[i].paid) +'" maxlength="11" onkeypress="return isNumberKey(event)" onkeyup="this.value=formatCurrencyPayPress(this.value,\''+count+'\')" onchange="this.value=formatCurrencyPayChange(this.value,\''+count+'\')"></div></td>';
				html +='<td width="20%">'
					 + '<input type="text" id="wai_' + count + '" name="waiving" class="form-control text-right" value="'+toRp(waii)+'" maxlength="11" onkeypress="return isNumberKey(event)" onkeyup="this.value=formatCurrencyWaiPress(this.value,\''+count+'\')" onchange="this.value=formatCurrencyWaiChange(this.value,\''+count+'\')"></div></td>';
				
				var restructureCount = mdata.data[i].rsd_amount - (mdata.data[i].paid + waii);
			
						
				html +='<td width="20%"><input type="hidden" name="restructure" id="res_' + count + '" value="'+restructureCount+'"><span style="float:left">Rp </span><span id="spnRes_' + count + '" style="float:right">'+ toRp(restructureCount) +'</span></td>';
				// html +='<td width="20%">'
				 	//  + '<input type="text" id="res_' + count + '" name="restructure" class="form-control text-right" value="'+ toRp(restructureCount) +'" maxlength="11" onkeypress="return isNumberKey(event)" onkeyup="this.value=formatCurrencyResPress(this.value,\''+count+'\')" onchange="this.value=formatCurrencyResChange(this.value,\''+count+'\')"></div></td>';
				//html +='<td width="24%">'
				//	 + '<input type="text" id="res_' + count + '" name="restructure" class="form-control text-right" value="'+ toRp(restructureCount) +'" maxlength="11" onkeypress="return isNumberKey(event)"></div></td>';
	 			
				 

				
				html +='</tr>';
				
				console.log(restructureCount);
				
				tot += mdata.data[i].rsd_amount;
				totPay += mdata.data[i].paid;
				totWai += waii;
				totRes += restructureCount;
						
				
			}
			
			html +='</tbody>';
			html +='<tfoot>';
			html +='<tr>';
			html +='<td><strong>TOTAL</strong></td>';
			html +='<td><strong><span style="float:left">Rp </span><input type="hidden" name="hidTot" id="hidTot" value="'+ tot +'"><span id="tot" style="float:right">'+toRp(tot)+'</span></strong></td>';
			html +='<td><strong><span style="float:left">Rp </span><input type="hidden" name="hidTotPay" id="hidTotPay" value="'+ totPay +'"><span style="float:right" id="totPay">'+toRp(totPay)+'</span></strong></td>';
			html +='<td><strong><span style="float:left">Rp </span><input type="hidden" name="hidTotWai" id="hidTotWai" value="'+ totWai +'"><span style="float:right" id="totWai">'+toRp(totWai)+'</span></strong></td>';
			html +='<td><strong><span style="float:left">Rp </span><input type="hidden" name="hidTotRes" id="hidTotRes" value="'+ totRes +'"><span style="float:right" id="totRes">'+toRp(totRes)+'</span></strong></td>';
			html +='</tr>';
			html +='</tfoot>';
			html +='</table>';
			html +='<input type="hidden" id="count" value="'+ mdata.data.length +'">';



			//  html += '<div class="row">';
			//  html+= '<div class="col-md-4">';
			//  html+= '<table width="100%">';						
			//  html+= '<tr>';							
			//  html+= '<td><strong>Old Loan Principal</strong></td>';								
			//  html+= '<td> : </td>';					

			//  var principalVal = 0;
			//  var outstandingVal = 0;
			//  for(var i = 0;i < mdata.data.length; i++) {
				
				 
			// 	 if(mdata.data[i].rsc_desc == "Outstanding Balance")	{
			// 			//var restructureCount = mdata.data[i].rsd_amount - (mdata.data[i].paid + mdata.data[i].remain_bill);
						
			// 			// outstandingVal = mdata.data[i].rsd_amount;
						 
			// 			 outstandingVal = mdata.data[i].rsd_amount - (mdata.data[i].paid + waii);

			// 			 console.log(outstandingVal, "outsVal");
			// 	}
				
			// 	 if( mdata.data[i].rsc_desc == "Principal"){
			// 		//var restructureCount = mdata.data[i].rsd_amount - (mdata.data[i].paid + mdata.data[i].remain_bill);
					
			// 		// principalVal = mdata.data[i].rsd_amount + outstandingVal;
			// 		 principalVal = mdata.data[i].rsd_amount - (mdata.data[i].paid + waii) + outstandingVal;
			// 			var z = toRp(principalVal);

			// 				var pemOldLP = Math.floor((principalVal/totRes) * 100);
			// 				var toStringOldLP =  pemOldLP.toString();
			// 				var substrOldLP = toStringOldLP.substring(0,5);
			// 		 	 	var perOldLP = substrOldLP; 
			// 				var oldLPPer = principalVal/totRes; 
			// 		   	if(perResP == NaN){
			// 		 		 html+= '<td><strong> Rp '+z+' (0 %)</strong></td>';	
			// 		 	 }else{
			// 	 			//html+= '<td><strong> Rp '+z+' ('+perOldLP+' %)</strong></td>';
			// 	 			html+='<td><strong><span style="float:left">Rp</span><input type="hidden" name="hidTotOldLP" id="hidTotOldLP" value="'+oldLPPer+'"><span style="float:right" id="totOldLP">'+ z +' ('+pemOldLP+'%)</span></strong></td>'
			// 	 			html+='<td><input type="hidden" name="hidOldLP" id="hidOldLP" value="'+principalVal+'"></td>'
			// 		 	 }
			// 			 console.log(principalVal, "princVal");	
			// 			 console.log(perOldLP);
			// 			 console.log(outstandingVal);
			// 	 }

				
			// }											
			//  html+= '</tr>'; 					
			//  html+= '<tr>';							
			//  html+= '<td><strong>Restructure Principal</strong></td>';								
			//  html+= '<td> : </td>';	
			//  var resP = totRes - principalVal;
			//  console.log(totRes, "totRes");
			//  console.log(principalVal, "princVal");
			//  console.log(resP, "resP");
			 
			//  var pemResP = Math.ceil((resP/totRes) * 100);
			//  var toStringResP = pemResP.toString();
			//  var substrResP = toStringResP.substring(0,5);
		 	//  var perResP = substrResP;
			//  var resPPer = resP/totRes;
		 	//  console.log(perResP, "persen resP");
		 	//  if(perResP == "NaN"){
		 	// 	 html+= '<td><strong> Rp '+toRp(resP)+' (0 %)</strong></td>';	
		 	//  }else{
			//  	 //html+= '<td><strong> Rp '+toRp(resP)+' ('+perResP+' %)</strong></td>';	
		 	// 		html+='<td><strong><span style="float:left">Rp</span><input type="hidden" name="hidTotResP" id="hidTotResP" value="'+resPPer+'"><span style="float:right" id="totResP">'+ toRp(resP) +' ('+pemResP+'%)</span></strong></td>'
		 	// 		html+='<td><input type="hidden" name="hidResP" id="hidResP" value="'+resP+'"></td>'
		 	//  }
		 	 
			//  html+= '</tr>';
			//  html+= '</table>';								
			//  html+= '</div>';							
			//  html+= '</div>';			

			//  html+='<div id="sisNote" style="display:none;">	';
			// html+='					<div class="row">';
	    //  html+='                           <div class="col-md-4">';
	    //  html+='                               <div class="form-group">';
	    //  html+='                                   <label><b>Tenor After Restructure</b></label>';
	    //  html+='                                   <input type="text" class="form-control" required id="tenAftRes" name="tenAftRes">';
	    //  html+='                               </div>';
	    //  html+='                           </div> 		'						;
			// html+='					</div>	'				;
			// html+='					<div class="row">';
			// html+='						<div class="col-md-4">';
			// html+='								<div class="form-group">';
			// html+='										<label><b>Bunga After Restructure</b></label>';
			// html+='			 							<input type="text" class="form-control" required id="bungAftRes" name="bungAftRes"> ';
			// html+='								</div>';
			// html+='						</div> 	'							;
			// html+='					</div>	';
			// html+='					<div class="row">';
			// html+='						<div class="col-md-4">';
			// html+='								<div class="form-group">';
			// html+='										<label><b>First Statement Date</b></label>';
			// html+='										<input type="text" class="form-control datepicker11" autocomplete="off" maxlength="10" data-date-format="YYYY-MM-DD" required id="firstStDate" name="firstStDate">';
			// html+='								</div>';
			// html+='						</div> 		';						
			// html+='					</div>		';
			// html+='				</div>			'	;						
			//  html+='<button type="button" id="btnShowTable" class="btn btn-primary " style="margin-top: 5px;margin-left: 5px;">Show Table</button>'	;
			//  html+= '';
			
			$("#periodHid").val(periodDelimeter);
			
			
			$("#billingDetailPriority").append(html);
			
			
			for(var i = 0;i < mdata.data.length; i++) {
			if(mdata.data[i].rsd_type == "T01"){
				//var vlResT01 ='';
				
				var vlResT01 = document.getElementById("res_1").value;
					//var vlResT01 = $('#res_"'+count+'"').val();

				//vlResT01 = vlResT01.toString().replace(/\$|\,/g, '');
				
				//vlResT01 = parseFloat(vlResT01);
				
				$('#valT01').val(mdata.data[i].rsd_amount - (mdata.data[i].paid + waii));
				html += '<input type = "hidden" id="payT01" value="'+mdata.data[i].paid+'">'
				html += '<input type = "hidden" id="waiT01" value="'+waii+'">'
				html += '<input type = "hidden" id="tagT01" value="'+mdata.data[i].rsd_amount+'">'
				html += '<input type = "hidden" id="resT01" value="'+vlResT01+'">'
				
				// pas disini ada di coba console log gak, resT01 keisi gak value nya?
						//aku debug dr browser ci, valuenya ada tp dia diambil dari id res_1
						// nah 1 itu nandain count pertama
						// value nya ada tapi di id res_1 maksudnya?
						// itu valuenya diambil dari id res_ trs kan aku panggil di func yg change
						// enggak maksudku disini vlResT01 udah keisi benar belum
						// sudah cii
						// km ngecek res_1 apa vlResT01 nya?
								// vlResT01 nya
								// udah yakin keisi ?
										
										// yakin. lemme show you itu ci, hah mana, sori2
			}
			if(mdata.data[i].rsd_type == "T05"){
				//var vlResT05 = $('#res_' + count).val();
				
				var vlResT05 = document.getElementById("res_3").value;

				$('#valT05').val(mdata.data[i].rsd_amount - (mdata.data[i].paid + waii));
				html += '<input type = "hidden" id="payT05" value="'+mdata.data[i].paid+'">'
				html += '<input type = "hidden" id="waiT05" value="'+waii+'">'
				html += '<input type = "hidden" id="tagT05" value="'+mdata.data[i].rsd_amount+'">'
				html += '<input type = "hidden" id="resT05" value="'+vlResT05+'">'
			}
			}
			
			$("#dvSave").show();
			$("#sisNote").show();

			$("#notes").val("");



				$("#btnShowTable").click(function(){
					
					// $('#simulation_table').refresh();
					$('#simulation_table').show(); 
					$('#restructureCalculation').show();
					$('#btnSave').attr('disabled', false);
				// 	var accno = e.relatedTarget.id;
		
				// $("#accNoHid").val(accno);
		
				// var dtArr = {};
				// dtArr['acc_no'] = accno;

					$
				.ajax({
					headers : {},
					type : 'POST',
					asyn : true,
					url : '${local_server}/restructure/getSimulateInstallment',
					data : $("#formInputPayment").serialize(),
					dataType : 'json',
					success : function(data) {
						console.log("simulation_table");
						console.log(data);
						

						getOldLPResP(data);
						
						$(
							'#simulation_table')
							.DataTable()
							.destroy();
						
						
						$('#simulation_table')
								.dataTable(
										{
					 						data : $.parseJSON(JSON
													.stringify(data.data)),
											scrollX: true,
											"order": [[ 8, "asc" ]],
											paging: false,
											columns : [
												{
													data : 'counter',
													"orderable":false,
														render : function(data,
																type, row) {
																	var edit='';
																	edit += row.counter;
																	edit += '<input type = "hidden" id="rni_periode" name="rni_periode" value="'+row.period+'">';
																	return edit;
																}

												},
												{
													data : 'installment_amount',
													"orderable":false,
														render : function(data,
																type, row) {
																	var edit='';
																	edit += toRp(row.installment_amount);
																	edit += '<input type = "hidden" id="installmentA" name="installmentA" value="'+row.installment_amount+'">';
																	return edit;
																}
												},
												{
													data : 'principal_amount',
													"orderable":false,
														render : function(data,
																type, row) {

																	var edit='';
																	edit += toRp(row.principal_amount);
														 		 	edit += '<input type = "hidden" id="pokok" name="pokok" value="'+row.principal_amount+'">';
																	return edit;
																}
												},
												{ 
													data : 'interest_amount',
													"orderable":false,
														render : function(data,
																type, row) {

																	var edit='';
																	edit += toRp(row.interest_amount);
																	edit += '<input type = "hidden" id="interestA" name="interestA" value="'+row.interest_amount+'">';
																	return edit;
																}
												},
													{
														data : 'outstanding_amount',
														"orderable":false,
															render : function(data,
																	type, row) { 
																		var edit='';
																		var a = row.interest;
							 											var b = a.toString();
																		
																		var d = b.substring(0,5);
																		
																		edit += toRp(row.outstanding_amount);
																		edit += '<input type = "hidden" id="outsA" name="outsA" value="'+row.outstanding_amount+'">';
																		edit += '<input type = "hidden" id="monthCounter" name="monthCounter" value="'+row.counter+'">';
																		edit += '<input type = "hidden" id="bungaPBulan" name="bungaPBulan" value="'+d+'">';
																		return edit;
														 		}
													},

													{
														data : 'old_principal_amount',
														"orderable":false,
															render : function(data,
																	type, row) {
																		var edit='';
																		edit += toRp(row.old_principal_amount);
																		edit += '<input type = "hidden" id="oldPA" name="oldPA" value="'+row.old_principal_amount+'">';
																		return edit;
																	}

													},
													{
														data : 'old_interest_amount',
														"orderable":false,
															render : function(data,
																	type, row) {
																		var edit='';
																		
																		edit += toRp(row.old_interest_amount);
																		edit += '<input type = "hidden" id="oldIA" name="oldIA" value="'+row.old_interest_amount+'">';
																		return edit;
																	}

													},
						
													{
														data : 'installment_date',
														"orderable":false,
															render : function(data,
																	type, row) {
																		var edit='';
																		edit += row.installment_date;
																		edit += '<input type = "hidden" id="instD" name="instD" value="'+row.installment_date+'">';
																		return edit;
																	}

													},
													{
														data : 'due_date',
														"orderable":false,
															render : function(data,
																	type, row) {
																		var edit='';
																		edit += row.due_date;
																		edit += '<input type = "hidden" id="dueD" name="dueD" value="'+row.due_date+'">';
																		return edit;
																	}

													} 
									 				/*{    
														data : 'interest', 
														"orderable":false,
															render : function(data,
																	type, row) {
																		var a = row.interest;
							 											var b= a.toString();
																		var c = b.substring(0,4);
																		
																		var d = b.substring(0,5);
																		
																		var e = (d*100).toString();
																		var f = e.substring(0,3);

																		console.log(d, "d");

																		var edit=''; 
																		edit += f + '%';
																		edit += '<input type = "hidden" id="bungaPBulan" name="bungaPBulan" value="'+d+'">';
																		return edit;
																	}
											 		
													}, */
													// {
													// 	data : 'outstanding_amount',
													// 		render : function(data,
													// 				type, row) {
													// 					var edit='';
								 					// 					edit += toRp(row.outstanding_amount);
													// 					edit += '<input type = "hidden" id="outsA" name="outsA" value="'+row.outstanding_amount+'">';
													// 					return edit;
													// 				}

													// }
													]
										});
						
						
					},
					failure : function(errMsg) {
						alert("call failed");
					}
				});

			});

		} else {
			$("#billingDetailPriority").empty();			
			$("#dvSave").hide();
			$("#sisNote").hide();
			$("#restructureCalculation").empty();
			$("#restructureCalculation").hide();
			$("#notes").val("");
			
		}
		
	}
	
	function getOldLPResP(data){
		$("#restructureCalculation").empty();
		console.log(data, "data getOldLPResP");
		var text = '';
		
		 text += '<div class="row">';
		 text += '<div class="col-md-4">';
		 text += '<table width="100%">';					
		 text += '<tr>';							
		 text += '<td><strong>Old Loan Principal</strong></td>';								
		 text += '<td> : </td>';		
		 
		 var pemOldLP = Math.floor(data.old_loan_percentage);

		 text += '<td><strong><span style="float:left">Rp</span><input type="hidden" name="hidTotOldLP" id="hidTotOldLP" value="'+data.old_loan_percentage+'"><span style="float:right" id="totOldLP">'+ toRp(data.old_loan_principal) +' ('+pemOldLP+'%)</span></strong></td>'
		 text += '<td><input type="hidden" name="hidOldLP" id="hidOldLP" value="'+data.old_loan_principal+'"></td>'
		 text += '</tr>'; 					
		 text += '<tr>';							
		 text += '<td><strong>Restructure Principal</strong></td>';								
		 text += '<td> : </td>';	
		 
		 var pemResP = Math.ceil(data.restructure_percentage);
		 
		 text += '<td><strong><span style="float:left">Rp</span><input type="hidden" name="hidTotResP" id="hidTotResP" value="'+data.restructure_percentage+'"><span style="float:right" id="totResP">'+ toRp(data.restructure_principal) +' ('+pemResP+'%)</span></strong></td>'
 		 text += '<td><input type="hidden" name="hidResP" id="hidResP" value="'+data.restructure_principal+'"></td>'
		 text += '</tr>';
		 text += '</table>';								
		 text += '</div>';							
		 text += '</div>';	
		 
		 $("#restructureCalculation").append(text);
	}
	
	function isNumberKey(evt) {
		var charCode = (evt.which) ? evt.which : event.keyCode;
		if (charCode > 31 && (charCode<48 || charCode>57) && charCode != 46)
			return false;

		return true;
	}
	
	function formatCurrency(num) {	
		num = num.toString().replace(/\$|\,/g, '');
		if (isNaN(num) || num == "")
			num = 0;	
		
		sign = (num == (num = Math.abs(num)));
		num = Math.floor(num * 100 + 0.50000000001);
		num = Math.floor(num / 100).toString();
		for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
			num = num.substring(0, num.length - (4 * i + 3)) + ','
					+ num.substring(num.length - (4 * i + 3));
		return (((sign) ? '' : '-') + num);
		
		
	}
	
	function formatCurrencyPayPress(num,count) {		
		num = num.toString().replace(/\$|\,/g, '');
		amount = $("#spnAmount_"+count).text();
		amount = amount.toString().replace(/\$|\,/g, '');
		
		
		
		if (isNaN(num) || num == "")
			num = 0;
		
		if (isNaN(amount) || amount == "")
			amount = 0;	
		
		if(parseFloat(num) > parseFloat(amount)) { 
			$.alert("Payment tidak boleh melebihi tagihan.");
			
			wai = $("#wai_"+count).val();
			wai = wai.toString().replace(/\$|\,/g, '');

			res = $("#res_"+count).val();
			res = res.toString().replace(/\$|\,/g, '');
			
			amount = parseFloat(amount) - (parseFloat(wai)+parseFloat(res));
			
			sign = (amount == (amount = Math.abs(amount)));
			amount = Math.floor(amount * 100 + 0.50000000001);
			amount = Math.floor(amount / 100).toString();
			for (var i = 0; i < Math.floor((amount.length - (1 + i)) / 3); i++)
				amount = amount.substring(0, amount.length - (4 * i + 3)) + ','
						+ amount.substring(amount.length - (4 * i + 3));	
			
			
			return (((sign) ? '' : '-') + amount);
			
		} else {
			
			
			sign = (num == (num = Math.abs(num)));
			num = Math.floor(num * 100 + 0.50000000001);
			num = Math.floor(num / 100).toString();
			for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
				num = num.substring(0, num.length - (4 * i + 3)) + ','
						+ num.substring(num.length - (4 * i + 3));
			return (((sign) ? '' : '-') + num);
		}
	}
	
	function formatCurrencyWaiPress(num,count) {		
		num = num.toString().replace(/\$|\,/g, '');
		amount = $("#spnAmount_"+count).text();
		amount = amount.toString().replace(/\$|\,/g, '');
		
		
		
		if (isNaN(num) || num == "")
			num = 0;
		
		if (isNaN(amount) || amount == "")
			amount = 0;	
		
		if(parseFloat(num) > parseFloat(amount)) { 
			$.alert("Penghapusan tidak boleh melebihi tagihan.");
			
			wai = $("#pay_"+count).val();
			wai = wai.toString().replace(/\$|\,/g, '');
			
			amount = parseFloat(amount) - parseFloat(wai);
			
			sign = (amount == (amount = Math.abs(amount)));
			amount = Math.floor(amount * 100 + 0.50000000001);
			amount = Math.floor(amount / 100).toString();
			for (var i = 0; i < Math.floor((amount.length - (1 + i)) / 3); i++)
				amount = amount.substring(0, amount.length - (4 * i + 3)) + ','
						+ amount.substring(amount.length - (4 * i + 3));	
			
			
			return (((sign) ? '' : '-') + amount);
			
		} else {
			
			
			sign = (num == (num = Math.abs(num)));
			num = Math.floor(num * 100 + 0.50000000001);
			num = Math.floor(num / 100).toString();
			for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
				num = num.substring(0, num.length - (4 * i + 3)) + ','
						+ num.substring(num.length - (4 * i + 3));
			return (((sign) ? '' : '-') + num);
		}
	}

	function formatCurrencyResPress(num,count) {		
		num = num.toString().replace(/\$|\,/g, '');
		amount = $("#spnAmount_"+count).text();
		amount = amount.toString().replace(/\$|\,/g, '');
		
		
		
		if (isNaN(num) || num == "")
			num = 0;
		
		if (isNaN(amount) || amount == "")
			amount = 0;	
		
		if(parseFloat(num) > parseFloat(amount)) { 
			$.alert("Restructure tidak boleh melebihi tagihan.");
			
			wai = $("#wai_"+count).val();
			wai = wai.toString().replace(/\$|\,/g, '');
			
			amount = parseFloat(amount) - parseFloat(wai);
			
			sign = (amount == (amount = Math.abs(amount)));
			amount = Math.floor(amount * 100 + 0.50000000001);
			amount = Math.floor(amount / 100).toString();
			for (var i = 0; i < Math.floor((amount.length - (1 + i)) / 3); i++)
				amount = amount.substring(0, amount.length - (4 * i + 3)) + ','
						+ amount.substring(amount.length - (4 * i + 3));	
			
			
			return (((sign) ? '' : '-') + amount);
			
		} else {
			
			
			sign = (num == (num = Math.abs(num)));
			num = Math.floor(num * 100 + 0.50000000001);
			num = Math.floor(num / 100).toString();
			for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
				num = num.substring(0, num.length - (4 * i + 3)) + ','
						+ num.substring(num.length - (4 * i + 3));
			return (((sign) ? '' : '-') + num);
		}
	}
	
	
	function formatCurrencyPayChange(num,count) { 	

		$('#simulation_table').hide();
		$(
		'#simulation_table')
		.DataTable()
		.destroy();
		$('#restructureCalculation').hide();
		$('#btnSave').attr('disabled', true);
		
		var totCount = $("#count").val();
		var totPay = 0;
		var totRes = 0;
		var numRes = 0;
		var numOldLP = 0;
		var numRes2 = 0;
		var oldLPT01 = 0;
		var oldLPT05 = 0;
		var numResT01 = 0;
		var numResT05 = 0;
		
		num = num.toString().replace(/\$|\,/g, '');
		
		if (isNaN(num) || num == "")
			num = 0;
		
		
		for(var n=1;n <= totCount; n++) {
			var textPay = "";
			var textWai = "";
			var textRes = "";
			var totPayWai =  0; 
			
			
			amount = $("#spnAmount_"+n).text();
			amount = amount.toString().replace(/\$|\,/g, '');
			amount = parseFloat(amount);
			
			textPay = $("#pay_"+ n).val(); 
			textWai = $("#wai_"+ n).val();
			textRes = $("#res_"+ n).val(); 
			textPay = textPay.toString().replace(/\$|\,/g, '');
			textWai = textWai.toString().replace(/\$|\,/g, '');
			textRes = textRes.toString().replace(/\$|\,/g, '');
			if (isNaN(textPay) || textPay == "")
				textPay = 0;
			if (isNaN(textWai) || textWai == "")
				textWai = 0;
			if (isNaN(textRes) || textRes == "")
				textRes = 0;
			totPayWai = parseFloat(textPay) + parseFloat(textWai) + parseFloat(textRes);

				
		var textGood = "";
		var textWaiv = "";
		var tagihan = ""; 
		
		textGood = $("#pay_"+n).val(); 
		textWaiv = $("#wai_"+n).val();
		
		textGood = textGood.toString().replace(/\$|\,/g, '');
		textWaiv = textWaiv.toString().replace(/\$|\,/g, '');
		
		tagihan = $("#hidTagihan_"+n).val();
		tagihan = tagihan.toString().replace(/\$|\,/g, '');
		
		textGood = parseFloat(textGood);
		textWaiv = parseFloat(textWaiv); 
		tagihan = parseFloat(tagihan);
		
		numRes2 = tagihan - (textGood+textWaiv);
		
				totPay += parseFloat(textPay);	
				totRes += numRes2;
			 
		}  
		
		var textGood = "";
		var textWaiv = "";
		var tagihan = ""; 
		
		textGood = $("#pay_"+count).val(); 
		textWaiv = $("#wai_"+count).val();
		
		textGood = textGood.toString().replace(/\$|\,/g, '');
		textWaiv = textWaiv.toString().replace(/\$|\,/g, '');
		
		tagihan = $("#hidTagihan_"+count).val();
		tagihan = tagihan.toString().replace(/\$|\,/g, '');
		
		textGood = parseFloat(textGood);
		textWaiv = parseFloat(textWaiv);
		tagihan = parseFloat(tagihan);
		
		numRes = tagihan - (textGood+textWaiv);
		
		var type = "";
		var outstandingVal = 0;
		var principalVal = 0;
		var htotRes = 0;
		var perOldLP = 0;
		var oldLPPer = 0;
		var pemOldLP = 0;
		var toStringOldLP = 0;
		var substrOldLP = 0;
		
		type = $("#hidType_"+count).val();
		console.log(type, "type");
		
		htotRes = $("#hidTotRes").val();
		htotRes = parseFloat(htotRes);
		//console.log(htotRes, "hidtotress");
		
		if(type == "T01"){ //outs balance
			outstandingVal = numRes;
			console.log(outstandingVal, "outsval t01");
			console.log(numRes, "numRes t01");
		
			
		}

		
			if(type == "T05"){ //principal
				principalVal = numRes + outstandingVal;
				
				pemOldLP = (principalVal/totRes) * 100;
				toStringOldLP =  pemOldLP.toString();
				substrOldLP = toStringOldLP.substring(0,5);
		 	 	perOldLP = substrOldLP; 
				oldLPPer = principalVal/totRes;
				
				console.log(outstandingVal, "outstandingVal if"); 

				console.log(perOldLP, "perOldLP if");
				console.log(oldLPPer, "oldLPPer if");
				console.log(totRes, "totRes if");
				console.log(numRes, "numRes if");
			}
		
		// var valuePayT01 = "";
		// var valuePayT05 = "";
		// var valueWaiT01 = "";
		// var valueWaiT05 = "";
		// var valueTagihanT01 = "";
		// var valueTagihanT05 = "";
		
		
		// valuePayT01 = $("#payT01").val();
		// valuePayT01 = valuePayT01.toString().replace(/\$|\,/g, '');
		// valuePayT01 = parseFloat(valuePayT01);
		
		// valuePayT05 = $("#payT05").val(); 
		// valuePayT05 = valuePayT05.toString().replace(/\$|\,/g, '');
		// valuePayT05 = parseFloat(valuePayT05);
		
		// valueWaiT01 = $("#waiT01").val();
		// valueWaiT01 = valueWaiT01.toString().replace(/\$|\,/g, '');
		// valueWaiT01 = parseFloat(valueWaiT01);
		
		// valueWaiT05 = $("#waiT05").val();
		// valueWaiT05 = valueWaiT05.toString().replace(/\$|\,/g, '');
		// valueWaiT05 = parseFloat(valueWaiT05);
		
		// valueTagihanT01 = $("#tagT01").val();
		// valueTagihanT01 = valueTagihanT01.toString().replace(/\$|\,/g, '');
		// valueTagihanT01 = parseFloat(valueTagihanT01);
		
		// valueTagihanT05 = $("#tagT05").val();
		// valueTagihanT05 = valueTagihanT05.toString().replace(/\$|\,/g, '');
		// valueTagihanT05 = parseFloat(valueTagihanT05);
		
		// numResT01 = valueTagihanT01 - (valuePayT01 + valueWaiT01);
		// numResT05 = valueTagihanT05 - (valuePayT05 + valueWaiT05);
		
		// var type01 = $("#valT01").val();
		// var fTypeT01 = parseFloat(type01);
		// var type05 = $("#valT05").val();
		// var fTypeT05 = parseFloat(type05);

		///////////////////////////////////
		
		// if(type == "T01" || type == "T05"){
		// 	//principalVal = fTypeT01+fTypeT05;
			
		// 	var valResT01 = 0;
		// 	var valResT05 = 0;
			
		// 	//valResT01 = $("#resT01").val();
		// 	valResT01 = document.getElementById("res_1").value;
			
		// 	//valResT01 = valResT01.toString();
		// 	valResT01 = parseFloat(valResT01);
			
		// 	//valResT05 = $("#resT05").val();
		// 	valResT05 = document.getElementById("res_3").value;
		// 	//valResT05 = valResT05.toString();
		// 	valResT05 = parseFloat(valResT05);
			
		// 	principalVal = valResT01 + valResT05;
			
		// 	//console.log(numResT01, "numResT01");
		// 	//console.log(numResT05, "numResT05");
		// 	console.log(valResT01, "valResT01");
		// 	console.log(valResT05, "valResT05");
		// 	console.log(principalVal, "fTypeT05 principalVal");
			
		// }
		
		
		else if(type != "T01" || type != "T05"){

			principalVal = $("#hidOldLP").val(); 

			principalVal = parseFloat(principalVal);
			
			pemOldLP = (principalVal/totRes) * 100;
			toStringOldLP =  pemOldLP.toString();
			substrOldLP = toStringOldLP.substring(0,5);
	 	 	perOldLP = substrOldLP; 
			oldLPPer = principalVal/totRes;
			
			console.log(principalVal, "principalVal yg else ");
			// console.log(htotRes, "htotRes else");
			console.log(outstandingVal, "outstandingVal else");

			console.log(perOldLP, "perOldLP outs else");
			console.log(oldLPPer, "oldLPPer outs else");
			console.log(totRes, "totRes outs else");
			
			console.log(numRes, "numRes yang di else");
			
		}
		
		//console.log(outstandingVal, "outssval");
		//console.log(principalVal, "principalVal");
		//console.log(perOldLP, "perOldLP");
		//console.log(oldLPPer, "oldLPPer");
		
		var resP = 0;
		var perResP = 0;
		var resPPer = 0;
		var pemResP = 0;
		var toStringResP = 0;
		var substrResP = 0;
		var perResP = 0;
		
		resP = totRes - principalVal;

		//console.log(resP, "INI RESP"); 
		//console.log(totRes, "INI totRes");
		//console.log(principalVal, "INI PRINCIPALVAL");

		 pemResP = (resP/totRes) * 100;
		 toStringResP = pemResP.toString();
		 substrResP = toStringResP.substring(0,5);
	 	 perResP = substrResP;
		resPPer = resP/totRes;
		 
		$("#hidTotPay").empty();
		$("#hidTotPay").val(totPay); 

		$("#res_"+count).empty();
		$("#res_"+count).val(numRes);
		
		//$("#hidTotOldLP").empty();
		//$("#hidTotOldLP").val(oldLPPer); 
		
		//$("#hidOldLP").empty();
		//$("#hidOldLP").val(principalVal); 
		
		//$("#hidResP").empty();
		//$("#hidResP").val(resP); 
		
		//$("#hidTotResP").empty();
		//$("#hidTotResP").val(resPPer); 
		


		$("#hidTotRes").empty();
		$("#hidTotRes").val(totRes); 

		
		totPay = toRp(totPay);
		$("#totPay").empty();
		$("#totPay").html(totPay);
		
		numRes = toRp(numRes);
		$("#spnRes_"+count).empty();
		$("#spnRes_"+count).html(numRes); 
		
		//principalVal = toRp(principalVal); 
		//$("#totOldLP").empty();
		//$("#totOldLP").html(principalVal + ' ('+perOldLP+'%)');
		
		//resP = toRp(resP);
		//$("#totResP").empty();
		//$("#totResP").html(resP + ' ('+perResP+'%)');

		totRes = toRp(totRes);
		$("#totRes").empty();
		$("#totRes").html(totRes);
		
		
		
		sign = (num == (num = Math.abs(num)));
		num = Math.floor(num * 100 + 0.50000000001);
		num = Math.floor(num / 100).toString();
		for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
			num = num.substring(0, num.length - (4 * i + 3)) + ','
					+ num.substring(num.length - (4 * i + 3));
		return (((sign) ? '' : '-') + num);
		
		
	}
	
	function formatCurrencyWaiChange(num,count) {	
		
		$('#simulation_table').hide();
		$(
		'#simulation_table')
		.DataTable()
		.destroy();
		$('#restructureCalculation').hide();
		$('#btnSave').attr('disabled', true);
		
		var totCount = $("#count").val();
		var totWai = 0;
		var totRes = 0;
		var numRes = 0;
		var numOldLP = 0;
		
		num = num.toString().replace(/\$|\,/g, '');
		
		if (isNaN(num) || num == "")
			num = 0;
		
		
		for(var n=1;n <= totCount; n++) {
			var textPay = "";
			var textWai = "";
			var textRes = "";
			var totPayWai =  0;
			var numRes2=0;
			
			
			amount = $("#spnAmount_"+n).text();
			amount = amount.toString().replace(/\$|\,/g, '');
			amount = parseFloat(amount);
			console.log(amount, "amount");
			console.log($("#hidTagihan_"+ n).val());
			
			textPay = $("#pay_"+ n).val();
			textWai = $("#wai_"+ n).val();
			textRes = $("#res_"+ n).val();
			textPay = textPay.toString().replace(/\$|\,/g, '');
			textWai = textWai.toString().replace(/\$|\,/g, '');
			textRes = textRes.toString().replace(/\$|\,/g, '');
			if (isNaN(textPay) || textPay == "")
				textPay = 0;
			if (isNaN(textWai) || textWai == "")
				textWai = 0;
			if (isNaN(textRes) || textRes == "")
				textRes = 0;
			totPayWai = parseFloat(textPay) + parseFloat(textWai) + parseFloat(textRes);

			var textGood = "";
		var textWaiv = "";
		var tagihan = ""; 
		
		textGood = $("#pay_"+n).val(); 
		textWaiv = $("#wai_"+n).val();
		
		textGood = textGood.toString().replace(/\$|\,/g, '');
		textWaiv = textWaiv.toString().replace(/\$|\,/g, '');
		
		tagihan = $("#hidTagihan_"+n).val();
		tagihan = tagihan.toString().replace(/\$|\,/g, '');
		
		textGood = parseFloat(textGood);
		textWaiv = parseFloat(textWaiv); 
		tagihan = parseFloat(tagihan);
		
		numRes2 = tagihan - (textGood+textWaiv);

		console.log(numRes2, "INI ISI NUMRES2");

				totWai += parseFloat(textWai);	
				totRes += numRes2;
			
		}   
		
		var textGood = "";
		var textWaiv = "";
		var tagihan = "";
		
		textGood = $("#pay_"+count).val(); 
		textWaiv = $("#wai_"+count).val();
		
		console.log(textGood, "txtGood");
		console.log(textWaiv, "textWaiv");
		
		textGood = textGood.toString().replace(/\$|\,/g, '');
		textWaiv = textWaiv.toString().replace(/\$|\,/g, '');
		
		console.log(textGood, "toStxtGood");
		console.log(textWaiv, "toStextWaiv");
		
		tagihan = $("#hidTagihan_"+count).val();
		tagihan = tagihan.toString().replace(/\$|\,/g, '');
		
		console.log(tagihan, "toStagihan");
		
		textGood = parseFloat(textGood);
		textWaiv = parseFloat(textWaiv);
		tagihan = parseFloat(tagihan);
		
		console.log(textGood, textWaiv, tagihan, "aaaa");
		
		numRes = tagihan - (textGood+textWaiv);
		console.log(numRes, "numRes yang di else");
		
		var type = "";
		var outstandingVal = 0;
		var principalVal = 0;
		var htotRes = 0;
		var perOldLP = 0;
		var oldLPPer = 0;
		var pemOldLP = 0;
		var toStringOldLP = 0;
		var substrOldLP = 0;
		
		
		type = $("#hidType_"+count).val();
		console.log(type, "type");
		
		htotRes = $("#hidTotRes").val();
		htotRes = parseFloat(htotRes);
		console.log(htotRes, "hidtotress");
		
		if(type == "T01"){
			outstandingVal = numRes;
			console.log("ulallala wai");
		}
		if(type == "T05"){
			principalVal = numRes + outstandingVal;

			pemOldLP = (principalVal/totRes) * 100;
			toStringOldLP =  pemOldLP.toString();
			substrOldLP = toStringOldLP.substring(0,5);
	 	 	perOldLP = substrOldLP; 
			oldLPPer = principalVal/totRes;
			
			console.log(" waii ahdashdadc");
		}
		
		
		else if(type != "T01" || type != "T05"){

			principalVal = $("#hidOldLP").val(); 

			principalVal = parseFloat(principalVal);

			pemOldLP = (principalVal/totRes) * 100;
			toStringOldLP =  pemOldLP.toString();
			substrOldLP = toStringOldLP.substring(0,5);
	 	 	perOldLP = substrOldLP; 
			oldLPPer = principalVal/totRes;
			
			console.log(principalVal, "principalVal yg else wai ");
			console.log(totRes, "totRes else wai");
			console.log(perOldLP, "perOldLP outs else wai");
			console.log(oldLPPer, "oldLPPer outs else wai");
			
		}
		
		console.log(outstandingVal, "outssval");
		console.log(principalVal, "principalVal");
		console.log(perOldLP, "perOldLP");
		console.log(oldLPPer, "oldLPPer");
		
		var resP = 0;
		var perResP = 0;
		var resPPer = 0;
		var pemResP = 0;
		var toStringResP = 0;
		var substrResP = 0;
		var perResP = 0;
		
		resP = totRes - principalVal;
		
		console.log(resP, "resP");

		pemResP = (resP/totRes) * 100;
		 toStringResP = pemResP.toString();
		 substrResP = toStringResP.substring(0,5);
	 	 perResP = substrResP;
	 	 
		resPPer = resP/totRes;
	 	console.log(perResP, "persen resP");
	 	console.log(resPPer, "resPPer");
		
			$("#hidTotWai").empty();
			$("#hidTotWai").val(totWai);

			$("#hidTotRes").empty();
			$("#hidTotRes").val(totRes);

			$("#res_"+count).empty();
	  	$("#res_"+count).val(numRes); 
	  	
	  	//$("#hidTotOldLP").empty();
	  	//$("#hidTotOldLP").val(oldLPPer); 
	  	
	  	//$("#hidOldLP").empty();
	  	//$("#hidOldLP").val(principalVal); 
	  	
	  	//$("#hidResP").empty();
	  	//$("#hidResP").val(resP); 
	  	
	  	//$("#hidTotResP").empty();
	  	//$("#hidTotResP").val(resPPer); 

			
			totWai = toRp(totWai);
			$("#totWai").empty();
			$("#totWai").html(totWai);

			totRes = toRp(totRes);
			$("#totRes").empty();
			$("#totRes").html(totRes);

			numRes = toRp(numRes);
			$("#spnRes_"+count).empty();
			$("#spnRes_"+count).html(numRes);

			//principalVal = toRp(principalVal); 
			//$("#totOldLP").empty();
			//$("#totOldLP").html(principalVal + ' ('+perOldLP+'%)');

			//resP = toRp(resP);
			//$("#totResP").empty();
			//$("#totResP").html(resP + ' ('+perResP+'%)');
			
			
			
			sign = (num == (num = Math.abs(num)));
			num = Math.floor(num * 100 + 0.50000000001);
			num = Math.floor(num / 100).toString();
			for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
				num = num.substring(0, num.length - (4 * i + 3)) + ','
						+ num.substring(num.length - (4 * i + 3));
			return (((sign) ? '' : '-') + num);
			
			
	}
	
	function tenorAftChange(){
		//$.alert('Harap menekan tombol "Simulasi Tabel" kembali.'); 
		$('#simulation_table').hide();
		$(
		'#simulation_table')
		.DataTable()
		.destroy();
		$('#restructureCalculation').hide();
		$('#btnSave').attr('disabled', true);
	}
	
	function bungaAftChange(){
		//$.alert('Harap menekan tombol "Simulasi Tabel" kembali.');
		$('#simulation_table').hide();
		$(
		'#simulation_table')
		.DataTable()
		.destroy();
		$('#restructureCalculation').hide();
		$('#btnSave').attr('disabled', true);
	}

	function goodWillChange(){
		$('#tblGenerateDetail').hide();
		$('#sisNote').hide();
		$('#simulation_table').hide();
		$(
		'#simulation_table')
		.DataTable()
		.destroy();
		$('#restructureCalculation').hide();
		$('#btnShowTable').hide();
		$('#btnSave').attr('disabled', true);
	}


	function formatCurrencyResChange(num,count) {	
		var totCount = $("#count").val();
		var totRes = 0;
		// var totOldLP = 0;
		
		num = num.toString().replace(/\$|\,/g, '');
		
		if (isNaN(num) || num == "")
			num = 0;
		
		
		for(var n=1;n <= totCount; n++) { 
			var textPay = "";
			var textWai = "";
			var textRes = "";
			var totPayWai =  0;
			
			
			amount = $("#spnAmount_"+n).text();
			amount = amount.toString().replace(/\$|\,/g, '');
			amount = parseFloat(amount);
			
			textPay = $("#pay_"+ n).val();
			textWai = $("#wai_"+ n).val();
			textRes = $("#res_"+ n).val();
			textPay = textPay.toString().replace(/\$|\,/g, '');
			textWai = textWai.toString().replace(/\$|\,/g, '');
			textRes = textRes.toString().replace(/\$|\,/g, '');
			if (isNaN(textPay) || textPay == "")
				textPay = 0;
			if (isNaN(textWai) || textWai == "")
				textWai = 0;
			if (isNaN(textRes) || textRes == "")
				textRes = 0;
			totPayWai = parseFloat(textPay) + parseFloat(textWai) + parseFloat(textRes);
			if(totPayWai > amount) {
				$.alert("Restructure tidak boleh lebih dari Tagihan Rp. "+ toRp(amount));
				num = parseFloat($("#hidTagihan_"+ n).val() - (textPay+textWai));
				num = num;
				totRes += parseFloat(num);
			} else { 
				totRes += parseFloat(textRes);				
			}
			
		} 
		
			$("#hidTotRes").empty();
			$("#hidTotRes").val(totRes);

			// $("#hidTotOldLP").empty();
			// $("#hidTotOldLP").val(totOldLP);
			
			totRes = toRp(totRes);
			$("#totRes").empty();
			$("#totRes").html(totRes);

			// totOldLP = toRp(totOldLP);
			// $("#totOldLP").empty();
			// $("#totOldLP").html(totOldLP);
			
			
			
			sign = (num == (num = Math.abs(num)));
			num = Math.floor(num * 100 + 0.50000000001);
			num = Math.floor(num / 100).toString();
			for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
				num = num.substring(0, num.length - (4 * i + 3)) + ','
						+ num.substring(num.length - (4 * i + 3));
			return (((sign) ? '' : '-') + num);
			
			
	}
	
	
	$("#formInputPayment").submit(function(e) {	
		var pay = $("#hidTotPay").val();
		var wai = $("#hidTotWai").val();
		var res = $("#hidTotRes").val();
		var tot = $("#hidTot").val();
		// var oldLP = $("#hidTotOldLP").val();
		
		var PayWai = parseFloat(pay) + parseFloat(wai);
		// if(parseFloat(PayWai) != parseFloat(tot)) {
			//var msg = "Cicilan Ke - "+ res[i] +", Sesuaikan dengan total terlebih dahulu Rp. " + toRp(tot);
		// 	var msg = "Alokasi pembayaran tidak sesuai dengan jumlah pembayaran(jumlah alokasi pembayaran - jumlah pembayaran).";
		// 	$.alert(msg);
		// 	return false; 
		// }	
		
		
		
		var jumlah = $("#jumBar").val();
		jumlah = jumlah.toString().replace(/\$|\,/g, '');
		var befJum = $("#befJumBar").val();
		
		console.log(parseFloat(jumlah), "console jumlah");
		
		if((parseFloat(jumlah)) != (parseFloat(pay))){
			$.alert("Pastikan jumlah pembayaran goodwill sama dengan total goodwill.");
		}
		
		else if(parseFloat(jumlah) != parseFloat(befJum)) {
			$.alert("Setelah Memasukkan Jumlah Pembayaran, harap klik submit jumlah pembayaran terlebih dahulu.");
			$("#befJumBar").val(0); 
		} else {

			var url = '${local_server}/restructure/saveDetailManualRestructure';
						
			$.ajax({
				type : "POST",
				url : url,
				data : $("#formInputPayment").serialize(),
				cache : false,
				dataType:'json',
				beforeSend : function() {
					$("#btnSave")
							.html(
									"<i class='fa fa-circle-o-notch fa-spin'></i>  Save");

					$("#btnSave").addClass("disabled");
					$("#btnCancel")
							.addClass("disabled");
					$('button[type=submit]').prop(
							'disabled', true);

				},
				complete : function(xhr, status) {
					
					if (status === 'error' || !xhr.responseText) {
						console.log(xhr);
						console.log("error woi")
					} else {
						var data = JSON.parse(xhr.responseText);
						console.log(data);
						console.log("berhasillll");
						console.log(data.status, "status");
						if(data.status ==  "Success") {						
								$
								.confirm({
									title : "Success",
									content : "Data Berhasil Disimpan.",
									buttons : {
										somethingElse : {
											text : 'OK',
											btnClass : 'btn-success',
											keys : [ 'enter' ],
											action : function() {																		
												location.reload();
												console.log("berhasil save hore");
											}
										}

									}
								});
						} else {
							$.alert(data.message);
							$("#btnSave").html("Save");
							$("#btnSave").removeClass("disabled");
							$("#btnCancel").removeClass("disabled");
							$('button[type=submit]').prop(
									'disabled', false);
							$('#view-modal-ManPay').modal('hide');
							return false;
						}
						
						
					}
					
				}
				
				
			})
		}
		
		
		e.preventDefault();
	})

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
			//ang[1] = (ang[1] != null) ? "," + ang[1] : ",00"
			return '' + rev2.split('').reverse().join('');
		} else {
			return '0'
		}

	}

	function convertDateAPI(val) {
		if (val != null && val != "") {
			var monthNames = [ "Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli",
					"Agustus", "September", "Oktober", "November", "Desember" ];
			var value = new Date(val.replace(/(\d{2})-(\d{2})-(\d{4})/,
					"$2/$1/$3"));
			var tgl = value.getDate();
			var bln = value.getMonth(); //+1;
			var thn = value.getFullYear();
			var dat = tgl + " " + monthNames[bln] + " " + thn;
			return dat;
		} else {
			return "";
		}

	}

	//end : load data
</script>
</html>