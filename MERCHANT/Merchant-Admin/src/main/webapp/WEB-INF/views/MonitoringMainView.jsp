<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Monitoring" />
	<jsp:param name="datatables" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
	<jsp:param name="noityjs" value="1" />
</jsp:include>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">

			<jsp:include page='_Side_Navigation.jsp' />
			<jsp:include page='_Top_Navigation.jsp' />
			
			<div class="modal fade" id="myModalView" tabindex="-1" role="dialog"
				aria-labelledby="myModalViewLabel">
				<div class="modal-dialog modal-md" role="document">
					<div class="modal-content">
						<div class="modal-header">
								<h4 class="modal-title" id="myModalViewLabel">Modal title</h4>
						</div>
						<form id="formConnection" class="form-horizontal form-label-left">
						<input id="con_id" name="con_id" type="hidden">
						<div class="modal-body">															
								<div class="form-group">
									<label class="control-label col-md-3 col-sm-3 col-xs-12">Lokasi server</label>
									<div class="col-md-9 col-sm-9 col-xs-12">
									  <input id="con_server_location" name="con_server_location"  autocomplete="off" type="text" class="form-control" placeholder="IP Address">
									</div>
								</div>
								
								<div class="form-group">
									<label class="control-label col-md-3 col-sm-3 col-xs-12">Port</label>
									<div class="col-md-9 col-sm-9 col-xs-12">
									  <input id="con_port" name="con_port" type="text" autocomplete="off" class="form-control" placeholder="Port">
									</div>
								</div>
								
								<div class="form-group">
									<label class="control-label col-md-3 col-sm-3 col-xs-12">Nama Database</label>
									<div class="col-md-9 col-sm-9 col-xs-12">
									  <input id="con_database_name" name="con_database_name" autocomplete="off" type="text" class="form-control" placeholder="Database Name">
									</div>
								</div>
								
								<div class="form-group">
									<label class="control-label col-md-3 col-sm-3 col-xs-12">ID Pengguna</label>
									<div class="col-md-9 col-sm-9 col-xs-12">
									  <input id="con_userid" name="con_userid" type="text" class="form-control"  autocomplete="off" placeholder="ID Pengguna">
									</div>
								</div>
								
								<div class="form-group">
									<label class="control-label col-md-3 col-sm-3 col-xs-12">Kata sandi</label>
									<div class="col-md-9 col-sm-9 col-xs-12">
									  <input id="con_password" name="con_password" type="password"  autocomplete="off" class="form-control" placeholder="Password">
									</div>
								</div>
								
								<div class="form-group">
									<label class="control-label col-md-3 col-sm-3 col-xs-12">Ukuran maksimal pool</label>
									<div class="col-md-9 col-sm-9 col-xs-12">
									  <input id="con_max_pool_size" name="con_max_pool_size" autocomplete="off" type="text" class="form-control" placeholder="Max Pool Size">
									</div>
								</div>
															
							
						</div>
						<div class="modal-footer">
								<button type="button" id="btnTestConnection" class="btn btn-success"><i class='fa fa-database'></i> Tes Koneksi</button>
								<button class="btn btn-default" data-dismiss="modal">Tutup</button>
								<button type="submit" id="btnUpdateConnection" class="btn btn-primary">Ubah</button> 
						</div>
						</form>
					</div>
				</div>
			</div>
					
			<div class="right_col" role="main">
				<div class="row">
					<div class="col-md-6 col-sm-6 col-xs-12">
						<!-- <button id="btnConf" class="btn btn-sm btn-warning"><i class='fa fa-gear'></i> Configuration</button> -->
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
	                	<div class="x_panel">
		                  <div class="x_title">
		                    <h2>Proses Sinkronisasi <small>&nbsp;</small></h2>
		                    <div class="clearfix"></div>
		                  </div>
		                  <div class="x_content">
		                    
		                    <table class="table table-bordered" style="width:100%">
		                    	<thead>
		                    		<tr>
		                    			<th style="width:30%">&nbsp;</th>
		                    			<th style="width:35%;text-align:center;"><b><span id="titlePGDkis">DKIS</span></b></th>
		                    			<th style="width:35%;text-align:center;"><b><span id="titlePG">Gerbang Pembayaran</span></b></th>
		                    		</tr>
		                    	</thead>
		                    	<tbody>
		                    		<tr>
			                  			<td><b>#Akun</b></td>
			                  			<td><span id="acc_spnPgDkis"></span></td>
			                  			<td><span id="acc_spnPg"></span></td>
			                  		</tr>
			                  		<tr>
			                  			<td><b>Ringkasan tagihan</b></td>
			                  			<td><span>Rp. </span><span id="sum_spnPgDkis" style="float:right;"></span></td>
			                  			<td><span>Rp. </span><span id="sum_spnPg" style="float:right;"></span></td>
			                  		</tr>
			                  		<tr>
			                  			<td><b>Tagihan maksimal</b></td>
			                  			<td><span>Rp. </span><span id="max_spnPgDkis" style="float:right;"></span></td>
			                  			<td><span>Rp. </span><span id="max_spnPg" style="float:right;"></span></td>
			                  		</tr>
			                  		<tr>
			                  			<td><b>Tagihan minimal</b></td>
			                  			<td><span>Rp. </span><span id="min_spnPgDkis" style="float:right;"></span></td>
			                  			<td><span>Rp. </span><span id="min_spnPg" style="float:right;"></span></td>
			                  		</tr>
			                  		<tr>
			                  			<td><b>Pengisian terakhir</b></td>
			                  			<td><span id="LC_spnPgDkis"></span></td>
			                  			<td><span id="LC_spnPg"></span></td>
			                  		</tr>
			                  		<tr>
			                  			<td><b>Pembayaran terakhir</b></td>
			                  			<td><span id="LP_spnPgDkis"></span></td>
			                  			<td><span id="LP_spnPg"></span></td>
			                  		</tr>	
		                    	</tbody>
		                  	</table>
		                    
		
		                  </div>
		                </div>
	              	</div>
	              	
	              	<!-- <div class="col-md-4 col-sm-4 col-xs-12">
	                	<div class="x_panel">
		                  <div class="x_title">
		                    <h2>Auto Retry <small>&nbsp;</small></h2>
		                    <div class="clearfix"></div>
		                  </div>
		                  <div class="x_content">
		                  		<form class="form-horizontal form-label-left">

								<div class="form-group">
									<label class="control-label col-md-5 col-sm-5 col-xs-12">Retry Tolerance</label>
									<div class="col-md-7 col-sm-7 col-xs-12">
									  <input type="text" class="form-control" placeholder="Times">
									</div>
								</div>
								
								<div class="form-group">
									<label class="control-label col-md-5 col-sm-5 col-xs-12">Retry Active</label>
									<div class="col-md-7 col-sm-7 col-xs-12">
									  <div class="checkbox">
			                            <label>
			                              <input type="checkbox" value=""> check to activated
			                            </label>
			                          </div>
									</div>
								</div>
								
								<div class="ln_solid"></div>
			                      <div class="form-group">
			                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
			                          <button type="submit" class="btn btn-sm btn-primary">Save</button>
			                          <button type="submit" class="btn btn-sm btn-success"><i class='fa fa-play'></i> Start</button>
			                        </div>
			                      </div>
																							
							</form>
							
		                  </div>
		                </div>
	              	</div> -->
	              						
				</div>
				
				<br />
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<button id="btnExportReversal" class="btn btn-sm btn-success" style="float:right"><i class='fa fa-download'></i> Unduh Pembalikan</button>
						<form id="downloadExcelForm" class="hidden" action="${local_server}/Monitoring/createFile/xlsx" target="_blank" method="POST">
								<input type="submit" id="btnSubmitExcel">
						</form>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-lg-12">
						<div class="x_panel">
							<div class="x_title">
			                    <h2 id="titleReversal">Pembalikan <small>&nbsp;</small></h2>
			                    <div class="clearfix"></div>
			                  </div>
							<div class="x_content">
								
								<table id="tblReversal" class="table table-hover" style="width:100%">
									<thead>
										<tr>
											<th>ID Pelanggan</th>
											<th>Virtual Account</th>
											<th>Jumlah</th>
											<th>Tanggal Pembalikan</th>
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
	<jsp:param name="title" value="Monitoring" />
	<jsp:param name="datatables" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
	<jsp:param name="noityjs" value="1" />
</jsp:include>

<script>
	
$(document).ready(function() {
	$("#tblReversal").dataTable({
		ajax: "${local_server}/Monitoring/getListReversal",
		"aaSorting": [],
		columns: [	{
						data : 'pay_order_id'
					},
					{
						data : 'pay_va_no'
					},
					{
						data : 'pay_amount',
						render : function(data,type, row) {
							//var amt = '<span style="float: right;">'+ toRp(row.pay_amount) +'</span>';
							var amt =  toRp(row.pay_amount);
							return amt;
						}
					},
					{
						data : 'pay_date',
						render : function(data,type, row) {
							var date =  convertDateAPI(row.pay_date);
							return date;
						}
					}]
		
	})
	
	loadMonitoring();
	
	$('#btnConf').on('click',function(e) {
		e.preventDefault(),
		$("#myModalViewLabel").html("Configuration <span class='label label-success'>Connection</span>"),
		$("#myModalView").modal({
			show: !0
		}),getDataConstring();
	});
	
	$("#btnExportReversal").click(function(e) {
		$("#downloadExcelForm").submit();	
	});
	
	$("#btnTestConnection").click(function(e) {
		$.ajax({
			type : "POST",
			url : "${local_server}/Monitoring/testConn",
			data : $("#formConnection").serialize(),
			cache : false,			
			beforeSend : function() {
				$("#btnTestConnection").html("<i class='fa fa-circle-o-notch fa-spin'></i> Test Connection");
			},
			success : function(res) {
				
				if(res.status ==  "Success") {
					$.alert(res.message);
				} else {
					$.alert(res.message);
				}
				
				$("#btnTestConnection").html("<i class='fa fa-database'></i> Test Connection");
			}
		});
	});
	
	$("#formConnection").submit(function(e) {
		$.ajax({
			type : "POST",
			url : "${local_server}/Monitoring/updateCon",
			data : $("#formConnection").serialize(),
			cache : false,			
			beforeSend : function() {
				$("#btnUpdateConnection").html("<i class='fa fa-circle-o-notch fa-spin'></i> Ubah");
			},
			success : function(res) {
				$("#btnUpdateConnection").html("Ubah");
				if(res.status ==  "Success") {
					$.confirm({
						title : res.status,
						content : res.message,
						buttons : {
							somethingElse : {
								text : 'OK',
								btnClass : 'btn-success',
								keys : [ 'enter' ],
								action : function() {										
									$("#myModalView").modal("hide");
									loadMonitoring();
								}
							}

						}
					});
				} else {
					$.alert(res.message);
				}
			}
		});
		return false;
	})
	
	
});

function loadMonitoring(){
	$.ajax({
		type : 'GET',
		url : "${local_server}/Monitoring/syncpgdkis",
		beforeSend : function() {
			load("Dkis");
		},
		success : function(res) {
			if(res.data.length > 0) {				
				syncpgdkis(res.data)
			}
		}
	});
	
	$.ajax({
		type : 'GET',
		url : "${local_server}/Monitoring/syncpg",
		beforeSend : function() {
			load("");
		},
		success : function(res) {
			if(res.data.length > 0) {				
				syncpg(res.data)
			}
		}
	});
}

function getDataConstring(){
	$.ajax({
		type : 'GET',
		url : "${local_server}/Monitoring/getDataCons",
		success : function(res) {
			if( Object.keys(res.data).length > 0) {				
				$("#con_id").val(res.data.id);
				$("#con_server_location").val(res.data.ip_address);
				$("#con_port").val(res.data.port);
				$("#con_database_name").val(res.data.database);
				$("#con_userid").val(res.data.user);
				$("#con_password").val(res.data.password);
				$("#con_max_pool_size").val(res.data.max_pool_size);
			}
		}
	});
}

function syncpgdkis(obj){	
	$("#acc_spnPgDkis").html(checkNull(obj[0].jml_account));
	$("#sum_spnPgDkis").html(toRp(obj[0].sum_bill));
	$("#max_spnPgDkis").html(toRp(obj[0].max_bill));
	$("#min_spnPgDkis").html(toRp(obj[0].min_bill));
	$("#LC_spnPgDkis").html(convertDateAPI(obj[0].last_charging));
	$("#LP_spnPgDkis").html(convertDateAPI(obj[0].last_payment));
	
	//$("#titlePGDkis").html("DKIS");
}

function syncpg(obj){
	
	$("#acc_spnPg").html(checkNull(obj[0].jml_account));
	$("#sum_spnPg").html(toRp(obj[0].sum_bill));
	$("#max_spnPg").html(toRp(obj[0].max_bill));
	$("#min_spnPg").html(toRp(obj[0].min_bill));
	$("#LC_spnPg").html(convertDateAPI(obj[0].last_charging));
	$("#LP_spnPg").html(convertDateAPI(obj[0].last_payment));
	
	//$("#titlePG").html("Payment Gateway");		
	
}

	
function checkNull(str) {
	var val = "";
	val = str == null ? "-":str;
	
	return val;
}

function toRp(angka) {
	if (angka == null) {
		return "0";
	} else {
		var rev = parseInt(angka, 10).toString().split('').reverse().join('');
		var rev2 = '';
		for (var i = 0; i < rev.length; i++) {
			rev2 += rev[i];
			if ((i + 1) % 3 === 0 && i !== (rev.length - 1)) {
				rev2 += ',';
			}
		}
		return '' + rev2.split('').reverse().join('') + '';
	}
}

function load(val) {	
	//$("#titlePG"+val).html("<i class='fa fa-circle-o-notch fa-spin'></i>");
	$("#acc_spnPg"+val).html("<i class='fa fa-circle-o-notch fa-spin'></i>");
	$("#sum_spnPg"+val).html("<i class='fa fa-circle-o-notch fa-spin'></i>");
	$("#max_spnPg"+val).html("<i class='fa fa-circle-o-notch fa-spin'></i>");
	$("#min_spnPg"+val).html("<i class='fa fa-circle-o-notch fa-spin'></i>");
	$("#LC_spnPg"+val).html("<i class='fa fa-circle-o-notch fa-spin'></i>");
	$("#LP_spnPg"+val).html("<i class='fa fa-circle-o-notch fa-spin'></i>");
}

function convertDateAPI(val) {
	if(val != null) {
		var monthNames = [ "Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli",
				"Agustus", "September", "Oktober", "November", "Desember" ];
		var value = new Date(val.replace(/(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3"));
		var tgl = value.getDate();
		var bln = value.getMonth(); //+1;
		var thn = value.getFullYear();
		var hou = value.getHours();
		var min = value.getMinutes();
		if(min < 10) {
			min = "0" + min;
		}
		var sec = value.getSeconds();
		if(sec < 10) {
			sec = "0" + sec;
		}
		var dat = tgl + " " + monthNames[bln] + " " + thn + " " + hou + ":" + min + ":" + sec;
		return dat;
	} else {
		return "-";	
	}
}

	
</script>