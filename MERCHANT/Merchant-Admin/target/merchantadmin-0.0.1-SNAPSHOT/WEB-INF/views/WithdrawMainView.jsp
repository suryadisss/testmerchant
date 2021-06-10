<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Penarikan" />
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

			<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" style="z-index: 9999;">
				<div class="modal-dialog" role="document">
					<form id="formInput2" method="post" action="product/dopost">
						<input type="hidden" name="new_edit_status" id="new_edit_status" />
						<div class="modal-content">

							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Unggah Daftar Penarikan</h4>
							</div>
							<div class="modal-body">
								<div class="form-horizontal">
									<fieldset style="margin-top: 25px;">
										<div class="form-group">
											<label for="scc_code" class="col-sm-4 control-label">Berkas</label>
											<div class="col-sm-6">
												<input type="file" name="files[0]" id="file"
													required="required" class="form-control" />
											</div>
										</div>
									</fieldset>
								</div>
							</div>
							<div class="modal-footer">
								<button class="btn btn-default" data-dismiss="modal">Tutup</button>
								<button type="submit" id="submitFile" class="btn btn-primary">Unggah</button>
							</div>
						</div>

					</form>
				</div>
			</div>


			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" style="z-index: 9999;">
				<div class="modal-dialog" role="document">
					<form id="formInput" method="post" action="disbursement_kc/dopost">
						<input type="hidden" name="new_edit_status" id="new_edit_status" />
						<div class="modal-content">

							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Rincian Penarikan</h4>
							</div>
							<div class="modal-body">
								<div class="form-horizontal">
									
									<input type="hidden" id="waw_amount" name="waw_amount">
									<input type="hidden" id="waw_order_id" name="waw_order_id">
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Nama</label>
										<div class="col-sm-6">
											<input type="text" name="waw_behalf_of"
												id="borr_waw_behalf_of" class="form-control"
												readonly="readonly" required="required" />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Nama Bank</label>
										<div class="col-sm-6">
											<input type="text" name="waw_bank"
												id="borr_waw_bank" class="form-control"
												readonly="readonly" required="required" />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Nomor Rekening</label>
										<div class="col-sm-6">
											<input type="text" name="waw_bank_acc"
												id="borr_waw_bank_acc" class="form-control"
												readonly="readonly" required="required" />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Biaya Penarikan</label>
										<div class="col-sm-6">
											<input type="text" name="withdraw_fee"
												id="borr_withdraw_fee" class="form-control"
												readonly="readonly" required="required" />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Nilai Penarikan</label>
										<div class="col-sm-6">
											<input type="text" name="waw_amount"
												id="borr_waw_amount" class="form-control"
												readonly="readonly" required="required" />
										</div>
									</div>
								</div>


							</div>
							<div class="modal-footer">
								<button class="btn btn-default" data-dismiss="modal">Batal</button>
								<button type="submit" id="submit" class="btn btn-primary">Kirim</button>
							</div>
						</div>

					</form>
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
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-lg-12"
										style="background: #f7f8f9; border: 1px solid #eff0f2; margin-bottom: 20px;">
										<div class="pull-left">
											<div id="msg"></div>
										</div>
										<form id="formSearch">
											<fieldset class="form-inline pull-left">
												<div class="form-group">
													<label for="staticEmail2" class="sr-only">Email/Surel</label> <select
														id="searchby" name="searchby" class="form-control"
														onclick="showPrm(this);">
														<option value="0">Telusuri Berdasarkan Tanggal</option>
														<option value="1">Telusuri Berdasarkan Status</option>
													</select>
												</div>
												<script type="text/javascript">
													function showPrm(n) {
														if (n.value == 1) {
															$(".dt1,.dt2")
																	.addClass(
																			"hide");
															$(".dt3")
																	.removeClass(
																			"hide");
														}
														if (n.value == 0) {
															$(".dt3").addClass(
																	"hide");
															$(".dt1,.dt2")
																	.removeClass(
																			"hide");
														}
													}
												</script>

												<div class="form-group mx-sm-2 divdate dt1">
													<label for="inputPassword2" class="sr-only">Mulai</label> <input
														type="text" class="form-control datepicker11"
														placeholder="Dari Tanggal" name="date_from" id="date_from"
														title="(YYYY-MM-DD)" data-date-format="YYYY-MM-DD" />
												</div>
												<div class="form-group mx-sm-2 divdate dt2">
													<label for="inputPassword2" class="sr-only">sampai</label> <input
														type="text" class="form-control datepicker11"
														placeholder="To Date" name="date_to" title="(YYYY-MM-DD)"
														id="date_to" data-date-format="YYYY-MM-DD" />
												</div>

												<div class="form-group mx-sm-4 divdate dt3 hide">
													<label for="staticEmail2" class="sr-only">Email/Surel</label> <select
														id="status" name="status" class="form-control">
														<option value="101">Settlement</option>
														<option value="100">Pending</option>
														<option value="102">Expired</option>
													</select>
												</div>
												<div class="form-group mx-sm-3">
													<label for="inputPassword2" class="sr-only">Kata Sandi</label>
													<button type="submit" id="btnShow" class="btn btn-primary "
														style="margin-top: 5px;">Tampilkan</button>
												</div>
											</fieldset>

										</form>

									</div>
								</div>
								<div id="tbwid" class="hide">
									<form style="margin-bottom: 30px;" id="formDownload"
										method="post" action="withdraw/download" target="_blank"
										class="btn-group hide" role="group">
										<textarea class="hidden" id="record" name="record"></textarea>
										<button type="submit" class="btn btn-primary btn-sm disabled"
											id="btn-dis-all">
											<i class="fa fa-cloud-download "></i> Unduh Daftar Penarikan
										</button>
										<a class="btn btn-success btn-sm" id="btn-upload"><i
											class="fa fa-cloud-upload "></i> Unggah Penarikan</a>
									</form>


									<table id="withdraw_table"
										class="table table-hover table-bordered table-striped nowrap "
										width="100%">
										<thead>
											<tr>
												<td><input type="checkbox" class="cekbox" id="cek"></td>
												<th>Tanggal Permintaan</th>
												<th>Nama Penerima Dana</th>
												<th>Rekening Bank</th>
												<th>Nomor Rekening</th>
												<th>Permintaan Penarikan</th>
												<!-- <th>Saldo saat ini</th> -->
												<th>Biaya Penarikan</th>
												<th>Nilai Pencairan</th>
												<th>Sisa Saldo</th>
												<th>Status</th>
												<th>Tindakan</th>
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

		<jsp:include page='_Footer_Note.jsp'></jsp:include>
	</div>
</body>

<jsp:include page='_Footer_Gentellela.jsp'>
	<jsp:param name="datatables" value="1" />
	<jsp:param name="validate" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
	<jsp:param name="jquerydatepicker" value="1" />
	<jsp:param name="inputmask" value="1" />
	<jsp:param name="noityjs" value="1" />
</jsp:include>
<script>
	$(document)
			.ready(
					function() {
						 
						 $("#cek").change(function() {
							   if(this.checked){
									$("input:checkbox[class=cekbox]").prop('checked', true); 
									$("#btn-dis-all").removeClass("disabled").prop("disabled",false) 
									
									$("#withdraw_table").closest("table").find("tbody > tr").each(function() {
						            	var a = this;
						           		t.fnSelect(a)
						           		
						        	});
							   } else{
								   $("input:checkbox[class=cekbox]").prop('checked', false); 
								   $("#btn-dis-all").addClass("disabled").prop("disabled",true) 
								   
								   $("#withdraw_table").closest("table").find("tbody > tr").each(function() {
						            	var a = this;
						           		t.fnDeselect(a)
						           		
						        	});
							   }
							    	
							   
							});
						 
						 
						 
						 var e = $("#withdraw_table")
							.DataTable(
									{
										searching : false,
										scrollX : true,
										data : [],/* 
										dom : 'Bfrtip',
										buttons : [ 'excel' ], */
										lengthMenu : [ [ 10, 25, 50, 100, 200, 300, -1 ],
												[ 10, 25, 50, 100, 200, 300, "All" ] ],
										columns : [

												{
													render : function(e, t, n) {
														return '<input type="checkbox" class="cekbox" name="acc[]" value="' + n.waw_order_id + '">'
													},
													orderable : !1
												},

												{
													data : 'waw_action_date',
													render : function(data, type, row) {
														return convertDateAPI(data);
													}
												},
												{

													data : 'waw_behalf_of'

												},
												{
													data : 'waw_bank'

												},
												{
													data : 'waw_bank_acc'

												},
												{
													data : 'waw_amount',
													className : "txtRigth",
													render : function(data, type, row) {
														row.waw_behalf_of
														return toRp(data);
													}

												},
												{
													data : 'withdraw_fee',
													className : "txtRigth",
													render : function(data, type, row) {
														return toRp(data);
													}
												},

												{
													data : 'nilai_pencairan',
													className : "txtRigth",
													render : function(data, type, row) {
														return "";
													}
												},

												{
													data : 'wal_on_hand',
													className : "txtRigth",
													render : function(data, type, row) {
														return toRp(data);
													}
												},

												{
													data : 'waw_status_description'
												},
												{
													orderable : false,
													render : function(data, type, row) {

														return "<button class='edit btn btn-xs btn-success' id='"+row.waw_order_id+"' value='"+row.waw_order_id+"' ><i class='fa fa-edit'></i></button>"

													}

												}

										]
									});

						var t = new $.fn.dataTable.TableTools(
								e,
								{
									sSwfPath : "",
									sRowSelector : "td:not(:last-child)",
									sRowSelect : "multi",
									fnRowSelected: function(e) {
							        	try {
							                $(e).find("input[type=checkbox]").get(0).checked = !0;
							                var t = -1;
							                $.each($(".cekbox"), function(e, n) {
							                    t++
							                });
							                var n = 0;
							                $.each($(".cekbox:checked"), function(e, t) {
							                    n++
							                });
							                t = (t-1);
							                if(t == n){
							                	$("#btn-dis-all").removeClass("disabled")
							                	if(false == document.getElementById("cek").checked){
							                		document.getElementById("cek").checked = true
							                	}
							                }
							                
							                if(0 != n) {
							                	$("#btn-dis-all").removeClass("disabled")	
							                }
							            } catch (a) {}
							        },
							        fnRowDeselected: function(e) {
							        	try {
								                $(e).find("input[type=checkbox]").get(0).checked = !1;
								                var t = -1;
								                $.each($(".cekbox"), function(e, n) {
								                    t++
								                });
								                var n = 0;
								                $.each($(".cekbox:checked"), function(e, t) {
								                    n++
								                });
								                
								                if(0 == n){
								                	$("#btn-dis-all").addClass("disabled")
								                }
								                
								                
								                if(t >= n){
								                	//$("#btn-dis-all").addClass("disabled")
								                	if(true == document.getElementById("cek").checked){
								                		document.getElementById("cek").checked = false;
								                	}
								                }  
							                
							            } catch (a) {}
							        },
									sSelectedClass : "success"
								});

						 $("#withdraw_table > thead > tr > td input[type=checkbox]").eq(0).on("click", function() {
						        var e = this.checked,
						            n = 0;
						        $.each($(".cekbox:checked"), function(e, t) {
						            n++
						        }), $(this).closest("table").find("tbody > tr").each(function() {
						            var a = this;
						            e ? (t.fnSelect(a), $("#btn-dis-all").removeClass("disabled")) : (t.fnDeselect(a), n >= 1 && $("#btn-dis-all").addClass("disabled"))
						        })
						    }), $("#withdraw_table").on("click", "tr td input[type=checkbox]", function() {
						        var e = $(this).closest("tr").get(0),
						            n = 0;
						        $.each($(".cekbox:checked"), function(e, t) {
						            n++
						        });
						        var a = -1;
						        $.each($(".cekbox"), function(e, t) {
						            a++
						        }), this.checked ? (t.fnSelect(e), n > 0 && $("#btn-dis-all").removeClass("disabled"), a == n && 0 == document.getElementById("cek").checked && (document.getElementById("cek").checked = !0)) : (t.fnDeselect(e), n > 0 && 1 == document.getElementById("cek").checked && 1 == n && (document.getElementById("cek").checked = !1, $("#btn-dis-all").addClass("disabled")))
						    });
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						 
						$('.datepicker11').datetimepicker();

						$("#formInput").submit(function(e) {

							submitDisburse(this);
							e.preventDefault();
						});
						$("#formSearch")
								.submit(
										function(e) {
											searchForm(this);	
											e.preventDefault();
										});

						$("#formDownload")
								.submit(
										function(e) {
											var t = 0;
											if ($.each($(".cekbox:checked"),
													function(e, n) {
														t++
													}), t > 0) {
												var n = new Array;
												$("input:checked").each(
														function() {
															n.push($(this)
																	.val())
														}), $("#record").val(n)
											} else
														$
																.alert("Please select the data first!"),
														e.preventDefault()
										});

						$("#withdraw_table").on("click", "button.edit",
								function(e) {

								 $("#formInput")[0].reset(),getdetilwithdraw(this.id);
								});

						
						$("#btn-upload").on("click", function() {
					        $("#myModal1").modal("show")
					    });
						
						 $("#formInput2").submit(function(e) {
						        $.ajax({
						            url: "${local_server}/withdraw/file",
						            type: "POST",
						            data: new FormData(this),
						            processData: !1,
						            contentType: !1,
						            cache: !1,
						            
						            beforeSend: function() {
						                $("#submitFile").html("<i class='fa fa-circle-o-notch fa-spin'></i>  Please wait .."), $("#submitFile").addClass("disabled")
						            },
						            success: function(e) {
						                $("#submitFile").html("Save Changes"), $("#submitFile").removeClass("disabled"), $("#myModal1").modal("hide"), $("#formInput2")[0].reset();
						                
						                $.confirm({
						                    title: '',
						                    content: e,
						                    buttons: {
						                        somethingElse: {
						                            text: 'OK',
						                            btnClass: 'btn-success',
						                            keys: ['enter'],
						                            action: function(){
						                            	searchForm($("#formSearch"));
						                            }
						                        }
						                    }
						                });
						            }
						        }), e.preventDefault();
						    }); 

					});
	
	function searchForm(a){
		if (checkDate()) {

			$
					.ajax({
						type : "POST",
						url : "${local_server}/withdraw/search/date",
						data : $(a)
								.serialize(),
						cache : !1,
						beforeSend : function() {
							$(
									'button[type=submit]')
									.prop(
											'disabled',
											true);
						},
						complete : function(
								e, t) {
							$(
									'button[type=submit]')
									.prop(
											'disabled',
											false);
							if ("error" !== t
									&& e.responseText) {
								var n = JSON
										.parse(e.responseText);
								if (n.status == "Success") {
									$(
											"#tbwid, #formDownload")
											.removeClass(
													"hide");
									searchDate(n);

								}
							}
						}
					});
		} else {
			$
					.alert(" You have entered an invalid date range");
		}
	}
	function submitDisburse(a) {
		$.ajax({
			type : "POST",
			url : "${local_server}/withdraw/save/disburse",
			data : $(a).serialize(),
			cache : !1,
			beforeSend : function() {
				$('button[type=submit]').prop('disabled', true);
			},
			complete : function(e, t) {
				$('button[type=submit]').prop('disabled', false);
				if ("error" !== t && e.responseText) {
					var n = JSON.parse(e.responseText);
					if (n.status == "Success") {
						$("#myModal").modal("hide");
						$.confirm({
							title : 'Success',
							content : n.message,
							typeAnimated : true,
							buttons : {
								tryAgain : {
									text : 'OK',
									btnClass : 'btn-success',
									action : function() {
										searchForm($("#formSearch"));
									}
								}
							}
						});

					}
				}
			}
		});
	}
	function checkDate() {
		var date_to = document.getElementById('date_to').value;
		var date_from = document.getElementById('date_from').value;
		var dateto = new Date(date_to);
		var datefrom = new Date(date_from);
		if (datefrom > dateto) {
			return false;
		}
		return true;
	}

	function getdetilwithdraw(id) {
		$.ajax({
			type : "GET",
			url : "${local_server}/withdraw/detail/" + id,
			dataType : "json",
			async : true,
			success : function(res) {
				$.each(res.data[0], function(i, o) {
					if(i=="waw_amount"){
						$("#waw_amount").val(o)
					}
					if(i=="waw_order_id"){
						$("#waw_order_id").val(o)
					}
					o = (i =="withdraw_fee")?toRp(o):o;
					o = (i =="waw_amount")?toRp(o):o;
					$("#borr_" + i).val(o);

				});

			},
			complete : function(a) {
				$("#myModal").modal("show");
			}
		});
	}

	function searchDate(n) {

		console.log(n);
		$('#withdraw_table').DataTable().clear();
		$('#withdraw_table').DataTable().rows.add(n.data);
		$('#withdraw_table').DataTable().draw();
		 
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
			var time = String(String(val).split("T")[1]).substr(0, 5);
			var dat = tgl + " " + monthNames[bln] + " " + thn + " " + time;
			return dat;
		} else {
			return "";
		}

	}
</script>