<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Version Management" />
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
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<form id="formInput" method="post" action="version/dopost">
							<input type="hidden" name="new_edit_status" id="new_edit_status" />
							<input type="hidden" name="detid" id="detid" />
							<div class="modal-header">

								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Perbaharui Versi</h4>
							</div>
							<div class="modal-body">
								<fieldset
									style="background: #f7f8f9; border: 1px solid #eff0f2; padding: 10px; margin-bottom: 50px;">
									<table width="100%">
										<tr>
											<td>
												<table width="100%">
													<tr>
														<td width="40%">Nama Aplikasi</td>
														<td width="10%">:</td>
														<td><label class="app_name"></label></td>
													</tr>
													<tr>
														<td>Deskripsi</td>
														<td>:</td>
														<td><label class="app_descs"></label></td>
													</tr>
													<tr>
														<td>Versi Terakhir</td>
														<td>:</td>
														<td><label class="app_versions"></label></td>
													</tr>
												</table>

											</td>

										</tr>

									</table>

								</fieldset>
								<div class="form-horizontal">
									<div class="form-group">
										<label for="inputPassword3" class="col-sm-3 control-label">Subjek
										</label>
										<div class="col-sm-9">
											<input type="text" class="form-control" required="required" name="apd_subject" id="apd_subject">

										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword3" class="col-sm-3 control-label">Status
										</label>
										<div class="col-sm-9">
											<input type="hidden" name="app_id" class="app_id"> <select
												id="status" required="required" name="status"
												class="form-control">

											</select>
											<input type="hidden" name="status_hid" id="status_hid">
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword3" class="col-sm-3 control-label">Deskripsi
										</label>
										<div class="col-sm-9">

											<textarea rows="6" cols="" required="required" class="form-control" name="descs"
												id="descs"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword3" class="col-sm-3 control-label">Berkas
										</label>
										<div class="col-sm-9">

											<input type="file" name="files[0]" id="file"
												class="form-control" /><br>
											<span id="oldfile" class="hide"><input type="checkbox"  name="oldfile" id="files" value=""> Simpan berkas lama : <a style="color:blue;" id="lableFiles"></a></span>
										</div>
									</div>
									<div class="form-group">
										<label for="inputPassword3" class="col-sm-3 control-label">
											Aplikasi </label>
										<div class="col-sm-9"></div>
									</div>
									<div id="app_type"
										style="padding:20px;border-radius:1em;-webkit-box-shadow: inset 0px 0px 18px -4px rgba(130,130,130,0.74);-moz-box-shadow: inset 0px 0px 18px -4px rgba(130,130,130,0.74);box-shadow: inset 0px 0px 18px -4px rgba(130,130,130,0.74);"></div>

								</div>
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
								<fieldset
									style="background: #f7f8f9; border: 1px solid #eff0f2; padding: 10px; margin-bottom: 50px;">
									<table width="100%">
										<tr>
											<td>
												<table width="100%">
													<tr>
														<td width="40%">Nama Aplikasi</td>
														<td width="10%">:</td>
														<td><label class="app_name"></label></td>
													</tr>
													<tr>
														<td>Deskripsi</td>
														<td>:</td>
														<td><label class="app_descs"></label></td>
													</tr>
													<tr>
														<td>Versi terakhir</td>
														<td>:</td>
														<td><label class="app_versions"></label></td>
													</tr>
												</table>

											</td>
											<td>
												<table width="100%">
													<tr>
														<td width="40%">Media</td>
														<td width="10%">:</td>
														<td><label class="app_platform"></label></td>
													</tr>
													<tr>
														<td>Arsitektur</td>
														<td>:</td>
														<td><label class="app_architecture"></label></td>
													</tr>
													<tr>
														<td>Pembaharuan terakhir</td>
														<td>:</td>
														<td><label class="app_updated_date"></label></td>
													</tr>
												</table>

											</td>
										</tr>

									</table>

								</fieldset>
								<button type="button" id="btnUpdate"
									class="btn btn-primary btn-sm">Perubahan Versi</button>
								<table class="table table-hover" id="tblVersion">
									<thead>
										<tr>
											<td width="10%">Versi</td>
											<td width="15%">Status</td>
											<td width="25%">Subjek</td>

											<td width="10%">Tanggal diubah</td>
											<td width="25%">Aplikasi</td>
											<td width="5%">Berkas</td>
											<td width="15%">Tindakan</td>
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
	$(document)
			.ready(
					function() {
						getapp();
						$("#formInput")
								.submit(
										function(e) {
										
											var checkbox = $('[name="apptype"]:checked').length; 
											
											if(checkbox > 0){
												var formData = new FormData(
														$(this)[0]);

												$
														.ajax({
															url : '${local_server}/version/dopost',
															type : 'POST',
															data : formData,
															async : false,
															cache : false,
															contentType : false,
															processData : false,
															dataType : "json",
															beforeSend : function() {
																$(
																		'button[type=submit]')
																		.prop(
																				'disabled',
																				true);
															},
															success : function(n) {
																$(
																		'button[type=submit]')
																		.prop(
																				'disabled',
																				false);
																
																if (n.status == "Success") {
																	$("#myModal")
																	.modal(
																			"hide");
																	$
																			.confirm({
																				title : "",
																				content : n.message,
																				buttons : {
																					somethingElse : {
																						text : "OK",
																						btnClass : "btn-success",
																						keys : [ "enter" ],
																						action : function() {
																							getapp();
																							$(
																									"#tblVersion")
																									.DataTable().ajax
																									.reload()
																						}
																					}
																				}
																			});
																}else{
																	$.alert(n.message);
																}
															}
														});
						
											}else{
												$.alert("Please select an updated apps");
											}
											
											e.preventDefault();
										});

						$('#tblVersion')
								.DataTable(
										{
											ajax : {
												url : '${local_server}/version/getapplistdet/1',
												type : 'GET'
											},
											order : [ [ 3, 'desc' ] ],
											columns : [
													{

														data : 'app_version',
														render : function(data,
																type, row) {
															return "<label class='label label-default'>"
																	+ data
																	+ "</label>";
														}
													},

													{
														data : 'status_name',
														render : function(data,
																type, row) {
															return "<label class='label label-success'>"
																	+ data
																	+ "</label>";
														}
													},
													{
														data : 'apd_subject'
													},

													{
														data : 'dates',
														render : function(data,
																type, row) {
															return convertDateVersion(data);
														}
													},
													{
														data : 'apd_apps'
													},
													{
														data : 'files',
														render : function(data,
																type, row) {

															return (data != null
																	&& data != "" && data != "-") ? "<a class='edit btn btn-xs btn-default' href='"+data+"' target='_blank'><i class='fa fa-download'></i></a>"
																	: "";

														}
													},
													{
														orderable : false,
														render : function(data,
																type, row) {

															return "<button class='edit btn btn-xs btn-success' id='"+row.id+"' value='"+row.app_version+"' ><i class='fa fa-edit'></i></button>"
																	+ "<button class='delete btn btn-xs btn-danger' id='"+row.id+"' value='"+row.app_version+"'><i class='fa fa-trash-o'></i></button>"

														}

													}

											]

										});
						$('#tblVersion').on("click", "button.edit", function() {
							$("#formInput")[0].reset();
							$("#myModal").modal("show");
							$("#new_edit_status").val("Edit");
							$("#oldfile").removeClass("hide");
							$("#lableFiles").text("");
							$("#status").attr('disabled', 'disabled').addClass("disabled");
							getappbyid(this.id);
						});

						$("#btnUpdate").on("click", function() {
							$("#formInput")[0].reset();
							$("#myModal").modal("show");
							$("#oldfile").addClass("hide");	$("#status").removeAttr('disabled').removeClass("disabled");
							getStatus(-1);
							generateType("");
							$("#new_edit_status").val("New");
						})
						$('#tblVersion')
								.on(
										"click",
										"button.delete",
										function() {
											var id = this.id;
											var ver = this.value;
											$
													.confirm({
														title : "Confirm",
														content : "Are you sure want to delete version <b>"
																+ ver
																+ "</b> ?",
														buttons : {
															cancel : function() {
																$
																		.alert("Canceled!")
															},
															somethingElse : {
																text : "DELETE",
																btnClass : "btn-danger",
																keys : [ "enter" ],
																action : function() {
																	_sendDel(id);
																}
															}
														}
													})
										});
					});
	/* function isInArray(value, array) {
		return array.indexOf(value) > -1;
	} */

	function isInArray(value, arr) {
		var status = false;
		
		for (var i = 0; i < arr.length; i++) {
			var name = String(arr[i]).trim();
			if (name == value) {
				status = true;
				break;
			}
		}

		return status;
	}
	function _sendDel(id) {
		$.ajax({
			type : "POST",
			url : "${local_server}/version/delappdet",
			data : "id=" + id,
			cache : !1,
			complete : function(e, t) {
				if ("error" !== t && e.responseText) {
					var n = JSON.parse(e.responseText);
					if (n.status == "Success") {
						$.confirm({
							title : "",
							content : n.message,
							buttons : {
								somethingElse : {
									text : "OK",
									btnClass : "btn-success",
									keys : [ "enter" ],
									action : function() {
										getapp();
										$("#tblVersion").DataTable().ajax
												.reload()
									}
								}
							}
						})
					}
				} else
					console.log(t)
			}
		});

	}
	function getapp() {
		$.ajax({
			type : "GET",
			url : "${local_server}/version/getapp/1",
			dataType : "json",
			async : true,
			success : function(res) {
				$.each(res.data[0], function(i, o) {
					o = (i == "updated_date") ? convertDateVersion(o) : o;
					if (i == "id") {
						$(".app_" + i).val(o);
					} else {
						$(".app_" + i).html(o);
					}

				});
			}
		});
	}
	function getappbyid(val) {
		$.ajax({
			type : "GET",
			url : "${local_server}/version/getapplistdetbyid/" + val,
			dataType : "json",
			async : true,
			success : function(res) {
				console.log(res);
				$.each(res.data[0], function(i, o) {

					if (i == "id") {
						$("#detid").val(o);
					}

					if (i == "status") {
						$("#status_hid").val(o);
						getStatus(o);
					}
					
					if(i == "files" && o != "-"){
						$("#lableFiles").text(getFileName(o)).prop("href", o);
					}

					if (i == "apd_apps") {
						generateType(o);
					}

					$("#" + i).val(o);

				});
			}
		});
	}
	function getStatus(val) {
		$.ajax({
			type : "GET",
			url : "${local_server}/version/getappstatus",
			dataType : "json",
			async : true,
			success : function(res) {
				var h = "";
				h += "<option value>--Select One--</option>"
				$.each(res.data, function(i, o) {
					if (o.aps_id == val) {
						h += "<option value='"+o.aps_id+"' selected>"
								+ o.aps_name + "</option>"
					} else {
						h += "<option value='"+o.aps_id+"'>" + o.aps_name
								+ "</option>"
					}

				});
				$("#status").empty().append(h);
			}
		});
	}
	
	function getFileName(val) {
		if (val != null && val != "") {
			var fn = val.split("/");
			return fn[fn.length - 1];
		} else {
			return "";
		}
	}

	function generateType(prm_in) {
		var y = String(prm_in).split(",");
		var h = "";
		$
				.ajax({
					type : "GET",
					url : "${local_server}/version/getapptype",
					dataType : "json",
					async : true,
					success : function(dt) {
						var h = "", x = 0;
						h += "<table width='100%'><tr><td>";
						$
								.each(
										dt.data,
										function(i, o) {

											var checl = (isInArray(String(
													o.name).trim(), y
													)) ? "checked" : "";
											var idx = String(o.name).replace(
													/[^a-zA-Z0-9_-]/g, '');
											h += "<label for='"+idx+"'><input type='checkbox' name='apptype' id='"+idx+"' value='"+o.name+"' "+checl+"/> "
													+ o.name + "</label><br>";
											if (x % 5 == 0 && x != 0) {
												h += "</td><td valign='top'>"
											}
											x++;

										});
						h += "</td></tr></table>";
						$("#app_type").empty().append(h);
					}
				});

	}
	
</script>

</html>

