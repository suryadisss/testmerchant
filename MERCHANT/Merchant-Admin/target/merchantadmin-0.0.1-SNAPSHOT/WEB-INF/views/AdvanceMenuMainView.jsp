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
								<h4 class="modal-title" id="myModalLabel">Menu Perubahan</h4>
							</div>
							<div class="modal-body">
								<div class="form-horizontal">

									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Nama</label>
										<div class="col-sm-6">
											<input type="hidden" name="id" id="id" class="form-control"
												required="required" /> <input type="text" name="mn_name"
												id="mn_name" class="form-control" required="required" />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Parent</label>
										<div class="col-sm-6">
											<select name=parent id="parent" class="form-control">

											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Nilai Order</label>
										<div class="col-sm-6">
											<input type="text" name="mn_orderid" id="mn_orderid"
												class="form-control" required="required" />
										</div>
									</div>
									<div class="form-group">
										<label for="scc_code" class="col-sm-4 control-label">
											Judul</label>
										<div class="col-sm-6">
											<textarea type="text" name="breadcrumb" id="breadcrumb"
												class="form-control" required="required" rows="5"></textarea>
										</div>
									</div>

								</div>
								<p>Sub Menu</p>
								<div id="submen"
									style="background: #edeeef; padding: 10px; overflow-y: auto; height: 150px;">


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
								<div
									style="padding: 20px; border-radius: 1em; -webkit-box-shadow: inset 0px 0px 18px -4px rgba(130, 130, 130, 0.74); -moz-box-shadow: inset 0px 0px 18px -4px rgba(130, 130, 130, 0.74); box-shadow: inset 0px 0px 18px -4px rgba(130, 130, 130, 0.74);">
									<p>Menu Hirarki</p>
									<div id="tree-content" style="overflow-y: auto;heigth: 200px;"></div>
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
	$(document).ready(function(e) {
		showMenuList();

		$("#formInput").submit(function(e) {

			$.ajax({
				type : "POST",
				url : "${local_server}/advance_menu/update",
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
								title : '',
								content : n.message,
								type : 'green',
								typeAnimated : true,
								buttons : {
									reload : {
										text : 'RELOAD PAGE',
										btnClass : 'btn-green',
										action : function() {

											location.reload();
										}
									},
									ok : {
										text : 'OK',
										btnClass : '',
										action : function() {

											showMenuList();
										}
									},
								}
							});

						}
					}
				}
			});
			e.preventDefault();
		});

	});
	function showModal(id) {
		$("#myModal").modal('show');
		$("#formInput")[0].reset();
		$("#parent").empty();
		showMenuListMod(id);
		showMenuListMod2(id);
	}

	function showMenuListMod2(id) {
		$.get("${local_server}/advance_menu/det/" + id, function(data) {

			var x = JSON.parse(data);

			$.each(x.data[0], function(i, o) {
				$("#" + i).val(o);
				if (i == "mn_parentid") {
					showDDLMenu(o);
				}
			})

		});
	}

	function showMenuListMod(id) {
		$.get("${local_server}/advance_menu/getlist/" + id, function(data) {

			var x = JSON.parse(data);

			$("#submen").html(genereateMnx(x.data, true));

		});
	}

	function showMenuList() {
		$.get("${local_server}/advance_menu/getlist", function(data) {

			var x = JSON.parse(data);

			$("#tree-content").html(genereateMn(x.data, true));

		});
	}

	function showDDLMenu(d) {
		$.get("${local_server}/advance_menu/getlist", function(data) {

			var x = JSON.parse(data);

			generateParent(x.data, d);

		});
	}

	function generateParent(x, d) {
		var ht = "<option value='0'>ROOT</option>";
		$.each(x, function(i, o) {
			var selected = (o.id == d) ? "selected" : "";
			ht += "<option value='"+o.id+"' "+selected+">" + o.mn_name
					+ "</option>"
			if (Object.keys(o.sub_menu).length > 0) {
				ht += "<optgroup label ='"+o.mn_name +"'>"
				ht += generateParentX(o.sub_menu, d);
				ht += "</optgroup>";
			}
		});

		$("#parent").empty().append(ht)
	}

	function generateParentX(x, d) {
		var ht = "";
		$.each(x, function(i, o) {
			//ht += "<optgroup label ='"+o.mn_name +"'>"
			var selected = (o.id == d) ? "selected" : "";

			ht += "<option value='"+o.id+"' "+selected+">" + o.mn_name
					+ "</option>"
			if (Object.keys(o.sub_menu).length > 0) {
				//ht += "<optgroup label ='"+o.mn_name +"'>"
				ht += generateParentX(o.sub_menu, d);
				//ht += "</optgroup>";
			}

		});
		return ht;

	}

	function genereateMnx(x, stat) {

		var ht = (stat) ? "<ul class='tree'>" : "<ul>";
		$.each(x, function(i, o) {
			ht += "<li>";
			ht += "" + o.mn_name + "  ";
			if (Object.keys(o.sub_menu).length > 0) {
				ht += genereateMnx(o.sub_menu, false);
			}
			ht += "</li>";
		})
		ht += "</ul>";
		return ht;

	}
	function genereateMn(x, stat) {

		var ht = (stat) ? "<ul class='tree'>" : "<ul>";
		$
				.each(
						x,
						function(i, o) {
							ht += "<li> <button onclick=\"showModal("
									+ o.id
									+ ")\"  id='"
									+ o.id
									+ "' class='rename btn btn-success btn-xs'><i class='fa fa-edit'></i></button>";
							var xj = (o.breadcrumb!=null && String(o.breadcrumb).trim()!=""&&o.breadcrumb!="null")?"  <span class='label label-default'><i> "+o.breadcrumb+"</i></span>":"";
							ht += "" + o.mn_name + xj ;
							if (Object.keys(o.sub_menu).length > 0) {
								ht += genereateMn(o.sub_menu, false);
							}
							ht += "</li>";
						})
		ht += "</ul>";
		return ht;

	}
</script>

</html>

