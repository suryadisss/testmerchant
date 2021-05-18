<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Persetujuan Pencairan" />
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
						<form id="formSMSBillApr">
							
							<div class="modal-header">

								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Info Data SMS Billing</h4>
							</div>
							<div class="modal-body">
								<input type="hidden" id="idNprod" name="idNprod">
								<table class="display table table-hover table-bordered dt-responsive" id="AppTableDtl" width="100%">
						    	<thead>
						    		<tr>
						    			<td>No Akun</td>
						    			<td>Nomor VA</td>
                      <td>Jumlah Tagihan</td>
                      <td>Tanggal Berlaku</td>
						    			<td>Tanggal Dibuat</td>
						    		</tr>
						    	</thead>
								</table>
							</div>
							<div class="modal-footer">
							
								<button class="btn btn-default" data-dismiss="modal">Tutup</button>
								<button id="rejectunb" type="button" class="btn btn-warning" onclick="setReject()">Tolak</button>
								<button type="submit" id="submitunb" class="btn btn-primary">Setuju</button>

								<br><br>

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


								<table class="display table table-hover" id="tblUnb">
									<thead>
										<tr>
											<td>No Akun</td>
						    			<td>Nomor VA</td>
                      <td>Jumlah Tagihan</td>
                      <td>Tanggal Berlaku</td>
						    			<td>Tanggal Dibuat</td>
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

						$('#tblUnb')
								.DataTable(
										{
											ajax : {
												url : '${local_server}/inquiry/getSMSList', 
												type : 'GET'
											},
											columns : [
													{

														data: "sbr_acc_no"
														
													},
													{
														data: "sbr_va_no"
													},
													{
														data : 'sbr_bill_amount',
											              className : 'txtRigth',
															render : function(
																	data,
																	type,
																	row) {
																return toRp(data);
															}
													},
													{
														data : 'sbr_due_date',
														render : function(
																data,
																type,
																row) {
															return spTgl(data);
														}

													},
                          {
														data : 'sbr_created_at',
														render : function(
																data,
																type,
																row) {
															return spTgl(data);
														}

													},
													{
														render : function(data,
																type, row) {
															var edit = "";

															edit = '<button class="view btn btn-xs btn-success" id="'+row.sbr_id+'_'+row.sbr_acc_no+'" value="'+row.sbr_id+'_'+row.sbr_acc_no+'" ><i class=" fa fa-edit"></i></button>'; 

															return edit;
														},
														orderable : false
													} ]

										});

						$('#tblUnb').on("click", "button.view", function() {
							$("#myModal").modal("show");
							$("#idNprod").val(this.id);
							getDetail(this.id);
							unblockTable();
						});

						$("#formSMSBillApr")
								.submit(
										function(e) {

											$
													.confirm({
														title : 'Konfirmasi!',
														content : 'Anda yakin ingin menyetujui tagihan ini ?',
														buttons : {
															Batal : function() {
																$
																		.alert('Berhasil dibatalkan!');
															},
															somethingElse : {
																text : 'Ya, Setujui',
																btnClass : 'btn-primary',
																keys : [ 'enter' ],
																action : function() {
																	setUnblockSub();
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
			title : 'Konfirmasi!',
			content : 'Anda yakin ingin menolak Tagihan SMS ini ?',
			buttons : {
				Batal : function() {
					$
							.alert('Dibatalkan!');
				},
				somethingElse : {
					text : 'Ya, Tolak Tagihan SMS',
					btnClass : 'btn-red',
					keys : [ 'enter' ],
					action : function() {
						rejectUNB();
					}
				}
			}
		});
	}
	
	function rejectUNB(){
		var dtm = {}
		dtm['idNprod'] = $("#idNprod").val();
		$
		.ajax({
			type : "POST",
			url : "${local_server}/inquiry/reject/SMS", 
			data : dtm,
			cache : false,
			beforeSend : function() {
				$("#rejectunb")
						.html(
								"<i class='fa fa-circle-o-notch fa-spin'></i>  Processing ..");

				$("#submitunb,#rejectunb").prop("disabled", true);

			},
			complete : function(xhr, status) {
				
				if (status === 'error' || !xhr.responseText) {
					console.log(status);
					$.alert(data.message);
					$("#submitunb,#rejectunb").prop("disabled", false);
				} else {
					$("#rejectunb").html("Tolak");
					$("#myModal").modal("hide");
					var data = JSON.parse(xhr.responseText);
						
					$.confirm({
						title : "Sukses",
						content : "SMS berhasil ditolak !",
						buttons : {
							somethingElse : {
								text : 'OK',
								btnClass : 'btn-success',
								keys : [ 'enter' ],
								action : function() {
									$("#submitunb,#rejectunb").prop("disabled", false);
									window.location.reload();
								}
							}

						}
					});
					

				}
			}

		});
	}
	
	function rejectUNBnovia(){
		var dtm = {}
		dtm['idNprod'] = $("#idNprod").val();
		$
		.ajax({
			type : "POST",
			url : "${local_server}/inquiry/reject/SMS", 
			data : dtm,
			cache : false,
			beforeSend : function() {
				$("#rejectunb")
						.html(
								"<i class='fa fa-circle-o-notch fa-spin'></i>  Processing ..");

				$("#submitunb,#rejectunb").prop("disabled", true);

			},
			complete : function(xhr, status) {
				
				if (status === 'error' || !xhr.responseText) {
					console.log(status);
				} else {
					$("#rejectunb").html("Tolak");
					$("#myModal").modal("hide");
					var data = JSON.parse(xhr.responseText);
					if (status.toLowerCase() == "success") {
						$("#bcl").html("");
						$.confirm({
							title : "Sukses",
							content : "SMS berhasil ditolak !",
							buttons : {
								somethingElse : {
									text : 'OK',
									btnClass : 'btn-success',
									keys : [ 'enter' ],
									action : function() {
										$("#submitunb,#rejectunb").prop("disabled", false);
										window.location.reload();
									}
								}

							}
						});
					} else {
						$.alert(data.message);
						$("#submitunb,#rejectunb").prop("disabled", false);
					}

				}
			}

		});
	}

	function setUnblockSub() {
		
		$
				.ajax({
					type : "POST",
					url : "${local_server}/inquiry/approve/SMS", 
					data : $( "#formSMSBillApr" ).serialize(),
					cache : false,
					beforeSend : function() {
						$("#submitunb").html("<i class='fa fa-circle-o-notch fa-spin'></i>  Processing ..");
						$("#submitunb,#rejectunb").prop("disabled", true);
					},
					complete : function(xhr, status) {
						
						if (status === 'error' || !xhr.responseText) {
							console.log(status);
						} else {
							$("#submitunb").html("Setuju");
							$("#myModal").modal("hide");
							var data = JSON.parse(xhr.responseText);
							if (data.status == "Success") {
								$("#bcl").html("");
								$.confirm({
									title : "Sukses",
									content : "Berhasil disimpan",
									buttons : {
										somethingElse : {
											text : 'OK',
											btnClass : 'btn-success',
											keys : [ 'enter' ],
											action : function() {
												$("#submitunb,#rejectunb").prop("disabled", false);
												$('#tblUnb').DataTable().ajax
														.reload();
											}
										}

									}
								});
							} else {
								$.alert(data.message);
								$("#submitunb,#rejectunb").prop("disabled", false);
							}

						}
					}

				});

	}

	function getDetail(cif) {
		$.ajax({
			type : 'GET',
			asyn : true,
			url : '${local_server}/unblock_submission/getUnblock/' + cif, 
			dataType : "json",
			success : function(data) {
				if (data.status == "Success") {
					$.each(data.data[0], function(i, o) {
						if(i == "cst_cif"){
							$("#hdcif").val(o);
						}
						$("#unb_" + i).html(o);
					})
				}

			}
		});
	}

	function unblockTable(){
		$.ajax({
				type : 'GET',
				asyn : true,
				url : '${local_server}/inquiry/getSMSList',
				dataType : 'json',
				success : function(data){
					$('#AppTableDtl').DataTable().destroy();
					$('#AppTableDtl').dataTable({
						data : $.parseJSON(JSON.stringify(data.data)),
						order : [ [ 0, 'desc' ] ],
            columns : [
            {
              data : 'sbr_acc_no'
            },
						{
              data : 'sbr_va_no'
            },
            {
              data : 'sbr_bill_amount',
              className : 'txtRigth',
							render : function(
									data,
									type,
									row) {
								return toRp(data);
							}
            },
            {
              data : 'sbr_due_date',
				render : function(
						data,
						type,
						row) {
					return spTgl(data);
				}
            },
            {
              data : 'sbr_created_at',
				render : function(
						data,
						type,
						row) {
					return spTgl(data);
				}
            }]
					});
				},
				failure : function(errMsg) {
					alert("call failed");
				}
			});					

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
	
	function productName(obj) {
		if (obj == 'A01') {
			return 'KiniCintaku';
		} else if (obj == 'A02'){
			return 'KiniFlexi';
		}else if (obj=='A03'){
			return 'KiniUsaha';
		}else{
			return 'Undefined';
		}

	}
	
</script>

</html>

