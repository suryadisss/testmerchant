<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="User Management" />
	<jsp:param name="datatables" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
	<jsp:param name="jquerydatepicker" value="1" />
	<jsp:param name="ass" value="1" />
	<jsp:param name="multipleselect" value="1" />
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
						<form id="formInput">
							<input type="hidden" name="new_edit_status" id="new_edit_status" />
							<input type="hidden" name="usr_id" id="usr_id" />
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
										<label for="scc_code" class="col-sm-4 control-label">ID Pengguna</label>
										<div class="col-sm-6">
											<input type="text" name="txtUserID" id="txtUserID"
												class="form-control" required />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Nama</label>
										<div class="col-sm-6">
											<input type="text" name="txtName" id="txtName"
												class="form-control" disabled/>
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">NIP</label>
										<div class="col-sm-6">
											<input type="text" name="txtNIP" id="txtNIP"
												class="form-control" disabled />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Email/Surel</label>
										<div class="col-sm-6">
											<input type="email" name="txtEmail" id="txtEmail"
												class="form-control" disabled />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Cabang
										</label>
										<div class="col-sm-6">
											<!-- <select name="ddlBranch" id="ddlBranch"
												class="form-control selectpicker" data-show-subtext="true"
												data-live-search="true" onchange="getRegion(this.value)"
												disabled>
											</select> -->
											<input type="text" name="ddlBranch" id="ddlBranch"
												class="form-control" disabled />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Wilayah</label>
										<div class="col-sm-6">
											<span id="spnRegion"></span>
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Tipe Area</label>
										<div class="col-sm-6">
											<span id="spnArea"></span>
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Toko</label>
										<div class="col-sm-6">
											<!-- <select name="ddlTenant" id="ddlTenant"
												class="form-control selectpicker" data-show-subtext="true"
												data-live-search="true" disabled>
											</select> -->
											<input type="text" name="ddlTenant" id="ddlTenant"
												class="form-control" disabled />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Nama Supervisor</label>
										<div class="col-sm-6">
											<!-- <select name="ddlSupervisor" id="ddlSupervisor"
												class="form-control selectpicker" data-show-subtext="true"
												data-live-search="true" disabled>
											</select> -->
											<input type="email" name="txtEmail" id="ddlSupervisor"
												class="form-control" disabled />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Posisi
										</label>
										<div class="col-sm-6">
											<!-- <select name="ddlPosition" id="ddlPosition"
												class="form-control selectpicker" data-show-subtext="true"
												data-live-search="true" disabled>
											</select> -->
											<input type="text" name="ddlPosition" id="ddlPosition"
												class="form-control" disabled />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Akses
											Level </label>
										<div class="col-sm-6">
											<!-- <select name="ddlAccessLevel" id="ddlAccessLevel"
												class="form-control selectpicker" data-show-subtext="true"
												data-live-search="true" disabled>
											</select> -->
											<input type="text" name="ddlAccessLevel" id="ddlAccessLevel"
												class="form-control" disabled />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Tanggal efektif</label>
										<div class="col-sm-6">
											<input type="text" class="form-control datepicker11"
												maxlength="10" id="txtEffectiveDate" name="txtEffectiveDate"
												data-date-format="YYYY-MM-DD" disabled/>
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Notifikasi
										</label>
										<div class="col-sm-6">
											<select class="selectpicker form-control" multiple
												title="-- None --" name="cmb_notif"
												id="cmb_notif" disabled>

											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Status
										</label>
										<div class="col-sm-6">
											<input type="checkbox" name="chkStatus" id="chkStatus" disabled/>
										</div>
									</div>
									<div id="bc"></div>

									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Grup partner</label>
											<div class="col-sm-6">
										<!-- <select name="ddlGroupPartner" id="ddlGroupPartner" onChange="bindDDLPartnerDetail(this.value)"
											class="form-control selectpicker" data-show-subtext="true"
											data-live-search="true" disabled>
										</select> -->
										<input type="text" name="ddlGroupPartner" id="ddlGroupPartner"
												class="form-control" disabled />
									</div>
										<!-- <div class="col-sm-6">
											<select name="ddlGroupPartner" id="ddlGroupPartner"
												class="form-control selectpicker" data-show-subtext="true"
												data-live-search="true" title="--Select One--">
											</select>
										</div> -->
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Rincian Partner</label>
										<div class="col-sm-6">
											<select name="ddlPartnerDetail" id="ddlPartnerDetail"
												class="form-control selectpicker" data-show-subtext="true"
												data-live-search="true" title="-- None --" disabled>
											</select>
										</div>
									</div>

								</div>


							</div>
							<div class="modal-footer">
								
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
								<!-- <button id="addNew" class="btn btn-primary btn-sm">Add
									New</button> -->

								<table id="userTable" class="table table-hover" width="100%">
									<thead>
										<tr>
											<td>ID Pengguna</td>
											<td>Nama</td>
											<td>NIP</td>
											<td>Level Akses</td>
											<td>Status</td>
											<td>Tindakan</td>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

			<jsp:include page='_Footer_Note.jsp'></jsp:include>
		</div>


	</div>
</body>
<jsp:include page='_Footer_Gentellela.jsp'>
	<jsp:param name="datatables" value="1" />
	<jsp:param name="validate" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
	<jsp:param name="jquerydatepicker" value="1" />
	<jsp:param name="ass" value="1" />
	<jsp:param name="multipleselect" value="1" />
	<jsp:param name="noityjs" value="1" />
</jsp:include>
<script>
/* function deleteMasterData(e){var t=$.ajax({type:"GET",url:"${local_server}/user/deleteUser/"+e,async:!1,success:function(e){return e.status}}).responseText;return t}function editUser(e){$.get("${local_server}/user/getDataUser/"+e,function(e){var t=JSON.parse(e);console.log(t),$.each(t.data,function(e,t){$("#txtUserID").val(t.usruserid),$("#txtName").val(t.usrname),$("#txtNIP").val(t.usrnip),$("#txtEmail").val(t.usremail),$("#ddlBranch").val(t.usrbranch),$("#spnRegion").text(t.branchregion),$("#spnArea").text(t.brancharea),$("#ddlSupervisor").val(t.usrsupervisor),$("#ddlPosition").val(t.usrposition),$("#ddlAccessLevel").val(t.usraccesslevel),$("#txtEffectiveDate").val(formatDate(t.usrefectivedate)),1==t.usrstatus&&$("#chkStatus").prop("checked",!0)})}),getNotifUser(e)}function isUsed(e){var t;return t="Active"==e?'<span class="label label-success">Active</span>':'<span class="label label-default">Not Actived</span>'}function getRegion(e){""!=e?$.get("${local_server}/user/getRegionArea/"+e,function(e){var t=JSON.parse(e);$.each(t.data,function(e,t){document.getElementById("spnRegion").innerHTML=t.branchregion,document.getElementById("spnArea").innerHTML=t.brancharea})}):(document.getElementById("spnRegion").innerHTML="",document.getElementById("spnArea").innerHTML="")}function DataCallParameterDDL(e,t){$.post("${local_server}/user/PostCallParameterGetDDL",{p_type:e,p_usr:t},function(t){var a="",n=JSON.parse(t);$.each(n.data,function(e,t){a+="<option value="+t.namevalue+">"+t.nameview+"</option>"}),"level"==e?($("#ddlAccessLevel").empty(),$("#ddlAccessLevel").append(a)):"branch"==e?($("#ddlBranch").empty(),$("#ddlBranch").append(a)):"supervisor"==e?($("#ddlSupervisor").empty(),$("#ddlSupervisor").append(a)):"position"==e&&($("#ddlPosition").empty(),$("#ddlPosition").append(a))})}function formatDate(e){return e=e.substring(0,10),date=new Date(e),month=date.getMonth()+1,year=date.getFullYear(),dt=date.getDate(),dt<10&&(dt="0"+dt),month<10&&(month="0"+month),year+"-"+month+"-"+dt}function getbranch(){$.get("${local_server}/user/getbranch/",function(e){e=JSON.parse(e),console.log(e);var t="";$.each(e,function(e,a){$.each(a,function(e,a){t+='<optgroup label="'+e+'">',$.each(a,function(e,a){t+='<option value="'+a.brc_code+'">'+a.brc_name+"</option>"}),t+="</optgroup>"})}),$("#ddlBranch").append(t)})}function getNotifUser(e){$.get("${local_server}/inbox/getnotif/"+e,function(e){e=JSON.parse(e),console.log(e);var t=[];$.each(e.data,function(e,a){t[e]=a.usr_typ}),console.log(t),$("#cmb_notif").selectpicker("val",t)})}function bindDDLNotification(){$.get("${local_server}/inbox/getnotif",function(e){e=JSON.parse(e),console.log(e);var t="";$.each(e.data,function(e,a){t+="<option value="+a.ntf_typ+">"+a.ntf_desc+"</option>"}),$("#cmb_notif").empty(),$("#cmb_notif").append(t),$("#cmb_notif").selectpicker("refresh")})}$(document).ready(function(){DataCallParameterDDL("level","${session_id}"),DataCallParameterDDL("branch","${session_id}"),DataCallParameterDDL("supervisor","${session_id}"),DataCallParameterDDL("position","${session_id}"),bindDDLNotification(),getbranch(),$("#formInput").submit(function(e){var t="user/insertUser";$.ajax({type:"POST",url:t,data:$("#formInput").serialize(),cache:!1,complete:function(e,t){if("error"!==t&&e.responseText){$("#myModal").modal("hide");var a=e.responseText;console.log(a),$.confirm({title:"",content:a,buttons:{somethingElse:{text:"OK",btnClass:"btn-success",keys:["enter"],action:function(){$("#userTable").DataTable().ajax.reload()}}}})}else console.log(t)}}),console.log($("#formInput").serialize()),e.preventDefault()}),$("#userTable").dataTable({ajax:"${local_server}/user/getListUser",columns:[{data:"usruserid"},{data:"usrname"},{data:"usrnip"},{data:"usraccesslevel"},{render:function(e,t,a){return isUsed(a.usrstatusformat)}},{render:function(e,t,a){var n='<button class="edit btn btn-xs btn-success" id="'+a.usruserid+'" value="'+a.usruserid+'" ><i class=" fa fa-edit"></i></button><button class="delete btn btn-xs btn-danger" id="'+a.usruserid+'" value="'+a.usruserid+'" ><i class=" fa fa-trash-o"></i></button>';return n},orderable:!1}]}),$("#addNew").on("click",function(){$("#formInput")[0].reset(),$("#new_edit_status").val("new"),$("#usr_id").val(0),$("#txtUserID").prop("readonly",!1),$("#dataPicker").selectpicker("refresh"),$("#myModalLabel").html("User <span class='label label-default'>New</span>"),$("#myModal").modal({show:!0})}),$(".datepicker11").datetimepicker()}),$("#userTable").on("click","button.edit",function(e){e.preventDefault(),$("#formInput")[0].reset(),$("#new_edit_status").val("edit"),$("#dataPicker").selectpicker("refresh"),$("#myModalLabel").html("User <span class='label label-default'>Edit</span>"),$("#myModal").modal({show:!0}),$("#usr_id").val(0),$("#txtUserID").prop("readonly",!0),editUser(this.id)}),$("#userTable").on("click","button.delete",function(e){e.preventDefault();var t=this.id,a=this.value;$.confirm({title:"Confirm",content:'Are you sure to want delete user "'+a+'" ?',buttons:{cancel:function(){$.alert("Canceled")},somethingElse:{text:"Delete",btnClass:"btn-danger",keys:["enter"],action:function(){var e=JSON.parse(deleteMasterData(t));console.log(e),$.alert("Success"),$("#userTable").DataTable().ajax.reload()}}}})});
*/function deleteMasterData(e) {
	var t = $.ajax({
		type: "GET",
		url: "${local_server}/user/deleteUser/" + e,
		async: !1,
		success: function (e) {
			return e.status
		}
	}).responseText;
	return t
}

function editUser(e) {
	$.get("${local_server}/user/getDataUser/" + e, function (e) {
		var t = JSON.parse(e);
		console.log(t), $.each(t.data, function (e, t) {
			$("#txtUserID").val(t.usruserid), 
			$("#txtName").val(t.usrname), 
			$("#txtNIP").val(t.usrnip), 
			$("#txtEmail").val(t.usremail), 
			$("#spnRegion").text(t.branchregion),
			$("#spnArea").text(t.brancharea), 
			DataCallParameterDDL("level","crm_admin", t.usraccesslevel),
			DataCallParameterDDL("supervisor", "crm_admin",t.usrsupervisor),
			DataCallParameterDDL("position", "crm_admin", t.usrposition),
			bindDDLGroupPartner(t.groupalias);
			bindDDLPartnerDetailEdit(t.groupalias, t.partneralias);
			
			$("#txtEffectiveDate").val(formatDate(t.usrefectivedate)),
			1 == t.usrstatus && $("#chkStatus").prop("checked", !0),
			getbranch(t.usrbranch);
			getTenant(t.usrtntalias);
			//$("#ddlBranch").val(t.usrbranch), 
			//$("#ddlSupervisor").val(t.usrsupervisor), 
			//$("#ddlPosition").val(t.usrposition), 
			//$("#ddlAccessLevel").val(t.usraccesslevel), 
			//DataCallParameterDDL("branch", "crm_admin"),
			//DataCallParameterDDL("groupalias", "crm_admin", t.groupalias),
			//bindDDLPartnerDetail(t.partneralias);
			
		})
	}), getNotifUser(e)
}

function resetPassword(e) {
	var t = $.ajax({
		type: "GET",
		url: "${local_server}/user/reset/password/" + e,
		async: !1,
		success: function (e) {
			return e.status
		}
	}).responseText;
	return t
}

function isUsed(e) {
	var t;
	return t = "Active" == e ? '<span class="label label-success">Active</span>' : '<span class="label label-default">Not Actived</span>'
}

function getRegion(e) {
	"" != e ? $.get("${local_server}/user/getRegionArea/" + e, function (e) {
		var t = JSON.parse(e);
		$.each(t.data, function (e, t) {
			document.getElementById("spnRegion").innerHTML = t.branchregion, document.getElementById("spnArea").innerHTML = t.brancharea
		})
	}) : (document.getElementById("spnRegion").innerHTML = "", document.getElementById("spnArea").innerHTML = "")
}

function DataCallParameterDDL(e, jk, kb) {
	$.post("${local_server}/user/PostCallParameterGetDDL", {
		p_type: e,
		p_usr: jk
	}, function (t) {
		var a = "", b="",d="NONE",
			n = JSON.parse(t);
		$.each(n.data, function (e, k) {
			//var xt = (kb == k.namevalue) ? "selected":"";
			//a += "<option value='" + k.namevalue + "' "+xt+" >" + k.nameview + "</option>"
			b += (kb == k.namevalue) ? d=k.nameview:d+="";
		}), 
		"level" == e ? 
		($("#ddlAccessLevel").val(d)) : "branch" == e ?	
			($("#ddlBranch").empty().append(a).selectpicker("refresh")) : "supervisor" == e ? 
					($("#ddlSupervisor").val(d)) : "position" == e	&& 
						 ($("#ddlPosition").val(d))
	})
}

function formatDate(e) {
	return e = e.substring(0, 10), date = new Date(e), month = date.getMonth() + 1, year = date.getFullYear(), dt = date.getDate(), dt < 10 && (dt = "0" + dt), month < 10 && (month = "0" + month), year + "-" + month + "-" + dt
}

function bindDDLGroupPartner(id) {
	$.get("${local_server}/user/GetGroupPartner", function(data) {
		var x = JSON.parse(data);
		console.log(x);
		var ht = ""; var sl="NON GROUP";
					$.each(x.data, function(i, o) {
						var d = (o.grp_alias == id) ? sl = o.grp_name : "";
						
		});

					
		$("#ddlGroupPartner").val(sl);
		;
	})
}
function bindDDLPartnerDetail(id) {
	$.get("${local_server}/user/GetPartnerDetail", function(data) {
		var x = JSON.parse(data);
		console.log(x);
		var ht = "";
		//$("#ddlGroupPartner").empty().append(a).selectpicker("refresh")
			ht += "<option value='ALL' "+">" + "ALL PARTNERS"
					+ "</option>";
					
			if (id == "ALL"){
				ht = "<option value='ALL'selected"+">" + "ALL PARTNERS"
				+ "</option>";
				}
				
		/* $.each(x.data, function(i, o) {
			//var sl = (o.grp_name == id) ? "selected" : "";
			ht += "<option value='"+o.gpt_alias+"' "+">" + o.gpt_name
					+ "</option>";  */

					$.each(x.data, function(i, o) {
						var sl = (o.gpt_alias == id) ? "selected" : "";
						ht += "<option value='"+o.gpt_alias+"' "+sl+">" + o.gpt_name
									+ "</option>";			
		});

		$("#ddlPartnerDetail").empty().append(ht).selectpicker("refresh");
		;
	})
}
function getTenant(b) {
	
	$
	.ajax({
		type : 'GET',
		asyn : false,
		url : '${local_server}/user/getDDLTenant',
	
		success : function(data) {
			var t = "";var sl ="NONE";
			if (data.status == "Success") {
				if(data.data.length > 0) {
					
					t = '<option value selected> - None - </option>';
					$.each(data.data, function(i, o) {
						
						if(o.tnt_alias == b){ sl = o.tnt_name; }
						t += '<option value="' + o.tnt_alias + '" '+sl+'>' + o.tnt_name + '</option>';
					});
					$("#ddlTenant").val(sl);
					//$("#ddlTenant").empty().append(t).selectpicker("refresh");
				}
				
			}

		},
		failure : function(errMsg) {
			alert("call failed");
		}
	});
}

function getbranch(b) {
	
	
	$.get("${local_server}/user/getbranch/", function (e) {
		e = JSON.parse(e), console.log(e);
		var t = ""; var d="NON BRANCH";
		t += '<optgroup label="NON BRANCH"><option value="0000601">NON BRANCH</option>',
		t += '</optgroup>'
		$.each(e, function (e, a) {
			$.each(a, function (e, a) {
				t += '<optgroup label="' + e + '">', 
				$.each(a, function (e, a) {
					var sl = (a.brc_code == b) ? d=a.brc_name : d+="";
					t += '<option value="' + a.brc_code + '" '+sl+'>' + a.brc_name + "</option>"
				}), t += "</optgroup>"
			})
		}), $("#ddlBranch").val(d);
		//$("#ddlBranch").empty().append(t).selectpicker("refresh");
	})
}

function getNotifUser(e) {
	$.get("${local_server}/inbox/getnotif/" + e, function (e) {
		e = JSON.parse(e), console.log(e);
		var t = [];
		$.each(e.data, function (e, a) {
			t[e] = a.usr_typ
		}), console.log(t), $("#cmb_notif").selectpicker("val", t)
	})
}

function bindDDLNotification() {
	$.get("${local_server}/inbox/getnotif", function (e) {
		e = JSON.parse(e), console.log(e);
		var t = "";
		$.each(e.data, function (e, a) {
			t += "<option value=" + a.ntf_typ + ">" + a.ntf_desc + "</option>"
		}), $("#cmb_notif").empty(), $("#cmb_notif").append(t), $("#cmb_notif").selectpicker("refresh")
	})
}
$(document).ready(function () {
	
	
	DataCallParameterDDL("level", "crm_admin", ""),
	DataCallParameterDDL("branch", "crm_admin", ""),
	DataCallParameterDDL("supervisor", "crm_admin", ""),
	DataCallParameterDDL("position", "crm_admin", ""),
	bindDDLNotification();
	bindDDLGroupPartner("");
	bindDDLPartnerDetail("");
	getbranch(""), 
	getTenant(""),
	$("#formInput").submit(function (e) {
		var t = "user/insertUser";
		$.ajax({
			type: "POST",
			url: t,
			data: $("#formInput").serialize(),
			cache: !1,
			beforeSend:function(){
				$('button[type=submit]').prop('disabled', true);
			},
			complete: function (e, t) {
					
				if ("error" !== t && e.responseText) {
					$("#myModal").modal("hide");
					var a = e.responseText;
					console.log(a), $.confirm({
						title: "",
						content: a,
						buttons: {
							somethingElse: {
								text: "OK",
								btnClass: "btn-success",
								keys: ["enter"],
								action: function () {
									$('button[type=submit]').prop('disabled', false);		
									$("#userTable").DataTable().ajax.reload()
								}
							}
						}
					})
				} else console.log(t)
			}
		}), console.log($("#formInput").serialize()), e.preventDefault()
	}), $("#userTable").dataTable({
		ajax: "${local_server}/user/getListUser",
		columns: [{
			data: "usruserid"
		}, {
			data: "usrname"
		}, {
			data: "usrnip"
		}, {
			data: "usraccesslevel"
		}, {
			render: function (e, t, a) {
				return isUsed(a.usrstatusformat)
			}
		}, {
			render: function (e, t, a) {
				var n = '<button title="Edit" class="edit btn btn-xs btn-success" id="' + a.usruserid + '" value="' + a.usruserid + '" ><i class=" fa fa-edit"></i></button>';
				return n
			},
			orderable: !1
		}]
	}), $("#addNew").on("click", function () {
		 DataCallParameterDDL("level", "crm_admin", ""),
		DataCallParameterDDL("supervisor", "crm_admin", ""),
		DataCallParameterDDL("position", "crm_admin", ""), 
		//DataCallParameterDDL("branch", "crm_admin", ""),
		bindDDLNotification();
		bindDDLGroupPartner("");
		bindDDLPartnerDetail("");
		$("#formInput")[0].reset(), $("#new_edit_status").val("new"), $("#usr_id").val(0), $("#txtUserID").prop("readonly", !1), $("#dataPicker").selectpicker("refresh"), $("#myModalLabel").html("User <span class='label label-default'>New</span>"), $("#myModal").modal({
			show: !0
		})
	}), $(".datepicker11").datetimepicker()
}), $("#userTable").on("click", "button.edit", function (e) {
	e.preventDefault(), $("#formInput")[0].reset(), $("#new_edit_status").val("edit"), $("#dataPicker").selectpicker("refresh"), $("#myModalLabel").html("User <span class='label label-default'>Edit</span>"), $("#myModal").modal({
		show: !0
	}), $("#usr_id").val(0), $("#txtUserID").prop("readonly", !0), editUser(this.id)
}), $("#userTable").on("click", "button.delete", function (e) {
	e.preventDefault();
	var t = this.id,
		a = this.value;
	$.confirm({
		title: "Confirm",
		content: 'Are you sure to want delete user "' + a + '" ?',
		buttons: {
			cancel: function () {
				$.alert("Canceled")
			},
			somethingElse: {
				text: "Delete",
				btnClass: "btn-danger",
				keys: ["enter"],
				action: function () {
					var e = JSON.parse(deleteMasterData(t));
					console.log(e), $.alert("Success"), $("#userTable").DataTable().ajax.reload()
				}
			}
		}
	})
}),
$("#userTable").on("click", "button.reset", function (e) {
		e.preventDefault();
		var t = this.id,
			a = this.value;
		$.confirm({
			title: "Confirm",
			content: 'Are you sure want to reset password user "' + a + '" ?',
			buttons: {
				cancel: function () {
					$.alert("Canceled")
				},
				somethingElse: {
					text: "Reset",
					btnClass: "btn-danger",
					keys: ["enter"],
					action: function () {
						var e = JSON.parse(resetPassword(t));
						//console.log(e)
						if(e.status.toLowerCase() == "success"){
							$.alert("Password has been reset"), 
							$("#userTable").DataTable().ajax.reload()	
						}
						else{
							$.alert(e.message)
						}
					}
				}
			}
		})
});

function bindDDLPartnerDetailEdit(id, partneralias) {	
	$.get("${local_server}/user/GetPartnerDetailDisburse/"+id, function(data) {
		var x = JSON.parse(data);
		console.log(data);
		console.log(data.length);
		var ht = "";
		//$("#ddlGroupPartner").empty().append(a).selectpicker("refresh")
			if(1==1){//harusnya cek length data
				ht += "<option value='ALL' "+">" + "ALL PARTNERS"
						+ "</option>";
			}		
			if (partneralias == "ALL"){
				ht = "<option value='ALL'selected"+">" + "ALL PARTNERS"
				+ "</option>";
				}
				
		/* $.each(x.data, function(i, o) {
			//var sl = (o.grp_name == id) ? "selected" : "";
			ht += "<option value='"+o.gpt_alias+"' "+">" + o.gpt_name
					+ "</option>";  */

					$.each(x.data, function(i, o) {
						var sl = (o.gpt_alias == partneralias) ? "selected" : "";
						ht += "<option value='"+o.gpt_alias+"' "+sl+">" + o.gpt_name
									+ "</option>";			
		});

		$("#ddlPartnerDetail").empty().append(ht).selectpicker("refresh");
	});
	}

function bindDDLPartnerDetail(id) {	
	$.get("${local_server}/user/GetPartnerDetailDisburse/"+id, function(data) {
		var x = JSON.parse(data);
		console.log(data);
		console.log(data.length);
		var ht = "";
		//$("#ddlGroupPartner").empty().append(a).selectpicker("refresh")
			if(1==1){//harusnya cek length data
				ht += "<option value='ALL' "+">" + "ALL PARTNERS"
						+ "</option>";
			}		
			if (id == "ALL"){
				ht = "<option value='ALL'selected"+">" + "ALL PARTNERS"
				+ "</option>";
				}
				
		/* $.each(x.data, function(i, o) {
			//var sl = (o.grp_name == id) ? "selected" : "";
			ht += "<option value='"+o.gpt_alias+"' "+">" + o.gpt_name
					+ "</option>";  */

					$.each(x.data, function(i, o) {
						var sl = (o.gpt_alias == id) ? "selected" : "";
						ht += "<option value='"+o.gpt_alias+"' "+sl+">" + o.gpt_name
									+ "</option>";			
		});

		$("#ddlPartnerDetail").empty().append(ht).selectpicker("refresh");
	});
}
</script>
</html>