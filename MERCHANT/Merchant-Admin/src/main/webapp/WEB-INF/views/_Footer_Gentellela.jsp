<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jQuery -->
<script src="<c:url value="/resources/libs/jquery/dist/jquery.min.js"/>" /></script>
<!-- Bootstrap -->
<script
	src="<c:url value="/resources/libs/bootstrap/dist/js/bootstrap.min.js"/>" /></script>
<!-- FastClick -->
<script
	src="<c:url value="/resources/libs/fastclick/lib/fastclick.js"/>" /></script>
<!-- NProgress -->
<%-- <script src="<c:url value="/resources/libs/nprogress/nprogress.js"/>" /></script> --%>
<!-- jQuery custom content scroller -->
<!-- IZ -->
<script
	src="<c:url value="/resources/libs/kiniCintaku/js/ekko-lightbox.js"/>" /></script>
<script src="<c:url value="/resources/libs/kiniCintaku/js/front.js"/>" /></script>
<script src="<c:url value="/resources/libs/kiniCintaku/js/webcam.js"/>" /></script>


<script
	src="<c:url value="/resources/libs/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"/>" /></script>

<!-- Custom Theme Scripts -->
<script src="<c:url value="/resources/libs/build/js/custom.js"/>"></script>
<script src="<c:url value="/resources/libs/build/js/jquery.twbsPagination.js"/>"></script>

<script
	src="<c:url value="/resources/libs/jquery-confirm/jquery-confirm.min.js"/>"></script>

<%
	if (request.getParameter("datatables") != null) {
%>
<!-- Datatables -->
<script src="<c:url value="/resources/libs/datesort/moment.min.js"/>"></script>
<script
	src="<c:url value="/resources/libs/datatables.net/js/jquery.dataTables.min.js"/>"></script>
<script
	src="<c:url value="/resources/libs/datatables.net-bs/js/dataTables.bootstrap.min.js"/>"></script>
<script
	src="<c:url value="/resources/libs/datatables.net-buttons/js/dataTables.buttons.min.js"/>"></script>
<script
	src="<c:url value="/resources/libs/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"/>"></script>
<script
	src="<c:url value="/resources/libs/datatables.net-buttons/js/buttons.flash.min.js"/>"></script>
<script
	src="<c:url value="/resources/libs/datatables.net-buttons/js/buttons.html5.min.js"/>"></script>
<script
	src="<c:url value="/resources/libs/datatables.net-buttons/js/buttons.print.min.js"/>"></script>
<script
	src="<c:url value="/resources/libs/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"/>"></script>
<script
	src="<c:url value="/resources/libs/datatables.net-keytable/js/dataTables.keyTable.min.js"/>"></script>
<script
	src="<c:url value="/resources/libs/datatables.net-responsive/js/dataTables.responsive.min.js"/>"></script>
<script
	src="<c:url value="/resources/libs/datatables.net-responsive-bs/js/responsive.bootstrap.js"/>"></script>
<script
	src="<c:url value="/resources/libs/datatables.net-scroller/js/dataTables.scroller.min.js"/>"></script>

<script
	src="<c:url value="/resources/libs/datatables.net-pdfmake/pdfmake.min.js"/>"></script>
<script
	src="<c:url value="/resources/libs/datatables.net-pdfmake/vfs_fonts.js"/>"></script>
<script
	src="<c:url value="/resources/libs/datatables.net-pdfmake/jszip.min.js"/>"></script>
<script
	src="<c:url value="/resources/libs/datatables/dataTables.tableTools.min.js"/>"></script>
<script src="<c:url value="/resources/libs/datesort/datetime-moment.js"/>"></script>	


<%
	}
%>
<%
	if (request.getParameter("validate") != null) {
%>
<script src="<c:url value="/resources/js/jquery.validate.js"/> "></script>
<%
	}
%>
<%
	if (request.getParameter("jqueryconfirm") != null) {
%>


<%
	}
%>
<%
	if (request.getParameter("jquerydatepicker") != null) {
%>
<script src="<c:url value="/resources/libs/datepicker/moment.js"/>"></script>
<script
	src="<c:url value="/resources/libs/jquery/src/jquery-ui.js"/>"></script>
<script
	src="<c:url value="/resources/libs/datepicker2/js/bootstrap-datetimepicker.min.js"/>"></script>
<%
	}
%>
<%
	if (request.getParameter("inputmask") != null) {
%>
<script src="<c:url value="/resources/libs/inputmask/inputmask.js"/>"></script>
<%
	}
%>

<%
	if (request.getParameter("noityjs") != null) {
%>
<script src="<c:url value="/resources/libs/notifyjs/dist/notify.js"/>"></script>
<script
	src="<c:url value="/resources/libs/notifyjs/dist/styles/metro/notify-metro.js"/>"></script>
<%
	}
%>
<%
	if (request.getParameter("monthpicker") != null) {
%><script
	src="<c:url value="/resources/libs/monthpicker/src/jquery-ui.min.js"/>"></script>
<script
	src="<c:url value="/resources/libs/monthpicker/src/MonthPicker.js"/>"></script>
	
<%
	}
%>

<%
	if (request.getParameter("multipleselect") != null) {
%>
<script
	src="<c:url value="/resources/libs/notifyjs/dist/multiple2.min.js"/>"></script>
<script
	src="<c:url value="/resources/libs/notifyjs/dist/bootpopup.min.js"/>"></script>
<%
	}
%>
<%
	if (request.getParameter("timepicker") != null) {
%>
<script
	src="<c:url value="/resources/libs/timepicker/timepicker.js"/>"></script>

<%
	}
%>
<%
	if (request.getParameter("ass") != null) {
%>
<script
	src="<c:url value="/resources/libs/ass/ass.js"/>"></script>

<%
	}
%>
<script>
$(document).ready(function(){
	getVersion();
	$.ajax({
		type : 'GET',
		asyn : true,
		url : '<c:url value="/login/getmenu"/>',
		dataType : 'json',
		beforeSend: function(){
			$("#loadingMenu").removeClass("hide");
		},
		success : function(data) {
			$("#loadingMenu").addClass("hide");
			$.each(data, function(x,y){
						$("#mn_"+y.ldlmdescription).removeClass("hide");
					
			})
		},
		complete: function(){
			
		}
	});
	var usrid= "<%=session.getAttribute("session_id")%>";
		getCountInbox(usrid);
		
		
		
		$(".version").on("click",function(){
			$("#myModalVersion").modal("show");
			$.ajax({
				type : "GET",
				url : "${local_server}/version/getapp/1",
				dataType : "json",
				async : true,
				success : function(res) {
					$.each(res.data[0], function(i, o) {
						o = (i == "updated_date")?convertDateVersion(o):o;
						$(".app_" + i).html(o);
					});
				}
			});
			$('#tblVersionModal')
			.DataTable().destroy();
			$('#tblVersionModal')
			.DataTable(
					{
						ajax : {
							url : '${local_server}/version/getapplistdet/1',
							type : 'GET'
						},
						order: [[ 0, 'desc' ]],
						pageLength: 5,
						columns : [
								{

									data : 'app_version',
									render : function(data,
											type, row) {
										return "<label class='label label-default'>"
												+ data
												+ "</label>";
									}
								},

								{
									data : 'status_name',
									render : function(data,
											type, row) {
										return "<label class='label label-success'>"+data+"</label>";
									}
								},
								{
									data : 'apd_subject'
								},
								
								{
									data : 'dates',
									render : function(data,
											type, row) {
										return convertDateVersion(data);
									}
								},
								{
									data : 'apd_apps'
								},
								{
									data : 'files',
									render : function(data,
											type, row) {

										return (data != null&& data !=""&&data !="-")?"<a class='edit btn btn-xs btn-default' href='"+data+"' target='_blank'><i class='fa fa-download'></i></a>":"";

									}
								}

						]

					});
		});
	});
		
	function getVersion() {
	
		$.ajax({
			type : 'GET',
			asyn : true,
			url : '<c:url value="/version/getversiontext/"/>1' ,
			dataType : 'json',
			success : function(data) {
				if(data.status == "Success" && Object.keys(data.data).length>0){
					$("#versionLabel").html(data.data[0].vers_text);
				}
	
			}
		});
	}
	
	function convertDateVersion(val) {
		if (val != null && val != "") {
			var monthNames = [ "Januari", "Februari", "Maret", "April", "Mei",
					"Juni", "Juli", "Agustus", "September", "Oktober",
					"November", "Desember" ];
			var value = new Date(val.replace(/(\d{2})-(\d{2})-(\d{4})/,
					"$2/$1/$3"));
			var tgl = value.getDate();
			var bln = value.getMonth(); //+1;
			var thn = value.getFullYear();
			var dat = tgl + " " + monthNames[bln] + " " + thn;
			return dat;
		} else {
			return "";
		}
	}

	function checkToken() {
		$
				.ajax({
					type : "GET",
					url : '<c:url value="/login/token_status/"/>',
					async : !0,
					success : function(e) {
						var t = JSON.parse(e);
						if (t.success) {
							$
									.confirm({
										title : "",
										content : "Session expired, please login again",
										type : "red",
										typeAnimated : !0,
										autoClose : 'tryAgain|8000',
										buttons : {
											tryAgain : {
												text : "Login",
												btnClass : "btn-red",
												action : function() {
													window.location = "${local_server}/login/do_logout"
												}
											}
										}
									})
						}
					}
				})
	}

	function getCountInbox(val) {

		$.ajax({
			type : 'GET',
			asyn : true,
			url : '<c:url value="/inbox/getinboxuser/"/>' + val,
			dataType : 'json',
			success : function(data) {
				console.log(data);
				var x = 0;
				var dt = data.data;
				for (var i = 0; i < dt.length; i++) {
					if (dt[i].usr_msg_is_read == false) {
						x++;
					}
				}
				if (x != 0) {
					$("#jmMsg").html(x).addClass("badge badge-success");
				} else {
					$("#jmMsg").empty();
				}

			}
		});
	}
	
	function showLoadingProg(val,text){
		if(val== true){
			$(".se-pre-con").removeClass("hide");
			$("#msgProgres").html(text)
		}else{
			$(".se-pre-con").addClass("hide");
			$("#msgProgres").html(text)
		}
		
	}
	
	function formatCurrency(num) {
		num = num.toString().replace(/\$|\,/g, '');
		if (isNaN(num))
			num = "0";
		sign = (num == (num = Math.abs(num)));
		num = Math.floor(num * 100 + 0.50000000001);
		num = Math.floor(num / 100).toString();
		for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
			num = num.substring(0, num.length - (4 * i + 3)) + ',' + num.substring(num.length - (4 * i + 3));
		return (((sign) ? '' : '-') + num);
	}
	
	function formatNumber(num){
		num = num.toString().replace(/\$|\,/g, '');
		if (isNaN(num)) num = "0";
		
		return num;
	}
	
	function isNumberKey(evt) {
		var charCode = (evt.which) ? evt.which : event.keyCode;
		if (charCode > 31 && (charCode < 48 || charCode > 57))
			return false;

            return true;
	}
	
		
</script>


