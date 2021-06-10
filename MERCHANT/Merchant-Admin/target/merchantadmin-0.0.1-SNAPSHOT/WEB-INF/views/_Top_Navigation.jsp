
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- top navigation -->

<div class="se-pre-con hide" style="padding:50px;">
	
	<center style="margin-top:350px;font-size:14pt"><span class="label label-info" id="msgProgres"></span></center>

</div>

<div class="top_nav">
	<div class="nav_menu">
		<nav class="" role="navigation">
			<div class="nav toggle">
				<a id="menu_toggle"><i class="fa fa-bars"></i></a>
			</div>

			<ul class="nav navbar-nav navbar-right">


				<li class=""><a href="javascript:;"
					class="user-profile dropdown-toggle" data-toggle="dropdown"
					aria-expanded="false"> <img
						src="<c:url value="/resources/images/user.png"/>"><%=session.getAttribute("usrname")%>
						<span class=" fa fa-angle-down"></span>
				</a>
					<ul class="dropdown-menu dropdown-usermenu pull-right">
						<li><a href="${local_server}/change_password">Ubah Kata Sandi</a></li>
						<li><a href="${local_server}/change_email">Ubah Email</a></li>
						<li><a href="${local_server}/login/do_logout"><i
								class="fa fa-sign-out pull-right"></i> Keluar</a></li>
					</ul></li>

			</ul>
		</nav>
	</div>
</div>

<div class="modal fade" id="myModalVersion" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
							<div class="modal-header">

								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title">Dana Kini Indonesia System</h4>
							</div>
							<div class="modal-body">
							<fieldset
									style="background: #f7f8f9; border: 1px solid #eff0f2; padding: 10px; margin-bottom: 50px;">
									<table width="100%">
										<tr>
											<td>
												<table width="100%">
													<tr>
														<td width="40%">Application Name</td>
														<td width="10%">:</td>
														<td><label class="app_name"></label></td>
													</tr>
													<tr>
														<td>Deskripis</td>
														<td>:</td>
														<td><label class="app_descs"></label></td>
													</tr>
													<tr>
														<td>Last Version</td>
														<td>:</td>
														<td><label class="app_versions"></label></td>
													</tr>
												</table>

											</td>
											<td>
												<table width="100%">
													<tr>
														<td width="40%">Media</td>
														<td width="10%">:</td>
														<td><label class="app_platform"></label></td>
													</tr>
													<tr>
														<td>Arsitektur</td>
														<td>:</td>
														<td><label class="app_architecture"></label></td>
													</tr>
													<tr>
														<td>Perubahan Terakhir</td>
														<td>:</td>
														<td><label class="app_updated_date"></label></td>
													</tr>
												</table>

											</td>
										</tr>

									</table>

								</fieldset>
								<table class="table table-hover" id="tblVersionModal" width="100%">
									<thead>
										<tr>
											<td width="10%">Versi</td>
											<td width="15%">Status</td>
											<td width="35%">Subjek</td>

											<td width="10%">Tanggal perubahan</td>
											<td width="35%">Aplikasi</td>
											<td width="5%">Berkas</td>
										</tr>
									</thead>
								</table>
							
							</div>
					
					</div>
				</div>
			</div>
<!-- /top navigation -->