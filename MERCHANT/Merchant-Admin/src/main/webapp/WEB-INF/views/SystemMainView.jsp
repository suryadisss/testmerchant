<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="System" />
	<jsp:param name="datatables" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
	<jsp:param name="jquerydatepicker" value="1" />
	<jsp:param name="noityjs" value="1" />
	<jsp:param name="timepicker" value="1" />
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
			
			<div class="modal fade" id="myModalGlobal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<form id="formInputGlobal">
							<div class="modal-header">
								<input type="hidden" name="new_edit_status" id="new_edit_status" />
								<input type="hidden" name="rul_id" id="rul_id" />
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel"></h4>
							</div>
							<div class="modal-body">
								<div class="form-horizontal">
									<div class="form-group">
										<label for="prd_code" class="col-sm-3 control-label">Kode</label>
										<div class="col-sm-6">
											<input class="form-control" type="text" id="glc_code"
												name="glc_code" readonly="true">
										</div>
									</div>
									<div class="form-group">
										<label for="prd_code" class="col-sm-3 control-label">Nama</label>
										<div class="col-sm-6">
											<input class="form-control" type="text" id="glc_name"
												name="glc_name" readonly="true">
										</div>
									</div>
									<div class="form-group">
										<label for="prd_code" class="col-sm-3 control-label">Deskripsi</label>
										<div class="col-sm-6">
											<textarea class="form-control" readonly="true" cols="15"rows="5" id="glc_desc" name="glc_desc"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="prd_code" class="col-sm-3 control-label">Nilai</label>
										<div class="col-sm-6">
											<input class="form-control" type="text" id="glc_value"
												required="required" name="glc_value">
										</div>
									</div>
									<div class="form-group">
										<label for="prd_code" class="col-sm-3 control-label">Kata sandi masuk</label>
										<div class="col-sm-6">
											<input type="password" name="pwd" placeholder="Tuliskan kata sandi" class="passwordJob form-control" required />
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button class="btn btn-default" data-dismiss="modal">Tutup</button>
								<button type="submit" id="submit" class="btn btn-primary">Simpan Perubahan</button>
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="modal fade" id="myModalTime" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<form id="formInputTime" autocomplete="off">
							<input type="hidden" name="new_edit_status" id="new_edit_status" />
							<input type="hidden" name="rul_id" id="rul_id" />
							<div class="modal-header">



								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Ubah jam kerja</h4>
							</div>
							<div class="modal-body">
								<table width="100%">
									<tr>
										<td width="30%">Pekerjaan</td>
										<td>:</td>
										<td><span class="list_job"></span></td>

									</tr>
									<tr>
										<td>Waktu</td>
										<td>:</td>
										<td><input type="hidden" id="list_id" name="list_id" /><input
											id="list_times" name="list_times" class="form-control"
											placeholder="HH:MM" required="required" /></td>

									</tr>


								</table>
								<div class="form-horizontal">
									<div class="form-group">
										<label for="sender_email">Kata sandi masuk</label> <input
											type="password" class="form-control" name="pwd" id="pwd"
											required="required" />
									</div>
								</div>






							</div>
							<div class="modal-footer">
								<button class="btn btn-default" data-dismiss="modal">Tutup</button>
								<button type="submit" id="submitTime" class="btn btn-primary">Simpan perubahan</button>
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="right_col" role="main">
				<div class="row">
					<div class="col-md-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>Sistem</h2>
								<ul class="nav navbar-right panel_toolbox">

								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
							
								<div class="panel-group" id="accordion1" role="tablist"
									aria-multiselectable="true">
									<div class="panel panel-default">
										<div class="panel-heading" role="tab" id="headingOne">
											<h4 class="panel-title">
												<a role="button" data-toggle="collapse"
													data-parent="#accordion1" href="#collapseTwo"
													aria-expanded="true" aria-controls="collapseTwo"> Pengaturan Keseluruhan</a>
											</h4>
										</div>
										<div id="collapseTwo" class="panel-collapse collapse in"
											role="tabpanel" aria-labelledby="headingOne">
											<div class="panel-body">
												<table class="table table-bordered " id="tblGlobalSetting" width="100%">
													<thead>
														<tr>
															<td>Kode</td>
															<td>Nama</td>
															<td>Deskripsi</td>
															<td>Nilai</td>
															<td>Tindakan</td>
														</tr>
													</thead>
												</table>
											</div>
										</div>
									</div>
								</div>
							


								<div class="panel-group" id="accordion" role="tablist"
									aria-multiselectable="true">
									<div class="panel panel-default">
										<div class="panel-heading" role="tab" id="headingOne">
											<h4 class="panel-title">
												<a role="button" data-toggle="collapse"
													data-parent="#accordion" href="#collapseOne"
													aria-expanded="true" aria-controls="collapseOne"> JOB
													ETL</a>
											</h4>
										</div>
										<div id="collapseOne" class="panel-collapse collapse in"
											role="tabpanel" aria-labelledby="headingOne">
											<div class="panel-body">

												<div>

													<!-- Nav tabs -->
													<ul class="nav nav-tabs" role="tablist">
														<li role="presentation" class="active"><a
															href="#home" aria-controls="home" role="tab"
															data-toggle="tab">Pengaturan Job</a></li>
														<li role="presentation"><a href="#profile"
															aria-controls="profile" role="tab" data-toggle="tab">Notif
																Pengaturan (Pengirim)</a></li>
														<li role="presentation"><a href="#profile2"
															aria-controls="profile" role="tab" data-toggle="tab">Notif
																Pengaturan (Penerima)</a></li>
														<li role="presentation"><a href="#globalSetting"
															aria-controls="globalSetting" role="tab" data-toggle="tab">Pengaturan Keseluruhan</a></li>
													</ul>

													<!-- Tab panes -->
													<div class="tab-content">
														<div role="tabpanel" class="tab-pane active" id="home">
															<button onclick="ref()" class="btn btn-default btn-sm">Perbarui</button>
															<a href="${local_server}/system/log"
																class="btn btn-default btn-sm">Catatan</a>
															<table class="table table-bordered " id="tblJob"
																width="100%">
																<thead>
																	<tr>
																		<td>JOB</td>
																		<td>Tipe</td>
																		<td>Diulang</td>
																		<td>Waktu</td>
																		<td>Prioritas</td>
																		<td>Status</td>
																		<td>Tindakan</td>
																	</tr>
																</thead>
															</table>
														</div>
														<div role="tabpanel" class="tab-pane" id="profile"
															style="padding: 30px;">

															<form id="formSender">

																<input type="hidden" name="sender_id" id="sender_id">
																<div class="form-group">
																	<label for="sender_email">Email/Surel Pengirim</label> <input
																		type="text" class="form-control" id="sender_email"
																		name="sender_email" required="required">
																</div>

																<div class="form-group">
																	<label for="sender_email">Domain</label> <input
																		type="text" class="form-control" id="sender_domain"
																		name="sender_domain" required="required">
																</div>
																<div class="form-group">
																	<label for="sender_email">Port</label> <input
																		type="number" min=0 class="form-control"
																		id="sender_port" name="sender_port"
																		required="required" value="0">
																</div>
																<div class="form-group">
																	<label for="sender_is_authentication"><input
																		type="checkbox" id="sender_is_authentication"
																		onclick="authchk(this.checked);"
																		name="sender_authentication"> Otentikasi</label>
																</div>
																<table class="table table-bordered hide" width="100%"
																	id="tblAuth">
																	<tr>
																		<td>

																			<div class="form-group">
																				<label for="sender_email">Nama Pengguna Auth</label> <input
																					type="text" class="form-control"
																					id="sender_username" name="sender_username">
																			</div>
																			<div class="form-group">
																				<label for="exampleInputPassword1">Kata Sandi
																					Auth</label> <input type="password" class="form-control"
																					id="sender_password" name="sender_password">
																			</div>

																		</td>

																	</tr>

																</table>
																<button type="submit" id="btnSender"
																	class="btn btn-primary">Kirim</button>
															</form>


														</div>
														<div role="tabpanel" class="tab-pane" id="profile2"
															style="padding: 30px;">
															<form id="formReceiver">

																<input type="hidden" name="receiver_id" id="receiver_id" />
																<div class="form-group">
																	<label for="exampleInputEmail1">Email/Surel Penerima</label>
																	<textarea class="form-control" id="receiver_email"
																		name="receiver_email" cols="5" required="required"></textarea>
																	<span id="helpBlock" class="help-block">Pisahkan dengan <b>;</b>
																		untuk memasukan banyak penerima
																	</span>
																</div>


																<button type="submit" id="btnReceiver"
																	class="btn btn-primary">Kirim</button>
															</form>



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
	<jsp:param name="timepicker" value="1" />
</jsp:include>

<script>
	function authchk(a) {
		a = (a != null) ? a : false;
		if (a) {
			$("#tblAuth").removeClass("hide");
			$("#sender_username").attr("required", true);
			$("#sender_password").attr("required", true);
		} else {
			$("#tblAuth").addClass("hide");
			$("#sender_username").removeAttr("required");
			$("#sender_password").removeAttr("required");
		}
	}
	function ref() {
		$('#tblJob').DataTable().ajax.reload();
	}
	function format(d) {

		var sta = "";

		if (d.status == 1) {
			sta = "<span class='label label-success'>Running Job</i>";
		} else if (d.status == 0) {
			sta = "<span class='label label-warning'>Preparing to Process</i>";
		}
		var clr = (d.status == 1) ? "#eaffc1" : "#fbfcf9";
		var clx = (d.status == 1)? '<br/><div class="progress"> <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%"> <span class="sr-only"></span> </div></div>':'';
		var dwn = "";
		dwn = '<div style="background-color:'
				+ clr
				+ '; width:100%;padding:10px;"><table  width="100%" style="padding-left:50px;">'
				+ '<tr>' + '<td width="30%">Job Name</td>' + '<td>:</td>'
				+ '<td>' + chckVl(d.job) + '</td>' + '</tr>' + '<tr>'
				+ '<td>Start Date</td>' + '<td>:</td>' + '<td>'
				+ chckVl(String(d.start_date).replace("T", " ").split(".")[0])
				+ '</td>' + '</tr>' + '<tr>' + '<td>End Date</td>'
				+ '<td>:</td>' + '<td>'
				+ chckVl(String(d.end_date).replace("T", " ").split(".")[0])
				+ '</td>' + '</tr>' + '<tr>' + '<td>Status</td>' + '<td>:</td>'
				+ '<td>' + chckVl(sta) + '</td>' + '</tr>';
		if (d.status == 2) {
			if(checkAllRunning()){
				dwn += '<tr>'
					+ '<td  colspan="3" align="center"><button class="btn btn-sm btn-primary runjob" onclick="runningJob('
					+ d.id + ',\'' + d.job
					+ '\')">Jalankan secara manual</button></td>' + '</tr>';
			}
			
		}
		dwn += '</table>'+clx+'</div>';

		return dwn;
	}

	function chckVl(a) {
		return (a != null && a != "null") ? a : "";
	}
	$(document)
			.ready(
					function() {
						setInterval(function() {
							ref();
							console.log("refresh");
						}, 60000);
						$("#formInputTime").submit(function(e) {

							saveTime();

							e.preventDefault();
						})
						$('#tblGlobalSetting')
						.DataTable(
								{
									ajax : {
										url : '${local_server}/system/ListGlobalConfig',
										type : 'GET'
									},
									lengthChange : false,
									searching : false,
									columns : [
											{
												data : 'glc_code'
											},
											{
												data : 'glc_name'
											},
											{
												data : 'glc_desc'
											},
											{
												data : 'glc_value',

											},
											{
												render : function(data,
														type, row) {
													var edit = "";

													edit = '<button class="detGlobal btn btn-xs btn-success" id="'+row.glc_code+'" value="'+row.glc_code+'" > <i class="fa fa-chevron-circle-down"></i> Detail</button>';

													return edit;
												},
												orderable : false
											} ]

								});
						$("#tblGlobalSetting").on("click", "button.detGlobal",
								function(e) {
									bindDataGlobal(this.id);
									$("#myModalGlobal").modal({
										show : true
									});
								});

						$('#list_times').timepicker();
						getDetailSender(0);
						getDetailReceiver(0);
						$("#formReceiver")
								.submit(
										function(e) {
											$
													.confirm({
														title : 'Confirm!',
														content : ''
																+ '<form class="formreceiver">'
																+ '<div class="form-group">'
																+

																'<label> Are you sure, want to save notification setting (receiver)?</label>'
																+ '<input type="password" placeholder="Enter your login password" class="passwordReceiver form-control" required />'
																+ '</div>'
																+ '</form>',
														buttons : {
															formSubmit : {
																text : 'SAVE CHANGES',
																btnClass : 'btn-blue',
																action : function() {
																	var pwd = this.$content
																			.find(
																					'.passwordReceiver')
																			.val();
																	if (!pwd) {
																		$
																				.alert('Please enter your password');
																		return false;
																	}
																	// $.alert('Your name is ' + name);
																	saveReceiver(pwd);
																}
															},
															cancel : function() {
																//close
															},
														},
														onContentReady : function() {
															// bind to events
															var jc = this;
															this.$content
																	.find(
																			'form')
																	.on(
																			'submit',
																			function(
																					e) {
																				// if the user submits the form by pressing enter in the field.
																				e
																						.preventDefault();
																				jc.$$formSubmit
																						.trigger('click'); // reference the button and click it
																			});
														}
													});

											e.preventDefault();
										});

						$("#formSender")
								.submit(
										function(e) {

											$
													.confirm({
														title : 'Confirm!',
														content : ''
																+ '<form class="formsender">'
																+ '<div class="form-group">'
																+

																'<label> Are you sure, want to save notification setting (sender)?</label>'
																+ '<input type="password" placeholder="Enter your login password" class="passwordSender form-control" required />'
																+ '</div>'
																+ '</form>',
														buttons : {
															formSubmit : {
																text : 'SAVE CHANGES',
																btnClass : 'btn-blue',
																action : function() {
																	var pwd = this.$content
																			.find(
																					'.passwordSender')
																			.val();
																	if (!pwd) {
																		$
																				.alert('Please enter your password');
																		return false;
																	}
																	// $.alert('Your name is ' + name);
																	saveSender(pwd);
																}
															},
															cancel : function() {
																//close
															},
														},
														onContentReady : function() {
															// bind to events
															var jc = this;
															this.$content
																	.find(
																			'form')
																	.on(
																			'submit',
																			function(
																					e) {
																				// if the user submits the form by pressing enter in the field.
																				e
																						.preventDefault();
																				jc.$$formSubmit
																						.trigger('click'); // reference the button and click it
																			});
														}
													});

											e.preventDefault();
										});

						var table = $('#tblJob')
								.DataTable(
										{
											ajax : {
												url : '${local_server}/system/ListJob',
												type : 'GET'
											},
											lengthChange : false,
											searching : false,
											order : [ [ 4, 'asc' ] ],
											columns : [
													{

														data : 'job',
														render : function(data,
																type, row) {
															return data;
														}
													},
													{

														render : function(data,
																type, row) {

															return (row.id != 1) ? "Manual"
																	: "Automatic";
														}
													},
													{

														render : function(data,
																type, row) {

															return (row.id == 1) ? "Daily"
																	: "";
														}
													},
													{
														data : 'times',
														render : function(data,
																type, row) {

															return (data != null) ? data
																	+ " <button class='timepicker btn btn-warning btn-xs' id='times-"+row.id+"'>Ubah Waktu</button>"
																	: "";
														}
													},
													{
														data : 'priority',

													},
													{
														data : 'status',
														render : function(data,
																type, row) {

															var x = "";
															if (data == 2) {
																x = "<span class='label label-info'>Finish/Stand By</span>";
															} else if (data == 1) {
																x = "<span class='label label-success'><i class='fa fa-spinner fa-pulse'></i> Running Job</span>";
															} else if (data == 0) {
																x = "<span class='label label-warning'><i class='fa fa-spinner fa-pulse '></i> Preparing to Process</span>";
															}
															return x;
														}

													},
													{
														render : function(data,
																type, row) {
															var edit = "";

															edit = '<button class="details-control btn btn-xs btn-success" id="'+row.id+'" value="'+row.job+'" > <i class="fa fa-chevron-circle-down"></i> Rincian Tugas</button>';

															return edit;
														},
														orderable : false
													} ]

										});
						$('#tblJob').on('click', 'button.timepicker',
								function() {
									$("#formInputTime")[0].reset();
									var ids = String(this.id).split("-")[1];
									getDetailList(ids);
									$("#myModalTime").modal({
										show : true
									});
								});
						$('#tblJob')
								.on(
										'click',
										'button.details-control',
										function() {
											var tr = $(this).closest('tr');
											var row = table.row(tr);

											if (row.child.isShown()) {
												// This row is already open - close it
												row.child.hide();
												tr.removeClass('shown');
												$("#" + this.id)
														.removeClass(
																"btn-default")
														.addClass("btn-success")
														.html(
																"<i class='fa fa-chevron-circle-down'></i> Rincian Tugas");
											} else {
												// Open this row
												row.child(format(row.data()))
														.show();
												tr.addClass('shown');
												$("#" + this.id)
														.removeClass(
																"btn-success")
														.addClass("btn-default")
														.html(
																"<i class='fa fa-chevron-circle-up'></i> Rincian Tugas");

											}
										});

					});

	function checkAllRunning() {

		try {
			var jx = $.ajax({
				type : "GET",
				async: false,
				url : "${local_server}/system/ListJob/1",
				dataType : "json",
				success : function(data) {
				}
			}).responseText;
			var ps = JSON.parse(jx);
			if (ps.status == "Success" && Object.keys(ps.data).length > 0) {
				if (ps.data[0].status != 1 && ps.data[0].status != 0) {
					return true;
				} else {
					return false;
				}
			} else {
				return false
			}
		} catch (err) {
			return false;
		}

	}

	function saveReceiver(a) {
		$.ajax({
			type : "POST",
			url : "${local_server}/system/dopost/receiver",
			data : $("#formReceiver").serialize() + '&pwd=' + a,
			dataType : "json",
			beforeSend : function() {
				$("#btnReceiver").prop("disabled", true).html(
						"<i class='fa fa-circle-o-notch fa-spin'></i>")

			},
			success : function(data) {
				console.log(data);
				$("#btnReceiver").prop("disabled", false).html("Kirim");

				if (data.status == "Success") {
					$.confirm({
						title : 'Success',
						content : 'Setting has been saved',
						type : 'green',
						typeAnimated : true,
						buttons : {
							tryAgain : {
								text : 'OK',
								btnClass : 'btn-green',
								action : function() {
									$("#formSender")[0].reset();
									getDetailSender(0);
									getDetailReceiver(0);
								}
							}
						}
					});
				} else if (data.status == "warning") {
					$("#formReceiver")[0].reset();
					$.alert(data.message);
					getDetailSender(0);
					getDetailReceiver(0);
				}
			}
		});
	}

	function saveTime() {
		$.ajax({
			type : "POST",
			url : "${local_server}/system/updateTimeJob",
			data : $("#formInputTime").serialize(),
			dataType : "json",
			beforeSend : function() {
				$("#submitTime").prop("disabled", true).html(
						"<i class='fa fa-circle-o-notch fa-spin'></i>")

			},
			success : function(data) {
				console.log(data);
				$("#submitTime").prop("disabled", false).html("Kirim");
				$("#myModalTime").modal("hide");
				if (data.status == "Success") {
					$.confirm({
						title : 'Success',
						content : 'Setting has been saved',
						type : 'green',
						typeAnimated : true,
						buttons : {
							tryAgain : {
								text : 'OK',
								btnClass : 'btn-green',
								action : function() {
									$("#formInputTime")[0].reset();
									ref();
								}
							}
						}
					});
				} else if (data.status == "warning") {
					$("#formSender")[0].reset();
					$.alert(data.message);
					getDetailSender(0);
					getDetailReceiver(0);
				}
			}
		});
	}

	function saveSender(a) {
		$.ajax({
			type : "POST",
			url : "${local_server}/system/dopost/sender",
			data : $("#formSender").serialize() + '&pwd=' + a,
			dataType : "json",
			beforeSend : function() {
				$("#btnSender").prop("disabled", true).html(
						"<i class='fa fa-circle-o-notch fa-spin'></i>")

			},
			success : function(data) {
				console.log(data);
				$("#btnSender").prop("disabled", false).html("Kirim");

				if (data.status == "Success") {
					$.confirm({
						title : 'Success',
						content : 'Setting has been saved',
						type : 'green',
						typeAnimated : true,
						buttons : {
							tryAgain : {
								text : 'OK',
								btnClass : 'btn-green',
								action : function() {
									$("#formSender")[0].reset();
									getDetailSender(0);
									getDetailReceiver(0);
								}
							}
						}
					});
				} else if (data.status == "warning") {
					$("#formSender")[0].reset();
					$.alert(data.message);
					getDetailSender(0);
					getDetailReceiver(0);
				}
			}
		});
	}

	function runningJob(a, b) {

		$
				.confirm({
					title : 'Confirm!',
					content : ''
							+ '<form class="formPassword">'
							+ '<div class="form-group">'
							+

							'<label> Are you sure want to run job "'
							+ b
							+ '" ?</label>'
							+ '<input type="password" placeholder="Enter your login password" class="passwordJob form-control" required />'
							+ '</div>' + '</form>',
					buttons : {
						formSubmit : {
							text : 'Run Job',
							btnClass : 'btn-blue',
							action : function() {
								var pwd = this.$content.find('.passwordJob')
										.val();
								if (!pwd) {
									$.alert('Please enter your password');
									return false;
								}
								// $.alert('Your name is ' + name);
								runJob(a, pwd);
							}
						},
						cancel : function() {
							//close
						},
					},
					onContentReady : function() {
						// bind to events
						var jc = this;
						this.$content.find('form').on('submit', function(e) {
							// if the user submits the form by pressing enter in the field.
							e.preventDefault();
							jc.$$formSubmit.trigger('click'); // reference the button and click it
						});
					}
				});

	}

	function runJob(id, pwd) {
		var mdata = {}
		mdata['pid'] = id;
		mdata['pwd'] = pwd;

		$.ajax({
			type : "POST",
			url : "${local_server}/system/updateJob",
			data : mdata,
			dataType : "json",
			beforeSend : function() {
				$(".runjob").prop("disabled", true).html(
						"<i class='fa fa-circle-o-notch fa-spin'></i>")

			},
			success : function(data) {
				console.log(data);
				if (data.status == "Success") {
					$.confirm({
						title : 'Success',
						content : 'Job is preparing to start',
						type : 'green',
						typeAnimated : true,
						buttons : {
							tryAgain : {
								text : 'OK',
								btnClass : 'btn-green',
								action : function() {
									$('#tblJob').DataTable().ajax.reload();
								}
							}
						}
					});

				} else if (data.status == "warning") {
					$(".runjob").prop("disabled", false).html(
							"Jalankan Manual")
					$.alert(data.message);
				}
			}
		});

	}
	
	$("#formInputGlobal").submit(function(e) {
        $.ajax({
            type: "POST",
            url: "${local_server}/system/updateGlobalConfig",
            data: $("#formInputGlobal").serialize(),
            cache: !1,
            beforeSend:function(){
            	$('button[type=submit]').prop(
						'disabled', true);
            },
            complete: function(e, t) {
                if ("error" !== t && e.responseText) {
                	$('button[type=submit]').prop(
							'disabled', false);
                    $("#myModalGlobal").modal("hide");
                    var data = JSON.parse(e.responseText);
                    $.confirm({
                        title: "",
                        content: data.message,
                        buttons: {
                            somethingElse: {
                                text: "OK",
                                btnClass: "btn-success",
                                keys: ["enter"],
                                action: function() {
                                	window.location.href = "${local_server}/system";
                                }
                            }
                        }
                    })
                } else {
                	var x = (n.message != null) ? n.message
							: "Failed to saving data";
					$.alert(x);
                }
            }
        }), e.preventDefault()
    });
	
	function bindDataGlobal(id) {
		$.ajax({
			type : "GET",
			url : "${local_server}/system/DetailGlobalConfig/" + id,
			dataType : "json",
			success : function(data) {
				console.log(data);
				if (Object.keys(data.data).length > 0) {
					$.each(data.data[0], function(i, o) {
						$("#" + i).val(o);
					});
				}
			}

		});
	}

	function getDetailSender(id) {
		$.ajax({
			type : "GET",
			url : "${local_server}/system/notif/sender/" + id,
			dataType : "json",
			success : function(data) {
				console.log(data);
				if (Object.keys(data.data).length > 0) {
					$.each(data.data[0], function(i, o) {
						//$("#sender_" + i).html(o);
						if (i == "is_authentication") {
							$("#sender_is_authentication").prop("checked", o);
							authchk(o);
						}
						i
						$("#sender_" + i).val(o);
					});
				} else {
					$("#sender_id").val(0);
				}

			}

		});
	}

	function getDetailReceiver(id) {
		$.ajax({
			type : "GET",
			url : "${local_server}/system/notif/receiver/" + id,
			dataType : "json",
			success : function(data) {
				console.log(data);
				if (Object.keys(data.data).length > 0) {
					$.each(data.data[0], function(i, o) {
						//$("#sender_" + i).html(o);

						$("#receiver_" + i).val(o);
					});
				} else {
					$("#receiver_id").val(0);
				}

			}

		});
	}

	function getDetailList(id) {
		$.ajax({
			type : "GET",
			url : "${local_server}/system/ListJob/" + id,
			dataType : "json",
			success : function(data) {
				console.log(data);
				if (Object.keys(data.data).length > 0) {
					$.each(data.data[0], function(i, o) {
						//$("#sender_" + i).html(o);
						if (i == "times") {
							var a = String(o).split(":");

							o = a[0] + ":" + a[1];
						}
						$("#list_" + i).val(o);
						$(".list_" + i).html(o);
					});
				} else {
					$("#list_id").val(0);
					$(".list_" + i).html(o);
				}

			}

		});
	}
</script>

</html>

