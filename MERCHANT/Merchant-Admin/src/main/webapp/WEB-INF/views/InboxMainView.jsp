<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Inbox" />
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
						<form id="formInput">
							<input type="hidden" name="new_edit_status" id="new_edit_status" />
							<input type="hidden" name="rul_id" id="rul_id" />
							<div class="modal-header">

								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">
									<i class="fa fa-envelope"></i> Kotak Masuk
								</h4>
							</div>
							<div class="modal-body">
								<div>
									<div class="mail_heading row ">

										<div class="col-md-6 text-left">
											<p class="date">
												<i class="fa fa-hand-o-right" aria-hidden="true"></i> Untuk : <span id="usr_id"></span>
											</p>
											<p class="date">
												<i class="fa fa-hand-o-right" aria-hidden="true"></i> Dari : <span id="usr_msg_from"></span>
											</p>
										</div>
										<div class="col-md-6 text-right">
											<p class="date">
												<i class="fa fa-calendar " aria-hidden="true"></i> <span id="usr_msg_date"></span>
											</p>
										</div>
										<div class="col-xs-12 col-sm-12 col-lg-12">
											<h4 id="ntf_desc"></h4>
										</div>
										<div class="view-mail pull-right" id="action_link"></div>
									</div>
								</div>
								<div class="inbox-body"
									style="background: #f4f4f4; border-radius: 0.5em; padding: 10px;">
									<div class="view-mail" id="usr_msg"></div>
									<div class="view-mail pull-right" id="action_link"></div>


								</div>



							</div>
							<div class="modal-footer">
								<button class="btn btn-default" data-dismiss="modal">Tutup</button>
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
								<h2>
									Kotak Masuk <small>Surat Pengguna</small>
								</h2>
								<ul class="nav navbar-right panel_toolbox">
									<li><a class="collapse-link"><i
											class="fa fa-chevron-up"></i></a></li>
									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-expanded="false"><i
											class="fa fa-wrench"></i></a>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#">Pengaturan 1</a></li>
											<li><a href="#">Pengaturan 2</a></li>
										</ul></li>
									<li><a class="close-link"><i class="fa fa-close"></i></a>
									</li>
								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<div class="row">
									<div class="col-sm-12 ">
										<table id="inboxTable" class="table table-hover">
											<thead>
												<tr>
													<td></td>
													<td width="5%"></td>
													<td width="20%">Dari</td>
													<td width="45%">Pesan</td>
													<td width="20%">Tanggal</td>
													<td width="15%">Tindakan</td>
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
function deleteMsg(e){var t=$.ajax({type:"GET",url:"${local_server}/inbox/deletemsg/"+e,async:!1,success:function(e){return e.status}}).responseText;return t}function setRead(e){$.ajax({type:"GET",url:"${local_server}/inbox/setreadmsg/"+e,async:!0,dataType:"json",beforSend:function(){},success:function(t){"Success"==t.status?getMsg(e):$.alert("Failed get message")},complete:function(){}})}function spTgl(e){if(null!=e){var t=e.split("T"),n=t[0],a=t[1].split(".");return n+" "+a[0]}return""}function getMsg(e){$.ajax({type:"GET",url:"${local_server}/inbox/getdetailmsg/"+e,async:!0,beforSend:function(){},success:function(e){console.log(e),e=JSON.parse(e),"Success"==e.status&&$.each(e.data,function(t,n){if($.each(e.data[t],function(e,t){t="usr_msg_date"==e?spTgl(t):t,$("#"+String(e)).html(t)}),"inquiry"==n.ntf_page){var a="${local_server}/inquiry/det/"+n.usr_msg_param;$("#usr_msg").append(" <a class='btn btn-success blink btn-xs pull-right' href='"+a+"'>ke Pemeriksaan</a>")}})},complete:function(){$("#myModal").modal("show"),$("#inboxTable").DataTable().ajax.reload(),getCountInbox("${id}")}})}function checkExists(e){var t=!1;return $(e).length&&(t=!0),t}$(document).ready(function(){$("#inboxTable").on("click","button.edit",function(e){var t=this.id;setRead(t)}),$("#inboxTable").on("click","button.delete",function(e){e.preventDefault();var t=this.id;this.value;$.confirm({title:"Confirm",content:"Are you sure to want delete this message ?",buttons:{cancel:function(){$.alert("Canceled")},somethingElse:{text:"Delete",btnClass:"btn-danger",keys:["enter"],action:function(){var e=JSON.parse(deleteMsg(t));console.log(e),$.alert(e.status),$("#inboxTable").DataTable().ajax.reload()}}}})}),$("#inboxTable").DataTable({ajax:"${local_server}/inbox/getinboxuser/${id}",order:[[0,"asc"]],columns:[{data:"usr_msg_is_read",visible:!1},{data:"usr_msg_is_read",render:function(e,t,n){return 0==e?"<i class='fa fa-envelope green blink'></i>":"<i class='fa fa-envelope-open-o '></i>"}},{data:"usr_msg_from"},{data:"usr_msg"},{data:"usr_msg_date",render:function(e,t,n){return spTgl(n.usr_msg_date)}},{orderable:!1,render:function(e,t,n){var a=0==n.usr_msg_is_read?"btn-success":"",s='<button class="edit btn btn-xs '+a+'" id="'+n.id+'" ><i class=" fa fa-envelope-open"></i></button><button class="delete btn btn-xs btn-danger" id="'+n.id+'" ><i class=" fa fa-trash"></i></button>';return s}}]})});
</script>

</html>

