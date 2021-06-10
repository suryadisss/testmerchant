<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Level Akses" />
	<jsp:param name="datatables" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
	<jsp:param name="noityjs" value="1" />
</jsp:include>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">

			<jsp:include page='_Side_Navigation.jsp' />
			<jsp:include page='_Top_Navigation.jsp' />

			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				style="z-index: 99999;" aria-labelledby="myModalLabel">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<form id="formInput" action="access_level/dopost" method="post">
							<input type="hidden" name="new_edit_status" id="new_edit_status" />
							<input type="hidden" name="id" id="id" />
							<div class="modal-header">

								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel"></h4>
							</div>
							<div class="modal-body">
								<table id="tbl1" class="table table-bordered "
									style="text-align: left;" cellSpacing="1" cellPadding="0"
									width="98%">
									<tr>
										<td style="width: 148px"><b>Kode Peran Pengguna</b></td>
										<td><input id="lulevelcode" name="lulevelcode"
											MaxLength="50" class="form-control" style="width: 350px;"
											required="required" /></td>
									</tr>
									<tr>
										<td style="width: 148px"><b>Nama Peran Pengguna</b></td>
										<td><input id="lulevelname" name="lulevelname"
											style="width: 350px;" MaxLength="50" class="form-control" /></td>
									</tr>
									<tr>
										<td style="width: 148px"><b>Deskripsi</b></td>
										<td><textarea id="luleveldescription"
												name="luleveldescription" MaxLength="50"
												style="width: 350px;" class="form-control"
												required="required"></textarea></td>
									</tr>
									<tr>
										<td><b>Batas</b></td>
										<td><span style="margin: 0 5px;"><b>Dari</b></span> <input
											ID="lulimitfrom" name="lulimitfrom" class="form-control"
											style="float: none; width: 350px;" value="0"
											onkeypress="return isNumberKey(event);"
											onkeyup="this.value=formatCurrency(this.value);" /> <span
											style="margin: 0 5px;"><b>Sampai</b></span> <input ID="lulimitto"
											name="lulimitto" class="form-control"
											style="float: none; width: 350px;" value="0"
											onkeypress="return isNumberKey(event);"
											onkeyup="this.value=formatCurrency(this.value);" /></td>
									</tr>
									<tr id="trStat">
										<td style="width: 148px"><b>Diaktifkan</b></td>
										<td><input type="checkbox" id="lustatus" name="lustatus"
											 /></td>
									</tr>
									<tr id="trStat2">
										<td style="width: 148px"><b>Web Merchant</b></td>
										<td><input type="checkbox" id="is_merchant" name="is_merchant" onclick="checkVal(this)"/></td>
									</tr>
									
									<tr>
										<td colspan="2">
											<table id="tblLevel" width="100%"></table>

										</td>
									</tr>
								</table>


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
								<h2>Access Level</h2>
								<ul class="nav navbar-right panel_toolbox">
									<!-- <li><a class="collapse-link"><i
											class="fa fa-chevron-up"></i></a></li>
									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-expanded="false"><i
											class="fa fa-wrench"></i></a>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#">Settings 1</a></li>
											<li><a href="#">Settings 2</a></li>
										</ul></li>
									<li><a class="close-link"><i class="fa fa-close"></i></a>
									</li> -->
								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<button id="addNew" class="btn btn-primary btn-sm">Tambah baru</button>
								<table id="AccessLevelTable" class="table table-hover"
									width="100%">
									<thead>
										<tr>
											<td width="30%">Nama</td>
											<td width="40%">Deskripsi</td>
											<td width="15%">Status</td>
											<td width="15%">Tindakan</td>
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
	<jsp:param name="noityjs" value="1" />
</jsp:include>

<script>
function deleteAccLev(e){var t=$.ajax({type:"GET",url:"${local_server}/access_level/deleteacclev/"+e,async:!1,success:function(e){}}).responseText,l=JSON.parse(t);return console.log(l),1==l.success?"Deleted":"Failed to delete data"}function fCheck(e){e.title&&fCheckChild(e.checked,e.title.split(",")),e.lang&&fCheckParent(e.checked,e.lang)}function fCheckChild(pValue,pArr){for(var i=0;i<pArr.length;i++)lObj=eval("document.getElementById('"+pArr[i]+"')"),lObj.checked=pValue,lObj.title&&fCheckChild(pValue,lObj.title.split(","))}function fCheckParent(pValue,pParent){if(lObj=eval("document.getElementById('"+pParent+"')"),pValue)lObj.checked=pValue,lObj.lang&&fCheckParent(pValue,lObj.lang);else if(lObj.title){lAllChildUnchecked=!0,lArr=lObj.title.split(",");for(var i=0;i<lArr.length;i++)lObjChild=eval("document.getElementById('"+lArr[i]+"')"),lObjChild.checked&&(lAllChildUnchecked=!1);lAllChildUnchecked&&(lObj.checked=pValue,lObj.lang&&fCheckParent(pValue,lObj.lang))}}function getDetailAccessLevel(e){$.get("${local_server}/access_level/getdetailacc/"+e,function(e){console.log(e);var t=JSON.parse(e),l=t.data[0];$.each(l,function(e,t){var l="#"+e,a=$(String(l)).attr("type");"checkbox"===a?$(String(l)).prop("checked",t):$(String(l)).val(t)})})}function getLevelDetail(e){console.log(e);$.get("${local_server}/access_level/getlevellist/"+e,function(e){console.log("ini");console.log(e);var t=JSON.parse(e),l=t.data;0==t.status?$.alert(t.message):$.each(l,function(e,t){var l="#"+t.ldlmdescription,a=$(String(l)).attr("type");checkExists(String(l))&&("checkbox"===a?(console.log(l),$(String(l)).prop("checked",!0)):$(String(l)).val(t))})})}function generateLevel(){var e=$.ajax({type:"GET",url:"${local_server}/access_level/getparentacc/",async:!1,success:function(e){}}).responseText,t="",l=JSON.parse(e);t+="<tr>",$.each(l.data,function(e,l){t+="<td valign='top' style='padding:10px;'>",t+="<fieldset>",t+="<table width='100%'>",t+="<tr>",t+="<td width='20%'><input type='checkbox' name='inputcheckbox' value='"+l.lmdescription+"' id='"+l.lmdescription+"' onclick='fCheck(this)' title='"+getLang(l.alcid)+"'/></td>",t+="<td width='80%' colspan='4'>"+l.lmname+"</td>",t+="</tr>",t+="<tr>",t+="<td></td>",t+="<td colspan='4'>",t+="<table>";var a=l.lmdescription,n=$.ajax({type:"GET",url:"${local_server}/access_level/getdatachild/"+l.alcid,async:!1,success:function(e){}}).responseText,c=JSON.parse(n);$.each(c.data,function(e,l){t+="<tr style='margin-bottom:50px;'>",t+="<td width='20%'><input type='checkbox' name='inputcheckbox' value='"+l.lmdescription+"' id='"+l.lmdescription+"' lang='"+a+"' onclick='fCheck(this)'/></td>",t+="<td width='80%'>"+l.lmname+"</td>",t+="</tr>"}),t+="</table>",t+="</td>",t+="</tr>",t+="</table>",t+="</fieldset>",t+="<td>"}),t+="</tr>",$("#tblLevel").append(t)}function getLang(e){var t=$.ajax({type:"GET",url:"${local_server}/access_level/getlang/"+e,async:!1,success:function(e){}}).responseText,l=JSON.parse(t);return l.success===!0?l.data[0].langs:""}function checkExists(e){var t=!1;return $(e).length&&(t=!0),t}function checkVal(e){}$(document).ready(function(){$("#formInput").submit(function(e){console.log($("#formInput").serialize());var t="access_level/dopost";$.ajax({type:"POST",url:t,data:$("#formInput").serialize(),cache:!1,complete:function(e,t){if("error"!==t&&e.responseText){$("#myModal").modal("hide");var l=e.responseText;$.confirm({title:"",content:l,buttons:{somethingElse:{text:"OK",btnClass:"btn-success",keys:["enter"],action:function(){$("#AccessLevelTable").DataTable().ajax.reload()}}}})}else console.log(t)}}),e.preventDefault()}),$("#AccessLevelTable").dataTable({ajax:"${local_server}/access_level/getlistlevel",deferRender:!0,columns:[{data:"lulevelname"},{data:"lulevelname"},{data:"lustatusformat"},{render:function(e,t,l){var a='<button class="edit btn btn-xs btn-success" id="'+l.id+'" rel="'+l.lulevelcode+'" value="'+l.lulevelname+'" ><i class=" fa fa-edit"></i></button><button class="delete btn btn-xs btn-danger" id="'+l.id+'" rel="'+l.lulevelcode+'" value="'+l.lulevelname+'" ><i class=" fa fa-trash-o"></i></button>';return a},orderable:!1}]}),$("#AccessLevelTable").on("click","button.edit",function(e){var t=this.id,l=this.value;$("#myModalLabel").html("Access Level <span class='label label-default'>Edit</span>"),$("#formInput")[0].reset(),$("#new_edit_status").val("edit"),$("#id").val(t),$("#lulevelcode").prop("readonly",!0),getDetailAccessLevel(t),getLevelDetail(l),$("#myModal").modal("show")}),$("#AccessLevelTable").on("click","button.delete",function(e){e.preventDefault();var t=this.id,l=this.value;$.confirm({title:"Confirm",content:'Are you sure to want delete Access Level "'+l+'" ?',buttons:{cancel:function(){$.alert("Canceled")},somethingElse:{text:"Delete",btnClass:"btn-danger",keys:["enter"],action:function(){$.alert(deleteAccLev(t)),$("#AccessLevelTable").DataTable().ajax.reload()}}}})}),$("#addNew").on("click",function(){$("#myModal").modal("show"),$("#formInput")[0].reset(),$("#new_edit_status").val("new"),$("#myModalLabel").html("Access Level <span class='label label-default'>New</span>"),$("#lulevelcode").prop("readonly",!1),$("#id").val(0)}),generateLevel()});
</script>

</html>

