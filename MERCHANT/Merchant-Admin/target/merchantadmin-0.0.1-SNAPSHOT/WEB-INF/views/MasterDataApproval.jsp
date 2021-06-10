<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Master Data" />
	<jsp:param name="datatables" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
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
							<input type="hidden" name="new_edit_status" id="new_edit_status" />
							<input type="hidden" name="map_id" id="map_id" />
							<div class="modal-header">

								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							</div>
							<div class="modal-body">
								<div class="form-horizontal">

									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Nama Kolom</label>
										<div class="col-sm-6">
											<input type="text" name="map_field_name" id="map_field_name"
												class="form-control" disabled="disabled" />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Deskripsi Kolom</label>
										<div class="col-sm-6">
											<input type="text" name="map_field_desc" id="map_field_desc"
												class="form-control" disabled="disabled" />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Tipe</label>
										<div class="col-sm-6">
											<input type="text" t name="map_type" id="map_type"
												class="form-control" disabled="disabled" /> <input
												type="hidden" id="tmpOut" name="tmpOut" />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Formula</label>
										<div class="col-sm-6">
											<textarea name="map_formula" id="map_formula"
												 disabled="disabled" rows="10" class="form-control" /></textarea>												
										</div>
									</div>

									<div class="form-group">
										<label for="map_level" class="col-sm-4 control-label">Level
										</label>
										<div class="col-sm-6">
											<select name="map_level" id="map_level" class="form-control" disabled="disabled">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
											</select>
										</div>
									</div>
								</div>


							</div>
							<div class="modal-footer">
								<button class="btn btn-default" data-dismiss="modal">Tutup</button>
								<button type="submit" id="submit" class="btn btn-primary">Disetujui</button>
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
								<h2>Manajemen Master Data</h2>
								
								<div class="clearfix"></div>
							</div>
							<div class="x_content">							


								<table id="MasterDataTable" class="table table-hover"
									width="100%">
									<thead>
										<tr>
											<td width="10%">Nama kolom</td>
											<td width="20%">Deskripsi</td>
											<td width="25%">Formula</td>
											<td width="15%">Tipe</td>
											<td width="10%">Status</td>
											<td width="10%">Status Aktivasi</td>
											<td width="10%">Tindakan</td>
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
	<jsp:param name="datatables" value="1" />
	<jsp:param name="validate" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
</jsp:include>
<script>
//function getDetailMasterData(e){$.get("${local_server}/master_data/getmaster/"+e,function(e){var a=e.data[0];$.each(a,function(e,a){var t=e;t="#"+t.replace(/\"/g,""),checkExists(String(t))&&("checkbox"===$(String(t))[0].type?$(String(t)).prop("checked",a):$(String(t)).val(a))})})}function deleteMasterData(e){var a=$.ajax({type:"GET",url:"${local_server}/master_data/delete/"+e,async:!1,success:function(e){return e.status}}).responseText;return a}function isUsed(e){var a;return a=1==e?'<span class="label label-default">Not Used</span>':'<span class="label label-success">Used</span>'}function checkExists(e){var a=!1;return $(e).length&&(a=!0),a}$(document).ready(function(){$("#formInput").submit(function(e){var a="master_data/dopost";$.ajax({type:"POST",url:a,data:$("#formInput").serialize(),cache:!1,complete:function(e,a){if("error"!==a&&e.responseText){$("#myModal").modal("hide");var t=e.responseText;console.log(t),$.confirm({title:"",content:t,buttons:{somethingElse:{text:"OK",btnClass:"btn-success",keys:["enter"],action:function(){$("#MasterDataTable").DataTable().ajax.reload()}}}})}else console.log(a)}}),console.log($("#formInput").serialize()),e.preventDefault()}),$("#MasterDataTable").dataTable({ajax:"${local_server}/master_data/getmaster",columns:[{data:"map_field_name"},{data:"map_field_desc"},{data:"map_formula"},{data:"map_type"},{render:function(e,a,t){return isUsed(t.map_is_use)}},{render:function(e,a,t){var n='<button class="edit btn btn-xs btn-success" id="'+t.map_id+'" value="'+t.map_field_name+'" ><i class=" fa fa-edit"></i></button><button class="delete btn btn-xs btn-danger" id="'+t.map_id+'" value="'+t.map_field_name+'" ><i class=" fa fa-trash-o"></i></button>';return n},orderable:!1}]}),$("#addNew").on("click",function(){$("#formInput")[0].reset(),$("#new_edit_status").val("new"),$("#map_id").val("0"),$("#myModalLabel").html("Master Data <span class='label label-default'>New</span>"),$("#myModal").modal({show:!0})}),$("#MasterDataTable").on("click","button.edit",function(e){e.preventDefault(),$("#formInput")[0].reset(),$("#new_edit_status").val("edit"),$("#myModalLabel").html("Master Data <span class='label label-default'>Edit</span>"),$("#myModal").modal({show:!0}),getDetailMasterData(this.id)}),$("#MasterDataTable").on("click","button.delete",function(e){e.preventDefault();var a=this.id,t=this.value;$.confirm({title:"Confirm",content:'Are you sure to want delete master data "'+t+'" ?',buttons:{cancel:function(){$.alert("Canceled")},somethingElse:{text:"Delete",btnClass:"btn-danger",keys:["enter"],action:function(){var e=JSON.parse(deleteMasterData(a));$.alert(e.message),$("#MasterDataTable").DataTable().ajax.reload()}}}})})});

function getDetailMasterData(e) {
    $.get("${local_server}/master_data/getmaster/" + e, function(e) {
        var a = e.data[0];
        $.each(a, function(e, a) {
            var t = e;
            t = "#" + t.replace(/\"/g, ""), checkExists(String(t)) && ("checkbox" === $(String(t))[0].type ? $(String(t)).prop("checked", a) : $(String(t)).val(a))
        })
    })
}

function deleteMasterData(e) {
    var a = $.ajax({
        type: "GET",
        url: "${local_server}/master_data/delete/" + e,
        async: !1,
        success: function(e) {
            return e.status
        }
    }).responseText;
    return a
}

function isUsed(e) {
    var a;
    return a = 1 == e ? '<span class="label label-default">Tidak digunakan</span>' : '<span class="label label-success">Digunakan</span>'
}

function checkExists(e) {
    var a = !1;
    return $(e).length && (a = !0), a
}
$(document).ready(function() {
    $("#formInput").submit(function(e) {
    	var url = '${local_server}/master_data/approve';
		$.ajax({
			type : 'POST',
			url : url,
			data : $("#formInput").serialize(),
			cache : false,
			beforeSend : function() {
				$("#submit").html("<i class='fa fa-circle-o-notch fa-spin'></i>  Disetujui");
				$("#submit").addClass("disabled");
				$('button[type=submit]').prop('disabled', true);
			},
			success : function(data) {
				if(data.status ==  "Success") {						
						$
						.confirm({
							title : "Success",
							content : "Data Berhasil Disimpan.",
							buttons : {
								somethingElse : {
									text : 'OK',
									btnClass : 'btn-success',
									keys : [ 'enter' ],
									action : function() {																		
										location.reload();
									}
								}
	
							}
						});
				} else {
					$.alert(data.message);
					$("#submit").html("Setujui");
					$("#submit").removeClass("disabled");
					$('button[type=submit]').prop('disabled', false);
					$('#myModal').modal('hide');
					return false;
				}
			},
			
		});
		return false;
    }), $("#MasterDataTable").dataTable({
        ajax: "${local_server}/master_data/getListApproval",
        columns: [{
            data: "map_field_name"
        }, {
            data: "map_field_desc"
        }, {
            data: "map_formula"
        }, {
            data: "map_type"
        }, 
        { data:"map_approved_status" },
        {
            render: function(e, a, t) {
                return isUsed(t.map_is_use)
            }
        }, {
            render: function(e, a, t) {
                var n = '<button class="edit btn btn-xs btn-success" id="' + t.map_id + '" value="' + t.map_field_name + '" ><i class=" fa fa-edit"></i></button>';
                return n
            },
            orderable: !1
        }]
    }), $("#MasterDataTable").on("click", "button.edit", function(e) {
        e.preventDefault(), $("#formInput")[0].reset(), $("#new_edit_status").val("edit"), $("#myModalLabel").html("Master Data <span class='label label-default'>Detail</span>"), $("#myModal").modal({
            show: !0
        }), getDetailMasterData(this.id)
    })
});



</script>
</html>
