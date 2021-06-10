<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="External Connection Setting" />
	<jsp:param name="datatables" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
	<jsp:param name="jquerydatepicker" value="1" />
	<jsp:param name="noityjs" value="1" />
	<jsp:param name="treemenu" value="1" />
	<jsp:param name="ass" value="1" />

</jsp:include>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">

			<jsp:include page='_Side_Navigation.jsp' />
			<jsp:include page='_Top_Navigation.jsp' />

<!-- modal start -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<form id="formInput">
							<div class="modal-header">

								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Pengubahan</h4>
							</div>
							
							<div class="modal-body">
								<div class="form-horizontal">

									<div class="form-group">
										<label for="name" class="col-sm-3 control-label" style="text-align:left">
											Service Name</label>
										<div class="col-sm-9">
											<input type="text" name="service_name" id="service_name"
												class="form-control" required="required" />
										</div>
									</div>

									<div class="form-group">
										<label for="type" class="col-sm-3 control-label" style="text-align:left">
											Service Type</label>
										<div class="col-sm-9">
											<select name="service_type" id="service_type" class="form-control selectpicker" required="required">
											</select>
										</div>
									</div>
						<div id="db">
									<div class="form-group">
										<label for="dtbase" class="col-sm-3 control-label" style="text-align:left">
											Database</label>
										<div class="col-sm-9">
											<select name="dbase" id="dbase" class="form-control selectpicker" required="required">
												<option value="Oracle">Oracle</option>
												<option value="MsSQL">MsSQL</option>
												<option value="MySQL">MySQL</option>
												<option value="PostgreSQL">PostgreSQL</option>
											</select>
										</div>
									</div>
									
									<div class="form-group">
										<label for="constring" class="col-sm-3 control-label" style="text-align:left">
											Connection String</label>
										<div class="col-sm-9">
											<textarea type="text" name="constring" id="constring"
												class="form-control" required="required"></textarea>
										</div>
									</div>
									
									<div class="form-group">
										<label for="qry" class="col-sm-3 control-label" style="text-align:left">
											SQL Query</label>
										<div class="col-sm-9">
											<textarea type="text" name="qry" id="qry"
												class="form-control" required="required"></textarea>
										</div>
									</div>
									
									<div class="form-group">
										<label for="respdb" class="col-sm-3 control-label" style="text-align:left">Response</label>
										<div class="col-sm-9" style="border:thin solid #ccc; border-radius:3px; margin:10px">
											<table class="table table-sm" id="tblResp">
												<thead class="thead-light">
													<tr>
														<td>Field Name</td>
														<td>Mapping</td>
													</tr>
												</thead>
												<tbody id="tblRespDbBody"></tbody>
											</table>
										</div>
									</div>
									
									<div class="form-group">
										<div class="col-sm-12">
											<div><button id="btnValDb" class="btn btn-success btn-sm" onclick="cekValDb();return false;">Validate</button></div>
										</div>
									</div>
						</div>
						<div id="ws">
									<div class="form-group">
										<label for="url" class="col-sm-3 control-label" style="text-align:left">
											URL</label>
										<div class="col-sm-9">
											<input type="text" name="service_url" id="service_url"
												class="form-control" required="required" />
										</div>
									</div>
									
									<div class="form-group">
										<label for="method" class="col-sm-3 control-label" style="text-align:left">Method</label>
										<div class="col-sm-9">
											<select name="service_method" id="service_method" class="form-control selectpicker" required="required">
											</select>
										</div>
									</div>									
									
									<div class="form-group">
										<label for="test" class="col-sm-3 control-label" style="text-align:left">Header</label>
										<div class="col-sm-9" style="border:thin solid #ccc; border-radius:3px; margin:10px">
											<table class="table table-sm" id="tblHeader">
												<thead class="thead-light">
													<tr>
														<td></td>
														<td>Key</td>
														<td>Value</td>
													</tr>
												</thead>
												<tbody id="tblHeaderBody"></tbody>
											</table>
											<button class="btn btn-default btn-sm" onclick="createRowTable('h');return false;">Add</button>
										</div>
									</div>									
									
									<div class="form-group">
										<label for="test" class="col-sm-3 control-label" style="text-align:left">Data Test</label>
										<div class="col-sm-9" style="border:thin solid #ccc; border-radius:3px; margin:10px">
											<table class="table table-sm" id="tblTest">
												<thead class="thead-light">
													<tr>
														<td></td>
														<td>Key</td>
														<td>Value</td>
													</tr>
												</thead>
												<tbody id="tblTestBody"></tbody>
											</table>
											<button class="btn btn-default btn-sm" onclick="createRowTable('d');return false;">Add</button>
										</div>
									</div>
									
									<div class="form-group">
										<div class="col-sm-12">
											<div><button id="btnVal" class="btn btn-success btn-sm" onclick="cekVal();return false;">Validate</button></div>
										</div>
									</div>
									
									<hr/>
									
									<div class="form-group">
										<label for="req" class="col-sm-3 control-label" style="text-align:left">Permintaan</label>
										<div class="col-sm-9" style="border:thin solid #ccc; border-radius:3px; margin:10px">
											<table class="table table-sm" id="tblReq">
												<thead class="thead-light">
													<tr>
														<td>Key</td>
														<td>Mapping</td>
													</tr>
												</thead>
												<tbody id="tblReqBody"></tbody>
											</table>
										</div>
									</div>
									
									<div class="form-group">
										<label for="resp" class="col-sm-3 control-label" style="text-align:left">Response</label>
										<div class="col-sm-9" style="border:thin solid #ccc; border-radius:3px; margin:10px">
											<table class="table table-sm" id="tblResp">
												<thead class="thead-light">
													<tr>
														<td>Key</td>
														<td>Mapping</td>
													</tr>
												</thead>
												<tbody id="tblRespBody"></tbody>
											</table>
										</div>
									</div>
								</div>									
								</div>
							</div>
							
							<div class="modal-footer">
								<button type="submit" id="submit" class="btn btn-primary">Simpan Perubahan</button>							
								<button class="btn btn-default" data-dismiss="modal">Tutup</button>
							</div>
						</form>
					</div>
				</div>
			</div>
<!-- modal end -->
			<div class="right_col" role="main">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-lg-12d">
						<div class="x_panel">
							<div class="x_title">
								<h2>External Connection Setting</h2>
								<ul class="nav navbar-right panel_toolbox">
									
								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<button class="btn btn-sm btn-primary" id="addnew">Add New</button>
								<table class="table" id="tableparam">
									<thead>
										<tr>
											<td>Service Name</td>
											<td>Service Type</td>
											<td>Date Modified</td>
											<td width="5%">Action</td>
										</tr>
									</thead>
								</table>
						</div></div>
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
	<jsp:param name="ass" value="1" />
</jsp:include>

<script>
	function getDetail(id){
		$.get("${local_server}/ext_conn/list/" + id, function(data) {
			var x = JSON.parse(data);
			//console.log(x.data[0].detail[0]);
			$.each(x.data[0].detail[0], function(i, o) {
				if (i == "con_name") $("#service_name").val(o);
				if (i == "con_type") {
					getType(o);
				}
				if (i == "con_url") $("#service_url").val(o);
				if (i == "con_method") {
					getMethod(o);
				}
				//$("#" + i).val(o);
			});
			
			if($("#service_type").val() == 'Json Webservice'){
				$("#ws").show();
				$("#db").hide();
			}else{
				$("#ws").hide();
				$("#db").show();
			}			
			
		});
	}
	
	function getType(o){
		var opt="";
		var item = ['DB Connection','Json Webservice'];
		$.each(item, function(k,v){
			var sel = (v == o) ? "selected" : "";
			opt += "<option value='"+v+"' "+sel+">"+v+"</option>";
		});
		$("#service_type").empty().append(opt).selectpicker("refresh");
	}
	
	function getMethod(o){
		var opt="";
		var item = ['POST','GET'];
		$.each(item, function(k,v){
			var sel = (v == o) ? "selected" : "";
			opt += "<option value='"+v+"' "+sel+">"+v+"</option>";
		});
		$("#service_method").empty().append(opt).selectpicker("refresh");
	}
	
	function createRowTable(a) {
		if(a=='d'){
			var rowCount = $('#tblTest >tbody >tr').length;
		}else{
			var rowCount = $('#tblHeader >tbody >tr').length;
		}
			
		var str = "";
		var xc = "<button type='button' onclick='deleteRow(this,"+rowCount+");return false;' class='btn btn-danger btn-xs'><i class='fa fa-times'></i></button>";
		str += "<tr><td>"+xc+"</td><td><input type='text' id='testKey_"+a+"' name='testKey_"+a+"' class='form-control' required/></td>";
		str += "<td><input type='text' id='testValue_"+a+"' name='testValue_"+a+"' class='form-control' required/></td></tr>";
		
		if(a=='d'){
			$("#tblTestBody").append(str);
		}else{
			$("#tblHeaderBody").append(str);
		}
	}
	
	function deleteRow(idTable, row) {
		var row = idTable.parentNode.parentNode;
		row.parentNode.removeChild(row);
	}	
	
	function cekValDb(){
		$("#tblRespDbBody").empty();
		
		$.ajax({
				type: 'POST',
				url: '${local_server}/ext_conn/execdb',
				data: $("#formInput").serialize(),
			
				beforeSend: function(){
					$('#btnValDb').prop('disabled',true);
				},
				success:function(response){
					$('#btnValDb').prop('disabled',false);
					//console.log(response);
					var optdb=""; var tmpdb="";
					tmpdb += "";
					
					var h =response.result.length;

					/* tablenya response - start */
					if(h>0){	
					$.each(response.result[0],function(i,o){	
						tmpdb += "<tr>";
						tmpdb += "<td><label>"+i+"</label></td>";
						tmpdb += "<td>";
						tmpdb += "<select id='ddlParam' name='ddlParam' data-show-subtext='true' data-live-search='true' class='selectpicker selDb' required='required'></select>";
						tmpdb += "</td>";
						tmpdb += "</tr>";
					});
					
					$("#tblRespDbBody").append(tmpdb);
					/* tablenya response - end */				
						
						/* isi data dropdown dari en master - start */
						$.get("${local_server}/ext_conn/ddl/", function(data) {
							var x = JSON.parse(data);
							//console.log(x.data);
							
							var opt="";
							$.each(x.data, function(i, o) {
									opt += "<option value='"+o.map_field_name+"'>"+o.map_field_name+"</option>";
							});
							
							$(".selDb").empty().append(opt).selectpicker("refresh");
						});		
						/* isi data dropdown dari en master - end */						
					}
				}
		 });
	}
	
	function cekVal(){		
		var z = document.getElementsByName('testKey_d');
		var i;
		var tmp = "";
		$("#tblReqBody").empty();
		$("#tblRespBody").empty();
		
		/* tablenya request - start */
		for(i=0; i<z.length; i++){
			tmp += "<tr>";
			tmp += "<td><label>"+z[i].value+"</label></td>";
			tmp += "<td>";
			tmp += "<select id='ddlParam' name='ddlParam' data-show-subtext='true' data-live-search='true' class='selectpicker selZzz' required='required'></select>";
			tmp += "</td>";
			tmp += "</tr>";
		}
		
		$("#tblReqBody").append(tmp);
		/* tablenya request - end */
		

		 $.ajax({
			type: 'POST',
			url: '${local_server}/ext_conn/val',
			data: $("#formInput").serialize(),
		
			beforeSend: function(){
				$('#btnVal').prop('disabled',true);
			},
			success:function(response){
				//console.log(response);
				$('#btnVal').prop('disabled',false);
				var optz=""; var tmpz="";
				tmpz += "";
				
				var h =response.data.length;

				/* tablenya response - start */
				if(h>0){	
				$.each(response.data[0],function(i,o){	
					tmpz += "<tr>";
					//tmpz += "<td><select id='ddlResp' name='ddlResp' data-show-subtext='true' data-live-search='true' class='selectpicker selZ' required='required'></select></td>";
					tmpz += "<td><label>"+i+"</label></td>";
					tmpz += "<td>";
					tmpz += "<select id='ddlParam' name='ddlParam' data-show-subtext='true' data-live-search='true' class='selectpicker selZzz' required='required'></select>";
					tmpz += "</td>";
					tmpz += "</tr>";
				});
				
				$("#tblRespBody").append(tmpz);
				/* tablenya response - end */				
				
					$.each(response.data[0],function(i,o){
						optz += "<option value='"+i+"'>"+i+"</option>";
					});
					$(".selZ").empty().append(optz).selectpicker("refresh");
				}
				
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
				console.log(errorThrown);
			}
		});
		
			/* isi data dropdown dari en master - start */
			$.get("${local_server}/ext_conn/ddl/", function(data) {
				var x = JSON.parse(data);
				//console.log(x.data);
				
				var opt="";
				$.each(x.data, function(i, o) {
						opt += "<option value='"+o.map_field_name+"'>"+o.map_field_name+"</option>";
				});
				
				$(".selZzz").empty().append(opt).selectpicker("refresh");
			});		
			/* isi data dropdown dari en master - end */		

	}
	
	$(document)
			.ready(
					function() {
						$('#btnVal').prop('disabled',false);
						
						$('#tableparam')
								.DataTable(
										{
											ajax : {
												url : '${local_server}/ext_conn/list',
											},
											paging: false,
											columnDefs: [{
												targets: [3], orderable: false
											}],
											bInfo: false,
											columns : [
													{

														data : 'con_name'
													},

													{
														data : 'con_type'
													},
													{
														render: function(data,type,row){
															return row.con_date;
														}
													},
													{
														render : function(data,
																type, row) {
															var edit = '';

															edit = '<button class="edit btn btn-xs btn-success" id="'+row.con_id+'" value="'+row.con_id+'"><i class=" fa fa-edit"></i> '
																	+ '</button>';

															return edit;
														}

													} ]

										});
						
						$('#tableparam')
						.on(
								"click",
								"button.edit",
								function() {
									$("#myModalLabel")
									.html(
											"External Connection Setting <span class='label label-default'>Pengubahan</span>");
									$("#myModal").modal("show");									
									$("#formInput")[0].reset();
									getDetail(this.id);
								});
						
						$("#addnew")
						.on(
								"click",
								function() {
									$("#myModalLabel")
											.html(
													"External Connection Setting <span class='label label-default'>New</span>");

									$("#myModal").modal("show");
									$("#formInput")[0].reset();
									getType("");
									getMethod("");
									$("#service_type").val("Json Webservice").change(); //default
								});						
						
						$("#service_type")
						.on(
							"change",
							function(){
								if(this.value == 'Json Webservice'){ 
									$("#ws").show();
									$("#db").hide();
								}
								else{
									$("#ws").hide();
									$("#db").show();
								}
							}
						);
						/*
						$("#formInput")
						.submit(
								function(e) {

									$.ajax({
												type : "POST",
												url : "${local_server}/ext_conn/insert",
												data : $(this)
														.serialize(),
												cache : !1,
												beforeSend : function() {
													$('button[type=submit]').prop('disabled',true);
												},
												complete : function(){
													$('button[type=submit]').prop('disabled',false);													
												}
											});
								});
						*/
					});
</script>

</html>

