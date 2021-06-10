<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Job Log" />
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
						<form id="formInput">
							<input type="hidden" name="new_edit_status" id="new_edit_status" />
							<input type="hidden" name="rul_id" id="rul_id" />
							<div class="modal-header">

								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Log Detail</h4>
							</div>
							<div class="modal-body">
							<!-- 	<table width="100%">
									<tr>
										<td width="30%" valign="top">Job</td>
										<td valign="top">:</td>
										<td valign="top"><span id="lgd_job"></span></td>
									</tr>
									<tr>
										<td valign="top">Process</td>
										<td valign="top">:</td>
										<td valign="top"><span id="lgd_process"></span></td>
									</tr>
									<tr>
										<td valign="top">Start Date</td>
										<td valign="top">:</td>
										<td valign="top"><span id="lgd_start_date"></span></td>
									</tr>
									<tr>
										<td valign="top">End Date</td>
										<td valign="top">:</td>
										<td valign="top"><span id="lgd_end_date"></span></td>
									</tr>
									<tr>
										<td valign="top">Estimate</td>
										<td valign="top">:</td>
										<td valign="top"><span id="lgd_estimate"></span></td>
									</tr>
									<tr>
										<td valign="top">Status</td>
										<td valign="top">:</td>
										<td valign="top"><span id="lgd_status"></span></td>
									</tr>
									<tr>
										<td valign="top">Message</td>
										<td valign="top">:</td>
										<td valign="top">
											<textarea id="lgd_message" readonly="readonly" rows="" cols="" style=" width: 100%;
									  height: 150px;
									  padding: 12px 20px;
									  box-sizing: border-box;
									  border: 2px solid #ccc;
									  border-radius: 4px;
									  background-color: #f8f8f8;
									  resize: none;"></textarea>
										
										
										</td>
									</tr>
									
								</table> -->
							
							<table class="table table-bordered" id="tableDetJob" width="100%">
								<thead>
									<tr>
										<td>Job</td>
										<td>Sub Job</td>
										<td>Start Date</td>
										<td>End Date</td>
										<td>Action</td>
									</tr>
								</thead>
							
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
					<div class="col-md-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>Job Log</h2>
								<ul class="nav navbar-right panel_toolbox">

								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
							
								<div class="col-xs-12 col-sm-12 col-lg-12"
									style="background: #f7f8f9; border: 1px solid #eff0f2; margin-bottom: 50px;">
											<form id="formLog" autocomplete="off">
											<fieldset class="form-inline pull-right">

											<div class="form-group">
												<label for="staticEmail2" class="sr-only">Email/Surel</label><select
													id="cmbRpt" name="job" class="form-control">
													
												</select>
											</div>
											<div class="form-group mx-sm-2 divdate">
												<input type="hidden" id="offset" name="offset" value="0">
												<input type="hidden" id="limit" name="limit" value="10">
												<label for="inputPassword2" class="sr-only">Start</label> <input
													type="text" class="form-control datepicker11"
													placeholder="Dari Tanggal" name="date_from" id="date_from"
													title="(YYYY-MM-DD)" data-date-format="YYYY-MM-DD" />
											</div>
											<div class="form-group mx-sm-2 divdate">
												<label for="inputPassword2" class="sr-only">End</label> <input
													type="text" class="form-control datepicker11"
													placeholder="To Date" name="date_to" title="(YYYY-MM-DD)"
													id="date_to" data-date-format="YYYY-MM-DD" />
											</div>

											<div class="form-group mx-sm-4 divbu hide">
												<label for="inputPassword2" class="sr-only">Bussines
													Unit</label><select style="width: 400px;" class="form-control"
													name="business_unit" id="business_unit"></select>
											</div>
											<div class="form-group mx-sm-3">
												<label for="inputPassword2" class="sr-only">Password</label>
												<button type="submit" id="btnShow" class="btn btn-primary "
													style="margin-top: 5px;">Show Log</button>
											</div>
										</fieldset>
									</form>
								</div>
								<div id="showlog" class="hide">
									<table class="table table-bordered" id="tblJob">
										<thead>
											<tr>
												<td>Start Date</td>
												<td>End Date</td>
												<td>Job</td>
												<td>Start By</td>
												<td>Estimate</td>
												<td>Action</td>
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
	<jsp:param name="title" value="Disbursement" />
	<jsp:param name="datatables" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
	<jsp:param name="jquerydatepicker" value="1" />
	<jsp:param name="noityjs" value="1" />
</jsp:include>

<script>


$("#formLog").submit(function(e){
	
	 $.ajax({
         type: "POST",
         url: "${local_server}/system/listLogJob",
         data: $(this).serialize(),
         dataType:"json",
         beforeSend:function(){
      	   $("#btnShow").prop("disabled",true).html("<i class='fa fa-circle-o-notch fa-spin'></i>");
      	   
         },
         success:function(data){
        	  $("#btnShow").prop("disabled",false).html("Show Log");
        	  
        	  if(data.status == "Success"){
        		  
        		  generateDttables(data.data);
        		  
        		  
        		  
        		  
        	  }
        	  
         }
        
     });
         
	
	e.preventDefault();
})

function generateDttables(mdata){
	
	$("#showlog").removeClass("hide");
	
	$('#tblJob')
	.DataTable().destroy();
	$('#tblJob')
	.DataTable(
			{
				data   : mdata,
				order : [[0,'desc']],
				columns : [
						{

							data : 'lg_start_date',
							render : function(data,
									type, row) {
								return String(data).replace("T"," ").split(".")[0];
							}
						},
						{
							data : 'lg_end_date',
							render : function(data,
									type, row) {
								
								return String(data).replace("T"," ").split(".")[0];
							}
						},
						{	
							data : 'job',
							render : function(data,
									type, row) {

								return data;
							}
						},
						{	
							data : 'lg_start_by',
							render : function(data,
									type, row) {

								return data;
							}
						},
						{	
							data : 'job_estimate',
							render : function(data,
									type, row) {

								return data;
							}
						},
						{
							render : function(data,
									type, row) {
								var edit = "";

								edit = '<button class="details-control btn btn-xs btn-success" id="'+row.lg_id+'" value="'+row.lg_id+'" >Rincian Tugas</button>';

								return edit;
							},
							orderable : false
						} ]

			});
}


function generateJobList(){
	
	
	 $.ajax({
         type: "GET",
         url: "${local_server}/system/ListJob",
         dataType:"json",
         success: function(data) {
        	 var h = "<optgroup label='Select All'><option value='0'>All Job</option><optgroup>";
        	 h+= "<optgroup label='Select One'>";
        	 $.each(data.data, function(i,o){
        		 h += "<option value='"+o.id+"'>"+o.job+"</option>"
        	 });
        	 h+= "</optgroup>";
        	 $("#cmbRpt").empty().append(h);
         }
         
	 });
}


	function getDetailLog(id){
		 $.ajax({
	         type: "GET",
	         url: "${local_server}/system/listLogJob/"+id,
	         dataType:"json",
	         success: function(xdata) {
	        		/* $.each(data.data[0], function(i,o){
	        			 o = (i == "lgd_start_date" || i == "lgd_end_date")?String(o).replace("T"," ").split(".")[0]:o;
		        		 $("#"+i).html(o);
		        		  $("#"+i).val(o);
		        	 })*/
		        	 
		        	
		        	 $('#tableDetJob')
						.DataTable().destroy();
		        	 $('#tableDetJob')
						.DataTable(
								{
									data : xdata.data,
									order : [ [ 2, 'asc' ] ],
									columns : [
											{

												data : 'lgd_job',
												render : function(data,
														type, row) {
													return data;
												}
											},
											{
												data : 'lgd_process',
												render : function(data,
														type, row) {

													return data;
												}
											},
											{


												data : 'lgd_start_date',
												render : function(data,
														type, row) {

													return String(data).replace("T"," ").split(".")[0];
												}
											},
											{
												data : 'lgd_end_date',
												render : function(data,
														type, row) {

													return String(data).replace("T"," ").split(".")[0];
												}
											},
											{
												render : function(data,
														type, row) {
													var edit = "";

													edit = '<button class="details-control btn btn-xs btn-success" id="'+row.lgd_id+'" value="'+row.lgd_id+'" >Detail Sub Job</button>';

													return edit;
												},
												orderable : false
											} ]

								});
		        	 
		        	 
		        	 
		        	 
	        	 
	         	}
	         
		 });
	}
	
	function format(d) {

		var sta = "";

		if (d.status == 1) {
			sta = "<span class='label label-success'>Running Job</i>";
		} else if (d.status == 0) {
			sta = "<span class='label label-default'>Preparing to Process</i>";
		}
		var clr = (d.status == 1) ? "#eaffc1" : "#fbfcf9";
		var dwn = "";
		dwn = '<table  width="100%" style="padding-left:50px;" class="table table-bordered">'
				+ '<tr>' 
				+ '<td width="30%">Job Name</td>'
				+ '<td>' + chckVl(d.lgd_job) + '</td>' 
				+ '</tr>'
				
				+ '<tr>' 
				+ '<td width="30%">Sub Job Name</td>'
				+ '<td>' + chckVl(d.lgd_process) + '</td>' 
				+ '</tr>'
				
				+ '<tr>' 
				+ '<td width="30%">Start Date</td>'
				+ '<td>' + chckVl(String(d.lgd_start_date).replace("T"," ").split(".")[0]) + '</td>' 
				+ '</tr>'
				
				+ '<tr>' 
				+ '<td width="30%">End Date</td>'
				+ '<td>' + chckVl(String(d.lgd_end_date).replace("T"," ").split(".")[0]) + '</td>' 
				+ '</tr>'
				
				+ '<tr>' 
				+ '<td width="30%">Running Estimate</td>'
				+ '<td>' + chckVl(d.lgd_estimate) + '</td>' 
				+ '</tr>'
				+ '<tr>' 
				+ '<td width="30%">Status</td>'
				+ '<td>' + chckVl(d.lgd_status) + '</td>' 
				+ '</tr>'
				
				+ '<tr>' 
				+ '<td width="30%">Message</td>'
				+ '<td>' + chckVl(d.lgd_message) + '</td>' 
				+ '</tr>'
				
		
		dwn += '</table>';

		return dwn;
	}
	function chckVl(a) {
		return (a != null && a != "null") ? a : "";
	}
	
	function formatAlert(d){
		$.confirm({
		    title: 'Detail Sub Job',
		    content: format(d),
		    buttons: {
		        somethingElse: {
		            text: 'OK',
		            btnClass: 'btn-blue',
		            keys: ['enter', 'shift'],
		            action: function(){
		            }
		        }
		    }
		});
	}
		 
		 
	$(document)
			.ready(
					function() {
						generateJobList();
						$('.datepicker11').datetimepicker({
				            useCurrent: false
				        });
						$('#tableDetJob')
						.on(
								'click',
								'button.details-control',
								function() {
									var table = $("#tableDetJob").DataTable();
									var tr = $(this).closest('tr');
									var row = table.row(tr);
									formatAlert(row.data());
									
									/*if (row.child.isShown()) {
										// This row is already open - close it
										row.child.hide();
										tr.removeClass('shown');
										$("#" + this.id)
												.html(
														"<i class='fa fa-chevron-circle-down'></i> Detail Job");
									} else {
										// Open this row
										row.child(format(row.data()))
												.show();
										tr.addClass('shown');
										$("#" + this.id)
												.html(
														"<i class='fa fa-chevron-circle-up'></i> Detail Job");

									}*/
									
									return false;
								});
						
						$("#tblJob").on("click","button.details-control", function(i,e){
							$("#myModal").modal("show");
							getDetailLog(this.id);
						});
				
						$("#btnEOD")
								.on(
										"click",
										function() {
											$
													.confirm({
														title : 'Confirm',
														content : 'Are you sure you want to do EOD(End of Day) Disbursement ?',
														buttons : {
															cancel : function() {
																$
																		.alert('Canceled');
															},
															somethingElse : {
																text : 'Yes',
																btnClass : 'btn-success',
																keys : [ 'enter' ],
																action : function() {
																	$
																			.alert('Something else?');
																}
															}
														}
													});
										});
					});
	
	

	 
	 
</script>

</html>

