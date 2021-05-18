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
								<h4 class="modal-title" id="myModalLabel">Simulasi
									Pembayaran</h4>
							</div>
							<div class="modal-body">
								<p>Rincian tunggakan sebagai berikut:</p>
								<table>
									<tr>
										<td>Tunggakan</td>
										<td>:</td>
										<td>3,000,000</td>
									</tr>
									<tr>
										<td>Denda</td>
										<td>:</td>
										<td>500,000</td>
									</tr>
									<tr>
										<td>Total Tunggakan</td>
										<td>:</td>
										<td>3,500,000</td>
									</tr>
									<tr>
										<td>Rencana Pembayaran</td>
										<td>:</td>
										<td><div class="input-group">
												<input type="text" class="form-control"
													id="exampleInputAmount">
												<div class="input-group-btn">
													<button class="btn" id="btnSimul"
														style="margin-bottom: 0px; border-radius: 3px; height: 34px;">
														Simulasi</button>
												</div>
											</div></td>
									</tr>
								</table>
							</div>
							<div class="modal-footer">
								<button class="btn btn-default" data-dismiss="modal">Close</button>

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
								<h2>Task Distribution</h2>
								<ul class="nav navbar-right panel_toolbox">

								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<form class="form-horizontal">
									<div class="form-group">
										<label for="nama" class="col-sm-2 control-label">Name</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="nama">
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword3" class="col-sm-2 control-label">Deskripsi</label>
										<div class="col-sm-10">
											<textarea rows="5" class="form-control"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword3" class="col-sm-2 control-label">Data
											Source</label>
										<div class="col-sm-10">
											<select class="form-control"><option>Data
													Source 1</option></select>
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword3" class="col-sm-2 control-label">Due</label>
										<div class="col-sm-10">
											<div class="input-group">
												<input type="text" class="form-control"
													id="exampleInputAmount">
												<div class="input-group-addon">Hari</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword3" class="col-sm-2 control-label">Kondisi Aturan</label>

									</div>
									<div
										style="border: 1px solid #D9DEE4; white-space: nowrap; padding: 30px; background: #EDEDED; height: 200px; overflow: auto;">
										<table class="table borderless" width="100%" cellpadding="10">
											<tr >
												<td width="90px"><select class="form-control input-sm">
														<option>AND</option>
														<option>OR</option>
												</select></td>
												<td width="80px"><div class="btn-group">
														<button class="btn btn-sm btn-success">
															<i class="fa fa-plus"></i>
														</button>
														<button class="btn btn-sm btn-info">
															<i class="fa fa-plus"></i>
														</button>
													</div></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td></td>
												<td><button class="btn btn-sm btn-cyrcle btn-danger">
														<i class="fa fa-times"></i>
													</button></td>
												<td><select class="form-control input-sm">
														<option>DPD</option>
												</select></td>
												<td><select class="form-control input-sm">
														<option>Start With</option>

												</select></td>
												<td><input type="text" class="form-control input-sm" /></td>

											</tr>

											<tr>
												<td></td>
												<td><button class="btn btn-sm btn-cyrcle btn-danger">
														<i class="fa fa-times"></i>
													</button></td>
												<td><select class="form-control input-sm">
														<option>DPD</option>
												</select></td>
												<td><select class="form-control input-sm">
														<option>Start With</option>

												</select></td>
												<td><input type="text" class="form-control input-sm" /></td>

											</tr>
										</table>

									</div>
									<div class="form-group" style="margin-top:30px;">
										<label for="inputPassword3" class="col-sm-2 control-label">Action</label>
										<div class="col-sm-10">
											<select class="form-control">
												<option>Visit</option>
												<option>SMS</option>
												<option>Email</option>
												<option>Call</option>
											</select>
										</div>
									</div><div class="form-group" style="margin-top:30px;">
										<label for="inputPassword3" class="col-sm-2 control-label">Team</label>
										<div class="col-sm-10">
											<select class="form-control">
												<option>Collection 1</option>
											</select>
										</div>
									</div>
									<div id="output">
									<div class="form-group" style="margin-top:30px;">
										<label for="inputPassword3" class="col-sm-2 control-label">Acivity</label>
										<div class="col-sm-10">
											<input type="checkbox"/> Call Connected<br>
											<input type="checkbox"/> Call Not Connected<br>
											<input type="checkbox"/> Call Busy
										</div>
									</div>
									<div class="form-group" style="margin-top:30px;">
										<label for="inputPassword3" class="col-sm-2 control-label">Status</label>
										<div class="col-sm-10">
											<input type="checkbox"/>
										
										</div>
									</div>
									
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<button type="submit" class="btn btn-success">Simpan</button>
										</div>
									</div>
								</form>


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
						$("#btnSimul")
								.on(
										"click",
										function() {
											$
													.confirm({
														title : 'Hasil Simulasi',
														content : 'Total tagihan anda tanggal 17-02-2018 adalah <br>'
																+ 'Tunggakan : 3,000,000<br>'
																+ 'Denda : 530,000<br>'
																+ 'Total Tagihan : 3,530,000<br>',
														type : 'green',
														typeAnimated : true,
														buttons : {
															tryAgain : {
																text : 'OK',
																btnClass : 'btn-green',
																action : function() {
																}
															}
														}
													});
											return false;
										});

					});

	function opensimulasi() {
		$("#myModalSimulasi").modal("show");
	}
</script>

</html>

