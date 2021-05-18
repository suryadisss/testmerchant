<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Persetujuan Penonaktifan Akun" />
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
						<form id="formDeactivateAcc">
							<input type="hidden" name="new_edit_status" id="new_edit_status" />
							<input type="hidden" name="rul_id" id="rul_id" />
							<div class="modal-header">

								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Menonaktifkan Akun</h4>
							</div>
							<div class="modal-body">
								<table width="100%">
									<tr>
										<td width="30%">Nama</td>
										<td>:</td>
										<td><span id="dct_cst_name"></span><input type="hidden" id="hdcif" name="hdcif"></td>
									</tr>
									<tr>
										<td>Email/Surel</td>
										<td>:</td>
										<td><span id="dct_cst_email"></span></td>
									</tr>
									<tr>
										<td>No. Ponsel</td>
										<td>:</td>
										<td><span id="dct_cst_phone_mobile"></span></td>
									</tr>
									<tr>
										<td>Diajukan Oleh</td>
										<td>:</td>
										<td><span id="dct_cst_status_user"></span></td>
									</tr>
									<tr>
										<td>Alasan</td>
										<td>:</td>
										<td><div
												style="border: 1px dotted #ffa505; border-radius: 0.1em; background: #ffdda0; color: black; padding: 5px; text-align: justify; text-justify: inter-word"
												id="dct_cst_status_reason"></div></td>
									</tr>
								</table>





							</div>
							<div class="modal-footer">
								<button class="btn btn-default" data-dismiss="modal">Tutup</button>
								<button id="rejectdct" type="button" class="btn btn-warning" onclick="setReject()">Tolak</button>
								<button type="submit" id="submitdct" class="btn btn-danger">Nonaktifkan Akun</button>
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


								<table class="table table-hover" id="tblDct">
									<thead>
										<tr>
											<td>Nama</td>
											<td>Email/Surel</td>
											<td>No. Ponsel</td>
											<td>Tindakan</td>
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

						$('#tblDct')
								.DataTable(
										{
											ajax : {
												url : '${local_server}/deactivate_account/getDeactivate', 
												type : 'GET'
											},
											order : [ [ 0, 'asc' ] ],
											columns : [
													{

														data : 'cst_name' 
													},
													{
														data : 'cst_email' 
													},
													{
														data : 'cst_phone_mobile' 

													},
													{
														render : function(data,
																type, row) {
															var edit = "";

															edit = '<button class="view btn btn-xs btn-success" id="'+row.cst_cif+'" value="'+row.cst_name+'" ><i class=" fa fa-edit"></i></button>'; 

															return edit;
														},
														orderable : false
													} ]

										});

						$('#tblDct').on("click", "button.view", function() {
							$("#myModal").modal("show");
							getDetail(this.id);
						});
						
						

						$("#formDeactivateAcc")
								.submit(
										function(e) {

											$
													.confirm({
														title : 'Confirm!',
														content : 'Are you sure, want to deactivate this account?',
														buttons : {
															cancel : function() {
																$
																		.alert('Canceled!');
															},
															somethingElse : {
																text : 'Yes, Deactivate',
																btnClass : 'btn-red',
																keys : [ 'enter' ],
																action : function() {
																	setDeactivateAcc();
																}
															}
														}
													});

											e.preventDefault();
										});

					});
	
	function setReject(){
		$
		.confirm({
			title : 'Confirm!',
			content : 'Are you sure, want to reject deactivate this account?',
			buttons : {
				cancel : function() {
					$
							.alert('Canceled!');
				},
				somethingElse : {
					text : 'Yes, Reject Deactivate',
					btnClass : 'btn-warning',
					keys : [ 'enter' ],
					action : function() {
						rejectDCT();
					}
				}
			}
		});
	}
	
	function rejectDCT(){
		var dtm = {}
		dtm['hdcif'] = $("#hdcif").val();
		$
		.ajax({
			type : "POST",
			url : "${local_server}/deactivate_account/setDeactivateReject", 
			data : dtm,
			cache : false,
			beforeSend : function() {
				$("#rejectdct")
						.html(
								"<i class='fa fa-circle-o-notch fa-spin'></i>  Processing ..");

				$("#submitdct,#rejectdct").prop("disabled", true);

			},
			complete : function(xhr, status) {
				
				if (status === 'error' || !xhr.responseText) {
					console.log(status);
				} else {
					$("#rejectdct").html("Reject");
					$("#myModal").modal("hide");
					var data = JSON.parse(xhr.responseText);
					if (data.status == "Success") {
						$("#bcl").html("");
						$.confirm({
							title : "Success",
							content : "Reject Deactivate Account Successfully",
							buttons : {
								somethingElse : {
									text : 'OK',
									btnClass : 'btn-success',
									keys : [ 'enter' ],
									action : function() {
										$("#submitdct,#rejectdct").prop("disabled", false);
										$('#tblDct').DataTable().ajax
												.reload();
									}
								}

							}
						});
					} else {
						$.alert(data.message);
						$("#submitdct,#rejectdct").prop("disabled", false);
					}

				}
			}

		});
	}

	function setDeactivateAcc() {
		
		$
				.ajax({
					type : "POST",
					url : "${local_server}/deactivate_account/setDeactivateApproved", 
					data : $( "#formDeactivateAcc" ).serialize(),
					cache : false,
					beforeSend : function() {
						$("#submitdct").html("<i class='fa fa-circle-o-notch fa-spin'></i>  Processing ..");
						$("#submitdct,#rejectdct").prop("disabled", true);
					},
					complete : function(xhr, status) {
						
						if (status === 'error' || !xhr.responseText) {
							console.log(status);
						} else {
							$("#submitdct").html("Penonaktifan Akun");
							$("#myModal").modal("hide");
							var data = JSON.parse(xhr.responseText);
							if (data.status == "Success") {
								$("#bcl").html("");
								$.confirm({
									title : "Success",
									content : "Deactivate Successfully",
									buttons : {
										somethingElse : {
											text : 'OK',
											btnClass : 'btn-success',
											keys : [ 'enter' ],
											action : function() {
												$("#submitdct,#rejectdct").prop("disabled", false);
												$('#tblDct').DataTable().ajax
														.reload();
											}
										}

									}
								});
							} else {
								$.alert(data.message);
								$("#submitdct,#rejectdct").prop("disabled", false);
							}

						}
					}

				});

	}

	function getDetail(cif) {
		$.ajax({
			type : 'GET',
			asyn : true,
			url : '${local_server}/deactivate_account/getDeactivate/' + cif, 
			dataType : "json",
			success : function(data) {
				if (data.status == "Success") {
					$.each(data.data[0], function(i, o) {
						if(i == "cst_cif"){
							$("#hdcif").val(o);
						}
						$("#dct_" + i).html(o);
					})
				}

			}
		});
	}
</script>

</html>

