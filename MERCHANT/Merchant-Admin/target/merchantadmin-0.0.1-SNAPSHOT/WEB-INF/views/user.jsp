<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Pengelolaan Pengguna" />
	<jsp:param name="datatables" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
	<jsp:param name="jquerydatepicker" value="1" />
	<jsp:param name="ass" value="1" />
	<jsp:param name="multipleselect" value="1" />
	<jsp:param name="noityjs" value="1" />
</jsp:include>
<style>
#checkboxessearch{
  width: 145%;
}
.multiselect {
  width: 265px;
}
.target{
color:#333}

.selectBox {
  position: relative;
}

.selectBox select {
  width: 100%;
  font-weight: bold;
}

.overSelect {
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
}

#checkboxes {
  display: none;
  border: 1px #dadada solid;
}
#checkboxesins{
 	width:145%;
  border: 1px #dadada solid;
  max-height:250px;
  overflow-y:scroll;
}

#checkboxessearch{
 padding-top:10px;
 padding-bottom:10px;
  border: 1px #dadada solid;
 
}

#checkboxes label {
  display: block;
}

#checkboxes label:hover {
  background-color: #e3e1e1;
}
</style>
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
												class="form-control" required />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">NIP</label>
										<div class="col-sm-6">
											<input type="text" name="txtNIP" id="txtNIP"
												class="form-control" required />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Email/Surel</label>
										<div class="col-sm-6">
											<input type="email" name="txtEmail" id="txtEmail"
												class="form-control" required />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Cabang</label>
										<div class="col-sm-6">
											<div class="multiselect">
											    <div class="selectBox" onclick="showCheckboxes()">
											      <select id="ddlBranch" name="ddlBranch" style="color:#333;height:35px">
											        <option id="cabangButton" value="" >Pilih Cabang</option>
											      </select>
											      <div class="overSelect"></div>
											    </div>
   												 <div id="checkboxes">
    
												    <div class="col-md-12" id="checkboxessearch" >
												    	<input class="form-control" id="pilihCabang" name="pilihCabang" type="text" onkeyup="searchFilter();" placeholder="Cari Cabang"/>
												    </div>
    
												    <div class="col-md-12" id="checkboxesins">
													      
												    </div>
    											</div>
  											</div>
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
											<select name="ddlTenant" id="ddlTenant"
												class="form-control selectpicker" data-show-subtext="true"
												data-live-search="true" required>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Nama Atasan (Supervisor)</label>
										<div class="col-sm-6">
											<select name="ddlSupervisor" id="ddlSupervisor"
												class="form-control selectpicker" data-show-subtext="true"
												data-live-search="true" required>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Posisi
										</label>
										<div class="col-sm-6">
											<select name="ddlPosition" id="ddlPosition"
												class="form-control selectpicker" data-show-subtext="true"
												data-live-search="true" required>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Level Akses</label>
										<div class="col-sm-6">
											<select name="ddlAccessLevel" id="ddlAccessLevel"
												class="form-control selectpicker" data-show-subtext="true"
												data-live-search="true" required>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Tanggal efektif</label>
										<div class="col-sm-6">
											<input type="text" class="form-control datepicker11"
												maxlength="10" id="txtEffectiveDate" name="txtEffectiveDate"
												data-date-format="YYYY-MM-DD" />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Notifikasi
										</label>
										<div class="col-sm-6">
											<select class="selectpicker form-control" multiple
												title="--Select One or More--" name="cmb_notif"
												id="cmb_notif">

											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Status
										</label>
										<div class="col-sm-6">
											<input type="checkbox" name="chkStatus" id="chkStatus" />
										</div>
									</div>
									<div id="bc"></div>

									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Partner Grup</label>
											<div class="col-sm-6">
										<select name="ddlGroupPartner" id="ddlGroupPartner" onChange="bindDDLPartnerDetail(this.value)"
											class="form-control selectpicker" data-show-subtext="true"
											data-live-search="true">
										</select>
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
												data-live-search="true" title="--Select One--">
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">Web Merchant</label>
										<div class="col-sm-6">
											<input type="checkbox" class="compulsary" id="is_merchant" name="is_merchant" style="width:15px;vertical-align:middle;">
										</div>
									</div>
									
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
								<button id="addNew" class="btn btn-primary btn-sm">Tambah baru</button>

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
var checkboxvalue=[];
$(document).on("change", "input[class='checkeds']", function () {
	
	checkboxvalue = [];
    $('.checkeds').each(function(){
        if($(this).prop('checked')){
           
        	checkboxvalue.push($(this).val());
        }
    });
    if(checkboxvalue.length==0){
    	checkboxvalue.push("Pilih Cabang");
    }
    console.log(checkboxvalue.join(', '));
    $('#cabangButton').html(checkboxvalue.join(','));
    $('#cabangButton').val(checkboxvalue.join(','));

});

function searchFilter(){
    var input = document.getElementById("pilihCabang");
    var filter = input.value.toLowerCase();
    var nodes = document.getElementsByClassName('target');

    for (i = 0; i < nodes.length; i++) {
    	console.log(nodes[i]);
    	console.log(nodes[i].innerText);
        if (nodes[i].innerText.toLowerCase().includes(filter)) {
        document.getElementById('target'+i).style.display = "block";
        } else {
        document.getElementById('target'+i).style.display = "none";
        }
    }
}
var expanded = false;

function showCheckboxes() {
  var checkboxes = document.getElementById("checkboxes");
  if (!expanded) {
    checkboxes.style.display = "block";
    expanded = true;
  } else {
    checkboxes.style.display = "none";
    expanded = false;
  }
}
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
			//$("#ddlBranch").val(t.usrbranch), 
			$("#spnRegion").text(t.branchregion),
			$("#spnArea").text(t.brancharea), 
			//$("#ddlSupervisor").val(t.usrsupervisor), 
			//$("#ddlPosition").val(t.usrposition), 
			//$("#ddlAccessLevel").val(t.usraccesslevel), 
			DataCallParameterDDL("level","crm_admin", t.usraccesslevel),
			//DataCallParameterDDL("branch", "crm_admin"),
			DataCallParameterDDL("supervisor", "crm_admin",t.usrsupervisor),
			DataCallParameterDDL("position", "crm_admin", t.usrposition),
			//DataCallParameterDDL("groupalias", "crm_admin", t.groupalias),
			console.log(t.groupalias);
			bindDDLGroupPartner(t.groupalias);
			//bindDDLPartnerDetail(t.partneralias);
			bindDDLPartnerDetailEdit(t.groupalias, t.partneralias);
			if(t.is_merchant==true){
				$("#is_merchant").prop("checked", true);
			}
			console.log(t.usrbranch);
			
			var splitterBranch = t.usrbranch.split(",");
			$('#cabangButton').html(t.usrbranch);
		    $('#cabangButton').val(t.usrbranch);
            console.log(splitterBranch);
			var val="";
            splitterBranch.forEach(val => {
                $('.checkeds').each(function(){
                    if($(this).val() == val){
                        $(this).prop("checked", true);
                    }
                });
            });
            
			getTenant(t.usrtntalias);
			
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
		var a = "",
			n = JSON.parse(t);
		$.each(n.data, function (e, k) {
			var xt = (kb == k.namevalue) ? "selected":"";
			a += "<option value='" + k.namevalue + "' "+xt+" >" + k.nameview + "</option>"
		}), 
		"level" == e ? 
		($("#ddlAccessLevel").empty().append(a).selectpicker("refresh")) :
			"branch" == e ?	
			($("#ddlBranch").empty().append(a).selectpicker("refresh")):
							"supervisor" == e ? 
								($("#ddlSupervisor").empty().append(a).selectpicker("refresh")) : 
								"position" == e	&& 
								($("#ddlPosition").empty().append(a).selectpicker("refresh"))
	})
}

function formatDate(e) {
	return e = e.substring(0, 10), date = new Date(e), month = date.getMonth() + 1, year = date.getFullYear(), dt = date.getDate(), dt < 10 && (dt = "0" + dt), month < 10 && (month = "0" + month), year + "-" + month + "-" + dt
}

function bindDDLGroupPartner(id) {
	$.get("${local_server}/user/GetGroupPartner", function(data) {
		var x = JSON.parse(data);
		console.log(x);
		var ht = "";
		//$("#ddlGroupPartner").empty().append(a).selectpicker("refresh")
			ht += "<option value='NON' "+">" + "NON GROUP"
					+ "</option>";

			if (id == "NON"){
				ht = "<option value='NON'selected"+">" + "NON GROUP"
				+ "</option>";
				}
		/* $.each(x.data, function(i, o) {
			var sl = (o.grp_alias == id) ? "selected" : "";
			ht += "<option value='"+o.grp_alias+"' "+">" + o.grp_name
					+ "</option>"; */
					$.each(x.data, function(i, o) {
						var sl = (o.grp_alias == id) ? "selected" : "";
						ht += "<option value='"+o.grp_alias+"' "+sl+">" + o.grp_name
									+ "</option>";
		});

					
		$("#ddlGroupPartner").empty().append(ht).selectpicker("refresh");
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
			var t = "";
			if (data.status == "Success") {
				if(data.data.length > 0) {
					
					t = '<option value selected>- Select One -</option>';
					$.each(data.data, function(i, o) {
						var sl ="";
						if(o.tnt_alias == b){ sl = "selected"; } else{ sl="";}
						t += '<option value="' + o.tnt_alias + '" '+sl+'>' + o.tnt_name + '</option>';
					});
					$("#ddlTenant").empty().append(t).selectpicker("refresh");
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
		var t = "";
		var inte = 0;
		t += '<label > NON BRANCH </label>', 
		t += '<label for="checkeds' + inte + '" class="target" id="target' + inte + '">',
		 t += '<input type="checkbox" class="checkeds" id="checkeds' + inte + '" value="0000601"/> 	NON BRANCH </label>',
		$.each(e, function (e, a) {
			$.each(a, function (e, a) {
				
		
				t += '<label > ' + e + ' </label>', 
				
				$.each(a, function (e, a) {
					inte++,
				
					t += '<label for="checkeds' + inte + '" class="target" id="target' + inte + '">',
					 t += '<input type="checkbox" class="checkeds" id="checkeds' + inte + '" value="' + a.brc_code + '"/> 	'+a.brc_name+' </label>'
					 
				});
				
			});
		}); $("#checkboxesins").empty().append(t);
	});
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
//	DataCallParameterDDL("branch", "crm_admin", ""),
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
				} else console.log(t);$('button[type=submit]').prop('disabled', false);		
				$("#userTable").DataTable().ajax.reload();
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
				n += '<button title="Delete" class="delete btn btn-xs btn-danger" id="' + a.usruserid + '" value="' + a.usruserid + '" ><i class=" fa fa-trash-o"></i></button>';
				n += '<button title="Reset Password" class="reset btn btn-xs btn-warning" id="' + a.usruserid + '" value="' + a.usruserid + '" ><i class=" fa fa-refresh"></i></button>';
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