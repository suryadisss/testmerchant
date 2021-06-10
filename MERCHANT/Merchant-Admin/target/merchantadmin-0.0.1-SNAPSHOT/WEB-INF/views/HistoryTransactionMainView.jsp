<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Riwayat Transaksi" />
	<jsp:param name="datatables" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
	<jsp:param name="jquerydatepicker" value="1" />
	<jsp:param name="noityjs" value="1" />
</jsp:include>
<style>
.hide{display:none}
.searchclass{text-align:right;padding :15px 15px 15px 15px}
</style>
<body id="body" class="nav-md">
	<div class="container body">
		<div class="main_container">

			<jsp:include page='_Side_Navigation.jsp' />
			<jsp:include page='_Top_Navigation.jsp' />


			
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
						<form id="formInput">
						<div class="row" style="margin-left:10%" >
					
							<div class="form-group">
										<label for="prd_code" class="col-sm-3 control-label">Tanggal
											Transaksi</label>
										<div class="col-sm-7">
											<div class="form-inline">
												<div class="form-group">
													<input type="text" class="form-control datepicker11"
														autocomplete="off" maxlength="10"
														data-date-format="YYYY-MM-DD" required id="transaction_start_date"
														name="transaction_start_date">
												</div>
												<div class="form-group" style="width: 12%">
													<span class="input-group-addon" id="basic-addon1">Sampai</span>
												</div>
												<div class="form-group">
													<input type="text" class="form-control datepicker11"
														autocomplete="off" maxlength="10"
														data-date-format="YYYY-MM-DD" required id="transaction_end_date"
														name="transaction_end_date">
												</div>
												
											</div>

										</div>
									</div>
									<br>
									
									<div class="form-group">
										<label for="prd_code" class="col-sm-3 control-label">Tanggal
											Settlement</label>
										<div class="col-sm-7">
											<div class="form-inline">
												<div class="form-group">
													<input type="text" class="form-control datepicker11"
														autocomplete="off" maxlength="10"
														data-date-format="YYYY-MM-DD" required id="settlement_start_date"
														name="settlement_start_date">
												</div>
												<div class="form-group" style="width: 12%">
													<span class="input-group-addon" id="basic-addon1">Sampai</span>
												</div>
												<div class="form-group">
													<input type="text" class="form-control datepicker11"
														autocomplete="off" maxlength="10"
														data-date-format="YYYY-MM-DD" required id="settlement_end_date"
														name="settlement_end_date">
												</div>
												
											</div>

										</div>
									</div>
									<br>
									
									<div class="form-group">
										<label for="prd_name" class="col-sm-3 control-label">Nama Toko</label>
										<div class="col-sm-4">
											<input class="form-control" type="text" id="store_name"
												required="required" name="store_name"
												style="width: 90%; ">
										</div>
									</div>
									<br>
									
									<div class="form-group">
										<label for="prd_name" class="col-sm-3 control-label">Status</label>
										<div class="col-sm-4">
											<input class="form-control" type="text" id="status"
												required="required" name="status"
												style="width: 90%; ">
										</div>
									</div>
									<br>
									<div class="form-group">
										<label for="prd_name" class="col-sm-3 control-label">Nomor Rekening</label>
										<div class="col-sm-4">
											<input class="form-control" type="text" id="rekening_number"
												 name="rekening_number"
												style="width: 90%; ">
										</div>
									</div>
									</div>
									<div class="row">
									<br>
									<div class="searchclass">
									<button id="downloadButton" class="btn btn-success">Download</button>
									<button id="searchButton" type="submit"class="btn btn-primary">Search</button>
									</div>
									</div>
									</form>
									<hr>
									<div class="row hide" id="tableHistory" >
										<table class="table table-hover" id="tableprmcol"
									width="100%">
									<thead>
										<tr>
											<td width="15%">Tanggal Transaksi</td>
											<td width="15%">Tanggal Settlement</td>
											<td width="15%">Nama Toko</td>
											<td width="15%">Kode Transaksi</td>
											<td width="15%">Total Settlement</td>
											<td width="15%">Status</td>
											<td width="15%">Nomor Rekening</td>
											
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
$("#formInput")
.submit(
		function(e) {
			var url = "${local_server}/Merchant/list";
			

			$
					.ajax({
						type : "POST",
						url : url,
						data : $("#formInput")
								.serialize(),
						cache: false,
						beforeSend: function () {
							
							
							
							
						},
						complete : function(xhr, status) {
							$("#tableHistory").removeClass("hide");
							
							
							var data = JSON.parse(xhr.responseText);
							
							mdata=data.data;
							$('#tableprmcol').DataTable().destroy();
								
								$('#tableprmcol').dataTable({
									data:mdata,
									
									columns: [{
										"width": "10%",
										data: 'trx_date',
									},{
										"width": "10%",
										data: 'settle_date',
									}, {
				                        data: "merchant_name",
				                        
				                      },{
				                        data: "trx_code",
				                        
				                      },{
				                        data: "settle_amount",
				                        
				                      },{
				                    	  "width": "10%",
					                        data: "status",
					                        
					                  },{
					                    	  "width": "10%",
						                        data: "trx_norek", 
						              }]

									

								});
							
						}
					});
			e.preventDefault();
		});
	$(document)
			.ready(
					function() {
						
						$('.datepicker11').datetimepicker({

						});
						
						 
						
						

						

						

						

					});
	
	

	

	function getDetailPayment(val) {
		var response = $.ajax({
			type : "GET",
			url : "${local_server}/billing_single/getbillsingle/" + val,
			async : false,
			success : function(data) {
				console.log(data)
			}
		}).responseText;
		var dt = JSON.parse(response);
		$.each(dt.data, function(i, o) {
			$.each(o.loan[0], function(i, o) {
				var TagHtml = "#" + i
				if (checkExists(String(TagHtml))) {
					o = (i == "lbi_req_date") ? o.substr(0, 10) : o;
					$(String(TagHtml)).val(o);

				}
			});
			$.each(o.profile[0], function(i, o) {
				var TagHtml = "#" + i
				if (checkExists(String(TagHtml))) {
					$(String(TagHtml)).val(o);
				}
			});
		});

	}

	/* function generateDatatables() {
		var response = $.ajax({
			type : "GET",
			url : "${local_server}/billing_single/getbillsingle",
			async : false,
			success : function(data) {
				console.log(data)
			}
		}).responseText;
		var dt = JSON.parse(response);
		var data = [], x = 0;
		if (dt.success = true) {
			$.each(dt.data, function(i, o) {
					obj.lst_id = o.lst_id;
					obj.lst_acc_no = o.lst_acc_no;
					obj.lst_period = o.lst_period;
					obj.lst_month = o.lst_month;
					obj.lst_total_amount = o.lst_total_amount;
					obj.pdi_req_date = o.lbi_req_date;
					obj.status = o.status;
					obj.cst_name = o.cst_name
				data[x] = obj;
				x++;

			});
		}

		return data;
	} */
	function checkExists(sel) {
		var status = false;
		if ($(sel).length)
			status = true;
		return status;
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
			ang[1] = (ang[1] != null) ? "." + ang[1] : ".00"
			return '' + rev2.split('').reverse().join('') + ang[1];
		} else {
			return '0.00'
		}

	}
</script>

</html>