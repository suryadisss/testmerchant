<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="AuditTrail" />
	<jsp:param name="datatables" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
	<jsp:param name="jquerydatepicker" value="1" />
	<jsp:param name="ass" value="1" />
	<jsp:param name="multipleselect" value="1" />
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
					<div class="modal-content" style="width: 120%">
						<form id="formInput">
							<input type="hidden" name="new_edit_status" id="new_edit_status" />
							<input type="hidden" name="usr_id" id="usr_id" />
							<div class="modal-header">

								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							</div>
							<div class="modal-body">
								<div class="form-horizontal">
									<table id="tableview" class="table table-hover hidden"
										width="50%">
										<thead>
											<tr>
												<td width="30%"><b>Nama Kolom</b></td>
												<td width="35%"><b>Sebelum</b></td>
												<td width="35%"><b>Sesudah</b></td>
											</tr>
											<tr>
												<td width="30%"><b>ID Pengguna</b></td>
												<td width="35%"><label for="scc_code" id="usr_userid"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="usr_userid_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Nama pengguna</b></td>
												<td width="35%"><label for="scc_code" id="usr_name"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="usr_name_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>NIP</b></td>
												<td width="35%"><label for="scc_code" id="usr_nip"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="usr_nip_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Level Akses</b></td>
												<td width="35%"><label for="scc_code"
													id="usr_access_level" class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="usr_access_level_a" class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Cabang</b></td>
												<td width="35%"><label for="scc_code" id="usr_branch"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="usr_branch_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Status</b></td>
												<td width="35%"><label for="scc_code" id="usr_status"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="usr_status_a"
													class="control-label after"></label></td>
											</tr>

										</thead>
									</table>
									<table id="tableviewua" class="table table-hover hidden"
										width="50%">
										<thead>
											<tr>
												<td width="30%"><b>Nama Kolom</b></td>
												<td width="35%" id="login" align="left"><b>Rincian login pengguna</b></td>
												<td width="35%" id="logout" align="right"><b>Rincian logout pengguna</b></td>
											</tr>
											<tr>
												<td width="30%"><b>Id Pengguna</b></td>
												<td width="35%"><label for="scc_code" id="userid"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="userid_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Nama pengguna</b></td>
												<td width="35%"><label for="scc_code" id="user_name"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="user_name_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>NIP</b></td>
												<td width="35%"><label for="scc_code" id="nip"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="nip_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Level Akses</b></td>
												<td width="35%"><label for="scc_code" id="access_level"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="access_level_a" class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Cabang</b></td>
												<td width="35%"><label for="scc_code" id="branch"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="branch_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Nama Level</b></td>
												<td width="35%"><label for="scc_code" id="lvl_name"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="lvl_name_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Status</b></td>
												<td width="35%"><label for="scc_code" id="status"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="status_a"
													class="control-label after"></label></td>
											</tr>

										</thead>
									</table>
									<table id="tableviewbranch" class="table table-hover hidden"
										width="50%">
										<thead>
											<tr>
												<td width="30%"><b>Nama Kolom</b></td>
												<td width="35%"><b>Sebelum</b></td>
												<td width="35%"><b>Sesudah</b></td>
											</tr>
											<tr>
												<td width="30%"><b>Kode Cabang</b></td>
												<td width="35%"><label for="scc_code" id="branch_code"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="branch_code_a" class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Grup Cabang</b></td>
												<td width="35%"><label for="scc_code" id="branch_group"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="branch_group_a" class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Nama Cabang</b></td>
												<td width="35%"><label for="scc_code" id="barnch_name"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="barnch_name_a" class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Alamat Cabang</b></td>
												<td width="35%"><label for="scc_code"
													id="branch_address" class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="branch_address_a" class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Nama Bank</b></td>
												<td width="35%"><label for="scc_code" id="name_bank"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="name_bank_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Nomor Rek</b></td>
												<td width="35%"><label for="scc_code" id="no_rek"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="no_rek_a"
													class="control-label after"></label></td>
											</tr>

										</thead>
									</table>
									<table id="tableviewMasterData"
										class="table table-hover hidden" width="50%">
										<thead>
											<tr>
												<td width="30%"><b>Nama Kolom</b></td>
												<td width="35%"><b>Sebelum</b></td>
												<td width="35%"><b>Sesudah</b></td>
											</tr>
											<tr>
												<td width="30%"><b>Nama Kolom</b></td>
												<td width="35%"><label for="scc_code"
													id="map_field_name" class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="map_field_name_a" class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Deskripsi Kolom</b></td>
												<td width="35%"><label for="scc_code"
													id="map_field_desc" class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="map_field_desc_a" class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Tipe</b></td>
												<td width="35%"><label for="scc_code" id="map_type"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="map_type_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Formula</b></td>
												<td width="35%"><label for="scc_code" id="map_formula"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="map_formula_a" class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Level</b></td>
												<td width="35%"><label for="scc_code"
													id="map_formula_level" class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="map_formula_level_a" class="control-label after"></label></td>
											</tr>
										</thead>
									</table>
									<table id="tableviewCollectionCharge"
										class="table table-hover hidden" width="50%">
										<thead>
											<tr>
												<td width="30%"><b>Nama Kolom</b></td>
												<td width="35%"><b>Sebelum</b></td>
												<td width="35%"><b>Sesudah</b></td>
											</tr>
											<tr>
												<td width="30%"><b>Dari DPD</b></td>
												<td width="35%"><label for="scc_code" id="ccl_from"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="ccl_from_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Hingga DPD</b></td>
												<td width="35%"><label for="scc_code" id="ccl_to"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="ccl_to_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Biaya</b></td>
												<td width="35%"><label for="scc_code" id="ccl_charge"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="ccl_charge_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Penghitung</b></td>
												<td width="35%"><label for="scc_code" id="ccl_level"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="ccl_level_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Aktif</b></td>
												<td width="35%"><label for="scc_code" id="ccl_isactive"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="ccl_isactive_a" class="control-label after"></label></td>
											</tr>
										</thead>
									</table>
									<table id="tableviewRule" class="table table-hover hidden"
										width="50%">
										<thead>
											<tr>
												<td width="30%"><b>Nama Kolom</b></td>
												<td width="35%"><b>Sebelum</b></td>
												<td width="35%"><b>Sesudah</b></td>
											</tr>
											<tr>
												<td width="30%"><b>Nama Aturan</b></td>
												<td width="35%"><label for="scc_code" id="rule_name"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="rule_name_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Deskripsi Aturan</b></td>
												<td width="35%"><label for="scc_code" id="rule_desk"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="rule_desk_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Kondisi Aturan</b></td>
												<td width="35%"><label for="scc_code" id="rule_cond"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="rule_cond_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Keluaran Aturan</b></td>
												<td width="35%"><label for="scc_code" id="rule_output"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="rule_output_a" class="control-label after"></label></td>
											</tr>
											<!-- 
										<tr>
											<td width="30%"><b>Rule Created By</b></td>
											<td width="35%"><label for="scc_code" id="rule_create"  class="control-label before"></label></td>
											<td width="35%"><label for="scc_code" id="rule_create_a"  class="control-label after"></label></td>
										</tr>
										<tr>
											<td width="30%"><b>Rule Modified By</b></td>
											<td width="35%"><label for="scc_code" id="rule_modif"  class="control-label before"></label></td>
											<td width="35%"><label for="scc_code" id="rule_modif_a"  class="control-label after"></label></td>
										</tr>
										 -->
										</thead>
									</table>
									<table id="tableviewRuleset" class="table table-hover hidden"
										width="50%">
										<thead>
											<tr>
												<td width="30%"><b>Nama Kolom</b></td>
												<td width="35%"><b>Sebelum</b></td>
												<td width="35%"><b>Sesudah</b></td>
											</tr>
											<tr>
												<td width="30%"><b>Nama Kelompok Aturan</b></td>
												<td width="35%"><label for="scc_code" id="lrus_name"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="lrus_name_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Deskripsi Kelompok Aturan</b></td>
												<td width="35%"><label for="scc_code" id="lrus_desc"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="lrus_desc_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Komponen Kelompok Aturan</b></td>
												<td width="35%"><label for="scc_code" id="lrus_comp"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="lrus_comp_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Keluaran Kelompok Aturan</b></td>
												<td width="35%" id="rlso_before"></td>
												<td width="35%" id="rlso_after"></td>
											</tr>
											<tr>
												<td width="30%"><b>Validasi Kelompok Aturan</b></td>
												<td width="35%" id="rlsv_before"></td>
												<td width="35%" id="rlsv_after"></td>
											</tr>
											<tr>
												<td width="30%"><b>Status</b></td>
												<td width="35%"><label for="scc_code"
													id="lrus_is_active" class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="lrus_is_active_a" class="control-label after"></label></td>
											</tr>
										</thead>
									</table>
									<table id="tableviewCoverage" class="table table-hover hidden"
										width="50%">
										<thead>
											<tr>
												<td width="30%"><b>Nama Kolom</b></td>
												<td width="35%"><b>Sebelum</b></td>
												<td width="35%"><b>Sesudah</b></td>
											</tr>
											<tr>
												<td width="30%"><b>Provinsi</b></td>
												<td width="35%"><label for="scc_code" id="province"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="province_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Kota</b></td>
												<td width="35%"><label for="scc_code" id="kota"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="kota_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Kecamatan</b></td>
												<td width="35%"><label for="scc_code" id="kecamatan"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="kecamatan_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Pelanggan</b></td>
												<td width="35%"><label for="scc_code" id="customer"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="customer_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Pelanggan Usaha</b></td>
												<td width="35%"><label for="scc_code"
													id="customer_usaha" class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="customer_usaha_a" class="control-label after"></label></td>
											</tr>


										</thead>
									</table>
									<table id="tableviewTenantGroup"
										class="table table-hover hidden" width="50%">
										<thead>
											<tr>
												<td width="30%"><b>Nama Kolom</b></td>
												<td width="35%"><b>Sebelum</b></td>
												<td width="35%"><b>Sesudah</b></td>
											</tr>
											<tr>
												<td width="30%"><b>Grup Alias</b></td>
												<td width="35%"><label for="scc_code" id="group_alias"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="group_alias_a" class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Nama Grup</b></td>
												<td width="35%"><label for="scc_code" id="group_name"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="group_name_a"
													class="control-label after"></label></td>
											</tr>
										</thead>
									</table>
									<table id="tableviewProductInfo"
										class="table table-hover hidden" width="50%">
										<thead>
											<tr>
												<td width="30%"><b>Nama Kolom</b></td>
												<td width="35%"><b>Sebelum</b></td>
												<td width="35%"><b>Sesudah</b></td>
											</tr>
											<tr>
												<td><b>Prioritas</b></td>
												<td><label id="prd_priority"
													class="control-label after"></label></td>
												<td><label id="prd_priority_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td><b>Produk</b></td>
												<td><label id="prd_grp_code"
													class="control-label after"></label></td>
												<td><label id="prd_grp_code_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td><b>Nama Produk</b></td>
												<td><label id="prd_name" style="text-align: left"
													class="control-label after"></label></td>
												<td><label id="prd_name_a" style="text-align: left"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td><b>Deskripsi Produk</b></td>
												<td><label id="prd_desc" style="text-align: left"
													class="control-label after"></label></td>
												<td><label id="prd_desc_a" style="text-align: left"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td><b>Dari jumlah pinjaman</b></td>
												<td><label id="prd_min_value"
													class="control-label after"></label></td>
												<td><label id="prd_min_value_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td><b>Hingga jumlah pinjaman</b></td>
												<td><label id="prd_max_value"
													class="control-label after"></label></td>
												<td><label id="prd_max_value_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td><b>Kalkulasi bunga</b></td>
												<td><label id="prd_intr_calc"
													class="control-label after"></label></td>
												<td><label id="prd_intr_calc_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td><b>Berlaku dari tanggal</b></td>
												<td><label id="prd_start_date"
													class="control-label after"></label></td>
												<td><label id="prd_start_date_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td><b>Sampai tanggal</b></td>
												<td><label id="prd_end_date"
													class="control-label after"></label></td>
												<td><label id="prd_end_date_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td><b>Tanggal pelunasan</b></td>
												<td><label id="prd_statement_date"
													class="control-label after"></label></td>
												<td><label id="prd_statement_date_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td><b>Tanggal tagihan</b></td>
												<td><label id="prd_billing_date"
													class="control-label after"></label></td>
												<td><label id="prd_billing_date_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td><b>Toleransi percepatan pembayaran</b></td>
												<td><label id="prd_repayment_tolerance"
													class="control-label after"></label></td>
												<td><label id="prd_repayment_tolerance_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td><b>Percepatan pembayaran minimal</b></td>
												<td><label id="prd_repayment_min"
													class="control-label after"></label></td>
												<td><label id="prd_repayment_min_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td><b>Toleransi penalti</b></td>
												<td><label id="prd_penalty_tolerance"
													class="control-label after"></label></td>
												<td><label id="prd_penalty_tolerance_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td><b>Pasar</b></td>
												<td><label id="prd_is_market_place"
													class="control-label after"></label></td>
												<td><label id="prd_is_market_place_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td><b>Pengecekan kredit</b></td>
												<td><label id="prd_credit_checking"
													class="control-label after"></label></td>
												<td><label id="prd_credit_checking_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td><b>Aturan Produk</b></td>
												<td><label id="prd_rule" style="text-align: left"
													class="control-label after"></label></td>
												<td><label id="prd_rule_a" style="text-align: left"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td><b>Toko</b></td>
												<td><label id="prd_tnt_alias"
													class="control-label after"></label></td>
												<td><label id="prd_tnt_alias_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td><b>Kategori Item</b></td>
												<td><label id="prd_item_cat"
													class="control-label after"></label></td>
												<td><label id="prd_item_cat_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td><b>Aturan Item</b></td>
												<td><label id="prd_item_rule" style="text-align: left"
													class="control-label after"></label></td>
												<td><label id="prd_item_rule_a"
													style="text-align: left" class="control-label after"></label></td>
											</tr>
											<tr>
												<td id="ProductInfo_Ruleset" colspan="3"></td>
											</tr>
											<tr>
												<td id="ProductInfo_Item" colspan="3"></td>
											</tr>
											<tr>
												<td id="ProductInfo_Othercost" colspan="3"></td>
											</tr>
											<tr>
												<td id="ProductInfo_Penalty" colspan="3"></td>
											</tr>
											<tr>
												<td id="ProductInfo_Repayment" colspan="3"></td>
											</tr>
											<tr>
												<td><b>Status</b></td>
												<td><label id="prd_approved_status"
													style="text-align: left" class="control-label after"></label></td>
												<td><label id="prd_approved_status_a"
													style="text-align: left" class="control-label after"></label></td>
											</tr>
										</thead>
									</table>
									<table id="tableviewTenantDetail"
										class="table table-hover hidden" width="50%">
										<thead>
											<tr>
												<td width="30%"><b>Nama Kolom</b></td>
												<td width="35%"><b>Sebelum</b></td>
												<td width="35%"><b>Sesudah</b></td>
											</tr>
											<tr>
												<td width="30%"><b>Grup Alias</b></td>
												<td width="35%"><label for="scc_code"
													id="tnt_group_alias" class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="tnt_group_alias_a" class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Nama Grup</b></td>
												<td width="35%"><label for="scc_code" id="tnt_group"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="tnt_group_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Toko Alias</b></td>
												<td width="35%"><label for="scc_code" id="tnt_alias"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="tnt_alias_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Nama Toko</b></td>
												<td width="35%"><label for="scc_code" id="tnt_name"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="tnt_name_a"
													class="control-label after"></label></td>
											</tr>
										</thead>
									</table>
									<table id="tableviewprioritypayment"
										class="table table-hover hidden" width="50%">
										<thead>
											<tr>
												<td width="30%"><b>Nama Kolom</b></td>
												<td width="35%"><b>Sebelum</b></td>
												<td width="35%"><b>Sesudah</b></td>
											</tr>
											<tr>
												<td width="30%"><b>Kode Pembayaran</b></td>
												<td width="35%"><label for="scc_code" id="payment_code"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="payment_code_a" class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Prioritas pembayaran</b></td>
												<td width="35%"><label for="scc_code"
													id="payment_priority" class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="payment_priority_a" class="control-label after"></label></td>
											</tr>
											<!-- <tr>
											<td width="30%"><b>Payment category</b></td>
											<td width="35%"><label for="scc_code" id="payment_category" class="control-label before"></label></td>
											<td width="35%"><label for="scc_code" id="payment_category_a"  class="control-label after"></label></td>
										</tr> -->
											<tr>
												<td width="30%"><b>Pembayaran melalui</b></td>
												<td width="35%"><label for="scc_code" id="payment_by"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="payment_by_a"
													class="control-label after"></label></td>
											</tr>

										</thead>
									</table>
									<table id="tableviewRuleParam" class="table table-hover hidden"
										width="50%">
										<thead>

											<tr>
												<td width="30%"><b>Nama Kolom</b></td>
												<td width="35%"><b>Sebelum</b></td>
												<td width="35%"><b>Sesudah</b></td>
											</tr>
											<tr>
												<td width="30%"><b>Nilai</b></td>
												<td width="35%"><label for="scc_code"
													id="ruleparam_ddp_value" class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="ruleparam_ddp_value_a" class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Nama</b></td>
												<td width="35%"><label for="scc_code"
													id="ruleparam_ddp_name" class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="ruleparam_ddp_name_a" class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Penghitung</b></td>
												<td width="35%"><label for="scc_code"
													id="ruleparam_urut" class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="ruleparam_urut_a" class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Terpakai</b></td>
												<td width="35%"><label for="scc_code"
													id="ruleparam_ddp_isused" class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="ruleparam_ddp_isused_a" class="control-label after"></label></td>
											</tr>
										</thead>
									</table>
									<table id="tableCommisionLog" class="table table-hover hidden"
										width="50%">
										<thead>
											<tr>
												<td width="30%"><b>Nama Kolom</b></td>
												<td width="35%"><b>Sebelum</b></td>
												<td width="35%"><b>Sesudah</b></td>
											</tr>
											<tr>
												<td width="30%"><b>Komisi Investasi Individu</b></td>
												<td width="35%"><label for="scc_code"
													id="pers_invest" class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="pers_invest_a" class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Komisi repay Individu</b></td>
												<td width="35%"><label for="scc_code"
													id="pers_repay" class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="pers_repay_a" class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Komisi keterlambatan individu</b></td>
												<td width="35%"><label for="scc_code"
													id="pers_late" class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="pers_late_a" class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Komisi penagihan individu</b></td>
												<td width="35%"><label for="scc_code"
													id="pers_collect" class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="pers_collect_a" class="control-label after"></label></td>
											</tr>


											<tr>
												<td width="30%"><b>Komisi investasi korporat</b></td>
												<td width="35%"><label for="scc_code"
													id="corp_invest" class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="corp_invest_a" class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Komisi Repay korporat</b></td>
												<td width="35%"><label for="scc_code"
													id="corp_repay" class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="corp_repay_a" class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Komisi Keterlambatan korporat</b></td>
												<td width="35%"><label for="scc_code"
													id="corp_late" class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="corp_late_a" class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Komisi Penagihan korporat</b></td>
												<td width="35%"><label for="scc_code"
													id="corp_collect" class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="corp_collect_a" class="control-label after"></label></td>
											</tr>


											<tr>
												<td width="30%"><b>Komisi investasi biaya akhir</b></td>
												<td width="35%"><label for="scc_code"
													id="ls_invest" class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="ls_invest_a" class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Komisi repay biaya akhir</b></td>
												<td width="35%"><label for="scc_code"
													id="ls_repay" class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="ls_repay_a" class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Komisi keterlambatan biaya akhir</b></td>
												<td width="35%"><label for="scc_code"
													id="ls_late" class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="ls_late_a" class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Komisi penagihan biaya akhir</b></td>
												<td width="35%"><label for="scc_code"
													id="ls_collect" class="control-label before"></label></td>
												<td width="35%"><label for="scc_code"
													id="ls_collect_a" class="control-label after"></label></td>
											</tr>
										</thead>
									</table>
									<table id="tableviewcustparam" class="table table-hover hidden"
										width="50%">
										<thead>

											<tr>
												<td width="30%"><b>Nama Kolom</b></td>
												<td width="35%"><b>Sebelum</b></td>
												<td width="35%"><b>Sesudah</b></td>
											</tr>
											<tr>
												<td width="30%"><b>Nilai</b></td>
												<td width="35%"><label for="scc_code" id="ddp_value"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="ddp_value_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Nama</b></td>
												<td width="35%"><label for="scc_code" id="ddp_name"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="ddp_name_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Penghitung</b></td>
												<td width="35%"><label for="scc_code" id="urut"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="urut_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Terpakai</b></td>
												<td width="35%"><label for="scc_code" id="ddp_isused"
													class="control-label before"></label></td>
												<td width="35%"><label for="scc_code" id="ddp_isused_a"
													class="control-label after"></label></td>
											</tr>
											<!--
										<tr>
											<td width="30%"><b>Cust CIF</b></td>
											<td width="35%"><label for="scc_code" id="cust_cif"  class="control-label before"></label></td>
											<td width="35%"><label for="scc_code" id="cust_cif_a"  class="control-label after"></label></td>
										</tr>
										<tr>
											<td width="30%"><b>Cust Spv NIK</b></td>
											<td width="35%"><label for="scc_code" id="cust_spv_nik"  class="control-label before"></label></td>
											<td width="35%"><label for="scc_code" id="cust_spv_nik_a"  class="control-label after"></label></td>
										</tr>
										<tr>
											<td width="30%"><b>Firs Name</b></td>
											<td width="35%"><label for="scc_code" id="firs_name" class="control-label before"></label></td>
											<td width="35%"><label for="scc_code" id="firs_name_a"  class="control-label after"></label></td>
										</tr>
										<tr>
											<td width="30%"><b>Last Name</b></td>
											<td width="35%"><label for="scc_code" id="last_name" class="control-label before"></label></td>
											<td width="35%"><label for="scc_code" id="last_name_a"  class="control-label after"></label></td>
										</tr>
										<tr>
											<td width="30%"><b>Cust NIK</b></td>
											<td width="35%"><label for="scc_code" id="cust_nik" class="control-label before"></label></td>
											<td width="35%"><label for="scc_code" id="cust_nik_a"  class="control-label after"></label></td>
										</tr>
										<tr>
											<td width="30%"><b>Tanggal Lahir</b></td>
											<td width="35%"><label for="scc_code" id="tgl_lhir" class="control-label before"></label></td>
											<td width="35%"><label for="scc_code" id="tgl_lhir_a"  class="control-label after"></label></td>
										</tr>
										<tr>
											<td width="30%"><b>Address</b></td>
											<td width="35%"><label for="scc_code" id="address" class="control-label before"></label></td>
											<td width="35%"><label for="scc_code" id="address_a"  class="control-label after"></label></td>
										</tr>
										<tr>
											<td width="30%"><b>No Phone</b></td>
											<td width="35%"><label for="scc_code" id="no_phone" class="control-label before"></label></td>
											<td width="35%"><label for="scc_code" id="no_phone_a"  class="control-label after"></label></td>
										</tr>
										<tr>
											<td width="30%"><b>Email</b></td>
											<td width="35%"><label for="scc_code" id="email" class="control-label before"></label></td>
											<td width="35%"><label for="scc_code" id="email_a"  class="control-label after"></label></td>
										</tr>
										<tr>
											<td width="30%"><b>Education</b></td>
											<td width="35%"><label for="scc_code" id="education" class="control-label before"></label></td>
											<td width="35%"><label for="scc_code" id="education_a"  class="control-label after"></label></td>
										</tr>
										<tr>
											<td width="30%"><b>Jenis Kelamin</b></td>
											<td width="35%"><label for="scc_code" id="gender" class="control-label before"></label></td>
											<td width="35%"><label for="scc_code" id="gender_a"  class="control-label after"></label></td>
										</tr>
										<tr>
											<td width="30%"><b>Status</b></td>
											<td width="35%"><label for="scc_code" id="payment_by" class="control-label before"></label></td>
											<td width="35%"><label for="scc_code" id="payment_by_a"  class="control-label after"></label></td>
										</tr>
										<tr>
											<td width="30%"><b>Level Salary</b></td>
											<td width="35%"><label for="scc_code" id="lvl_salery" class="control-label before"></label></td>
											<td width="35%"><label for="scc_code" id="lvl_salery_a"  class="control-label after"></label></td>
										</tr>
										<tr>
											<td width="30%"><b>Length of work</b></td>
											<td width="35%"><label for="scc_code" id="work" class="control-label before"></label></td>
											<td width="35%"><label for="scc_code" id="work_a"  class="control-label after"></label></td>
										</tr>
										<tr>
											<td width="30%"><b>Mother</b></td>
											<td width="35%"><label for="scc_code" id="mother" class="control-label before"></label></td>
											<td width="35%"><label for="scc_code" id="mother_a"  class="control-label after"></label></td>
										</tr>
										<tr>
											<td width="30%"><b>Adress KTP</b></td>
											<td width="35%"><label for="scc_code" id="address_ktp" class="control-label before"></label></td>
											<td width="35%"><label for="scc_code" id="address_ktp_a"  class="control-label after"></label></td>
										</tr>
-->
											<!-- <tr>
											<td>Cust CIF</td>
											<td>Cust Spv NIK</td>
											<td>Firs Name</td>
											<td>Last Name</td>
											<td>Cust NIK</td>
											<td>Tanggal Lahir</td>
											<td>Address</td>
											<td>No Phone</td>
											<td>Email</td>
											<td>Education</td>
											<td>Jenis Kelamin</td>
											<td>Status</td>
											<td>Level Salary</td>
											<td>Length of work</td>
											<td>Mother</td>
											<td>Adress KTP</td>
										</tr> -->
										</thead>
									</table>
									<table id="tableviewBlacklist" class="table table-hover hidden"
										width="50%">
										<thead>
											<tr>
												<td width="30%"><b>Nama Kolom</b></td>
												<td width="35%"><b>Sebelum</b></td>
												<td width="35%"><b>Sesudah</b></td>
											</tr>
											<tr>
												<td width="30%"><b>CIF</b></td>
												<td width="35%"><label id="cib_cif"
													class="control-label before"></label></td>
												<td width="35%"><label id="cib_cif_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Status</b></td>
												<td width="35%"><label id="cib_status"
													class="control-label before"></label></td>
												<td width="35%"><label id="cib_status_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Persetujuan Pengguna</b></td>
												<td width="35%"><label id="cib_status_approval_user"
													class="control-label before"></label></td>
												<td width="35%"><label id="cib_status_approval_user_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Disetujui</b></td>
												<td width="35%"><label id="cib_status_isapproval"
													class="control-label before"></label></td>
												<td width="35%"><label id="cib_status_isapproval_a"
													class="control-label after"></label></td>
											</tr>
											<tr>
												<td width="30%"><b>Alasan</b></td>
												<td width="35%"><label id="cib_status_reason"
													class="control-label before"></label></td>
												<td width="35%"><label id="cib_status_reason_a"
													class="control-label after"></label></td>
											</tr>
										</thead>
									</table>
									<table id="tableResetPass" class="table table-hover hidden"
										width="50%">
										<tr>
											<td width="30%"><b>Nama Kolom</b></td>
											<td width="35%"><b>Sebelum</b></td>
											<td width="35%"><b>Sesudah</b></td>
										</tr>
										<tr>
											<td width="30%"><b>Pengguna</b></td>
											<td width="35%"><label id="a_usr_id"
												class="control-label before"></label></td>
											<td width="35%"><label id="a_usr_id_a"
												class="control-label after"></label></td>
										</tr>
									</table>
									<table id="tableGlobalConfig" class=" table table-hover hidden"
										width="50%">
										<tr>
											<td width="30%"><b>Nama Kolom</b></td>
											<td width="35%"><b>Sebelum</b></td>
											<td width="35%"><b>Sesudah</b></td>
										</tr>
										<tr>
											<td width="30%"><b>Kode</b></td>
											<td width="35%"><label id="glc_code"
												class="control-label before"></label></td>
											<td width="35%"><label id="glc_code_a"
												class="control-label after"></label></td>
										</tr>
										<tr>
											<td width="30%"><b>Nama</b></td>
											<td width="35%"><label id="glc_name"
												class="control-label before"></label></td>
											<td width="35%"><label id="glc_name_a"
												class="control-label after"></label></td>
										</tr>
										<tr>
											<td width="30%"><b>Deskripsi</b></td>
											<td width="35%"><label id="glc_desc"
												class="control-label before"></label></td>
											<td width="35%"><label id="glc_desc_a"
												class="control-label after"></label></td>
										</tr>
										
										<tr>
											<td width="30%"><b>Nilai</b></td>
											<td width="35%"><label id="glc_value"
												class="control-label before"></label></td>
											<td width="35%"><label id="glc_value_a"
												class="control-label after"></label></td>
										</tr>
										
									</table>

									<div id="bc"></div>
								</div>
							</div>
							<div class="modal-footer">
								<button class="btn btn-default" data-dismiss="modal">Tutup</button>
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
								<h2>Jejak Audit</h2>
								<div class="clearfix"></div>
							</div>
							<div class="col-xs-12 col-sm-12 col-lg-12"
								style="background: #f7f8f9; border: 1px solid #eff0f2; margin-bottom: 50px;">


								<form id="formReport" autocomplete="off">
									<fieldset>
										<div class="form-horizontal">
											<div class="col-sm-2">
												<input type="hidden" name="rul_id" id="rul_id" /><br />
											</div>
											<div class="form-group col-sm-12">
												<div class="col-sm-2">
													<label for="scc_code" class="control-label">Catatan pengguna</label>
												</div>
												<div class="col-sm-7">
													<select name="p_user" id="p_user"
														class="form-control selectpicker" data-show-subtext="true"
														data-live-search="true"
														onChange="$('#user').val(this.value);" required>
													</select>

												</div>
											</div>
											<div class="form-group col-sm-12">
												<div class="col-sm-2">
													<label for="scc_code" class="control-label">Catatan Modul</label>
												</div>
												<div class="col-sm-7">
													<select name="p_code" id="p_code"
														class="form-control selectpicker" data-show-subtext="true"
														data-live-search="true"
														onChange="$('#code').val(this.value);" required>
													</select>

												</div>
											</div>
											<div class="form-group mx-sm-12 divdate form-inline">
												<div class="col-sm-2">
													<label for="scc_code" class=" col-sm-1 control-label">Dari</label>
												</div>
												<div class="col-sm-3 divdate">
													<input type="text"
														class="col-sm-4 form-control datepicker11"
														placeholder="Dari Tanggal" id="txtform" name="txtform"
														title="(YYYY-MM-DD)" data-date-format="YYYY-MM-DD" />
												</div>
												<div class="col-sm-1">
													<label for="scc_code" class="col-sm-1 control-label">Sampai</label>
												</div>
												<div class="col-sm-4 divbu">
													<input type="text" class="form-control datepicker11"
														placeholder="To Date" name="txtto" id="txtto"
														title="(YYYY-MM-DD)" data-date-format="YYYY-MM-DD" />
												</div>
											</div>

											<div class="form-group mx-sm-8">
												<button type="submit" id="btnShow" class="btn btn-primary">
													<i id="msg"></i>Telusuri
												</button>
											</div>
									</fieldset>
								</form>

							</div>

							<form id="formdownload" class="hidden"
								action="${local_server}/AuditTrail/downloadFile/xlsx"
								target="_blank" method="POST">
								<input type="hidden" class="form-control" id="user" name="user"
									value="0"> <input type="hidden" class="form-control"
									id="code" name="code" value=""> <input type="submit"
									id="btnSubmitExcel">
							</form>
							<div id="exceldownload"></div>
							<table id="tableAuditTrail" class="table table-hover hidden"
								width="100%" style="max-width: 100%">

								<thead>
									<tr>
										<td width="10%">ID Pengguna</td>
										<td width="20%">Tanggal ditindak</td>
										<td width="20%">Client IP</td>
										<td width="20%">Nama Server</td>
										<td width="20%">Aktivitas</td>
										<td width="10%">Tindakan</td>
									</tr>
								</thead>
							</table>
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
	<jsp:param name="validate" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
	<jsp:param name="jquerydatepicker" value="1" />
	<jsp:param name="ass" value="1" />
	<jsp:param name="multipleselect" value="1" />
	<jsp:param name="noityjs" value="1" />
</jsp:include>

<script>
	$(document).ready(function() {

		$('.datepicker11').datetimepicker({
			useCurrent : false
		});

		$("#txtform").on("dp.change", function(e) {
			endDate = new Date(e.date);
			endDate.setDate(endDate.getDate() + 30);

			$("#txto").data("DateTimePicker");

		});

		$("#txto").on("dp.change", function(e) {
			startDate = new Date(e.date);
			startDate.setDate(startDate.getDate() - 30);
			$("#txtform").data("DateTimePicker");
		});

		getDDLUser();
		getDDLModul();

		$("#formReport").submit(function(e) {
			document.getElementById("tableAuditTrail").style.display = "none";
			getListLog();
			var x = $("#p_user");
			switch (x.val()) {
			case "":
				getListLog();
				break;

			}
			e.preventDefault();
		});

	});

	function getListLog() {
		console.log($("#formReport").serialize());
		$
				.ajax({
					type : 'POST',
					asyn : true,
					url : '${local_server}/AuditTrail/list',
					data : $("#formReport").serialize(),
					dataType : 'json',

					beforeSend : function() {
						document.getElementById("tableAuditTrail").style.display = "block";
						$("#msg").html("");
						$("#msg").html("<i class='fa fa-spinner fa-spin'></i>")
					},

					success : function(data) {
						console.log("Product List");
						console.log(data);

						/* var user = document.getElementById('p_user').value;
						var code = document.getElementById('p_code').value;
						 */

						$("#msg").html("");

						$('#tableAuditTrail').removeClass("hidden");
						$('#tableAuditTrail').DataTable().destroy();
						/* var html ='';
						html += '<button type="button" class="btn btn-success btn-sm" id="downloadall">';
						html += '<i class="fa fa-file-excel-o"></i> Download All To Excel</button>';
						$("#exceldownload").empty(); 
						$("#exceldownload").append(html); */

						if (data.status == "Success") {
							//viewDownloadAll(user, code);
							$('#tableAuditTrail')
									.dataTable(
											{
												data : $.parseJSON(JSON
														.stringify(data.data)),
												"searching" : true,
												"scrollX" : true,
												"lengthMenu" : [
														[ 10, 25, 50, -1 ],
														[ 10, 25, 50, "All" ] ],
												columns : [
														{
															data : 'b_log_userid'
														},
														{
															data : 'b_log_action_date',
															render : function(
																	data, type,
																	row) {
																return convertDatetimeAPI(row.b_log_action_date);
															}
														},
														{
															data : 'b_log_https'
														},

														{
															data : 'b_log_server_name'
														},
														{
															data : 'b_log_activity'
														},
														{
															render : function(
																	data, type,
																	row) {
																var edit = '';
																if (row.b_code == 'ua') {
																	edit = '-';
																} else {
																	edit = '<button class="edit btn btn-xs btn-success" id="'+row.b_log_id+'" value="'+row.b_code+'"><i>Tampilkan Rincian</i> '
																			+ '</button>';
																}
																return edit;
															}

														} ],
												dom : 'Bfrtip',
												buttons : [ 'excel' ]

											});
						} else {
							$('#tableAuditTrail').DataTable(
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
		$('#tableAuditTrail')
				.on(
						"click",
						"button.edit",
						function() {
							$("#myModalLabel")
									.html(
											"Audit Trail <span class='label label-default'>View</span>");

							$("#myModal").modal("show");
							//$("#tableview")[0].reset(); 
							getdata(this.id, this.value);
						})

	}

	/* function viewDownloadAll(user,code) {
	
	 $("#downloadall") 
	 .click(function(e) {
	 $("#user").val(user);
	 $("#code").val(code);
	 $("#formdownload").submit();	
	 });
	 } 
	 */

	function convertDateAPI(val) {
		if (val != null && val != "") {
			var monthNames = [ "Januari", "Februari", "Maret", "April", "Mei",
					"Juni", "Juli", "Agustus", "September", "Oktober",
					"November", "Desember" ];
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

	function convertDatetimeAPI(val) {
		if (val != null && val != "") {
			var monthNames = [ "Januari", "Februari", "Maret", "April", "Mei",
					"Juni", "Juli", "Agustus", "September", "Oktober",
					"November", "Desember" ];
			var value = new Date(val.replace(/(\d{2})-(\d{2})-(\d{4})/,
					"$2/$1/$3"));
			var tgl = value.getDate();
			var bln = value.getMonth(); //+1;
			var thn = value.getFullYear();
			var h = value.getHours();
			var m = value.getMinutes();
			var s = value.getSeconds();
			var dat = tgl + " " + monthNames[bln] + " " + thn + " " + h + ":"
					+ m + ":" + s;
			return dat;
		} else {
			return "";
		}

	}

	function getdata(id, code) {
		resetAllTable()
		switch (code) {
		//case "users":
		//	getDataViewUsers(id, code);
		//	break;
		case "ua":
			getDataViewUA(id, code);
			break;
		case "usermanagement":
			getDataViewUM(id, code);
			break;
		case "branch":
			getDataViewBranch(id, code);
			break;
		case "Rule":
			getDataViewRule(id, code);
			break;
		case "coverage":
			getDataViewCoverage(id, code);
			break;
		case "Priority Payment":
			getDataViewPriorityPayment(id, code);
			break;
		case "customer parameter":
			getDataViewCustParam(id, code);
			break;
		case "tenant_group":
			getDataViewTenantGroup(id, code);
			break;
		case "tenant":
			getDataViewTenantDetail(id, code);
			break;
		case "Collection Charge":
			getDataViewCollectionCharge(id, code);
			break;
		case "Ruleset":
			getDataViewRuleset(id, code);
			break;
		case "rule parameter":
			getDataViewRuleParam(id, code);
			break;
		case "Product Info":
			getDataViewProductInfo(id, code);
			break;
		case "Master Data":
			getDataViewMasterData(id, code);
			break;
		case "blacklist":
			getDataViewBlacklist(id, code);
			break;
		case "reset_password":
			getResetPassword(id, code);
			break;
		case "GlobalConfig":
			getGlobalConfig(id, code);
			break;
		case "Commision Log":
			getCommisionLog(id, code);
			break;
		default:
			getDataViewUsers(id, code);
		}

	}

	function getCommisionLog(id, code) {
		$
				.get(
						"${local_server}/AuditTrail/view_detail/" + id + '/'
								+ code,
						function(data) {
							var t = JSON.parse(data);
							console.log(t)
							var bft = ""
							var aft = ""

							$("#msg").html("");
							$('#tableCommisionLog').removeClass("hidden");
							$('#tableCommisionLog').DataTable().destroy();
							$(".before").empty();
							$(".before").removeAttr("style");
							$(".after").empty();
							$(".after").removeAttr("style");

							var model = t.data[0].After;
							

							//for (z = 0; z < t.data[0].item_detail.length; z++)
							//if (model == "After") {
							if(model != ""){
								$
										.each(
												t.data[0].After,
												function(data, t) {
													document.getElementById('pers_invest_a').innerHTML= t.pers_invest; 
													
													document.getElementById('pers_repay_a').innerHTML= t.pers_repay; 
												
													document.getElementById('pers_late_a').innerHTML= t.pers_late; 
												
													document.getElementById('pers_collect_a').innerHTML= t.pers_collect;

													document.getElementById('corp_invest_a').innerHTML= t.corp_invest; 
												
													document.getElementById('corp_repay_a').innerHTML= t.corp_repay; 
												
													document.getElementById('corp_late_a').innerHTML= t.corp_late; 
												
													document.getElementById('corp_collect_a').innerHTML= t.corp_collect;

													document.getElementById('ls_invest_a').innerHTML= t.ls_invest; 
												
													document.getElementById('ls_repay_a').innerHTML= t.ls_repay; 
												
													document.getElementById('ls_late_a').innerHTML= t.ls_late; 
												
													document.getElementById('ls_collect_a').innerHTML= t.ls_collect; 
												});
							}
							var model1 = t.data[0].Before;
							if (model1 != "") {
								$
								.each(
										t.data[0].Before,
										function(data, t) {
											document.getElementById('pers_invest').innerHTML= t.pers_invest; 
											
											document.getElementById('pers_repay').innerHTML= t.pers_repay; 
										
											document.getElementById('pers_late').innerHTML= t.pers_late; 
										
											document.getElementById('pers_collect').innerHTML= t.pers_collect;

											document.getElementById('corp_invest').innerHTML= t.corp_invest; 
										
											document.getElementById('corp_repay').innerHTML= t.corp_repay; 
										
											document.getElementById('corp_late').innerHTML= t.corp_late; 
										
											document.getElementById('corp_collect').innerHTML= t.corp_collect;

											document.getElementById('ls_invest').innerHTML= t.ls_invest; 
										
											document.getElementById('ls_repay').innerHTML= t.ls_repay; 
										
											document.getElementById('ls_late').innerHTML= t.ls_late; 
										
											document.getElementById('ls_collect').innerHTML= t.ls_collect;  
										});
							}
						});
	}
	
	function getGlobalConfig(id, code) {
		$.get("${local_server}/AuditTrail/view_detail/" + id + '/' + code,
				function(data) {
					var o = JSON.parse(data);
					
					$("#msg").html("");
					$(".before").empty();
					$(".before").removeAttr("style");
					$(".after").empty();
					$(".after").removeAttr("style");

					$('#tableGlobalConfig').removeClass("hidden");
					//$('#tableGlobalConfig').DataTable().destroy();
					
					$.each(o.data, function(data, t) {

						if (t.glc_log_action == "BEFORE" || t.glc_log_action == "AFTER") {
							
							var bef1 = (o.data[0].glc_code);
							var aft1 = (o.data[1].glc_code);
							var bef2 = (o.data[0].glc_name);
							var aft2 = (o.data[1].glc_name);
							var bef3 = (o.data[0].glc_desc);
							var aft3 = (o.data[1].glc_desc);
							var bef4 = (o.data[0].glc_value);
							var aft4 = (o.data[1].glc_value);
							var bef5 = (o.data[0].glc_action_by);
							var aft5 = (o.data[1].glc_action_by);
							
							if (bef1 !== aft1) {
								document
										.getElementById('glc_code').innerHTML = bef1;
								document
										.getElementById('glc_code').style.color = "red";
								document
										.getElementById('glc_code_a').innerHTML = aft1;
								document
										.getElementById('glc_code_a').style.color = "red";
							} else {
								document
										.getElementById('glc_code').innerHTML = bef1;
								document
										.getElementById('glc_code_a').innerHTML = aft1;
							}

							if (bef2 !== aft2) {
								document
										.getElementById('glc_name').innerHTML = bef2;
								document
										.getElementById('glc_name').style.color = "red";
								document
										.getElementById('glc_name_a').innerHTML = aft2;
								document
										.getElementById('glc_name_a').style.color = "red";
							} else {
								document
										.getElementById('glc_name').innerHTML = bef2;
								document
										.getElementById('glc_name_a').innerHTML = aft2;
							}
							if (bef3 !== aft3) {
								document
										.getElementById('glc_desc').innerHTML = bef3;
								document
										.getElementById('glc_desc').style.color = "red";
								document
										.getElementById('glc_desc_a').innerHTML = aft3;
								document
										.getElementById('glc_desc_a').style.color = "red";
							} else {
								document
										.getElementById('glc_desc').innerHTML = bef3;
								document
										.getElementById('glc_desc_a').innerHTML = aft3;
							}
							if (bef4 !== aft4) {
								document
										.getElementById('glc_value').innerHTML = bef4;
								document
										.getElementById('glc_value').style.color = "red";
								document
										.getElementById('glc_value_a').innerHTML = aft4;
								document
										.getElementById('glc_value_a').style.color = "red";

							} else {
								document
										.getElementById('glc_value').innerHTML = bef4;
								document
										.getElementById('glc_value_a').innerHTML = aft4;
							}
							
							
						}else{
							document.getElementById('glc_code').innerHTML = (t.glc_code);
							document.getElementById('glc_code').style.color = "red";
							document.getElementById('glc_name').innerHTML = (t.glc_name);
							document.getElementById('glc_name').style.color = "red";
							document.getElementById('glc_desc').innerHTML = (t.glc_desc);
							document.getElementById('glc_desc').style.color = "red";
							document.getElementById('glc_value').innerHTML = (t.glc_value);
							document.getElementById('glc_value').style.color = "red";
							document.getElementById('glc_action_by').innerHTML = (t.glc_action_by);
							document.getElementById('glc_action_by').style.color = "red";
						}

					});
				});
	}

	function getResetPassword(id, code) {
		$
				.get(
						"${local_server}/AuditTrail/view_detail/" + id + '/'
								+ code,
						function(data) {
							var o = JSON.parse(data);
							console.log(o);
							$("#msg").html("");
							$(".before").empty();
							$(".before").removeAttr("style");
							$(".after").empty();
							$(".after").removeAttr("style");
							$('#tableResetPass').removeClass("hidden");
							$
									.each(
											o.data,
											function(data, t) {
												//var model = String(t.cib_action);
												document
														.getElementById('a_usr_id').innerHTML = (t.usr_id);
												document
												.getElementById('a_usr_id').style.color = "red";
										
											});
						});
	}

	function getDataViewBlacklist(id, code) {
		$
				.get(
						"${local_server}/AuditTrail/view_detail/" + id + '/'
								+ code,
						function(data) {
							var o = JSON.parse(data);
							console.log(o);
							$("#msg").html("");
							$(".before").empty();
							$(".before").removeAttr("style");
							$(".after").empty();
							$(".after").removeAttr("style");

							$('#tableviewBlacklist').removeClass("hidden");
							$('#tableviewBlacklist').DataTable().destroy();

							$
									.each(
											o.data,
											function(data, t) {
												var model = String(t.cib_action);
												if (model == "INSERT") {
													document
															.getElementById('cib_cif').innerHTML = (t.cib_cif);
													document
															.getElementById('cib_cif_a').style.color = "red";
													document
															.getElementById('cib_status').innerHTML = (t.cib_status);
													document
															.getElementById('cib_status_a').style.color = "red";
													document
															.getElementById('cib_status_approval_user').innerHTML = (t.cib_status_approval_user);
													document
															.getElementById('cib_status_approval_user_a').style.color = "red";
													document
															.getElementById('cib_status_isapproval').innerHTML = (t.cib_status_isapproval);
													document
															.getElementById('cib_status_isapproval_a').style.color = "red";
													document
															.getElementById('cib_status_reason').innerHTML = (t.cib_status_reason);
													document
															.getElementById('cib_status_reason_a').style.color = "red";

												} else {
													var bef1 = (o.data[0].cib_cif);
													var aft1 = (o.data[1].cib_cif);
													var bef2 = (o.data[0].cib_status);
													var aft2 = (o.data[1].cib_status);
													var bef3 = (o.data[0].cib_status_approval_user);
													var aft3 = (o.data[1].cib_status_approval_user);
													var bef4 = (o.data[0].cib_status_isapproval);
													var aft4 = (o.data[1].cib_status_isapproval);
													var bef5 = (o.data[0].cib_status_reason);
													var aft5 = (o.data[1].cib_status_reason);

													if (bef1 !== aft1) {
														document
																.getElementById('cib_cif').innerHTML = bef1;
														document
																.getElementById('cib_cif').style.color = "red";
														document
																.getElementById('cib_cif_a').innerHTML = aft1;
														document
																.getElementById('cib_cif_a').style.color = "red";
													} else {
														document
																.getElementById('cib_cif').innerHTML = bef1;
														document
																.getElementById('cib_cif_a').innerHTML = aft1;
													}

													if (bef2 !== aft2) {
														document
																.getElementById('cib_status').innerHTML = bef2;
														document
																.getElementById('cib_status').style.color = "red";
														document
																.getElementById('cib_status_a').innerHTML = aft2;
														document
																.getElementById('cib_status_a').style.color = "red";
													} else {
														document
																.getElementById('cib_status').innerHTML = bef2;
														document
																.getElementById('cib_status_a').innerHTML = aft2;
													}
													if (bef3 !== aft3) {
														document
																.getElementById('cib_status_approval_user').innerHTML = bef3;
														document
																.getElementById('cib_status_approval_user').style.color = "red";
														document
																.getElementById('cib_status_approval_user_a').innerHTML = aft3;
														document
																.getElementById('cib_status_approval_user_a').style.color = "red";
													} else {
														document
																.getElementById('cib_status_approval_user').innerHTML = bef3;
														document
																.getElementById('cib_status_approval_user_a').innerHTML = aft3;
													}
													if (bef4 !== aft4) {
														document
																.getElementById('cib_status_isapproval').innerHTML = bef4;
														document
																.getElementById('cib_status_isapproval').style.color = "red";
														document
																.getElementById('cib_status_isapproval_a').innerHTML = aft4;
														document
																.getElementById('cib_status_isapproval_a').style.color = "red";

													} else {
														document
																.getElementById('cib_status_isapproval').innerHTML = bef4;
														document
																.getElementById('cib_status_isapproval_a').innerHTML = aft4;
													}
													if (bef5 !== aft5) {
														document
																.getElementById('cib_status_reason').innerHTML = bef5;
														document
																.getElementById('cib_status_reason').style.color = "red";
														document
																.getElementById('cib_status_reason_a').innerHTML = aft5;
														document
																.getElementById('cib_status_reason_a').style.color = "red";
													} else {
														document
																.getElementById('cib_status_reason').innerHTML = bef4;
														document
																.getElementById('cib_status_reason_a').innerHTML = aft4;
													}
												}
											});

						});
	}

	function getDataViewUsers(id, code) {
		$
				.get(
						"${local_server}/AuditTrail/view_detail/" + id + '/'
								+ code,
						function(data) {
							var o = JSON.parse(data);
							console.log(o)

							$("#msg").html("");
							$(".before").empty();
							$(".before").removeAttr("style");
							$(".after").empty();
							$(".after").removeAttr("style");

							$('#tableview').removeClass("hidden");
							$('#tableview').DataTable().destroy();

							$
									.each(
											o.data,
											function(data, t) {
												var model = (t['p_log_action_mode']);

												if (model == "New") {

													document
															.getElementById('usr_userid_a').innerHTML = (t.p_usr_userid);
													document
															.getElementById('usr_userid_a').style.color = "red";
													document
															.getElementById('usr_name_a').innerHTML = (t.p_usr_name);
													document
															.getElementById('usr_name_a').style.color = "red";
													document
															.getElementById('usr_nip_a').innerHTML = (t.p_usr_nip);
													document
															.getElementById('usr_nip_a').style.color = "red";
													document
															.getElementById('usr_access_level_a').innerHTML = (t.p_usr_access_level);
													document
															.getElementById('usr_access_level_a').style.color = "red";
													document
															.getElementById('usr_branch_a').innerHTML = (t.p_usr_branch);
													document
															.getElementById('usr_branch_a').style.color = "red";
													document
															.getElementById('usr_status_a').innerHTML = (t.p_usr_status);
													document
															.getElementById('usr_status_a').style.color = "red";
												} else if (model == "Delete") {
													document
															.getElementById('usr_userid').innerHTML = (t.p_usr_userid);
													document
															.getElementById('usr_userid').style.color = "red";
													document
															.getElementById('usr_name').innerHTML = (t.p_usr_name);
													document
															.getElementById('usr_name').style.color = "red";
													document
															.getElementById('usr_nip').innerHTML = (t.p_usr_nip);
													document
															.getElementById('usr_nip').style.color = "red";
													document
															.getElementById('usr_access_level').innerHTML = (t.p_usr_access_level);
													document
															.getElementById('usr_access_level').style.color = "red";
													document
															.getElementById('usr_branch').innerHTML = (t.p_usr_branch);
													document
															.getElementById('usr_branch').style.color = "red";
													document
															.getElementById('usr_status').innerHTML = (t.p_usr_status);
													document
															.getElementById('usr_status').style.color = "red";

												} else {
													/* for(var i = 0;i < o.data.length;i++) { */
													var bef1 = (o.data[0].p_usr_userid);
													var aft1 = (o.data[1].p_usr_userid);
													var bef2 = (o.data[0].p_usr_name);
													var aft2 = (o.data[1].p_usr_name);
													var bef3 = (o.data[0].p_usr_nip);
													var aft3 = (o.data[1].p_usr_nip);
													var bef4 = (o.data[0].p_usr_access_level);
													var aft4 = (o.data[1].p_usr_access_level);
													var bef5 = (o.data[0].p_usr_branch);
													var aft5 = (o.data[1].p_usr_branch);
													var bef6 = (o.data[0].p_usr_status);
													var aft6 = (o.data[1].p_usr_status);
													if (bef1 !== aft1) {
														document
																.getElementById('usr_userid').innerHTML = bef1;
														document
																.getElementById('usr_userid').style.color = "red";
														document
																.getElementById('usr_userid_a').innerHTML = aft1;
														document
																.getElementById('usr_userid_a').style.color = "red";
													} else {
														document
																.getElementById('usr_userid').innerHTML = bef1;
														document
																.getElementById('usr_userid_a').innerHTML = aft1;
													}
													if (bef2 !== aft2) {
														document
																.getElementById('usr_name').innerHTML = bef2;
														document
																.getElementById('usr_name').style.color = "red";
														document
																.getElementById('usr_name_a').innerHTML = aft2;
														document
																.getElementById('usr_name_a').style.color = "red";
													} else {
														document
																.getElementById('usr_name').innerHTML = bef2;
														document
																.getElementById('usr_name_a').innerHTML = aft2;
													}
													if (bef3 !== aft3) {
														document
																.getElementById('usr_nip').innerHTML = bef3;
														document
																.getElementById('usr_nip').style.color = "red";
														document
																.getElementById('usr_nip_a').innerHTML = aft3;
														document
																.getElementById('usr_nip_a').style.color = "red";
													} else {
														document
																.getElementById('usr_nip').innerHTML = bef3;
														document
																.getElementById('usr_nip_a').innerHTML = aft3;
													}
													if (bef4 !== aft4) {
														document
																.getElementById('usr_access_level').innerHTML = bef4;
														document
																.getElementById('usr_access_level').style.color = "red";
														document
																.getElementById('usr_access_level_a').innerHTML = aft4;
														document
																.getElementById('usr_access_level_a').style.color = "red";

													} else {
														document
																.getElementById('usr_access_level').innerHTML = bef4;
														document
																.getElementById('usr_access_level_a').innerHTML = aft4;
													}
													if (bef5 !== aft5) {
														document
																.getElementById('usr_branch').innerHTML = bef5;
														document
																.getElementById('usr_branch').style.color = "red";
														document
																.getElementById('usr_branch_a').innerHTML = aft5;
														document
																.getElementById('usr_branch_a').style.color = "red";
													} else {
														document
																.getElementById('usr_branch').innerHTML = bef5;
														document
																.getElementById('usr_branch_a').innerHTML = aft5;
													}
													if (bef6 !== aft6) {
														document
																.getElementById('usr_status').innerHTML = bef6;
														document
																.getElementById('usr_status').style.color = "red";
														document
																.getElementById('usr_status_a').innerHTML = aft6;
														document
																.getElementById('usr_status_a').style.color = "red";
													} else {
														document
																.getElementById('usr_status').innerHTML = bef6;
														document
																.getElementById('usr_status_a').innerHTML = aft6;
													}
													/*  } */

												}

											});
						});

	}

	function getDataViewProductInfo(id, code) {
		$
				.get(
						"${local_server}/AuditTrail/view_detail/" + id + '/'
								+ code,
						function(data) {
							var o = JSON.parse(data);
							console.log(o)

							$("#msg").html("");
							$(".before").empty();
							$(".before").removeAttr("style");
							$(".after").empty();
							$(".after").removeAttr("style");

							$('#tableviewProductInfo').removeClass("hidden");
							$('#tableviewProductInfo').DataTable().destroy();

							var model = o.data[0].detail[0].plo_action;

							if (o.data.length > 0) {
								var var1 = o.data[0].detail[0].prd_priority;
								var var2 = o.data[0].detail[0].prd_grp_code;
								var var3 = o.data[0].detail[0].prd_name;
								var var4 = o.data[0].detail[0].prd_desc;
								var var5 = o.data[0].detail[0].prd_min_value;
								var var6 = o.data[0].detail[0].prd_max_value;
								var var7 = o.data[0].detail[0].prd_intr_calc;
								var var8 = o.data[0].detail[0].prd_start_date;
								var var9 = o.data[0].detail[0].prd_end_date;
								var var10 = o.data[0].detail[0].prd_statement_date;
								var var11 = o.data[0].detail[0].prd_billing_date;
								var var12 = o.data[0].detail[0].prd_repayment_tolerance;
								var var13 = o.data[0].detail[0].prd_repayment_min;
								var var14 = o.data[0].detail[0].prd_penalty_tolerance;
								var var15 = o.data[0].detail[0].prd_is_market_place;
								var var16 = o.data[0].detail[0].prd_credit_checking;
								var var17 = o.data[0].detail[0].prd_rule;
								var var18 = o.data[0].detail[0].prd_tnt_alias;
								var var19 = o.data[0].detail[0].prd_item_cat;
								var var20 = o.data[0].detail[0].prd_item_rule;
								var var21 = o.data[0].detail[0].prd_approved_status;
							}

							if (o.data[0].detail.length == 1) {
								if (model == "Insert") {
									document.getElementById('prd_priority_a').innerHTML = var1;
									document.getElementById('prd_priority_a').style.color = "red";
									document.getElementById('prd_grp_code_a').innerHTML = var2;
									document.getElementById('prd_grp_code_a').style.color = "red";
									document.getElementById('prd_name_a').innerHTML = var3;
									document.getElementById('prd_name_a').style.color = "red";
									document.getElementById('prd_name_a').style.textAlign = "left";
									document.getElementById('prd_desc_a').innerHTML = var4;
									document.getElementById('prd_desc_a').style.color = "red";
									document.getElementById('prd_desc_a').style.textAlign = "left";
									document.getElementById('prd_min_value_a').innerHTML = var5;
									document.getElementById('prd_min_value_a').style.color = "red";
									document.getElementById('prd_max_value_a').innerHTML = var6;
									document.getElementById('prd_max_value_a').style.color = "red";
									document.getElementById('prd_intr_calc_a').innerHTML = var7;
									document.getElementById('prd_intr_calc_a').style.color = "red";
									document.getElementById('prd_start_date_a').innerHTML = convertDateAPI(var8);
									document.getElementById('prd_start_date_a').style.color = "red";
									document.getElementById('prd_end_date_a').innerHTML = convertDateAPI(var9);
									document.getElementById('prd_end_date_a').style.color = "red";
									document
											.getElementById('prd_statement_date_a').innerHTML = var10;
									document
											.getElementById('prd_statement_date_a').style.color = "red";
									document
											.getElementById('prd_billing_date_a').innerHTML = var11;
									document
											.getElementById('prd_billing_date_a').style.color = "red";
									document
											.getElementById('prd_repayment_tolerance_a').innerHTML = var12;
									document
											.getElementById('prd_repayment_tolerance_a').style.color = "red";
									document
											.getElementById('prd_repayment_min_a').innerHTML = var13;
									document
											.getElementById('prd_repayment_min_a').style.color = "red";
									document
											.getElementById('prd_penalty_tolerance_a').innerHTML = var14;
									document
											.getElementById('prd_penalty_tolerance_a').style.color = "red";
									document
											.getElementById('prd_is_market_place_a').innerHTML = var15;
									document
											.getElementById('prd_is_market_place_a').style.color = "red";
									document
											.getElementById('prd_credit_checking_a').innerHTML = var16;
									document
											.getElementById('prd_credit_checking_a').style.color = "red";
									document.getElementById('prd_rule_a').innerHTML = var17;
									document.getElementById('prd_rule_a').style.color = "red";
									document.getElementById('prd_rule_a').style.textAlign = "left";
									document.getElementById('prd_tnt_alias_a').innerHTML = var18;
									document.getElementById('prd_tnt_alias_a').style.color = "red";
									document.getElementById('prd_item_cat_a').innerHTML = var19;
									document.getElementById('prd_item_cat_a').style.color = "red";
									document.getElementById('prd_item_rule_a').innerHTML = var20;
									document.getElementById('prd_item_rule_a').style.color = "red";
									document.getElementById('prd_item_rule_a').style.textAlign = "left";
									document
											.getElementById('prd_approved_status_a').innerHTML = var21;
									document
											.getElementById('prd_approved_status_a').style.color = "red";

									document
											.getElementById('ProductInfo_Ruleset').innerHTML = '';
									if (o.data[0].ruleset.length > 0) {
										var htm = '';

										for (i = 1; i <= (o.data[0].ruleset.length / 2); i++) {
											htm += '<table class="table table-hover" width="50%">';
											htm += '<tr>';
											htm += '<td width="30%"><b>Kelompok Aturan</b></td>';
											htm += '<td width="35%"><label id="prs_code_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="prs_code_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';
											htm += '</table>';
										}

										document
												.getElementById('ProductInfo_Ruleset').innerHTML = htm;

										var ctr = 0;
										$
												.each(
														o.data[0].ruleset,
														function(data, t) {
															ctr += 1;
															document
																	.getElementById('prs_code_'
																			+ ctr
																			+ '_a').innerHTML = t.prs_code;
															document
																	.getElementById('prs_code_'
																			+ ctr
																			+ '_a').style.color = "red";
														});
									}

									document.getElementById('ProductInfo_Item').innerHTML = '';
									if (o.data[0].item.length > 0) {
										var htm = '';

										for (i = 1; i <= o.data[0].item.length; i++) {
											htm += '<table class="table table-hover" width="50%">';
											htm += '<tr>';
											htm += '<td width="30%"><b>Category</b></td>';
											htm += '<td width="35%"><label id="pri_category_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="pri_category_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';
											htm += '<tr>';
											htm += '<td width="30%"><b>Priority</b></td>';
											htm += '<td width="35%"><label id="pri_priority_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="pri_priority_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';
											htm += '<tr>';
											htm += '<td width="30%"><b>Plafon From</b></td>';
											htm += '<td width="35%"><label id="pri_plafon_min_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="pri_plafon_min_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';
											htm += '<tr>';
											htm += '<td width="30%"><b>Plafon To</b></td>';
											htm += '<td width="35%"><label id="pri_plafon_max_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="pri_plafon_max_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';
											htm += '<tr>';
											htm += '<td width="30%"><b>Min DP %</b></td>';
											htm += '<td width="35%"><label id="pri_min_dp_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="pri_min_dp_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';

											htm += '<tr>';
											htm += '<td width="30%"><b>Item Detail</b></td>';
											htm += '<td width="35%">';

											if (o.data[0].item_detail.length > 0) {
												for (z = 0; z < o.data[0].item_detail.length; z++) {
													if (o.data[0].item_detail[z].pid_pri_id == o.data[0].item[i].pri_id
															&& (o.data[0].item_detail[z].pdl_action == "Before")) {
														htm += 'tenor : <label id="pid_tenor_'+i+'" class="control-label after"></label>';
														htm += '&nbsp;';
														htm += 'interest : <label id="pid_interest_'+i+'" class="control-label after"></label>';
														htm += '<br/>';
													}
												}
											}

											htm += '</td>';
											htm += '<td width="35%">';

											if (o.data[0].item_detail.length > 0) {
												for (z = 0; z < o.data[0].item_detail.length; z++) {
													if (o.data[0].item_detail[z].pid_pri_id == o.data[0].item[i].pri_id
															&& (o.data[0].item_detail[z].pdl_action == "After")) {
														htm += 'tenor : <label id="pid_tenor_'+i+'_a" class="control-label after">'
																+ o.data[0].item_detail[z].pid_tenor
																+ '</label>';
														htm += '&nbsp;';
														htm += 'interest : <label id="pid_interest_'+i+'_a" class="control-label after">'
																+ o.data[0].item_detail[z].pid_interest
																+ '</label>';
														htm += '<br/>';
														//document.getElementById('pid_tenor_'+i+'_a').style.color="red";
														//document.getElementById('pid_interest_'+i+'_a').style.color="red";
													}
												}
											}

											htm += '</td>';
											htm += '</tr>';

											htm += '</table>';
										}

										document
												.getElementById('ProductInfo_Item').innerHTML = htm;

										var ctr = 0;
										$
												.each(
														o.data[0].item,
														function(data, t) {
															ctr += 1;
															document
																	.getElementById('pri_category_'
																			+ ctr
																			+ '_a').innerHTML = t.pri_category;
															document
																	.getElementById('pri_category_'
																			+ ctr
																			+ '_a').style.color = "red";
															document
																	.getElementById('pri_priority_'
																			+ ctr
																			+ '_a').innerHTML = t.pri_priority;
															document
																	.getElementById('pri_priority_'
																			+ ctr
																			+ '_a').style.color = "red";
															document
																	.getElementById('pri_plafon_min_'
																			+ ctr
																			+ '_a').innerHTML = t.pri_plafon_min;
															document
																	.getElementById('pri_plafon_min_'
																			+ ctr
																			+ '_a').style.color = "red";
															document
																	.getElementById('pri_plafon_max_'
																			+ ctr
																			+ '_a').innerHTML = t.pri_plafon_max;
															document
																	.getElementById('pri_plafon_max_'
																			+ ctr
																			+ '_a').style.color = "red";
															document
																	.getElementById('pri_min_dp_'
																			+ ctr
																			+ '_a').innerHTML = t.pri_min_dp;
															document
																	.getElementById('pri_min_dp_'
																			+ ctr
																			+ '_a').style.color = "red";
														});
									}

									document
											.getElementById('ProductInfo_Othercost').innerHTML = '';
									if (o.data[0].other_cost.length > 0) {
										var htm = '';

										for (i = 1; i <= o.data[0].other_cost.length; i++) {
											htm += '<table class="table table-hover" width="50%">';
											htm += '<tr>';
											htm += '<td width="30%"><b>Other Payment</b></td>';
											htm += '<td width="35%"><label id="lpc_name_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="lpc_name_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';
											htm += '<tr>';
											htm += '<td width="30%"><b>Value Time</b></td>';
											htm += '<td width="35%"><label id="lpc_recurring_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="lpc_recurring_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';
											htm += '<tr>';
											htm += '<td width="30%"><b>Value Amt</b></td>';
											htm += '<td width="35%"><label id="lpc_value_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="lpc_value_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';
											htm += '</table>';
										}

										document
												.getElementById('ProductInfo_Othercost').innerHTML = htm;

										var ctr = 0;
										$
												.each(
														o.data[0].other_cost,
														function(data, t) {
															ctr += 1;
															document
																	.getElementById('lpc_name_'
																			+ ctr
																			+ '_a').innerHTML = t.lpc_name;
															document
																	.getElementById('lpc_name_'
																			+ ctr
																			+ '_a').style.color = "red";
															document
																	.getElementById('lpc_recurring_'
																			+ ctr
																			+ '_a').innerHTML = t.lpc_recurring;
															document
																	.getElementById('lpc_recurring_'
																			+ ctr
																			+ '_a').style.color = "red";
															document
																	.getElementById('lpc_value_'
																			+ ctr
																			+ '_a').innerHTML = t.lpc_value;
															document
																	.getElementById('lpc_value_'
																			+ ctr
																			+ '_a').style.color = "red";
														});
									}

									document
											.getElementById('ProductInfo_Penalty').innerHTML = '';
									var htm = '';
									htm += '<table class="table table-hover" width="50%">';
									htm += '<tr>';
									htm += '<td width="30%"><b>Penalti Keterlambatan %</b></td>';
									htm += '<td width="35%"><label id="lpp_value" class="control-label after"></label></td>';
									htm += '<td width="35%"><label id="lpp_value_a" class="control-label after"></label></td>';
									htm += '</tr>';
									htm += '</table>';
									document
											.getElementById('ProductInfo_Penalty').innerHTML = htm;
									document.getElementById('lpp_value_a').innerHTML = o.data[0].penalty[0].lpp_value;
									document.getElementById('lpp_value_a').style.color = "red";

									document
											.getElementById('ProductInfo_Repayment').innerHTML = '';
									if (o.data[0].repayment.length > 0) {
										var htm = '';

										for (i = 1; i <= o.data[0].repayment.length; i++) {
											htm += '<table class="table table-hover" width="50%">';
											htm += '<tr>';
											htm += '<td width="30%"><b>Remaining Installment From</b></td>';
											htm += '<td width="35%"><label id="lpr_tenor_from_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="lpr_tenor_from_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';
											htm += '<tr>';
											htm += '<td width="30%"><b>Remaining Installment To</b></td>';
											htm += '<td width="35%"><label id="lpr_tenor_to_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="lpr_tenor_to_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';
											htm += '<tr>';
											htm += '<td width="30%"><b>Biaya Percepatan Pembayaran</b></td>';
											htm += '<td width="35%"><label id="lpr_out_principal_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="lpr_out_principal_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';
											htm += '<tr>';
											htm += '<td width="30%"><b>Administrative Cost</b></td>';
											htm += '<td width="35%"><label id="lpr_adm_cost_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="lpr_adm_cost_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';
											htm += '<tr>';
											htm += '<td width="30%"><b>Min Cost</b></td>';
											htm += '<td width="35%"><label id="lpr_min_cost_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="lpr_min_cost_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';
											htm += '</table>';
										}

										document
												.getElementById('ProductInfo_Repayment').innerHTML = htm;

										var ctr = 0;
										$
												.each(
														o.data[0].repayment,
														function(data, t) {
															ctr += 1;
															document
																	.getElementById('lpr_tenor_from_'
																			+ ctr
																			+ '_a').innerHTML = t.lpr_tenor_from;
															document
																	.getElementById('lpr_tenor_from_'
																			+ ctr
																			+ '_a').style.color = "red";
															document
																	.getElementById('lpr_tenor_to_'
																			+ ctr
																			+ '_a').innerHTML = t.lpr_tenor_to;
															document
																	.getElementById('lpr_tenor_to_'
																			+ ctr
																			+ '_a').style.color = "red";
															document
																	.getElementById('lpr_out_principal_'
																			+ ctr
																			+ '_a').innerHTML = t.lpr_out_principal;
															document
																	.getElementById('lpr_out_principal_'
																			+ ctr
																			+ '_a').style.color = "red";
															document
																	.getElementById('lpr_adm_cost_'
																			+ ctr
																			+ '_a').innerHTML = t.lpr_adm_cost;
															document
																	.getElementById('lpr_adm_cost_'
																			+ ctr
																			+ '_a').style.color = "red";
															document
																	.getElementById('lpr_min_cost_'
																			+ ctr
																			+ '_a').innerHTML = t.lpr_min_cost;
															document
																	.getElementById('lpr_min_cost_'
																			+ ctr
																			+ '_a').style.color = "red";
														});
									}
								} else {
									document.getElementById('prd_priority').innerHTML = var1;
									document.getElementById('prd_priority').style.color = "red";
									document.getElementById('prd_grp_code').innerHTML = var2;
									document.getElementById('prd_grp_code').style.color = "red";
									document.getElementById('prd_name').innerHTML = var3;
									document.getElementById('prd_name').style.color = "red";
									document.getElementById('prd_name').style.textAlign = "left";
									document.getElementById('prd_desc').innerHTML = var4;
									document.getElementById('prd_desc').style.color = "red";
									document.getElementById('prd_desc').style.textAlign = "left";
									document.getElementById('prd_min_value').innerHTML = var5;
									document.getElementById('prd_min_value').style.color = "red";
									document.getElementById('prd_max_value').innerHTML = var6;
									document.getElementById('prd_max_value').style.color = "red";
									document.getElementById('prd_intr_calc').innerHTML = var7;
									document.getElementById('prd_intr_calc').style.color = "red";
									document.getElementById('prd_start_date').innerHTML = convertDateAPI(var8);
									document.getElementById('prd_start_date').style.color = "red";
									document.getElementById('prd_end_date').innerHTML = convertDateAPI(var9);
									document.getElementById('prd_end_date').style.color = "red";
									document
											.getElementById('prd_statement_date').innerHTML = var10;
									document
											.getElementById('prd_statement_date').style.color = "red";
									document.getElementById('prd_billing_date').innerHTML = var11;
									document.getElementById('prd_billing_date').style.color = "red";
									document
											.getElementById('prd_repayment_tolerance').innerHTML = var12;
									document
											.getElementById('prd_repayment_tolerance').style.color = "red";
									document
											.getElementById('prd_repayment_min').innerHTML = var13;
									document
											.getElementById('prd_repayment_min').style.color = "red";
									document
											.getElementById('prd_penalty_tolerance').innerHTML = var14;
									document
											.getElementById('prd_penalty_tolerance').style.color = "red";
									document
											.getElementById('prd_is_market_place').innerHTML = var15;
									document
											.getElementById('prd_is_market_place').style.color = "red";
									document
											.getElementById('prd_credit_checking').innerHTML = var16;
									document
											.getElementById('prd_credit_checking').style.color = "red";
									document.getElementById('prd_rule').innerHTML = var17;
									document.getElementById('prd_rule').style.color = "red";
									document.getElementById('prd_rule').style.textAlign = "left";
									document.getElementById('prd_tnt_alias').innerHTML = var18;
									document.getElementById('prd_tnt_alias').style.color = "red";
									document.getElementById('prd_item_cat').innerHTML = var19;
									document.getElementById('prd_item_cat').style.color = "red";
									document.getElementById('prd_item_rule').innerHTML = var20;
									document.getElementById('prd_item_rule').style.color = "red";
									document.getElementById('prd_item_rule').style.textAlign = "left";
									document
											.getElementById('prd_approved_status_a').innerHTML = var21;
									document
											.getElementById('prd_approved_status_a').style.color = "red";

									document
											.getElementById('ProductInfo_Ruleset').innerHTML = '';
									if (o.data[0].ruleset.length > 0) {
										var htm = '';

										for (i = 1; i <= o.data[0].ruleset.length; i++) {
											htm += '<table class="table table-hover" width="50%">';
											htm += '<tr>';
											htm += '<td width="30%"><b>Kelompok Aturan</b></td>';
											htm += '<td width="35%"><label id="prs_code_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="prs_code_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';
											htm += '</table>';
										}

										document
												.getElementById('ProductInfo_Ruleset').innerHTML = htm;

										var ctr = 0;
										$
												.each(
														o.data[0].ruleset,
														function(data, t) {
															ctr += 1;
															document
																	.getElementById('prs_code_'
																			+ ctr).innerHTML = t.prs_code;
															document
																	.getElementById('prs_code_'
																			+ ctr).style.color = "red";
														});
									}

									document.getElementById('ProductInfo_Item').innerHTML = '';
									if (o.data[0].item.length > 0) {
										var htm = '';

										for (i = 1; i <= o.data[0].item.length; i++) {
											htm += '<table class="table table-hover" width="50%">';
											htm += '<tr>';
											htm += '<td width="30%"><b>Category</b></td>';
											htm += '<td width="35%"><label id="pri_category_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="pri_category_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';
											htm += '<tr>';
											htm += '<td width="30%"><b>Priority</b></td>';
											htm += '<td width="35%"><label id="pri_priority_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="pri_priority_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';
											htm += '<tr>';
											htm += '<td width="30%"><b>Plafon From</b></td>';
											htm += '<td width="35%"><label id="pri_plafon_min_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="pri_plafon_min_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';
											htm += '<tr>';
											htm += '<td width="30%"><b>Plafon To</b></td>';
											htm += '<td width="35%"><label id="pri_plafon_max_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="pri_plafon_max_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';
											htm += '<tr>';
											htm += '<td width="30%"><b>Min DP %</b></td>';
											htm += '<td width="35%"><label id="pri_min_dp_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="pri_min_dp_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';

											htm += '<tr>';
											htm += '<td width="30%"><b>Item Detail</b></td>';
											htm += '<td width="35%">';

											if (o.data[0].item_detail.length > 0) {
												for (z = 0; z < o.data[0].item_detail.length; z++) {
													if (o.data[0].item_detail[z].pid_pri_id == o.data[0].item[i].pri_id) {
														htm += 'tenor : <label id="pid_tenor_'+i+'" class="control-label after">'
																+ o.data[0].item_detail[z].pid_tenor
																+ '</label>';
														htm += '&nbsp;';
														htm += 'interest : <label id="pid_interest_'+i+'" class="control-label after">'
																+ o.data[0].item_detail[z].pid_interest
																+ '</label>';
														htm += '<br/>';
													}
												}
											}

											htm += '</td>';
											htm += '<td width="35%">';

											if (o.data[0].item_detail.length > 0) {
												for (z = 0; z < o.data[0].item_detail.length; z++) {
													if (o.data[0].item_detail[z].pid_pri_id == o.data[0].item[i].pri_id) {
														htm += 'tenor : <label id="pid_tenor_'+i+'_a" class="control-label after"></label>';
														htm += '&nbsp;';
														htm += 'interest : <label id="pid_interest_'+i+'_a" class="control-label after"></label>';
														htm += '<br/>';
													}
												}
											}

											htm += '</td>';
											htm += '</tr>';

											htm += '</table>';
										}

										document
												.getElementById('ProductInfo_Item').innerHTML = htm;

										var ctr = 0;
										$
												.each(
														o.data[0].item,
														function(data, t) {
															ctr += 1;
															document
																	.getElementById('pri_category_'
																			+ ctr).innerHTML = t.pri_category;
															document
																	.getElementById('pri_category_'
																			+ ctr).style.color = "red";
															document
																	.getElementById('pri_priority_'
																			+ ctr).innerHTML = t.pri_priority;
															document
																	.getElementById('pri_priority_'
																			+ ctr).style.color = "red";
															document
																	.getElementById('pri_plafon_min_'
																			+ ctr).innerHTML = t.pri_plafon_min;
															document
																	.getElementById('pri_plafon_min_'
																			+ ctr).style.color = "red";
															document
																	.getElementById('pri_plafon_max_'
																			+ ctr).innerHTML = t.pri_plafon_max;
															document
																	.getElementById('pri_plafon_max_'
																			+ ctr).style.color = "red";
															document
																	.getElementById('pri_min_dp_'
																			+ ctr).innerHTML = t.pri_min_dp;
															document
																	.getElementById('pri_min_dp_'
																			+ ctr).style.color = "red";
														});
									}

									document
											.getElementById('ProductInfo_Othercost').innerHTML = '';
									if (o.data[0].other_cost.length > 0) {
										var htm = '';

										for (i = 1; i <= o.data[0].other_cost.length; i++) {
											htm += '<table class="table table-hover" width="50%">';
											htm += '<tr>';
											htm += '<td width="30%"><b>Other Payment</b></td>';
											htm += '<td width="35%"><label id="lpc_name_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="lpc_name_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';
											htm += '<tr>';
											htm += '<td width="30%"><b>Value Time</b></td>';
											htm += '<td width="35%"><label id="lpc_recurring_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="lpc_recurring_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';
											htm += '<tr>';
											htm += '<td width="30%"><b>Value Amt</b></td>';
											htm += '<td width="35%"><label id="lpc_value_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="lpc_value_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';
											htm += '</table>';
										}

										document
												.getElementById('ProductInfo_Othercost').innerHTML = htm;

										var ctr = 0;
										$
												.each(
														o.data[0].other_cost,
														function(data, t) {
															ctr += 1;
															document
																	.getElementById('lpc_name_'
																			+ ctr).innerHTML = t.lpc_name;
															document
																	.getElementById('lpc_name_'
																			+ ctr).style.color = "red";
															document
																	.getElementById('lpc_recurring_'
																			+ ctr).innerHTML = t.lpc_recurring;
															document
																	.getElementById('lpc_recurring_'
																			+ ctr).style.color = "red";
															document
																	.getElementById('lpc_value_'
																			+ ctr).innerHTML = t.lpc_value;
															document
																	.getElementById('lpc_value_'
																			+ ctr).style.color = "red";
														});
									}

									document
											.getElementById('ProductInfo_Penalty').innerHTML = '';
									var htm = '';
									htm += '<table class="table table-hover" width="50%">';
									htm += '<tr>';
									htm += '<td width="30%"><b>Penalti Keterlambatan %</b></td>';
									htm += '<td width="35%"><label id="lpp_value" class="control-label after"></label></td>';
									htm += '<td width="35%"><label id="lpp_value_a" class="control-label after"></label></td>';
									htm += '</tr>';
									htm += '</table>';
									document
											.getElementById('ProductInfo_Penalty').innerHTML = htm;
									document.getElementById('lpp_value').innerHTML = o.data[0].penalty[0].lpp_value;
									document.getElementById('lpp_value').style.color = "red";

									document
											.getElementById('ProductInfo_Repayment').innerHTML = '';
									if (o.data[0].repayment.length > 0) {
										var htm = '';

										for (i = 1; i <= o.data[0].repayment.length; i++) {
											htm += '<table class="table table-hover" width="50%">';
											htm += '<tr>';
											htm += '<td width="30%"><b>Remaining Installment From</b></td>';
											htm += '<td width="35%"><label id="lpr_tenor_from_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="lpr_tenor_from_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';
											htm += '<tr>';
											htm += '<td width="30%"><b>Remaining Installment To</b></td>';
											htm += '<td width="35%"><label id="lpr_tenor_to_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="lpr_tenor_to_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';
											htm += '<tr>';
											htm += '<td width="30%"><b>Biaya Percepatan Pembayaran</b></td>';
											htm += '<td width="35%"><label id="lpr_out_principal_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="lpr_out_principal_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';
											htm += '<tr>';
											htm += '<td width="30%"><b>Administrative Cost</b></td>';
											htm += '<td width="35%"><label id="lpr_adm_cost_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="lpr_adm_cost_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';
											htm += '<tr>';
											htm += '<td width="30%"><b>Min Cost</b></td>';
											htm += '<td width="35%"><label id="lpr_min_cost_'+i+'" class="control-label after"></label></td>';
											htm += '<td width="35%"><label id="lpr_min_cost_'+i+'_a" class="control-label after"></label></td>';
											htm += '</tr>';
											htm += '</table>';
										}

										document
												.getElementById('ProductInfo_Repayment').innerHTML = htm;

										var ctr = 0;
										$
												.each(
														o.data[0].repayment,
														function(data, t) {
															ctr += 1;
															document
																	.getElementById('lpr_tenor_from_'
																			+ ctr).innerHTML = t.lpr_tenor_from;
															document
																	.getElementById('lpr_tenor_from_'
																			+ ctr).style.color = "red";
															document
																	.getElementById('lpr_tenor_to_'
																			+ ctr).innerHTML = t.lpr_tenor_to;
															document
																	.getElementById('lpr_tenor_to_'
																			+ ctr).style.color = "red";
															document
																	.getElementById('lpr_out_principal_'
																			+ ctr).innerHTML = t.lpr_out_principal;
															document
																	.getElementById('lpr_out_principal_'
																			+ ctr).style.color = "red";
															document
																	.getElementById('lpr_adm_cost_'
																			+ ctr).innerHTML = t.lpr_adm_cost;
															document
																	.getElementById('lpr_adm_cost_'
																			+ ctr).style.color = "red";
															document
																	.getElementById('lpr_min_cost_'
																			+ ctr).innerHTML = t.lpr_min_cost;
															document
																	.getElementById('lpr_min_cost_'
																			+ ctr).style.color = "red";
														});
									}
								}
							} else {
								//
								var var1 = o.data[0].detail[0].prd_priority;
								var var2 = o.data[0].detail[0].prd_grp_code;
								var var3 = o.data[0].detail[0].prd_name;
								var var4 = o.data[0].detail[0].prd_desc;
								var var5 = o.data[0].detail[0].prd_min_value;
								var var6 = o.data[0].detail[0].prd_max_value;
								var var7 = o.data[0].detail[0].prd_intr_calc;
								var var8 = o.data[0].detail[0].prd_start_date;
								var var9 = o.data[0].detail[0].prd_end_date;
								var var10 = o.data[0].detail[0].prd_statement_date;
								var var11 = o.data[0].detail[0].prd_billing_date;
								var var12 = o.data[0].detail[0].prd_repayment_tolerance;
								var var13 = o.data[0].detail[0].prd_repayment_min;
								var var14 = o.data[0].detail[0].prd_penalty_tolerance;
								var var15 = o.data[0].detail[0].prd_is_market_place;
								var var16 = o.data[0].detail[0].prd_credit_checking;
								var var17 = o.data[0].detail[0].prd_rule;
								var var18 = o.data[0].detail[0].prd_tnt_alias;
								var var19 = o.data[0].detail[0].prd_item_cat;
								var var20 = o.data[0].detail[0].prd_item_rule;
								var var21 = o.data[0].detail[0].prd_approved_status;

								var aft1 = o.data[0].detail[1].prd_priority;
								var aft2 = o.data[0].detail[1].prd_grp_code;
								var aft3 = o.data[0].detail[1].prd_name;
								var aft4 = o.data[0].detail[1].prd_desc;
								var aft5 = o.data[0].detail[1].prd_min_value;
								var aft6 = o.data[0].detail[1].prd_max_value;
								var aft7 = o.data[0].detail[1].prd_intr_calc;
								var aft8 = o.data[0].detail[1].prd_start_date;
								var aft9 = o.data[0].detail[1].prd_end_date;
								var aft10 = o.data[0].detail[1].prd_statement_date;
								var aft11 = o.data[0].detail[1].prd_billing_date;
								var aft12 = o.data[0].detail[1].prd_repayment_tolerance;
								var aft13 = o.data[0].detail[1].prd_repayment_min;
								var aft14 = o.data[0].detail[1].prd_penalty_tolerance;
								var aft15 = o.data[0].detail[1].prd_is_market_place;
								var aft16 = o.data[0].detail[1].prd_credit_checking;
								var aft17 = o.data[0].detail[1].prd_rule;
								var aft18 = o.data[0].detail[1].prd_tnt_alias;
								var aft19 = o.data[0].detail[1].prd_item_cat;
								var aft20 = o.data[0].detail[1].prd_item_rule;
								var aft21 = o.data[0].detail[1].prd_approved_status;

								if (var1 != aft1) {
									document.getElementById('prd_priority').innerHTML = var1;
									document.getElementById('prd_priority').style.color = "red";
									document.getElementById('prd_priority_a').innerHTML = aft1;
									document.getElementById('prd_priority_a').style.color = "red";
								} else {
									document.getElementById('prd_priority').innerHTML = var1;
									document.getElementById('prd_priority_a').innerHTML = aft1;
								}

								if (var2 != aft2) {
									document.getElementById('prd_grp_code').innerHTML = var2;
									document.getElementById('prd_grp_code').style.color = "red";
									document.getElementById('prd_grp_code_a').innerHTML = aft2;
									document.getElementById('prd_grp_code_a').style.color = "red";
								} else {
									document.getElementById('prd_grp_code').innerHTML = var2;
									document.getElementById('prd_grp_code_a').innerHTML = aft2;
								}

								if (var3 != aft3) {
									document.getElementById('prd_name').innerHTML = var3;
									document.getElementById('prd_name').style.color = "red";
									document.getElementById('prd_name').style.textAlign = "left";
									document.getElementById('prd_name_a').innerHTML = aft3;
									document.getElementById('prd_name_a').style.color = "red";
									document.getElementById('prd_name_a').style.textAlign = "left";
								} else {
									document.getElementById('prd_name').innerHTML = var3;
									document.getElementById('prd_name').style.textAlign = "left";
									document.getElementById('prd_name_a').innerHTML = aft3;
									document.getElementById('prd_name_a').style.textAlign = "left";
								}

								if (var4 != aft4) {
									document.getElementById('prd_desc').innerHTML = var4;
									document.getElementById('prd_desc').style.color = "red";
									document.getElementById('prd_desc').style.textAlign = "left";
									document.getElementById('prd_desc_a').innerHTML = aft4;
									document.getElementById('prd_desc_a').style.color = "red";
									document.getElementById('prd_desc_a').style.textAlign = "left";
								} else {
									document.getElementById('prd_desc').innerHTML = var4;
									document.getElementById('prd_desc').style.textAlign = "left";
									document.getElementById('prd_desc_a').innerHTML = aft4;
									document.getElementById('prd_desc_a').style.textAlign = "left";
								}

								if (var5 != aft5) {
									document.getElementById('prd_min_value').innerHTML = var5;
									document.getElementById('prd_min_value').style.color = "red";
									document.getElementById('prd_min_value_a').innerHTML = aft5;
									document.getElementById('prd_min_value_a').style.color = "red";
								} else {
									document.getElementById('prd_min_value').innerHTML = var5;
									document.getElementById('prd_min_value_a').innerHTML = aft5;
								}

								if (var6 != aft6) {
									document.getElementById('prd_max_value').innerHTML = var6;
									document.getElementById('prd_max_value').style.color = "red";
									document.getElementById('prd_max_value_a').innerHTML = aft6;
									document.getElementById('prd_max_value_a').style.color = "red";
								} else {
									document.getElementById('prd_max_value').innerHTML = var6;
									document.getElementById('prd_max_value_a').innerHTML = aft6;
								}

								if (var7 != aft7) {
									document.getElementById('prd_intr_calc').innerHTML = var7;
									document.getElementById('prd_intr_calc').style.color = "red";
									document.getElementById('prd_intr_calc_a').innerHTML = aft7;
									document.getElementById('prd_intr_calc_a').style.color = "red";
								} else {
									document.getElementById('prd_intr_calc').innerHTML = var7;
									document.getElementById('prd_intr_calc_a').innerHTML = aft7;
								}

								if (var8 != aft8) {
									document.getElementById('prd_start_date').innerHTML = convertDateAPI(var8);
									document.getElementById('prd_start_date').style.color = "red";
									document.getElementById('prd_start_date_a').innerHTML = convertDateAPI(aft8);
									document.getElementById('prd_start_date_a').style.color = "red";
								} else {
									document.getElementById('prd_start_date').innerHTML = convertDateAPI(var8);
									document.getElementById('prd_start_date_a').innerHTML = convertDateAPI(aft8);
								}

								if (var9 != aft9) {
									document.getElementById('prd_end_date').innerHTML = convertDateAPI(var9);
									document.getElementById('prd_end_date').style.color = "red";
									document.getElementById('prd_end_date_a').innerHTML = convertDateAPI(aft9);
									document.getElementById('prd_end_date_a').style.color = "red";
								} else {
									document.getElementById('prd_end_date').innerHTML = convertDateAPI(var9);
									document.getElementById('prd_end_date_a').innerHTML = convertDateAPI(aft9);
								}

								if (var10 != aft10) {
									document
											.getElementById('prd_statement_date').innerHTML = var10;
									document
											.getElementById('prd_statement_date').style.color = "red";
									document
											.getElementById('prd_statement_date_a').innerHTML = aft10;
									document
											.getElementById('prd_statement_date_a').style.color = "red";
								} else {
									document
											.getElementById('prd_statement_date').innerHTML = var10;
									document
											.getElementById('prd_statement_date_a').innerHTML = aft10;
								}

								if (var11 != aft11) {
									document.getElementById('prd_billing_date').innerHTML = var11;
									document.getElementById('prd_billing_date').style.color = "red";
									document
											.getElementById('prd_billing_date_a').innerHTML = aft11;
									document
											.getElementById('prd_billing_date_a').style.color = "red";
								} else {
									document.getElementById('prd_billing_date').innerHTML = var11;
									document
											.getElementById('prd_billing_date_a').innerHTML = aft11;
								}

								if (var12 != aft12) {
									document
											.getElementById('prd_repayment_tolerance').innerHTML = var12;
									document
											.getElementById('prd_repayment_tolerance').style.color = "red";
									document
											.getElementById('prd_repayment_tolerance_a').innerHTML = aft12;
									document
											.getElementById('prd_repayment_tolerance_a').style.color = "red";
								} else {
									document
											.getElementById('prd_repayment_tolerance').innerHTML = var12;
									document
											.getElementById('prd_repayment_tolerance_a').innerHTML = aft12;
								}

								if (var13 != aft13) {
									document
											.getElementById('prd_repayment_min').innerHTML = var13;
									document
											.getElementById('prd_repayment_min').style.color = "red";
									document
											.getElementById('prd_repayment_min_a').innerHTML = aft13;
									document
											.getElementById('prd_repayment_min_a').style.color = "red";
								} else {
									document
											.getElementById('prd_repayment_min').innerHTML = var13;
									document
											.getElementById('prd_repayment_min_a').innerHTML = aft13;
								}

								if (var14 != aft14) {
									document
											.getElementById('prd_penalty_tolerance').innerHTML = var14;
									document
											.getElementById('prd_penalty_tolerance').style.color = "red";
									document
											.getElementById('prd_penalty_tolerance_a').innerHTML = aft14;
									document
											.getElementById('prd_penalty_tolerance_a').style.color = "red";
								} else {
									document
											.getElementById('prd_penalty_tolerance').innerHTML = var14;
									document
											.getElementById('prd_penalty_tolerance_a').innerHTML = aft14;
								}

								if (var15 != aft15) {
									document
											.getElementById('prd_is_market_place').innerHTML = var15;
									document
											.getElementById('prd_is_market_place').style.color = "red";
									document
											.getElementById('prd_is_market_place_a').innerHTML = aft15;
									document
											.getElementById('prd_is_market_place_a').style.color = "red";
								} else {
									document
											.getElementById('prd_is_market_place').innerHTML = var15;
									document
											.getElementById('prd_is_market_place_a').innerHTML = aft15;
								}

								if (var16 != aft16) {
									document
											.getElementById('prd_credit_checking').innerHTML = var16;
									document
											.getElementById('prd_credit_checking').style.color = "red";
									document
											.getElementById('prd_credit_checking_a').innerHTML = aft16;
									document
											.getElementById('prd_credit_checking_a').style.color = "red";
								} else {
									document
											.getElementById('prd_credit_checking').innerHTML = var16;
									document
											.getElementById('prd_credit_checking_a').innerHTML = aft16;
								}

								if (var17 != aft17) {
									document.getElementById('prd_rule').innerHTML = var17;
									document.getElementById('prd_rule').style.color = "red";
									document.getElementById('prd_rule').style.textAlign = "left";
									document.getElementById('prd_rule_a').innerHTML = aft17;
									document.getElementById('prd_rule_a').style.color = "red";
									document.getElementById('prd_rule_a').style.textAlign = "left";
								} else {
									document.getElementById('prd_rule').innerHTML = var17;
									document.getElementById('prd_rule').style.textAlign = "left";
									document.getElementById('prd_rule_a').innerHTML = aft17;
									document.getElementById('prd_rule_a').style.textAlign = "left";
								}

								if (var18 != aft18) {
									document.getElementById('prd_tnt_alias').innerHTML = var18;
									document.getElementById('prd_tnt_alias').style.color = "red";
									document.getElementById('prd_tnt_alias_a').innerHTML = aft18;
									document.getElementById('prd_tnt_alias_a').style.color = "red";
								} else {
									document.getElementById('prd_tnt_alias').innerHTML = var18;
									document.getElementById('prd_tnt_alias_a').innerHTML = aft18;
								}

								if (var19 != aft19) {
									document.getElementById('prd_item_cat').innerHTML = var19;
									document.getElementById('prd_item_cat').style.color = "red";
									document.getElementById('prd_item_cat_a').innerHTML = aft19;
									document.getElementById('prd_item_cat_a').style.color = "red";
								} else {
									document.getElementById('prd_item_cat').innerHTML = var19;
									document.getElementById('prd_item_cat_a').innerHTML = aft19;
								}

								if (var20 != aft20) {
									document.getElementById('prd_item_rule').innerHTML = var20;
									document.getElementById('prd_item_rule').style.color = "red";
									document.getElementById('prd_item_rule').style.textAlign = "left";
									document.getElementById('prd_item_rule_a').innerHTML = aft20;
									document.getElementById('prd_item_rule_a').style.color = "red";
									document.getElementById('prd_item_rule_a').style.textAlign = "left";
								} else {
									document.getElementById('prd_item_rule').innerHTML = var20;
									document.getElementById('prd_item_rule').style.textAlign = "left";
									document.getElementById('prd_item_rule_a').innerHTML = aft20;
									document.getElementById('prd_item_rule_a').style.textAlign = "left";
								}

								if (var21 != aft21) {
									document
											.getElementById('prd_approved_status').innerHTML = var21;
									document
											.getElementById('prd_approved_status').style.color = "red";
									document
											.getElementById('prd_approved_status_a').innerHTML = aft21;
									document
											.getElementById('prd_approved_status_a').style.color = "red";
								} else {
									document
											.getElementById('prd_approved_status').innerHTML = var19;
									document
											.getElementById('prd_approved_status_a').innerHTML = aft19;
								}

								document.getElementById('ProductInfo_Ruleset').innerHTML = '';
								if (o.data[0].ruleset.length > 0) {
									var htm = '';

									for (i = 1; i <= (o.data[0].ruleset.length / 2); i++) {
										htm += '<table class="table table-hover" width="50%">';
										htm += '<tr>';
										htm += '<td width="30%"><b>Kelompok Aturan</b></td>';
										htm += '<td width="35%"><label id="prs_code_'+i+'" class="control-label after"></label></td>';
										htm += '<td width="35%"><label id="prs_code_'+i+'_a" class="control-label after"></label></td>';
										htm += '</tr>';
										htm += '</table>';
									}

									document
											.getElementById('ProductInfo_Ruleset').innerHTML = htm;

									var ctr = 0;
									var arr = [];
									$.each(o.data[0].ruleset,
											function(data, t) {
												ctr += 1;
												arr[ctr] = t.prs_code;
											});

									for (i = 1; i <= (o.data[0].ruleset.length / 2); i++) {
										if (arr[i] == arr[i
												+ (o.data[0].ruleset.length / 2)]) {
											document.getElementById('prs_code_'
													+ i).innerHTML = arr[i];
											document.getElementById('prs_code_'
													+ i + '_a').innerHTML = arr[i];
										} else {
											document.getElementById('prs_code_'
													+ i).innerHTML = arr[i];
											document.getElementById('prs_code_'
													+ i).style.color = "red";
											document.getElementById('prs_code_'
													+ i + '_a').innerHTML = arr[i];
											document.getElementById('prs_code_'
													+ i + '_a').style.color = "red";
										}
									}
								}

								document.getElementById('ProductInfo_Item').innerHTML = '';
								if (o.data[0].item.length > 0) {
									var htm = '';

									for (i = 1; i <= (o.data[0].item.length / 2); i++) {
										htm += '<table class="table table-hover" width="50%">';
										htm += '<tr>';
										htm += '<td width="30%"><b>Category</b></td>';
										htm += '<td width="35%"><label id="pri_category_'+i+'" class="control-label after"></label></td>';
										htm += '<td width="35%"><label id="pri_category_'+i+'_a" class="control-label after"></label></td>';
										htm += '</tr>';
										htm += '<tr>';
										htm += '<td width="30%"><b>Priority</b></td>';
										htm += '<td width="35%"><label id="pri_priority_'+i+'" class="control-label after"></label></td>';
										htm += '<td width="35%"><label id="pri_priority_'+i+'_a" class="control-label after"></label></td>';
										htm += '</tr>';
										htm += '<tr>';
										htm += '<td width="30%"><b>Plafon From</b></td>';
										htm += '<td width="35%"><label id="pri_plafon_min_'+i+'" class="control-label after"></label></td>';
										htm += '<td width="35%"><label id="pri_plafon_min_'+i+'_a" class="control-label after"></label></td>';
										htm += '</tr>';
										htm += '<tr>';
										htm += '<td width="30%"><b>Plafon To</b></td>';
										htm += '<td width="35%"><label id="pri_plafon_max_'+i+'" class="control-label after"></label></td>';
										htm += '<td width="35%"><label id="pri_plafon_max_'+i+'_a" class="control-label after"></label></td>';
										htm += '</tr>';
										htm += '<tr>';
										htm += '<td width="30%"><b>Min DP %</b></td>';
										htm += '<td width="35%"><label id="pri_min_dp_'+i+'" class="control-label after"></label></td>';
										htm += '<td width="35%"><label id="pri_min_dp_'+i+'_a" class="control-label after"></label></td>';
										htm += '</tr>';

										htm += '<tr>';
										htm += '<td width="30%"><b>Item Detail</b></td>';
										htm += '<td width="35%">';

										if (o.data[0].item_detail.length > 0) {
											for (j = 1; j <= (o.data[0].item.length); j++) {
												for (z = 0; z < o.data[0].item_detail.length; z++) {
													if (o.data[0].item_detail[z].pid_pri_id == o.data[0].item[j - 1].pri_id
															&& o.data[0].item_detail[z].pdl_action == 'Before'
															&& o.data[0].item[j - 1].pri_category == o.data[0].item[i - 1].pri_category) {
														htm += 'tenor : <label id="pid_tenor_'+j+'" class="control-label after">'
																+ o.data[0].item_detail[z].pid_tenor
																+ '</label>';
														htm += '&nbsp;';
														htm += 'interest : <label id="pid_interest_'+j+'" class="control-label after">'
																+ o.data[0].item_detail[z].pid_interest
																+ '</label>';
														htm += '<br/>';
													}
												}
											}
										}

										htm += '</td>';
										htm += '<td width="35%">';

										if (o.data[0].item_detail.length > 0) {
											for (j = 1; j <= (o.data[0].item.length); j++) {
												for (z = 0; z < o.data[0].item_detail.length; z++) {
													if (o.data[0].item_detail[z].pid_pri_id == o.data[0].item[j - 1].pri_id
															&& o.data[0].item_detail[z].pdl_action == 'After'
															&& o.data[0].item[j - 1].pri_category == o.data[0].item[i - 1].pri_category) {
														htm += 'tenor : <label id="pid_tenor_'+j+'_a" class="control-label after">'
																+ o.data[0].item_detail[z].pid_tenor
																+ '</label>';
														htm += '&nbsp;';
														htm += 'interest : <label id="pid_interest_'+j+'_a" class="control-label after">'
																+ o.data[0].item_detail[z].pid_interest
																+ '</label>';
														htm += '<br/>';
													}
												}
											}
										}

										htm += '</td>';
										htm += '</tr>';

										htm += '</table>';
									}

									document.getElementById('ProductInfo_Item').innerHTML = htm;

									var ctr = 0;
									var arr = [];
									$
											.each(
													o.data[0].item,
													function(data, t) {
														ctr += 1;
														arr[ctr] = [];
														arr[ctr]['pri_category'] = t.pri_category;
														arr[ctr]['pri_priority'] = t.pri_priority;
														arr[ctr]['pri_plafon_min'] = t.pri_plafon_min;
														arr[ctr]['pri_plafon_max'] = t.pri_plafon_max;
														arr[ctr]['pri_min_dp'] = t.pri_min_dp;
													});

									for (i = 1; i <= (o.data[0].item.length / 2); i++) {
										if (arr[i]['pri_category'] == arr[i
												+ (o.data[0].item.length / 2)]['pri_category']) {
											document
													.getElementById('pri_category_'
															+ i).innerHTML = arr[i]['pri_category'];
											document
													.getElementById('pri_category_'
															+ i + '_a').innerHTML = arr[i]['pri_category'];
										} else {
											document
													.getElementById('pri_category_'
															+ i).innerHTML = arr[i]['pri_category'];
											document
													.getElementById('pri_category_'
															+ i).style.color = "red";
											document
													.getElementById('pri_category_'
															+ i + '_a').innerHTML = arr[i]['pri_category'];
											document
													.getElementById('pri_category_'
															+ i + '_a').style.color = "red";
										}

										if (arr[i]['pri_priority'] == arr[i
												+ (o.data[0].item.length / 2)]['pri_priority']) {
											document
													.getElementById('pri_priority_'
															+ i).innerHTML = arr[i]['pri_priority'];
											document
													.getElementById('pri_priority_'
															+ i + '_a').innerHTML = arr[i]['pri_priority'];
										} else {
											document
													.getElementById('pri_priority_'
															+ i).innerHTML = arr[i]['pri_priority'];
											document
													.getElementById('pri_priority_'
															+ i).style.color = "red";
											document
													.getElementById('pri_priority_'
															+ i + '_a').innerHTML = arr[i]['pri_priority'];
											document
													.getElementById('pri_priority_'
															+ i + '_a').style.color = "red";
										}

										if (arr[i]['pri_plafon_min'] == arr[i
												+ (o.data[0].item.length / 2)]['pri_plafon_min']) {
											document
													.getElementById('pri_plafon_min_'
															+ i).innerHTML = arr[i]['pri_plafon_min'];
											document
													.getElementById('pri_plafon_min_'
															+ i + '_a').innerHTML = arr[i]['pri_plafon_min'];
										} else {
											document
													.getElementById('pri_plafon_min_'
															+ i).innerHTML = arr[i]['pri_plafon_min'];
											document
													.getElementById('pri_plafon_min_'
															+ i).style.color = "red";
											document
													.getElementById('pri_plafon_min_'
															+ i + '_a').innerHTML = arr[i]['pri_plafon_min'];
											document
													.getElementById('pri_plafon_min_'
															+ i + '_a').style.color = "red";
										}

										if (arr[i]['pri_plafon_max'] == arr[i
												+ (o.data[0].item.length / 2)]['pri_plafon_max']) {
											document
													.getElementById('pri_plafon_max_'
															+ i).innerHTML = arr[i]['pri_plafon_max'];
											document
													.getElementById('pri_plafon_max_'
															+ i + '_a').innerHTML = arr[i]['pri_plafon_max'];
										} else {
											document
													.getElementById('pri_plafon_max_'
															+ i).innerHTML = arr[i]['pri_plafon_max'];
											document
													.getElementById('pri_plafon_max_'
															+ i).style.color = "red";
											document
													.getElementById('pri_plafon_max_'
															+ i + '_a').innerHTML = arr[i]['pri_plafon_max'];
											document
													.getElementById('pri_plafon_max_'
															+ i + '_a').style.color = "red";
										}

										if (arr[i]['pri_min_dp'] == arr[i
												+ (o.data[0].item.length / 2)]['pri_min_dp']) {
											document
													.getElementById('pri_min_dp_'
															+ i).innerHTML = arr[i]['pri_min_dp'];
											document
													.getElementById('pri_min_dp_'
															+ i + '_a').innerHTML = arr[i]['pri_min_dp'];
										} else {
											document
													.getElementById('pri_min_dp_'
															+ i).innerHTML = arr[i]['pri_min_dp'];
											document
													.getElementById('pri_min_dp_'
															+ i).style.color = "red";
											document
													.getElementById('pri_min_dp_'
															+ i + '_a').innerHTML = arr[i]['pri_min_dp'];
											document
													.getElementById('pri_min_dp_'
															+ i + '_a').style.color = "red";
										}
									}
								}

								document
										.getElementById('ProductInfo_Othercost').innerHTML = '';
								if (o.data[0].other_cost.length > 0) {
									var htm = '';

									for (i = 1; i <= (o.data[0].other_cost.length / 2); i++) {
										htm += '<table class="table table-hover" width="50%">';
										htm += '<tr>';
										htm += '<td width="30%"><b>Pembayaran Lain</b></td>';
										htm += '<td width="35%"><label id="lpc_name_'+i+'" class="control-label after"></label></td>';
										htm += '<td width="35%"><label id="lpc_name_'+i+'_a" class="control-label after"></label></td>';
										htm += '</tr>';
										htm += '<tr>';
										htm += '<td width="30%"><b>Value Time</b></td>';
										htm += '<td width="35%"><label id="lpc_recurring_'+i+'" class="control-label after"></label></td>';
										htm += '<td width="35%"><label id="lpc_recurring_'+i+'_a" class="control-label after"></label></td>';
										htm += '</tr>';
										htm += '<tr>';
										htm += '<td width="30%"><b>Value Amt</b></td>';
										htm += '<td width="35%"><label id="lpc_value_'+i+'" class="control-label after"></label></td>';
										htm += '<td width="35%"><label id="lpc_value_'+i+'_a" class="control-label after"></label></td>';
										htm += '</tr>';
										htm += '</table>';
									}

									document
											.getElementById('ProductInfo_Othercost').innerHTML = htm;

									var ctr = 0;
									var arr = [];
									$
											.each(
													o.data[0].other_cost,
													function(data, t) {
														ctr += 1;
														arr[ctr] = [];
														arr[ctr]['lpc_name'] = t.lpc_name;
														arr[ctr]['lpc_recurring'] = t.lpc_recurring;
														arr[ctr]['lpc_value'] = t.lpc_value;
													});

									for (i = 1; i <= (o.data[0].other_cost.length / 2); i++) {
										if (arr[i]['lpc_name'] == arr[i
												+ (o.data[0].other_cost.length / 2)]['lpc_name']) {
											document.getElementById('lpc_name_'
													+ i).innerHTML = arr[i]['lpc_name'];
											document.getElementById('lpc_name_'
													+ i + '_a').innerHTML = arr[i]['lpc_name'];
										} else {
											document.getElementById('lpc_name_'
													+ i).innerHTML = arr[i]['lpc_name'];
											document.getElementById('lpc_name_'
													+ i).style.color = "red";
											document.getElementById('lpc_name_'
													+ i + '_a').innerHTML = arr[i]['lpc_name'];
											document.getElementById('lpc_name_'
													+ i + '_a').style.color = "red";
										}

										if (arr[i]['lpc_recurring'] == arr[i
												+ (o.data[0].other_cost.length / 2)]['lpc_recurring']) {
											document
													.getElementById('lpc_recurring_'
															+ i).innerHTML = arr[i]['lpc_recurring'];
											document
													.getElementById('lpc_recurring_'
															+ i + '_a').innerHTML = arr[i]['lpc_recurring'];
										} else {
											document
													.getElementById('lpc_recurring_'
															+ i).innerHTML = arr[i]['lpc_recurring'];
											document
													.getElementById('lpc_recurring_'
															+ i).style.color = "red";
											document
													.getElementById('lpc_recurring_'
															+ i + '_a').innerHTML = arr[i]['lpc_recurring'];
											document
													.getElementById('lpc_recurring_'
															+ i + '_a').style.color = "red";
										}

										if (arr[i]['lpc_value'] == arr[i
												+ (o.data[0].other_cost.length / 2)]['lpc_value']) {
											document
													.getElementById('lpc_value_'
															+ i).innerHTML = arr[i]['lpc_value'];
											document
													.getElementById('lpc_value_'
															+ i + '_a').innerHTML = arr[i]['lpc_value'];
										} else {
											document
													.getElementById('lpc_value_'
															+ i).innerHTML = arr[i]['lpc_value'];
											document
													.getElementById('lpc_value_'
															+ i).style.color = "red";
											document
													.getElementById('lpc_value_'
															+ i + '_a').innerHTML = arr[i]['lpc_value'];
											document
													.getElementById('lpc_value_'
															+ i + '_a').style.color = "red";
										}
									}
								}

								document.getElementById('ProductInfo_Penalty').innerHTML = '';
								var htm = '';
								htm += '<table class="table table-hover" width="50%">';
								htm += '<tr>';
								htm += '<td width="30%"><b>Penalti Keterlambatan %</b></td>';
								htm += '<td width="35%"><label id="lpp_value" class="control-label after"></label></td>';
								htm += '<td width="35%"><label id="lpp_value_a" class="control-label after"></label></td>';
								htm += '</tr>';
								htm += '</table>';
								document.getElementById('ProductInfo_Penalty').innerHTML = htm;

								if (o.data[0].penalty[0].lpp_value == o.data[0].penalty[1].lpp_value) {
									document.getElementById('lpp_value').innerHTML = o.data[0].penalty[0].lpp_value;
									document.getElementById('lpp_value_a').innerHTML = o.data[0].penalty[1].lpp_value;
								} else {
									document.getElementById('lpp_value').innerHTML = o.data[0].penalty[0].lpp_value;
									document.getElementById('lpp_value').style.color = "red";
									document.getElementById('lpp_value_a').innerHTML = o.data[0].penalty[1].lpp_value;
									document.getElementById('lpp_value_a').style.color = "red";
								}

								document
										.getElementById('ProductInfo_Repayment').innerHTML = '';
								if (o.data[0].repayment.length > 0) {
									var htm = '';

									for (i = 1; i <= (o.data[0].repayment.length / 2); i++) {
										htm += '<table class="table table-hover" width="50%">';
										htm += '<tr>';
										htm += '<td width="30%"><b>Remaining Installment From</b></td>';
										htm += '<td width="35%"><label id="lpr_tenor_from_'+i+'" class="control-label after"></label></td>';
										htm += '<td width="35%"><label id="lpr_tenor_from_'+i+'_a" class="control-label after"></label></td>';
										htm += '</tr>';
										htm += '<tr>';
										htm += '<td width="30%"><b>Remaining Installment To</b></td>';
										htm += '<td width="35%"><label id="lpr_tenor_to_'+i+'" class="control-label after"></label></td>';
										htm += '<td width="35%"><label id="lpr_tenor_to_'+i+'_a" class="control-label after"></label></td>';
										htm += '</tr>';
										htm += '<tr>';
										htm += '<td width="30%"><b>Biaya Percepatan Pembayaran</b></td>';
										htm += '<td width="35%"><label id="lpr_out_principal_'+i+'" class="control-label after"></label></td>';
										htm += '<td width="35%"><label id="lpr_out_principal_'+i+'_a" class="control-label after"></label></td>';
										htm += '</tr>';
										htm += '<tr>';
										htm += '<td width="30%"><b>Administrative Cost</b></td>';
										htm += '<td width="35%"><label id="lpr_adm_cost_'+i+'" class="control-label after"></label></td>';
										htm += '<td width="35%"><label id="lpr_adm_cost_'+i+'_a" class="control-label after"></label></td>';
										htm += '</tr>';
										htm += '<tr>';
										htm += '<td width="30%"><b>Min Cost</b></td>';
										htm += '<td width="35%"><label id="lpr_min_cost_'+i+'" class="control-label after"></label></td>';
										htm += '<td width="35%"><label id="lpr_min_cost_'+i+'_a" class="control-label after"></label></td>';
										htm += '</tr>';
										htm += '</table>';
									}

									document
											.getElementById('ProductInfo_Repayment').innerHTML = htm;

									var ctr = 0;
									var arr = [];
									$
											.each(
													o.data[0].repayment,
													function(data, t) {
														ctr += 1;
														arr[ctr] = [];
														arr[ctr]['lpr_tenor_from'] = t.lpr_tenor_from;
														arr[ctr]['lpr_tenor_to'] = t.lpr_tenor_to;
														arr[ctr]['lpr_out_principal'] = t.lpr_out_principal;
														arr[ctr]['lpr_adm_cost'] = t.lpr_adm_cost;
														arr[ctr]['lpr_min_cost'] = t.lpr_min_cost;
													});

									for (i = 1; i <= (o.data[0].repayment.length / 2); i++) {
										if (arr[i]['pri_category'] == arr[i
												+ (o.data[0].repayment.length / 2)]['pri_category']) {
											document
													.getElementById('lpr_tenor_from_'
															+ i).innerHTML = arr[i]['lpr_tenor_from'];
											document
													.getElementById('lpr_tenor_from_'
															+ i + '_a').innerHTML = arr[i]['lpr_tenor_from'];
										} else {
											document
													.getElementById('lpr_tenor_from_'
															+ i).innerHTML = arr[i]['lpr_tenor_from'];
											document
													.getElementById('lpr_tenor_from_'
															+ i).style.color = "red";
											document
													.getElementById('lpr_tenor_from_'
															+ i + '_a').innerHTML = arr[i]['lpr_tenor_from'];
											document
													.getElementById('lpr_tenor_from_'
															+ i + '_a').style.color = "red";
										}

										if (arr[i]['lpr_tenor_to'] == arr[i
												+ (o.data[0].repayment.length / 2)]['lpr_tenor_to']) {
											document
													.getElementById('lpr_tenor_to_'
															+ i).innerHTML = arr[i]['lpr_tenor_to'];
											document
													.getElementById('lpr_tenor_to_'
															+ i + '_a').innerHTML = arr[i]['lpr_tenor_to'];
										} else {
											document
													.getElementById('lpr_tenor_to_'
															+ i).innerHTML = arr[i]['lpr_tenor_to'];
											document
													.getElementById('lpr_tenor_to_'
															+ i).style.color = "red";
											document
													.getElementById('lpr_tenor_to_'
															+ i + '_a').innerHTML = arr[i]['lpr_tenor_to'];
											document
													.getElementById('lpr_tenor_to_'
															+ i + '_a').style.color = "red";
										}

										if (arr[i]['lpr_out_principal'] == arr[i
												+ (o.data[0].repayment.length / 2)]['lpr_out_principal']) {
											document
													.getElementById('lpr_out_principal_'
															+ i).innerHTML = arr[i]['lpr_out_principal'];
											document
													.getElementById('lpr_out_principal_'
															+ i + '_a').innerHTML = arr[i]['lpr_out_principal'];
										} else {
											document
													.getElementById('lpr_out_principal_'
															+ i).innerHTML = arr[i]['lpr_out_principal'];
											document
													.getElementById('lpr_out_principal_'
															+ i).style.color = "red";
											document
													.getElementById('lpr_out_principal_'
															+ i + '_a').innerHTML = arr[i]['lpr_out_principal'];
											document
													.getElementById('lpr_out_principal_'
															+ i + '_a').style.color = "red";
										}

										if (arr[i]['lpr_adm_cost'] == arr[i
												+ (o.data[0].repayment.length / 2)]['lpr_adm_cost']) {
											document
													.getElementById('lpr_adm_cost_'
															+ i).innerHTML = arr[i]['lpr_adm_cost'];
											document
													.getElementById('lpr_adm_cost_'
															+ i + '_a').innerHTML = arr[i]['lpr_adm_cost'];
										} else {
											document
													.getElementById('lpr_adm_cost_'
															+ i).innerHTML = arr[i]['lpr_adm_cost'];
											document
													.getElementById('lpr_adm_cost_'
															+ i).style.color = "red";
											document
													.getElementById('lpr_adm_cost_'
															+ i + '_a').innerHTML = arr[i]['lpr_adm_cost'];
											document
													.getElementById('lpr_adm_cost_'
															+ i + '_a').style.color = "red";
										}

										if (arr[i]['lpr_min_cost'] == arr[i
												+ (o.data[0].repayment.length / 2)]['lpr_min_cost']) {
											document
													.getElementById('lpr_min_cost_'
															+ i).innerHTML = arr[i]['lpr_min_cost'];
											document
													.getElementById('lpr_min_cost_'
															+ i + '_a').innerHTML = arr[i]['lpr_min_cost'];
										} else {
											document
													.getElementById('lpr_min_cost_'
															+ i).innerHTML = arr[i]['lpr_min_cost'];
											document
													.getElementById('lpr_min_cost_'
															+ i).style.color = "red";
											document
													.getElementById('lpr_min_cost_'
															+ i + '_a').innerHTML = arr[i]['lpr_min_cost'];
											document
													.getElementById('lpr_min_cost_'
															+ i + '_a').style.color = "red";
										}
									}
								}
								//
							}

						});

	}

	function getDataViewMasterData(id, code) {
		$
				.get(
						"${local_server}/AuditTrail/view_detail/" + id + '/'
								+ code,
						function(data) {
							var o = JSON.parse(data);
							console.log(o)

							$("#msg").html("");
							$(".before").empty();
							$(".before").removeAttr("style");
							$(".after").empty();
							$(".after").removeAttr("style");

							$('#tableviewMasterData').removeClass("hidden");
							$('#tableviewMasterData').DataTable().destroy();

							bef1 = (o.data)[0].map_field_name;
							aft1 = (o.data)[1].map_field_name;
							bef2 = (o.data)[0].map_field_desc;
							aft2 = (o.data)[1].map_field_desc;
							bef3 = (o.data)[0].map_type;
							aft3 = (o.data)[1].map_type;
							bef4 = (o.data)[0].map_formula;
							aft4 = (o.data)[1].map_formula;
							bef5 = (o.data)[0].map_formula_level;
							aft5 = (o.data)[1].map_formula_level;

							if (bef1 !== aft1) {
								document.getElementById('map_field_name').innerHTML = bef1;
								document.getElementById('map_field_name').style.color = "red";
								document.getElementById('map_field_name_a').innerHTML = aft1;
								document.getElementById('map_field_name_a').style.color = "red";
							} else {
								document.getElementById('map_field_name').innerHTML = bef1;
								document.getElementById('map_field_name_a').innerHTML = aft1;
							}
							if (bef2 !== aft2) {
								document.getElementById('map_field_desc').innerHTML = bef2;
								document.getElementById('map_field_desc').style.color = "red";
								document.getElementById('map_field_desc_a').innerHTML = aft2;
								document.getElementById('map_field_desc_a').style.color = "red";
							} else {
								document.getElementById('map_field_desc').innerHTML = bef2;
								document.getElementById('map_field_desc_a').innerHTML = aft2;
							}
							if (bef3 !== aft3) {
								document.getElementById('map_type').innerHTML = bef3;
								document.getElementById('map_type').style.color = "red";
								document.getElementById('map_type_a').innerHTML = aft3;
								document.getElementById('map_type_a').style.color = "red";
							} else {
								document.getElementById('map_type').innerHTML = bef3;
								document.getElementById('map_type_a').innerHTML = aft3;
							}
							if (bef4 !== aft4) {
								document.getElementById('map_formula').innerHTML = bef4;
								document.getElementById('map_formula').style.color = "red";
								document.getElementById('map_formula_a').innerHTML = aft4;
								document.getElementById('map_formula_a').style.color = "red";
							} else {
								document.getElementById('map_formula').innerHTML = bef4;
								document.getElementById('map_formula_a').innerHTML = aft4;
							}
							if (bef5 !== aft5) {
								document.getElementById('map_formula_level').innerHTML = bef5;
								document.getElementById('map_formula_level').style.color = "red";
								document.getElementById('map_formula_level_a').innerHTML = aft5;
								document.getElementById('map_formula_level_a').style.color = "red";
							} else {
								document.getElementById('map_formula_level').innerHTML = bef5;
								document.getElementById('map_formula_level_a').innerHTML = aft5;
							}
						});

	}

	function getDataViewTenantDetail(id, code) {
		$
				.get(
						"${local_server}/AuditTrail/view_detail/" + id + '/'
								+ code,
						function(data) {
							var o = JSON.parse(data);
							console.log(o)

							$("#msg").html("");
							$(".before").empty();
							$(".before").removeAttr("style");
							$(".after").empty();
							$(".after").removeAttr("style");

							$('#tableviewTenantDetail').removeClass("hidden");
							$('#tableviewTenantDetail').DataTable().destroy();

							//$.each(o.data, function (data, t) {
							//var model = (t['p_log_action_mode']);
							var model = (o.data)[0].tlo_action;

							if (model == "Insert") {
								$
										.each(
												o.data,
												function(data, t) {
													document
															.getElementById('tnt_group_alias_a').innerHTML = (t.tnt_group_alias);
													document
															.getElementById('tnt_group_alias_a').style.color = "red";
													document
															.getElementById('tnt_group_a').innerHTML = (t.tnt_group);
													document
															.getElementById('tnt_group_a').style.color = "red";
													document
															.getElementById('tnt_alias_a').innerHTML = (t.tnt_alias);
													document
															.getElementById('tnt_alias_a').style.color = "red";
													document
															.getElementById('tnt_name_a').innerHTML = (t.tnt_name);
													document
															.getElementById('tnt_name_a').style.color = "red";
												});
							} else {
								/* for(var i = 0;i < o.data.length;i++) { */
								bef1 = (o.data)[0].tnt_group_alias;
								aft1 = (o.data)[1].tnt_group_alias;
								bef2 = (o.data)[0].tnt_group;
								aft2 = (o.data)[1].tnt_group;
								bef3 = (o.data)[0].tnt_alias;
								aft3 = (o.data)[1].tnt_alias;
								bef4 = (o.data)[0].tnt_name;
								aft4 = (o.data)[1].tnt_name;
								if (bef1 !== aft1) {
									document.getElementById('tnt_group_alias').innerHTML = bef1;
									document.getElementById('tnt_group_alias').style.color = "red";
									document
											.getElementById('tnt_group_alias_a').innerHTML = aft1;
									document
											.getElementById('tnt_group_alias_a').style.color = "red";
								} else {
									document.getElementById('tnt_group_alias').innerHTML = bef1;
									document
											.getElementById('tnt_group_alias_a').innerHTML = aft1;
								}
								if (bef2 !== aft2) {
									document.getElementById('tnt_group').innerHTML = bef2;
									document.getElementById('tnt_group').style.color = "red";
									document.getElementById('tnt_group_a').innerHTML = aft2;
									document.getElementById('tnt_group_a').style.color = "red";
								} else {
									document.getElementById('tnt_group').innerHTML = bef2;
									document.getElementById('tnt_group_a').innerHTML = aft2;
								}
								if (bef3 !== aft3) {
									document.getElementById('tnt_alias').innerHTML = bef3;
									document.getElementById('tnt_alias').style.color = "red";
									document.getElementById('tnt_alias_a').innerHTML = aft3;
									document.getElementById('tnt_alias_a').style.color = "red";
								} else {
									document.getElementById('tnt_alias').innerHTML = bef3;
									document.getElementById('tnt_alias_a').innerHTML = aft3;
								}
								if (bef4 !== aft4) {
									document.getElementById('tnt_name').innerHTML = bef4;
									document.getElementById('tnt_name').style.color = "red";
									document.getElementById('tnt_name_a').innerHTML = aft4;
									document.getElementById('tnt_name_a').style.color = "red";
								} else {
									document.getElementById('tnt_name').innerHTML = bef4;
									document.getElementById('tnt_name_a').innerHTML = aft4;
								}
							}

							//}); 
						});

	}

	function getDataViewTenantGroup(id, code) {
		$
				.get(
						"${local_server}/AuditTrail/view_detail/" + id + '/'
								+ code,
						function(data) {
							var o = JSON.parse(data);
							console.log(o)

							$("#msg").html("");
							$(".before").empty();
							$(".before").removeAttr("style");
							$(".after").empty();
							$(".after").removeAttr("style");

							$('#tableviewTenantGroup').removeClass("hidden");
							$('#tableviewTenantGroup').DataTable().destroy();

							//$.each(o.data, function (data, t) {
							//var model = (t['p_log_action_mode']);
							var model = (o.data)[0].tgl_action;

							if (model == "Insert") {
								$
										.each(
												o.data,
												function(data, t) {
													document
															.getElementById('group_alias_a').innerHTML = (t.tag_group_alias);
													document
															.getElementById('group_alias_a').style.color = "red";
													document
															.getElementById('group_name_a').innerHTML = (t.tap_group_name);
													document
															.getElementById('group_name_a').style.color = "red";
												});
							} else {
								/* for(var i = 0;i < o.data.length;i++) { */
								bef1 = (o.data)[0].tag_group_alias;
								aft1 = (o.data)[1].tag_group_alias;
								bef2 = (o.data)[0].tap_group_name;
								aft2 = (o.data)[1].tap_group_name;
								if (bef1 !== aft1) {
									document.getElementById('group_alias').innerHTML = bef1;
									document.getElementById('group_alias').style.color = "red";
									document.getElementById('group_alias_a').innerHTML = aft1;
									document.getElementById('group_alias_a').style.color = "red";
								} else {
									document.getElementById('group_alias').innerHTML = bef1;
									document.getElementById('group_alias_a').innerHTML = aft1;
								}
								if (bef2 !== aft2) {
									document.getElementById('group_name').innerHTML = bef2;
									document.getElementById('group_name').style.color = "red";
									document.getElementById('group_name_a').innerHTML = aft2;
									document.getElementById('group_name_a').style.color = "red";
								} else {
									document.getElementById('group_name').innerHTML = bef2;
									document.getElementById('group_name_a').innerHTML = aft2;
								}
							}

							//}); 
						});

	}

	function getDataViewUA(id, code) {
		$
				.get(
						"${local_server}/AuditTrail/view_detail/" + id + '/'
								+ code,
						function(data) {
							var t = JSON.parse(data);
							console.log(t)
							var bft = ""
							var aft = ""
							$("#msg").html("");
							$('#tableviewua').removeClass("hidden");
							$('#tableviewua').DataTable().destroy();
							$(".before").empty();
							$(".before").removeAttr("style");
							$(".after").empty();
							$(".after").removeAttr("style");

							$
									.each(
											t.data,
											function(data, t) {
												var model = (t.p_log_action_mode);
												if (model == "Logout") {
													document
															.getElementById('login').style.display = "none";
													document
															.getElementById('userid_a').innerHTML = (t.p_usr_userid);
													document
															.getElementById('userid_a').style.color = "red";
													document
															.getElementById('user_name_a').innerHTML = (t.p_usr_name);
													document
															.getElementById('user_name_a').style.color = "red";
													document
															.getElementById('nip_a').innerHTML = (t.p_usr_nip);
													document
															.getElementById('nip_a').style.color = "red";
													document
															.getElementById('access_level_a').innerHTML = (t.p_usr_access_level);
													document
															.getElementById('access_level_a').style.color = "red";
													document
															.getElementById('branch_a').innerHTML = (t.p_usr_branch);
													document
															.getElementById('branch_a').style.color = "red";
													document
															.getElementById('lvl_name_a').innerHTML = (t.p_lu_level_name);
													document
															.getElementById('lvl_name_a').style.color = "red";
													document
															.getElementById('status_a').innerHTML = (t.p_usr_status);
													document
															.getElementById('status_a').style.color = "red";

												} else if (model == "Login") {
													document
															.getElementById('logout').style.display = "none";
													document
															.getElementById('userid').innerHTML = (t.p_usr_userid);
													document
															.getElementById('userid').style.color = "red";
													document
															.getElementById('user_name').innerHTML = (t.p_usr_name);
													document
															.getElementById('user_name').style.color = "red";
													document
															.getElementById('nip').innerHTML = (t.p_usr_nip);
													document
															.getElementById('nip').style.color = "red";
													document
															.getElementById('access_level').innerHTML = (t.p_usr_access_level);
													document
															.getElementById('access_level').style.color = "red";
													document
															.getElementById('branch').innerHTML = (t.p_usr_branch);
													document
															.getElementById('branch').style.color = "red";
													document
															.getElementById('lvl_name').innerHTML = (t.p_lu_level_name);
													document
															.getElementById('lvl_name').style.color = "red";
													document
															.getElementById('status').innerHTML = (t.p_usr_status);
													document
															.getElementById('status').style.color = "red";

												}

											});
						});

	}

	function getDataViewBranch(id, code) {
		$
				.get(
						"${local_server}/AuditTrail/view_detail/" + id + '/'
								+ code,
						function(data) {
							var t = JSON.parse(data);
							console.log(t);
							var bft = "";
							var aft = "";

							$("#msg").html("");
							$('#tableviewbranch').removeClass("hidden");
							$('#tableviewbranch').DataTable().destroy();
							$(".before").empty();
							$(".before").removeAttr("style");
							$(".after").empty();
							$(".after").removeAttr("style");
							var model = (t.data)[0].p_lbrc_action;
							//$.each(t.data, function (data, t) {
							//var model = (t['p_lbrc_action']);

							if (model == "INSERT") {
								$
										.each(
												t.data,
												function(data, t) {
													document
															.getElementById('branch_code_a').innerHTML = (t.p_lbrc_code);
													document
															.getElementById('branch_code_a').style.color = "red";
													document
															.getElementById('branch_group_a').innerHTML = (t.p_lbrc_group);
													document
															.getElementById('branch_group_a').style.color = "red";
													document
															.getElementById('barnch_name_a').innerHTML = (t.p_lbrc_name);
													document
															.getElementById('barnch_name_a').style.color = "red";
													document
															.getElementById('branch_address_a').innerHTML = (t.p_lbrc_address);
													document
															.getElementById('branch_address_a').style.color = "red";
													document
															.getElementById('name_bank_a').innerHTML = (t.p_lbrc_bank);
													document
															.getElementById('name_bank_a').style.color = "red";
													document
															.getElementById('no_rek_a').innerHTML = (t.p_lbrc_norek);
													document
															.getElementById('no_rek_a').style.color = "red";
												});

							} else if (model == "DELETE SOFT") {
								$
										.each(
												t.data,
												function(data, t) {
													document
															.getElementById('branch_code').innerHTML = (t.p_lbrc_code);
													document
															.getElementById('branch_code').style.color = "red";
													document
															.getElementById('branch_group').innerHTML = (t.p_lbrc_group);
													document
															.getElementById('branch_group').style.color = "red";
													document
															.getElementById('barnch_name').innerHTML = (t.p_lbrc_name);
													document
															.getElementById('barnch_name').style.color = "red";
													document
															.getElementById('branch_address').innerHTML = (t.p_lbrc_address);
													document
															.getElementById('branch_address').style.color = "red";
													document
															.getElementById('name_bank').innerHTML = (t.p_lbrc_bank);
													document
															.getElementById('name_bank').style.color = "red";
													document
															.getElementById('no_rek').innerHTML = (t.p_lbrc_norek);
													document
															.getElementById('no_rek').style.color = "red";
												});
							} else {
								bef1 = (t.data)[0].p_lbrc_code;
								aft1 = (t.data)[1].p_lbrc_code;
								bef2 = (t.data)[0].p_lbrc_group;
								aft2 = (t.data)[1].p_lbrc_group;
								bef3 = (t.data)[0].p_lbrc_name;
								aft3 = (t.data)[1].p_lbrc_name;
								bef4 = (t.data)[0].p_lbrc_address;
								aft4 = (t.data)[1].p_lbrc_address;
								bef5 = (t.data)[0].p_lbrc_bank;
								aft5 = (t.data)[1].p_lbrc_bank;
								bef6 = (t.data)[0].p_lbrc_norek;
								aft6 = (t.data)[1].p_lbrc_norek;
								if (bef1 !== aft1) {
									document.getElementById('branch_code').innerHTML = bef1;
									document.getElementById('branch_code').style.color = "red";
									document.getElementById('branch_code_a').innerHTML = aft1;
									document.getElementById('branch_code_a').style.color = "red";
								} else {
									document.getElementById('branch_code').innerHTML = bef1;
									document.getElementById('branch_code_a').innerHTML = aft1;
								}
								if (bef2 !== aft2) {
									document.getElementById('branch_group').innerHTML = bef2;
									document.getElementById('branch_group').style.color = "red";
									document.getElementById('branch_group_a').innerHTML = aft2;
									document.getElementById('branch_group_a').style.color = "red";
								} else {
									document.getElementById('branch_group').innerHTML = bef2;
									document.getElementById('branch_group_a').innerHTML = aft2;
								}
								if (bef3 !== aft3) {
									document.getElementById('barnch_name').innerHTML = bef3;
									document.getElementById('barnch_name').style.color = "red";
									document.getElementById('barnch_name_a').innerHTML = aft3;
									document.getElementById('barnch_name_a').style.color = "red";
								} else {
									document.getElementById('barnch_name').innerHTML = bef3;
									document.getElementById('barnch_name_a').innerHTML = aft3;
								}
								if (bef4 !== aft4) {
									document.getElementById('branch_address').innerHTML = bef4;
									document.getElementById('branch_address').style.color = "red";
									document.getElementById('branch_address_a').innerHTML = aft4;
									document.getElementById('branch_address_a').style.color = "red";

								} else {
									document.getElementById('branch_address').innerHTML = bef4;
									document.getElementById('branch_address_a').innerHTML = aft4;
								}
								if (bef5 !== aft5) {
									document.getElementById('name_bank').innerHTML = bef5;
									document.getElementById('name_bank').style.color = "red";
									document.getElementById('name_bank_a').innerHTML = aft5;
									document.getElementById('name_bank_a').style.color = "red";
								} else {
									document.getElementById('name_bank').innerHTML = bef5;
									document.getElementById('name_bank_a').innerHTML = aft5;
								}
								if (bef6 !== aft6) {
									document.getElementById('no_rek').innerHTML = bef6;
									document.getElementById('no_rek').style.color = "red";
									document.getElementById('no_rek_a').innerHTML = aft6;
									document.getElementById('no_rek_a').style.color = "red";
								} else {
									document.getElementById('no_rek').innerHTML = bef6;
									document.getElementById('no_rek_a').innerHTML = aft6;
								}
							}
							//}); 
						});

	}

	function getDataViewRule(id, code) {
		$
				.get(
						"${local_server}/AuditTrail/view_detail/" + id + '/'
								+ code,
						function(data) {
							var o = JSON.parse(data);
							console.log(o)
							var bft = ""
							var aft = ""

							$("#msg").html("");
							$('#tableviewRule').removeClass("hidden");
							$('#tableviewRule').DataTable().destroy();
							$(".before").empty();
							$(".before").removeAttr("style");
							$(".after").empty();
							$(".after").removeAttr("style");
							$
									.each(
											o.data,
											function(data, t) {
												var model = (t.lrul_action);

												if (model == "INSERT") {

													document
															.getElementById('rule_name_a').innerHTML = (t.lrul_name);
													document
															.getElementById('rule_name_a').style.color = "red";
													document
															.getElementById('rule_desk_a').innerHTML = (t.lrul_desc);
													document
															.getElementById('rule_desk_a').style.color = "red";
													document
															.getElementById('rule_cond_a').innerHTML = (t.lrul_condition);
													document
															.getElementById('rule_cond_a').style.color = "red";
													document
															.getElementById('rule_output_a').innerHTML = (t.lrul_output);
													document
															.getElementById('rule_output_a').style.color = "red";
													//document.getElementById('rule_create_a').innerHTML = (t.lrus_created_by); 
													//document.getElementById('rule_create_a').style.color="red";
													//document.getElementById('rule_modif_a').innerHTML = (t.p_lrus_modified_by);  
													//document.getElementById('rule_modif_a').style.color="red";

												} else if (model == "DELETE") {

													document
															.getElementById('rule_name').innerHTML = (t.lrul_name);
													document
															.getElementById('rule_name').style.color = "red";
													document
															.getElementById('rule_desk').innerHTML = (t.lrul_desc);
													document
															.getElementById('rule_desk').style.color = "red";
													document
															.getElementById('rule_cond').innerHTML = (t.lrul_condition);
													document
															.getElementById('rule_cond').style.color = "red";
													document
															.getElementById('rule_output').innerHTML = (t.lrul_output);
													document
															.getElementById('rule_output').style.color = "red";
													//document.getElementById('rule_create').innerHTML = (t.p_lrus_created_by); 
													//document.getElementById('rule_create').style.color="red";
													//document.getElementById('rule_modif').innerHTML = (t.p_lrus_modified_by);  
													//document.getElementById('rule_modif').style.color="red";

												}

												if (model != "INSERT"
														&& model != "DELETE") {
													bef1 = (o.data)[0].lrul_name;
													aft1 = (o.data)[1].lrul_name;
													bef2 = (o.data)[0].lrul_desc;
													aft2 = (o.data)[1].lrul_desc;
													bef3 = (o.data)[0].lrul_condition;
													aft3 = (o.data)[1].lrul_condition;
													bef4 = (o.data)[0].lrul_output;
													aft4 = (o.data)[1].lrul_output;
													//bef5 = (t.data)[0].p_lrus_created_by; 
													//aft5 = (t.data)[1].p_lrus_created_by; 
													//bef6 = (t.data)[0].p_lrus_modified_by; 
													//aft6 = (t.data)[1].p_lrus_modified_by; 
													if (bef1 !== aft1) {
														document
																.getElementById('rule_name').innerHTML = bef1;
														document
																.getElementById('rule_name').style.color = "red";
														document
																.getElementById('rule_name_a').innerHTML = aft1;
														document
																.getElementById('rule_name_a').style.color = "red";
													} else {
														document
																.getElementById('rule_name').innerHTML = bef1;
														document
																.getElementById('rule_name_a').innerHTML = aft1;
													}
													if (bef2 !== aft2) {
														document
																.getElementById('rule_desk').innerHTML = bef2;
														document
																.getElementById('rule_desk').style.color = "red";
														document
																.getElementById('rule_desk_a').innerHTML = aft2;
														document
																.getElementById('rule_desk_a').style.color = "red";
													} else {
														document
																.getElementById('rule_desk').innerHTML = bef2;
														document
																.getElementById('rule_desk_a').innerHTML = aft2;
													}
													if (bef3 !== aft3) {
														document
																.getElementById('rule_cond').innerHTML = bef3;
														document
																.getElementById('rule_cond').style.color = "red";
														document
																.getElementById('rule_cond_a').innerHTML = aft3;
														document
																.getElementById('rule_cond_a').style.color = "red";
													} else {
														document
																.getElementById('rule_cond').innerHTML = bef3;
														document
																.getElementById('rule_cond_a').innerHTML = aft3;
													}
													if (bef4 !== aft4) {
														document
																.getElementById('rule_output').innerHTML = bef4;
														document
																.getElementById('rule_output').style.color = "red";
														document
																.getElementById('rule_output_a').innerHTML = aft4;
														document
																.getElementById('rule_output_a').style.color = "red";

													} else {
														document
																.getElementById('rule_output').innerHTML = bef4;
														document
																.getElementById('rule_output_a').innerHTML = aft4;
													}
													/*
													if (bef5 !== aft5){
														 document.getElementById('rule_create').innerHTML = bef5;
														 document.getElementById('rule_create').style.color="red";
														 document.getElementById('rule_create_a').innerHTML = aft5;
														 document.getElementById('rule_create_a').style.color="red";
													}
													else
													{
														 document.getElementById('rule_create').innerHTML = bef5;
														 document.getElementById('rule_create_a').innerHTML = aft5;
													}
													if (bef6 !== aft6){
														 document.getElementById('rule_modif').innerHTML = bef6;
														 document.getElementById('rule_modif').style.color="red";
														 document.getElementById('rule_modif_a').innerHTML = aft6;
														 document.getElementById('rule_modif_a').style.color="red";
													}
													else
													{
														 document.getElementById('rule_modif').innerHTML = bef6;
														 document.getElementById('rule_modif_a').innerHTML = aft6;
													}
													 */
												}
											});
						});

	}

	function getDataViewCollectionCharge(id, code) {
		$
				.get(
						"${local_server}/AuditTrail/view_detail/" + id + '/'
								+ code,
						function(data) {
							var o = JSON.parse(data);
							console.log(o)
							var bft = ""
							var aft = ""

							$("#msg").html("");
							$('#tableviewCollectionCharge').removeClass(
									"hidden");
							$('#tableviewCollectionCharge').DataTable()
									.destroy();
							$(".before").empty();
							$(".before").removeAttr("style");
							$(".after").empty();
							$(".after").removeAttr("style");
							$
									.each(
											o.data,
											function(data, t) {
												var model = (t.ccl_action);

												if (model == "Insert") {

													document
															.getElementById('ccl_from_a').innerHTML = (t.ccl_to);
													document
															.getElementById('ccl_from_a').style.color = "red";
													document
															.getElementById('ccl_to_a').innerHTML = (t.ccl_to);
													document
															.getElementById('ccl_to_a').style.color = "red";
													document
															.getElementById('ccl_charge_a').innerHTML = (t.ccl_charge);
													document
															.getElementById('ccl_charge_a').style.color = "red";
													document
															.getElementById('ccl_level_a').innerHTML = (t.ccl_level);
													document
															.getElementById('ccl_level_a').style.color = "red";
													document
															.getElementById('ccl_isactive_a').innerHTML = (t.ccl_isactive);
													document
															.getElementById('ccl_isactive_a').style.color = "red";

												} else {
													bef1 = (o.data)[0].ccl_from;
													aft1 = (o.data)[1].ccl_from;
													bef2 = (o.data)[0].ccl_to;
													aft2 = (o.data)[1].ccl_to;
													bef3 = (o.data)[0].ccl_charge;
													aft3 = (o.data)[1].ccl_charge;
													bef4 = (o.data)[0].ccl_level;
													aft4 = (o.data)[1].ccl_level;
													bef5 = (o.data)[0].ccl_isactive;
													aft5 = (o.data)[1].ccl_isactive;

													if (bef1 !== aft1) {
														document
																.getElementById('ccl_from').innerHTML = bef1;
														document
																.getElementById('ccl_from').style.color = "red";
														document
																.getElementById('ccl_from_a').innerHTML = aft1;
														document
																.getElementById('ccl_from_a').style.color = "red";
													} else {
														document
																.getElementById('ccl_from').innerHTML = bef1;
														document
																.getElementById('ccl_from_a').innerHTML = aft1;
													}
													if (bef2 !== aft2) {
														document
																.getElementById('ccl_to').innerHTML = bef2;
														document
																.getElementById('ccl_to').style.color = "red";
														document
																.getElementById('ccl_to_a').innerHTML = aft2;
														document
																.getElementById('ccl_to_a').style.color = "red";
													} else {
														document
																.getElementById('ccl_to').innerHTML = bef2;
														document
																.getElementById('ccl_to_a').innerHTML = aft2;
													}
													if (bef3 !== aft3) {
														document
																.getElementById('ccl_charge').innerHTML = bef3;
														document
																.getElementById('ccl_charge').style.color = "red";
														document
																.getElementById('ccl_charge_a').innerHTML = aft3;
														document
																.getElementById('ccl_charge_a').style.color = "red";
													} else {
														document
																.getElementById('ccl_charge').innerHTML = bef3;
														document
																.getElementById('ccl_charge_a').innerHTML = aft3;
													}
													if (bef4 !== aft4) {
														document
																.getElementById('ccl_level').innerHTML = bef4;
														document
																.getElementById('ccl_level').style.color = "red";
														document
																.getElementById('ccl_level_a').innerHTML = aft4;
														document
																.getElementById('ccl_level_a').style.color = "red";

													} else {
														document
																.getElementById('ccl_level').innerHTML = bef4;
														document
																.getElementById('ccl_level_a').innerHTML = aft4;
													}
													if (bef5 !== aft5) {
														document
																.getElementById('ccl_isactive').innerHTML = bef5;
														document
																.getElementById('ccl_isactive').style.color = "red";
														document
																.getElementById('ccl_isactive_a').innerHTML = aft5;
														document
																.getElementById('ccl_isactive_a').style.color = "red";
													} else {
														document
																.getElementById('ccl_isactive').innerHTML = bef5;
														document
																.getElementById('ccl_isactive_a').innerHTML = aft5;
													}
												}
											});
						});

	}

	function getDataViewRuleset(id, code) {
		$
				.get(
						"${local_server}/AuditTrail/view_detail/" + id + '/'
								+ code,
						function(data) {
							var o = JSON.parse(data);
							console.log(o)
							var bft = ""
							var aft = ""

							$("#msg").html("");
							$('#tableviewRuleset').removeClass("hidden");
							$('#tableviewRuleset').DataTable().destroy();
							$(".before").empty();
							$(".before").removeAttr("style");
							$(".after").empty();
							$(".after").removeAttr("style");
							//$.each(o.data[0].detail[0], function (data, t) {
							var model = (o.data[0].detail[0].lrus_action);

							if (model == "INSERT") {

								document.getElementById('lrus_name_a').innerHTML = (o.data[0].detail[0].lrus_name);
								document.getElementById('lrus_name_a').style.color = "red";
								document.getElementById('lrus_desc_a').innerHTML = (o.data[0].detail[0].lrus_desc);
								document.getElementById('lrus_desc_a').style.color = "red";

								if (o.data[0].ruleset_component.length > 0) {
									var htm = '';
									htm += '<table>';
									htm += '<td>Rule Type</td><td>Rule Name</td>';
									for (i = 0; i < o.data[0].ruleset_component.length; i++) {
										htm += '<tr>';
										htm += '<td><label id="lrsc_type_'+i+'_a">'
												+ o.data[0].ruleset_component[i].lrsc_type
												+ '</label></td>';
										document.getElementById('lrsc_type_'
												+ i + '_a').style.color = "red";
										htm += '<td><label id="lrsc_comp_name_'+i+'_a">'
												+ o.data[0].ruleset_component[i].lrsc_comp_name
												+ '</label></td>';
										document
												.getElementById('lrsc_comp_name_'
														+ i + '_a').style.color = "red";
										htm += '</tr>';
									}
									htm += '</table>';
									document.getElementById('lrus_comp_a').innerHTML = htm;
								}

								if (o.data[0].ruleset_output.length > 0) {
									var htm = '';
									htm += '<table>';
									htm += '<td>JSON Key</td><td>JSON Output</td>';
									for (i = 0; i < o.data[0].ruleset_output.length; i++) {
										htm += '<tr>';
										htm += '<td><label id="lrso_value_'+i+'_a">'
												+ o.data[0].ruleset_output[i].lrso_value
												+ '</label></td>';
										document.getElementById('lrso_value_'
												+ i + '_a').style.color = "red";
										htm += '<td><label id="lrso_output_'+i+'_a">'
												+ o.data[0].ruleset_output[i].lrso_output
												+ '</label></td>';
										document.getElementById('lrso_output_'
												+ i + '_a').style.color = "red";
										htm += '</tr>';
									}
									htm += '</table>';
									document.getElementById('rlso_after').innerHTML = htm;
								}

								if (o.data[0].ruleset_validation.length > 0) {
									var htm = '';
									htm += '<table>';
									htm += '<td>Rule ID</td><td>Priority</td><td>Message</td>';
									for (i = 0; i < o.data[0].ruleset_validation.length; i++) {
										htm += '<tr>';
										htm += '<td><label id="lrsv_rul_name_'+i+'_a">'
												+ o.data[0].ruleset_validation[i].lrsv_rul_name
												+ '</label></td>';
										document
												.getElementById('lrsv_rul_name_'
														+ i + '_a').style.color = "red";
										htm += '<td><label id="lrsv_counter_'+i+'_a">'
												+ o.data[0].ruleset_validation[i].lrsv_counter
												+ '</label></td>';
										document.getElementById('lrsv_counter_'
												+ i + '_a').style.color = "red";
										htm += '<td><label id="lrsv_message_'+i+'_a">'
												+ o.data[0].ruleset_validation[i].lrsv_message
												+ '</label></td>';
										document.getElementById('lrsv_message_'
												+ i + '_a').style.color = "red";
										htm += '</tr>';
									}
									htm += '</table>';
									document.getElementById('rlsv_after').innerHTML = htm;
								}

							} else if (model == "DELETE") {

								document.getElementById('lrus_name').innerHTML = (o.data[0].detail[0].lrus_name);
								document.getElementById('lrus_name').style.color = "red";
								document.getElementById('lrus_desc').innerHTML = (o.data[0].detail[0].lrus_desc);
								document.getElementById('lrus_desc').style.color = "red";

								if (o.data[0].ruleset_component.length > 0) {
									var htm = '';
									htm += '<table>';
									htm += '<td>Tipe Aturan</td><td>Nama Aturan</td>';
									for (i = 0; i < o.data[0].ruleset_component.length; i++) {
										htm += '<tr>';
										htm += '<td><label id="lrsc_type_'+i+'">'
												+ o.data[0].ruleset_component[i].lrsc_type
												+ '</label></td>';
										document.getElementById('lrsc_type_'
												+ i).style.color = "red";
										htm += '<td><label id="lrsc_comp_name_'+i+'">'
												+ o.data[0].ruleset_component[i].lrsc_comp_name
												+ '</label></td>';
										document
												.getElementById('lrsc_comp_name_'
														+ i).style.color = "red";
										htm += '</tr>';
									}
									htm += '</table>';
									document.getElementById('lrus_comp').innerHTML = htm;
								}

								if (o.data[0].ruleset_output.length > 0) {
									var htm = '';
									htm += '<table>';
									htm += '<td>JSON Key</td><td>JSON Output</td>';
									for (i = 0; i < o.data[0].ruleset_output.length; i++) {
										htm += '<tr>';
										htm += '<td><label id="lrso_value_'+i+'">'
												+ o.data[0].ruleset_output[i].lrso_value
												+ '</label></td>';
										document.getElementById('lrso_value_'
												+ i).style.color = "red";
										htm += '<td><label id="lrso_output_'+i+'">'
												+ o.data[0].ruleset_output[i].lrso_output
												+ '</label></td>';
										document.getElementById('lrso_output_'
												+ i).style.color = "red";
										htm += '</tr>';
									}
									htm += '</table>';
									document.getElementById('rlso_before').innerHTML = htm;
								}

								if (o.data[0].ruleset_validation.length > 0) {
									var htm = '';
									htm += '<table>';
									htm += '<td>ID Aturan</td><td>Prioritas</td><td>Pesan</td>';
									for (i = 0; i < o.data[0].ruleset_validation.length; i++) {
										htm += '<tr>';
										htm += '<td><label id="lrsv_rul_name_'+i+'">'
												+ o.data[0].ruleset_validation[i].lrsv_rul_name
												+ '</label></td>';
										document
												.getElementById('lrsv_rul_name_'
														+ i).style.color = "red";
										htm += '<td><label id="lrsv_counter_'+i+'">'
												+ o.data[0].ruleset_validation[i].lrsv_counter
												+ '</label></td>';
										document.getElementById('lrsv_counter_'
												+ i).style.color = "red";
										htm += '<td><label id="lrsv_message_'+i+'">'
												+ o.data[0].ruleset_validation[i].lrsv_message
												+ '</label></td>';
										document.getElementById('lrsv_message_'
												+ i).style.color = "red";
										htm += '</tr>';
									}
									htm += '</table>';
									document.getElementById('rlsv_before').innerHTML = htm;
								}

							}

							if (model != "INSERT" && model != "DELETE") {
								document.getElementById('lrus_name').innerHTML = (o.data[0].detail[0].lrus_name);
								document.getElementById('lrus_name_a').innerHTML = (o.data[0].detail[1].lrus_name);
								if (o.data[0].detail[0].lrus_name != o.data[0].detail[1].lrus_name) {
									document.getElementById('lrus_name_a').style.color = "red";
								}
								document.getElementById('lrus_desc').innerHTML = (o.data[0].detail[0].lrus_desc);
								document.getElementById('lrus_desc_a').innerHTML = (o.data[0].detail[1].lrus_desc);
								if (o.data[0].detail[0].lrus_desc != o.data[0].detail[1].lrus_desc) {
									document.getElementById('lrus_desc_a').style.color = "red";
								}

								if (o.data[0].ruleset_component.length > 0) {
									var htm = '';
									var htm2 = '';
									htm += '<table>';
									htm2 += '<table>';
									htm += '<td>Tipe Aturan</td><td>Nama Aturan</td>';
									htm2 += '<td>Tipe Aturan</td><td>Nama Aturan</td>';
									for (i = 0; i < o.data[0].ruleset_component.length; i++) {
										if (o.data[0].ruleset_component[i].lrsc_action == 'Before') {
											htm += '<tr>';
											htm += '<td><label id="lrsc_type_'+i+'">'
													+ o.data[0].ruleset_component[i].lrsc_type
													+ '</label></td>';
											//document.getElementById('lrsc_type_'+i).style.color="red";
											htm += '<td><label id="lrsc_comp_name_'+i+'">'
													+ o.data[0].ruleset_component[i].lrsc_comp_name
													+ '</label></td>';
											//document.getElementById('lrsc_comp_name_'+i).style.color="red";
											htm += '</tr>';
										}
										if (o.data[0].ruleset_component[i].lrsc_action == 'After') {
											htm2 += '<tr>';
											htm2 += '<td><label id="lrsc_type_'+i+'_a">'
													+ o.data[0].ruleset_component[i].lrsc_type
													+ '</label></td>';
											//document.getElementById('lrsc_type_'+i+'_a').style.color="red";
											htm2 += '<td><label id="lrsc_comp_name_'+i+'_a">'
													+ o.data[0].ruleset_component[i].lrsc_comp_name
													+ '</label></td>';
											//document.getElementById('lrsc_comp_name_'+i+'_a').style.color="red";
											htm2 += '</tr>';
										}
									}
									htm += '</table>';
									htm2 += '</table>';
									document.getElementById('lrus_comp').innerHTML = htm;
									document.getElementById('lrus_comp_a').innerHTML = htm2;
								}

								if (o.data[0].ruleset_output.length > 0) {
									var htm = '';
									var htm2 = '';
									htm += '<table>';
									htm2 += '<table>';
									htm += '<td>JSON Key</td><td>JSON Output</td>';
									htm2 += '<td>JSON Key</td><td>JSON Output</td>';
									for (i = 0; i < o.data[0].ruleset_output.length; i++) {
										if (o.data[0].ruleset_output[i].lrso_action == 'Before') {
											htm += '<tr>';
											htm += '<td><label id="lrso_value_'+i+'">'
													+ o.data[0].ruleset_output[i].lrso_value
													+ '</label></td>';
											//document.getElementById('lrso_value_'+i).style.color="red";
											htm += '<td><label id="lrso_output_'+i+'">'
													+ o.data[0].ruleset_output[i].lrso_output
													+ '</label></td>';
											//document.getElementById('lrso_output_'+i).style.color="red";
											htm += '</tr>';
										}
										if (o.data[0].ruleset_output[i].lrso_action == 'After') {
											htm2 += '<tr>';
											htm2 += '<td><label id="lrso_value_'+i+'_a">'
													+ o.data[0].ruleset_output[i].lrso_value
													+ '</label></td>';
											//document.getElementById('lrso_value_'+i+'_a').style.color="red";
											htm2 += '<td><label id="lrso_output_'+i+'_a">'
													+ o.data[0].ruleset_output[i].lrso_output
													+ '</label></td>';
											//document.getElementById('lrso_output_'+i+'_a').style.color="red";
											htm2 += '</tr>';
										}
									}
									htm += '</table>';
									htm2 += '</table>';
									document.getElementById('rlso_before').innerHTML = htm;
									document.getElementById('rlso_after').innerHTML = htm2;
								}

								if (o.data[0].ruleset_validation.length > 0) {
									var htm = '';
									var htm2 = '';
									htm += '<table>';
									htm2 += '<table>';
									htm += '<td>ID Aturan</td><td>Prioritas</td><td>Pesan</td>';
									htm2 += '<td>ID Aturan</td><td>Prioritas</td><td>Pesan</td>';
									for (i = 0; i < o.data[0].ruleset_validation.length; i++) {
										if (o.data[0].ruleset_validation[i].lrsv_action == 'Before') {
											htm += '<tr>';
											htm += '<td><label id="lrsv_rul_name_'+i+'">'
													+ o.data[0].ruleset_validation[i].lrsv_rul_name
													+ '</label></td>';
											//document.getElementById('lrsv_rul_name_'+i).style.color="red";
											htm += '<td><label id="lrsv_counter_'+i+'">'
													+ o.data[0].ruleset_validation[i].lrsv_counter
													+ '</label></td>';
											//document.getElementById('lrsv_counter_'+i).style.color="red";								
											htm += '<td><label id="lrsv_message_'+i+'">'
													+ o.data[0].ruleset_validation[i].lrsv_message
													+ '</label></td>';
											//document.getElementById('lrsv_message_'+i).style.color="red";
											htm += '</tr>';
										}
										if (o.data[0].ruleset_validation[i].lrsv_action == 'After') {
											htm2 += '<tr>';
											htm2 += '<td><label id="lrsv_rul_name_'+i+'_a">'
													+ o.data[0].ruleset_validation[i].lrsv_rul_name
													+ '</label></td>';
											//document.getElementById('lrsv_rul_name_'+i+'_a').style.color="red";
											htm2 += '<td><label id="lrsv_counter_'+i+'_a">'
													+ o.data[0].ruleset_validation[i].lrsv_counter
													+ '</label></td>';
											//document.getElementById('lrsv_counter_'+i+'_a').style.color="red";								
											htm2 += '<td><label id="lrsv_message_'+i+'_a">'
													+ o.data[0].ruleset_validation[i].lrsv_message
													+ '</label></td>';
											//document.getElementById('lrsv_message_'+i+'_a').style.color="red";
											htm2 += '</tr>';
										}
									}
									htm += '</table>';
									htm2 += '</table>';
									document.getElementById('rlsv_before').innerHTML = htm;
									document.getElementById('rlsv_after').innerHTML = htm2;
								}
							}
							//}); 
						});

	}

	function getDataViewCustParam(id, code) {
		$
				.get(
						"${local_server}/AuditTrail/view_detail/" + id + '/'
								+ code,
						function(data) {
							var t = JSON.parse(data);
							console.log(t)
							var bft = ""
							var aft = ""

							$("#msg").html("");
							$('#tableviewcustparam').removeClass("hidden");
							$('#tableviewcustparam').DataTable().destroy();
							$(".before").empty();
							$(".before").removeAttr("style");
							$(".after").empty();
							$(".after").removeAttr("style");

							var model = (t.data)[0].ddl_action;

							if (model == "Insert") {
								$
										.each(
												t.data,
												function(data, t) {
													document
															.getElementById('ddp_value_a').innerHTML = t.ddp_value;
													document
															.getElementById('ddp_value_a').style.color = "red";
													document
															.getElementById('ddp_name_a').innerHTML = t.ddp_name;
													document
															.getElementById('ddp_name_a').style.color = "red";
													document
															.getElementById('urut_a').innerHTML = t.urut;
													document
															.getElementById('urut_a').style.color = "red";
													document
															.getElementById('ddp_isused_a').innerHTML = t.ddp_isused;
													document
															.getElementById('ddp_isused_a').style.color = "red";
												});
							} else {
								document.getElementById('ddp_value').innerHTML = (t.data)[0].ddp_value;
								document.getElementById('ddp_value_a').innerHTML = (t.data)[1].ddp_value;

								var bef1 = (t.data)[0].ddp_name;
								var aft1 = (t.data)[1].ddp_name;
								var bef2 = (t.data)[0].urut;
								var aft2 = (t.data)[1].urut;
								var bef3 = (t.data)[0].ddp_isused;
								var aft3 = (t.data)[1].ddp_isused;

								if (bef1 != aft1) {
									document.getElementById('ddp_name').style.color = "red";
									document.getElementById('ddp_name_a').style.color = "red";
								}

								if (bef2 != aft2) {
									document.getElementById('urut').style.color = "red";
									document.getElementById('urut_a').style.color = "red";
								}

								if (bef3 != aft3) {
									document.getElementById('ddp_isused').style.color = "red";
									document.getElementById('ddp_isused_a').style.color = "red";
								}

								document.getElementById('ddp_name').innerHTML = (t.data)[0].ddp_name;
								document.getElementById('ddp_name_a').innerHTML = (t.data)[1].ddp_name;
								document.getElementById('urut').innerHTML = (t.data)[0].urut;
								document.getElementById('urut_a').innerHTML = (t.data)[1].urut;
								document.getElementById('ddp_isused').innerHTML = (t.data)[0].ddp_isused;
								document.getElementById('ddp_isused_a').innerHTML = (t.data)[1].ddp_isused;
							}
						});
	}

	function getDataViewRuleParam(id, code) {
		$
				.get(
						"${local_server}/AuditTrail/view_detail/" + id + '/'
								+ code,
						function(data) {
							var t = JSON.parse(data);
							console.log(t)
							var bft = ""
							var aft = ""

							$("#msg").html("");
							$('#tableviewRuleParam').removeClass("hidden");
							$('#tableviewRuleParam').DataTable().destroy();
							$(".before").empty();
							$(".before").removeAttr("style");
							$(".after").empty();
							$(".after").removeAttr("style");

							var model = (t.data)[0].ddl_action;

							if (model == "Insert") {
								$
										.each(
												t.data,
												function(data, t) {
													document
															.getElementById('ruleparam_ddp_value_a').innerHTML = t.ddp_value;
													document
															.getElementById('ruleparam_ddp_value_a').style.color = "red";
													document
															.getElementById('ruleparam_ddp_name_a').innerHTML = t.ddp_name;
													document
															.getElementById('ruleparam_ddp_name_a').style.color = "red";
													document
															.getElementById('ruleparam_urut_a').innerHTML = t.urut;
													document
															.getElementById('ruleparam_urut_a').style.color = "red";
													document
															.getElementById('ruleparam_ddp_isused_a').innerHTML = t.ddp_isused;
													document
															.getElementById('ruleparam_ddp_isused_a').style.color = "red";
												});
							} else {
								document.getElementById('ruleparam_ddp_value').innerHTML = (t.data)[0].ddp_value;
								document
										.getElementById('ruleparam_ddp_value_a').innerHTML = (t.data)[1].ddp_value;

								var bef1 = (t.data)[0].ddp_name;
								var aft1 = (t.data)[1].ddp_name;
								var bef2 = (t.data)[0].urut;
								var aft2 = (t.data)[1].urut;
								var bef3 = (t.data)[0].ddp_isused;
								var aft3 = (t.data)[1].ddp_isused;

								if (bef1 != aft1) {
									document
											.getElementById('ruleparam_ddp_name').style.color = "red";
									document
											.getElementById('ruleparam_ddp_name_a').style.color = "red";
								}

								if (bef2 != aft2) {
									document.getElementById('ruleparam_urut').style.color = "red";
									document.getElementById('ruleparam_urut_a').style.color = "red";
								}

								if (bef3 != aft3) {
									document
											.getElementById('ruleparam_ddp_isused').style.color = "red";
									document
											.getElementById('ruleparam_ddp_isused_a').style.color = "red";
								}

								document.getElementById('ruleparam_ddp_name').innerHTML = (t.data)[0].ddp_name;
								document.getElementById('ruleparam_ddp_name_a').innerHTML = (t.data)[1].ddp_name;
								document.getElementById('ruleparam_urut').innerHTML = (t.data)[0].urut;
								document.getElementById('ruleparam_urut_a').innerHTML = (t.data)[1].urut;
								document.getElementById('ruleparam_ddp_isused').innerHTML = (t.data)[0].ddp_isused;
								document
										.getElementById('ruleparam_ddp_isused_a').innerHTML = (t.data)[1].ddp_isused;
							}
						});
	}

	function getDataViewCoverage(id, code) {
		$
				.get(
						"${local_server}/AuditTrail/view_detail/" + id + '/'
								+ code,
						function(data) {
							var t = JSON.parse(data);
							console.log(t)
							var bft = ""
							var aft = ""

							$("#msg").html("");
							$('#tableviewCoverage').removeClass("hidden");
							$('#tableviewCoverage').DataTable().destroy();
							$(".before").empty();
							$(".before").removeAttr("style");
							$(".after").empty();
							$(".after").removeAttr("style");
							var model = (t.data)[0].p_lcuc_action;
							//$.each(t.data, function (data, t) {
							//var model = (t['p_lcuc_action']);

							if (model == "INSERT") {
								$
										.each(
												t.data,
												function(data, t) {
													document
															.getElementById('province_a').innerHTML = (t.p_lcuc_province);
													document
															.getElementById('province_a').style.color = "red";
													document
															.getElementById('kota_a').innerHTML = (t.p_lcuc_kota);
													document
															.getElementById('kota_a').style.color = "red";
													document
															.getElementById('kecamatan_a').innerHTML = (t.p_lcuc_kecamatan);
													document
															.getElementById('kecamatan_a').style.color = "red";
													document
															.getElementById('customer_a').innerHTML = (t.p_lcuc_ok);
													document
															.getElementById('customer_a').style.color = "red";
													document
															.getElementById('customer_usaha_a').innerHTML = (t.p_lcuc_ok_usaha);
													document
															.getElementById('customer_usaha_a').style.color = "red";
												});

							} else if (model == "DELETE") {
								$
										.each(
												t.data,
												function(data, t) {
													document
															.getElementById('province').innerHTML = (t.p_lcuc_province);
													document
															.getElementById('province').style.color = "red";
													document
															.getElementById('kota').innerHTML = (t.p_lcuc_kota);
													document
															.getElementById('kota').style.color = "red";
													document
															.getElementById('kecamatan').innerHTML = (t.p_lcuc_kecamatan);
													document
															.getElementById('kecamatan').style.color = "red";
													document
															.getElementById('customer').innerHTML = (t.p_lcuc_ok);
													document
															.getElementById('customer').style.color = "red";
													document
															.getElementById('customer_usaha').innerHTML = (t.p_lcuc_ok_usaha);
													document
															.getElementById('customer_usaha').style.color = "red";
												});
							} else {
								bef1 = (t.data[0]).p_lcuc_province;
								aft1 = (t.data[1]).p_lcuc_province;
								bef2 = (t.data[0]).p_lcuc_kota;
								aft2 = (t.data[1]).p_lcuc_kota;
								bef3 = (t.data[0]).p_lcuc_kecamatan;
								aft3 = (t.data[1]).p_lcuc_kecamatan;
								bef4 = (t.data[0]).p_lcuc_ok;
								aft4 = (t.data[1]).p_lcuc_ok;
								bef5 = (t.data[0]).p_lcuc_ok_usaha;
								aft5 = (t.data[1]).p_lcuc_ok_usaha;

								if (bef1 !== aft1) {
									document.getElementById('province').innerHTML = bef1;
									document.getElementById('province').style.color = "red";
									document.getElementById('province_a').innerHTML = aft1;
									document.getElementById('province_a').style.color = "red";
								} else {
									document.getElementById('province').innerHTML = bef1;
									document.getElementById('province_a').innerHTML = aft1;
								}
								if (bef2 !== aft2) {
									document.getElementById('kota').innerHTML = bef2;
									document.getElementById('kota').style.color = "red";
									document.getElementById('kota_a').innerHTML = aft2;
									document.getElementById('kota_a').style.color = "red";
								} else {
									document.getElementById('kota').innerHTML = bef2;
									document.getElementById('kota_a').innerHTML = aft2;
								}
								if (bef3 !== aft3) {
									document.getElementById('kecamatan').innerHTML = bef3;
									document.getElementById('kecamatan').style.color = "red";
									document.getElementById('kecamatan_a').innerHTML = aft3;
									document.getElementById('kecamatan_a').style.color = "red";
								} else {
									document.getElementById('kecamatan').innerHTML = bef3;
									document.getElementById('kecamatan_a').innerHTML = aft3;
								}
								if (bef4 !== aft4) {
									document.getElementById('customer').innerHTML = bef4;
									document.getElementById('customer').style.color = "red";
									document.getElementById('customer_a').innerHTML = aft4;
									document.getElementById('customer_a').style.color = "red";

								} else {
									document.getElementById('customer').innerHTML = bef4;
									document.getElementById('customer_a').innerHTML = aft4;
								}
								if (bef5 !== aft5) {
									document.getElementById('customer_usaha').innerHTML = bef5;
									document.getElementById('customer_usaha').style.color = "red";
									document.getElementById('customer_usaha_a').innerHTML = aft5;
									document.getElementById('customer_usaha_a').style.color = "red";
								} else {
									document.getElementById('customer_usaha').innerHTML = bef5;
									document.getElementById('customer_usaha_a').innerHTML = aft5;
								}

							}
							//}); 
						});

	}

	function getDataViewPriorityPayment(id, code) {
		$
				.get(
						"${local_server}/AuditTrail/view_detail/" + id + '/'
								+ code,
						function(data) {
							var t = JSON.parse(data);
							console.log(t)
							var bft = ""
							var aft = ""

							$("#msg").html("");
							$('#tableviewprioritypayment')
									.removeClass("hidden");
							$('#tableviewprioritypayment').DataTable()
									.destroy();
							$(".before").empty();
							$(".before").removeAttr("style");
							$(".after").empty();
							$(".after").removeAttr("style");
							var model = (t.data)[0].ppl_action;
							//$.each(t.data, function (data, t) {
							//var model = (t['ppl_action']);

							if (model == "Insert") {
								$
										.each(
												t.data,
												function(data, t) {
													document
															.getElementById('payment_code_a').innerHTML = (t.pyp_code);
													document
															.getElementById('payment_code_a').style.color = "red";
													document
															.getElementById('payment_priority_a').innerHTML = (t.pyp_priority);
													document
															.getElementById('payment_priority_a').style.color = "red";
													//document.getElementById('payment_category_a').innerHTML = (t.pyp_category); 
													//document.getElementById('payment_category_a').style.color="red";
													document
															.getElementById('payment_by_a').innerHTML = (t.ppl_by);
													document
															.getElementById('payment_by_a').style.color = "red";
												});

							} else if (model == "Delete") {
								$
										.each(
												t.data,
												function(data, t) {
													document
															.getElementById('payment_code').innerHTML = (t.pyp_code);
													document
															.getElementById('payment_code').style.color = "red";
													document
															.getElementById('payment_priority').innerHTML = (t.pyp_priority);
													document
															.getElementById('payment_priority').style.color = "red";
													//document.getElementById('payment_category').innerHTML = (t.pyp_category); 
													//document.getElementById('payment_category').style.color="red";
													document
															.getElementById('payment_by').innerHTML = (t.ppl_by);
													document
															.getElementById('payment_by').style.color = "red";
												});
							} else {
								console.log(t.data);
								bef1 = (t.data)[0].pyp_code;
								aft1 = (t.data)[1].pyp_code;
								bef2 = (t.data)[0].pyp_priority;
								aft2 = (t.data)[1].pyp_priority;
								//bef3 = (t.data)[0].pyp_category; 
								//aft3 = (t.data)[1].pyp_category; 
								bef4 = (t.data)[0].ppl_by;
								aft4 = (t.data)[1].ppl_by;

								if (bef1 !== aft1) {
									document.getElementById('payment_code').innerHTML = bef1;
									document.getElementById('payment_code').style.color = "red";
									document.getElementById('payment_code_a').innerHTML = aft1;
									document.getElementById('payment_code_a').style.color = "red";
								} else {
									document.getElementById('payment_code').innerHTML = bef1;
									document.getElementById('payment_code_a').innerHTML = aft1;
								}
								if (bef2 !== aft2) {
									document.getElementById('payment_priority').innerHTML = bef2;
									document.getElementById('payment_priority').style.color = "red";
									document
											.getElementById('payment_priority_a').innerHTML = aft2;
									document
											.getElementById('payment_priority_a').style.color = "red";
								} else {
									document.getElementById('payment_priority').innerHTML = bef2;
									document
											.getElementById('payment_priority_a').innerHTML = aft2;
								}
								/*if (bef3 !== aft3){
									document.getElementById('payment_category').innerHTML = bef3;
									document.getElementById('payment_category').style.color="red";
									document.getElementById('payment_category_a').innerHTML = aft3;
									document.getElementById('payment_category_a').style.color="red";
								}
								else
								{
									document.getElementById('payment_category').innerHTML = bef3;
									document.getElementById('payment_category_a').innerHTML = aft3;
								}*/
								if (bef4 !== aft4) {
									document.getElementById('payment_by').innerHTML = bef4;
									document.getElementById('payment_by').style.color = "red";
									document.getElementById('payment_by_a').innerHTML = aft4;
									document.getElementById('payment_by_a').style.color = "red";

								} else {
									document.getElementById('payment_by').innerHTML = bef4;
									document.getElementById('payment_by_a').innerHTML = aft4;
								}
							}
							//}); 
						});

	}

	/*
	 function getDataViewCustParam(id, code) {
	 $.get("${local_server}/AuditTrail/view_detail/" + id + '/' + code, function (data) {
	 var t = JSON.parse(data);
	 console.log(t)
	 var bft =""
	 var aft =""	
	
	 $("#msg").html("");
	 $('#tableviewcustparam').removeClass("hidden");
	 $('#tableviewcustparam').DataTable().destroy();
	 $(".before").empty();
	 $(".before").removeAttr("style");
	 $(".after").empty();
	 $(".after").removeAttr("style");
	 $.each(t.data, function (data, t) {
	 var model = (t['ppl_action']);
	
	 if (model == "Insert"){
	
	 document.getElementById('cust_cif_a').innerHTML = (t.p_cst_cif); 
	 document.getElementById('cust_cif_a').style.color="red";
	 document.getElementById('cust_spv_nik_a').innerHTML = (t.p_cst_spv_nik);
	 document.getElementById('cust_spv_nik_a').style.color="red";
	 document.getElementById('firs_name_a').innerHTML = (t.p_cst_fname);
	 document.getElementById('firs_name_a').style.color="red";
	 document.getElementById('last_name_a').innerHTML = (t.p_cst_lname);
	 document.getElementById('last_name_a').style.color="red";
	 document.getElementById('cust_nik_a').innerHTML = (t.p_cst_ktp); 
	 document.getElementById('cust_nik_a').style.color="red";
	 document.getElementById('tgl_lhir_a').innerHTML = (t.p_cst_dob);
	 document.getElementById('tgl_lhir_a').style.color="red";
	 document.getElementById('address_a').innerHTML = (t.p_cst_address);
	 document.getElementById('address_a').style.color="red";
	 document.getElementById('no_phone_a').innerHTML = (t.p_cst_phone);
	 document.getElementById('no_phone_a').style.color="red";
	 document.getElementById('email_a').innerHTML = (t.p_cst_email);
	 document.getElementById('email_a').style.color="red";
	 document.getElementById('education_a').innerHTML = (t.p_cst_education);
	 document.getElementById('education_a').style.color="red";
	 document.getElementById('gender_a').innerHTML = (t.p_cst_sex);
	 document.getElementById('gender_a').style.color="red";
	 document.getElementById('payment_by_a').innerHTML = (t.p_cst_marital_status); 
	 document.getElementById('payment_by_a').style.color="red";
	 document.getElementById('lvl_salery_a').innerHTML = (t.p_cst_salary_level);
	 document.getElementById('lvl_salery_a').style.color="red";
	 document.getElementById('work_a').innerHTML = (t.p_cst_length_of_work);
	 document.getElementById('work_a').style.color="red";
	 document.getElementById('mother_a').innerHTML = (t.p_cst_mother_meiden_name); 
	 document.getElementById('mother_a').style.color="red";
	 document.getElementById('address_ktp_a').innerHTML = (t.p_varyingcst_address_ktp); 
	 document.getElementById('address_ktp_a').style.color="red";	
	
	
	 } 
	 else if (model == "Delete"){
	
	 document.getElementById('cust_cif').innerHTML = (t.p_cst_cif); 
	 document.getElementById('cust_cif').style.color="red";
	 document.getElementById('cust_spv_nik').innerHTML = (t.p_cst_spv_nik);
	 document.getElementById('cust_spv_nik').style.color="red";
	 document.getElementById('firs_name').innerHTML = (t.p_cst_fname);
	 document.getElementById('firs_name').style.color="red";
	 document.getElementById('last_name').innerHTML = (t.p_cst_lname);
	 document.getElementById('last_name').style.color="red";
	 document.getElementById('cust_nik').innerHTML = (t.p_cst_ktp); 
	 document.getElementById('cust_nik').style.color="red";
	 document.getElementById('tgl_lhir').innerHTML = (t.p_cst_dob);
	 document.getElementById('tgl_lhir').style.color="red";
	 document.getElementById('address').innerHTML = (t.p_cst_address);
	 document.getElementById('address').style.color="red";
	 document.getElementById('no_phone').innerHTML = (t.p_cst_phone);
	 document.getElementById('no_phone').style.color="red";
	 document.getElementById('email').innerHTML = (t.p_cst_email);
	 document.getElementById('email').style.color="red";
	 document.getElementById('education').innerHTML = (t.p_cst_education);
	 document.getElementById('education').style.color="red";
	 document.getElementById('gender').innerHTML = (t.p_cst_sex);
	 document.getElementById('gender').style.color="red";
	 document.getElementById('payment_by').innerHTML = (t.p_cst_marital_status); 
	 document.getElementById('payment_by').style.color="red";
	 document.getElementById('lvl_salery').innerHTML = (t.p_cst_salary_level);
	 document.getElementById('lvl_salery').style.color="red";
	 document.getElementById('work').innerHTML = (t.p_cst_length_of_work);
	 document.getElementById('work').style.color="red";
	 document.getElementById('mother').innerHTML = (t.p_cst_mother_meiden_name); 
	 document.getElementById('mother').style.color="red";
	 document.getElementById('address_ktp').innerHTML = (t.p_varyingcst_address_ktp); 
	 document.getElementById('address_ktp').style.color="red";	
	
	 }
	 else
	 {
	 bef1 = (o.data[0].p_cst_cif); 
	 aft1 = (o.data[1].p_cst_cif); 
	 bef2 = (o.data[0].p_cst_spv_nik); 
	 aft2 = (o.data[1].p_cst_spv_nik); 
	 bef3 = (o.data[0].p_cst_fname); 
	 aft3 = (o.data[1].p_cst_fname); 
	 bef4 = (o.data[0].p_cst_lname); 
	 aft4 = (o.data[1].p_cst_lname); 
	 bef5 = (o.data[0].p_cst_ktp); 
	 aft5 = (o.data[1].p_cst_ktp); 
	 bef6 = (o.data[0].p_cst_dob); 
	 aft6 = (o.data[1].p_cst_dob); 
	 bef7 = (o.data[0].p_cst_address); 
	 aft7 = (o.data[1].p_cst_address); 
	 bef8 = (o.data[0].p_cst_phone); 
	 aft8 = (o.data[1].p_cst_phone); 
	 bef9 = (o.data[0].p_cst_email); 
	 aft9 = (o.data[1].p_cst_email); 
	 bef10 = (o.data[0].p_cst_education); 
	 aft10 = (o.data[1].p_cst_education); 
	 bef11 = (o.data[0].p_cst_sex); 
	 aft11 = (o.data[1].p_cst_sex); 
	 bef12 = (o.data[0].p_cst_marital_status); 
	 aft12 = (o.data[1].p_cst_marital_status); 
	 bef13 = (o.data[0].p_cst_salary_level); 
	 aft13 = (o.data[1].p_cst_salary_level); 
	 bef14 = (o.data[0].p_cst_length_of_work); 
	 aft14 = (o.data[1].p_cst_length_of_work); 
	 bef15 = (o.data[0].p_cst_mother_meiden_name); 
	 aft15 = (o.data[1].p_cst_mother_meiden_name); 
	 bef16 = (o.data[0].p_varyingcst_address_ktp); 
	 aft16 = (o.data[1].p_varyingcst_address_ktp); 
	 if (bef1 !== aft1){
	 document.getElementById('cust_cif').innerHTML = bef1;
	 document.getElementById('cust_cif').style.color="red";
	 document.getElementById('cust_cif_a').innerHTML = aft1;
	 document.getElementById('cust_cif_a').style.color="red";
	 }
	 else 
	 {
	 document.getElementById('cust_cif').innerHTML = bef1;
	 document.getElementById('cust_cif_a').innerHTML = aft1;
	 }
	 if (bef2 !== aft2){
	 document.getElementById('cust_spv_nik').innerHTML = bef2;
	 document.getElementById('cust_spv_nik').style.color="red";
	 document.getElementById('cust_spv_nik_a').innerHTML = aft2;
	 document.getElementById('cust_spv_nik_a').style.color="red";
	 }
	 else
	 {
	 document.getElementById('cust_spv_nik').innerHTML = bef2;
	 document.getElementById('cust_spv_nik_a').innerHTML = aft2;
	 }
	 if (bef3 !== aft3){
	 document.getElementById('firs_name').innerHTML = bef3;
	 document.getElementById('firs_name').style.color="red";
	 document.getElementById('firs_name_a').innerHTML = aft3;
	 document.getElementById('firs_name_a').style.color="red";
	 }
	 else
	 {
	 document.getElementById('firs_name').innerHTML = bef3;
	 document.getElementById('firs_name_a').innerHTML = aft3;
	 }
	 if (bef4 !== aft4){
	 document.getElementById('last_name').innerHTML = bef4;
	 document.getElementById('last_name').style.color="red";
	 document.getElementById('last_name_a').innerHTML = aft4;
	 document.getElementById('last_name_a').style.color="red";
	
	 }
	 else
	 {
	 document.getElementById('last_name').innerHTML = bef4;
	 document.getElementById('last_name_a').innerHTML = aft4;
	 }
	 if (bef5 !== aft5){
	 document.getElementById('cust_nik').innerHTML = bef5;
	 document.getElementById('cust_nik').style.color="red";
	 document.getElementById('cust_nik_a').innerHTML = aft5;
	 document.getElementById('cust_nik_a').style.color="red";
	 }
	 else
	 {
	 document.getElementById('cust_nik').innerHTML = bef5;
	 document.getElementById('cust_nik_a').innerHTML = aft5;
	 }
	 if (bef6 !== aft6){
	 document.getElementById('tgl_lhir').innerHTML = bef6;
	 document.getElementById('tgl_lhir').style.color="red";
	 document.getElementById('tgl_lhir_a').innerHTML = aft6;
	 document.getElementById('tgl_lhir_a').style.color="red";
	 }
	 else
	 {
	 document.getElementById('tgl_lhir').innerHTML = bef6;
	 document.getElementById('tgl_lhir_a').innerHTML = aft6;
	 }
	 if (bef7 !== aft7){
	 document.getElementById('address').innerHTML = bef7;
	 document.getElementById('address').style.color="red";
	 document.getElementById('address_a').innerHTML = aft7;
	 document.getElementById('address_a').style.color="red";
	 }
	 else
	 {
	 document.getElementById('address').innerHTML = bef7;
	 document.getElementById('address_a').innerHTML = aft7;
	 }
	 if (bef8 !== aft8){
	 document.getElementById('no_phone').innerHTML = bef8;
	 document.getElementById('no_phone').style.color="red";
	 document.getElementById('no_phone_a').innerHTML = aft8;
	 document.getElementById('no_phone_a').style.color="red";
	 }
	 else
	 {
	 document.getElementById('no_phone').innerHTML = bef8;
	 document.getElementById('no_phone_a').innerHTML = aft8;
	 }
	 if (bef9 !== aft9){
	 document.getElementById('email').innerHTML = bef9;
	 document.getElementById('email').style.color="red";
	 document.getElementById('email_a').innerHTML = aft9;
	 document.getElementById('email_a').style.color="red";
	 }
	 else
	 {
	 document.getElementById('email').innerHTML = bef9;
	 document.getElementById('email_a').innerHTML = aft9;
	 }
	 if (bef10 !== aft10){
	 document.getElementById('education').innerHTML = bef10;
	 document.getElementById('education').style.color="red";
	 document.getElementById('education_a').innerHTML = aft10;
	 document.getElementById('education_a').style.color="red";
	 }
	 else
	 {
	 document.getElementById('education').innerHTML = bef10;
	 document.getElementById('education_a').innerHTML = aft10;
	 }
	 if (bef11 !== aft11){
	 document.getElementById('gender').innerHTML = bef11;
	 document.getElementById('gender').style.color="red";
	 document.getElementById('gender_a').innerHTML = aft11;
	 document.getElementById('gender_a').style.color="red";
	 }
	 else
	 {
	 document.getElementById('gender').innerHTML = bef11;
	 document.getElementById('gender_a').innerHTML = aft11;
	 }
	 if (bef12 !== aft12){
	 document.getElementById('payment_by').innerHTML = bef12;
	 document.getElementById('payment_by').style.color="red";
	 document.getElementById('payment_by_a').innerHTML = aft12;
	 document.getElementById('payment_by_a').style.color="red";
	 }
	 else
	 {
	 document.getElementById('payment_by').innerHTML = bef12;
	 document.getElementById('payment_by_a').innerHTML = aft12;
	 }
	 if (bef13 !== aft13){
	 document.getElementById('lvl_salery').innerHTML = bef13;
	 document.getElementById('lvl_salery').style.color="red";
	 document.getElementById('lvl_salery_a').innerHTML = aft13;
	 document.getElementById('lvl_salery_a').style.color="red";
	 }
	 else
	 {
	 document.getElementById('lvl_salery').innerHTML = bef13;
	 document.getElementById('lvl_salery_a').innerHTML = aft13;
	 }
	 if (bef14 !== aft14){
	 document.getElementById('work').innerHTML = bef14;
	 document.getElementById('work').style.color="red";
	 document.getElementById('work_a').innerHTML = aft14;
	 document.getElementById('work_a').style.color="red";
	 }
	 else
	 {
	 document.getElementById('work').innerHTML = bef14;
	 document.getElementById('work_a').innerHTML = aft14;
	 }
	 if (bef15 !== aft15){
	 document.getElementById('mother').innerHTML = bef15;
	 document.getElementById('mother').style.color="red";
	 document.getElementById('mother_a').innerHTML = aft15;
	 document.getElementById('mother_a').style.color="red";
	 }
	 else
	 {
	 document.getElementById('mother').innerHTML = bef15;
	 document.getElementById('mother_a').innerHTML = aft15;
	 }
	 if (bef16 !== aft16){
	 document.getElementById('address_ktp').innerHTML = bef16;
	 document.getElementById('address_ktp').style.color="red";
	 document.getElementById('address_ktp_a').innerHTML = aft16;
	 document.getElementById('address_ktp_a').style.color="red";
	 }
	 else
	 {
	 document.getElementById('address_ktp').innerHTML = bef16;
	 document.getElementById('address_ktp_a').innerHTML = aft16;
	 }
	
	 }
	 }); 
	 }); 
	
	 }
	 */

	function resetAllTable() {
		$("#msg").html("");
		$("#downloadExcel").empty();
		$('#tableview').addClass("hidden");
		$('#tableview').DataTable().destroy();
		$('#tableviewua').addClass("hidden");
		$('#tableviewua').DataTable().destroy();
		$('#tableviewbranch').addClass("hidden");
		$('#tableviewbranch').DataTable().destroy();
		$('#tableviewRule').addClass("hidden");
		$('#tableviewRule').DataTable().destroy();
		$('#tableviewRuleset').addClass("hidden");
		$('#tableviewRuleset').DataTable().destroy();
		$('#tableviewCoverage').addClass("hidden");
		$('#tableviewCoverage').DataTable().destroy();
		$('#tableviewprioritypayment').addClass("hidden");
		$('#tableviewprioritypayment').DataTable().destroy();
		$('#tableviewcustparam').addClass("hidden");
		$('#tableviewcustparam').DataTable().destroy();
		$('#tableviewMasterData').addClass("hidden");
		$('#tableviewMasterData').DataTable().destroy();
		$('#tableviewRuleParam').addClass("hidden");
		$('#tableviewRuleParam').DataTable().destroy();
		$('#tableviewTenantGroup').addClass("hidden");
		$('#tableviewTenantGroup').DataTable().destroy();
		$('#tableviewTenantDetail').addClass("hidden");
		$('#tableviewTenantDetail').DataTable().destroy();
		$('#tableviewCollectionCharge').addClass("hidden");
		$('#tableviewCollectionCharge').DataTable().destroy();
		$('#tableviewProductInfo').addClass("hidden");
		$('#tableviewProductInfo').DataTable().destroy();
	}

	function getDDLUser() {
		$
				.get(
						"${local_server}/AuditTrail/list_user",
						function(data) {
							var x = JSON.parse(data);
							console.log(x);
							var t = "";
									t += '<optgroup label="User Name><option value="0">-Select All-</option>',
									t += '</optgroup>'
							t = "<option value='0'>--Select All--</option>";
							$.each(x.data, function(i, o) {
								var sl = (o.p_userid == "") ? "selected" : "";

								t += "<option value='"+o.p_userid+"' >"
										+ o.p_username + "</option>";
							});
							$("#p_user").empty().append(t).selectpicker(
									"refresh");
						})

	};

	function getDDLModul() {
		$
				.get(
						"${local_server}/AuditTrail/list_modul",
						function(data) {
							var x = JSON.parse(data);
							console.log(x);
							var t = "";
									t += '<optgroup label="User Modul><option value="0">Select All</option>',
									t += '</optgroup>'
							t = "";
							//t = "<option value='0'>--Select All--</option>";	
							$.each(x.data, function(i, o) {
								var sl = (o.lgc_val == "") ? "selected" : "";

								t += "<option value='"+o.lgc_val+"' >"
										+ o.lgc_name + "</option>";
							});
							$("#p_code").empty().append(t).selectpicker(
									"refresh");
						})

	}
</script>
</html>