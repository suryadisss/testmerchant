
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-md-3 left_col menu_fixed" style="z-index: 1000;">
	<div class="left_col scroll-view">
		<div class="navbar nav_title" style="border: 0;">
			<a href="#" class="site_title"><i class="fa fa-snowflake-o"></i>
				<span>DANA KINI</span></a>
		</div>

		<div class="clearfix"></div>

		<!-- menu profile quick info -->
		<div class="profile">
			<div class="profile_pic">
				<img src="<c:url value="/resources/images/user.png"/>"
					class="img-circle profile_img">

			</div>
			<div class="profile_info">
				<span>Selamat Datang,</span>
				<h2><%=session.getAttribute("usrname")%> - <%=session.getAttribute("branchname")%></h2>
			</div>
		</div>
		<!-- /menu profile quick info -->

		<br />

		<!-- sidebar menu -->
		<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
			
			<div class="menu_section" style="margin-top: 80px;"
				onload="getMenu()">

				<div id="selectedTarget"></div>
				
				
			</div>

		</div>
		
		<div class="sidebar-footer hidden-small">
			<!--<a data-toggle="tooltip" data-placement="top" title="Logout">
							<span class="glyphicon glyphicon-off" aria-hidden="true"></span>
						</a>  -->
		</div>
	</div>
</div>

<script src="<c:url value="/resources/libs/jquery/dist/jquery.min.js"/>" /></script>
<script type="text/javascript">
getMenuList();


function getMenuLevel(idx) {	
	var x = $.ajax({
		type : 'GET',
		async: false,
		url : '${local_server}/levelDynamic/getMnLvl/'+ idx,
		success : function(data) {
					
				}
	});
	return JSON.parse(x.responseText);
}

function getMenuList() {
	var lvusr = levelUser();
	var objParent = getMenuLevel(0);	
	
	var html = "";
	html += '<ul class="nav side-menu">';
	
	for(var i = 0;i < objParent.data.length;i++) {
		
		for(var u = 0; u < lvusr.length; u++) {
			if(lvusr[u].ldlmdescription == objParent.data[i].mn_acl) {
				
				var objChild = getMenuLevel(objParent.data[i].id);
				
				if(objChild.data.length > 0) {
					html += '<li><a><i class="'+ objParent.data[i].mn_icon +'"></i>'+ objParent.data[i].mn_name;
					html += '<span class="fa fa-chevron-down"></span></a>';
					html += '<ul class="nav child_menu">';
					
					for(var z = 0;z < objChild.data.length;z++) {
						
						for(var o = 0; o < lvusr.length; o++) {
							if(lvusr[o].ldlmdescription == objChild.data[z].mn_acl) {
								
								var objChildDown = getMenuLevel(objChild.data[z].id);
								
								if(objChildDown.data.length > 0) {
									html += '<li><a>'+ objChild.data[z].mn_name;
									html +=  '<span class="fa fa-chevron-down"></span></a>';
									html += '<ul class="nav child_menu">';
									
									for(var zz = 0;zz < objChildDown.data.length;zz++) {
										for(var h = 0; h < lvusr.length; h++) {
											if(lvusr[h].ldlmdescription == objChildDown.data[zz].mn_acl) {
												
												html += '<li class="sub_menu"><a href="${local_server}'+ objChildDown.data[zz].mn_link +'">'+ objChildDown.data[zz].mn_name +'</a></li>';
												
											}
										}
										
									}
									html += '</ul>';
									html += '</li>';
								} else {
									html += '<li><a href="${local_server}'+ objChild.data[z].mn_link +'">'+ objChild.data[z].mn_name;
									html += '</li>';
								}
								
								
							}
						}
						
						
						
					}
					html += '</ul>';
					html += '</li>';
				} else {
					html += '<li><a href="${local_server}'+ objParent.data[i].mn_link +'"><i class="'+ objParent.data[i].mn_icon +'"></i>'+ objParent.data[i].mn_name;
					html += '</li>';
				}
				
				
			}
		}
		
		
		
		
	}
	
	html += '</ul>';
	$("#selectedTarget").html(html);
}

function levelUser() {
	var x = $.ajax({
		type : 'GET',
		async: false,
		url : '${local_server}/login/getmenu',
		success : function(data) {
					
				}
	});
	return JSON.parse(x.responseText);
	
}


function getBread(param){
	var x = $.ajax({
		type : 'GET',
		async: false,
		url : '${local_server}/advance_menu/bread?url='+ param,
		success : function(data) {
					
				}
	});
	var x = JSON.parse(x.responseText);
	var j = "";
	if(x.status=="Success"){
		if(Object.keys(x.data).length>0){
			j= String(x.data[0].mn_breadcrumb);
		}
	}
	
	return j;
}
 </script>
