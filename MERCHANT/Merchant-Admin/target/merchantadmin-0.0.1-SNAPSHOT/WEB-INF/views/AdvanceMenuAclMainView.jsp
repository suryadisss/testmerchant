<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Advance Menu" />
	<jsp:param name="datatables" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
	<jsp:param name="jquerydatepicker" value="1" />
	<jsp:param name="noityjs" value="1" />
	<jsp:param name="treemenu" value="1" />

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
							<div class="modal-header">

								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Ubah</h4>
							</div>
							<div class="modal-body">
								<div class="form-horizontal">

									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Nama</label>
										<div class="col-sm-6">
											<input type="hidden" name="id"
												id="id" class="form-control" required="required" />
											<input type="text" name="lm_name" id="lm_name"
												class="form-control" required="required" />
										</div>
									</div>
									
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Parent</label>
										<div class="col-sm-6">
											
											<select id="lm_parentid" name="lm_parentid" class="form-control">
											
											</select>
										</div>
									</div>
									

								</div>
								

							</div>
							<div class="modal-footer">
								<button class="btn btn-default" data-dismiss="modal">Tutup</button>
								<button type="submit" id="submit" class="btn btn-primary">Ubah
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="right_col" role="main">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-lg-12d">
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
								<div>
									<p>Menu Hirarki</p>
									<table id="tblLevel" class='table'></table>
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
	function editMn(idm) {
		$("#myModal").modal('show');
		$("#formInput")[0].reset();
		//showMenuListMod(id);
		$("#lm_parentid").empty();
		showMenuListMod2(idm);
		//generateParent()
	}
	
	function generateParent(d) {
		var e = $.ajax({
			type : "GET",
			url : "${local_server}/advance_menu/parentdet",
			async : !1,
			success : function(e) {
			}
		}).responseText, x = JSON.parse(e);
		
		var ht = "<option value='0'>ROOT</option>";
		$.each(x.data, function(i, o) {
			var selected = (o.id == d) ? "selected" : "";
			ht += "<option value='"+o.id+"' "+selected+">" + o.lm_name
					+ "</option>"
		});

		$("#lm_parentid").empty().append(ht)
	}


	function showMenuListMod2(idm) {
		//var xid =id;
		
		
		$.get("${local_server}/advance_menu/detacc/" + idm, function(data) {

			var x = JSON.parse(data);

			$.each(x.data[0], function(i, o) {
				if(i == "lm_parentid"){
					generateParent(o);
				}
				$("#" + i).val(o);
			})

		});
	}

	function generateLevel() {
		var e = $.ajax({
			type : "GET",
			url : "${local_server}/access_level/getparentacc/",
			async : !1,
			success : function(e) {
			}
		}).responseText, t = "", l = JSON.parse(e);
				//$("#tblLevel").html("loading ..")
				$("#tblLevel").empty().append("Loading");
				t += "<tr>",
				$
						.each(
								l.data,
								function(e, l) {
											t += "<td valign='top' style='padding:10px;'>",
											t += "<fieldset>",
											t += "<table class='table table-bordered' width='100%'>",
											t += "<tr>",
											t += "<td width='20%'><button class='btn btn-success btn-xs' onclick=\"editMn('"
													+ l.alcid
													+ "')\" ><i class='fa fa-edit'></i></button></td>",
											t += "<td width='80%' colspan='4'>"
													+ l.lmname + "</td>",
											t += "</tr>",
											t += "<tr>",
											t += "<td></td>",
											t += "<td colspan='4'>",
											t += "<table class='table table-bordered'>";
									var a = l.lmdescription, n = $
											.ajax({
												type : "GET",
												url : "${local_server}/access_level/getdatachild/"
														+ l.alcid,
												async : !1,
												success : function(e) {
												}
											}).responseText, c = JSON.parse(n);
									$
											.each(
													c.data,
													function(e, l) {
																t += "<tr style='margin-bottom:50px;'>",
																t += "<td width='20%'><button class='btn btn-success btn-xs' onclick=\"editMn('"
																		+ l.lmid
																		+ "')\" ><i class='fa fa-edit'></i></button></td>",
																t += "<td width='80%'>"
																		+ l.lmname
																		+ "</td>",
																t += "</tr>"
													});

									t += "</table>";
									t += "</td>";
									t += "</tr>";
									t += "</table>";
									t += "</fieldset>", t += "<td>"
								}), t += "</tr>", $("#tblLevel").empty().append(t)
	}

	$(document).ready(function() {
		generateLevel();
		
		$("#formInput").submit(function(e) {

			$.ajax({
				type : "POST",
				url : "${local_server}/advance_menu/update/acc",
				data : $(this).serialize(),
				cache : !1,
				beforeSend : function() {
					$('button[type=submit]').prop('disabled', true);
				},
				complete : function(e, t) {
					$('button[type=submit]').prop('disabled', false);
					if ("error" !== t && e.responseText) {
						var n = JSON.parse(e.responseText);
						if (n.status == "Success") {
							$("#myModal").modal("hide");
							$.confirm({
							    title: '',
							    content: n.message,
							    type: 'green',
							    typeAnimated: true,
							    buttons: {
							        reload: {
							            text: 'OK',
							            btnClass: 'btn-green',
							            action: function(){
							            	
							            	generateLevel();
							            }
							        }
							    }
							});

						}
					}
				}
			});
			e.preventDefault();
		});

	});
</script>

</html>

