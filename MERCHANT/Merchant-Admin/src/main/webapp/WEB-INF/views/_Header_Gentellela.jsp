<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" href="<c:url value="/resources/images/favicon.ico"/>"
	type="image/x-icon" />
<title><%=request.getParameter("title")%></title>
<style type="text/css">
.img-fluid {
	display: block;
	max-width: 100%;
	height: auto;
}
.ui-datepicker { position: relative; z-index: 10000 !important; }
.borderless td, .borderless th {
	border: none;
}

.txtleft {
	text-align: left;
}

.txtRigth {
	text-align: right;
}

.select-group input.form-control {
	width: 65%
}

.select-group select.input-group-addon {
	width: 35%;
}

.modal {
	overflow-y: auto;
}

.blink {
	animation: blinker 1s linear infinite;
}

@
keyframes blinker { 50% {
	opacity: 0.0;
}
}
</style>
<style type="text/css">
@media all {
	.page-break {
		display: none;
	}
}

@media print {
	.page-break {
		display: block;
		page-break-before: always;
	}
}
</style>
<style type="text/css">
div.gallery {
	margin: 5px;
	border: 1px solid #ccc;
	float: left;
	width: 180px;
}

div.gallery:hover {
	border: 1px solid #777;
}

div.gallery img {
	width: 100%;
	height: auto;
}

div.desc {
	padding: 15px;
	text-align: center;
}

.section-title {
	width: 100%;
	overflow-x: scroll(or auto);
}

.ScrollStyle {
	max-height: 250px;
	overflow-y: scroll;
}
</style>
<style type="text/css">
.frb-group {
	margin: 15px 0
}

.frb ~.frb {
	margin-top: 15px
}

.frb input[type=radio]:empty, .frb input[type=checkbox]:empty {
	display: none
}

.frb input[type=radio] ~label:before, .frb input[type=checkbox] ~label:before
	{
	font-family: FontAwesome;
	content: '\f096';
	position: absolute;
	top: 50%;
	margin-top: -11px;
	left: 15px;
	font-size: 18px
}

.frb input[type=radio]:checked ~label:before, .frb input[type=checkbox]:checked
	 ~label:before {
	content: '\f046'
}

.frb input[type=radio] ~label, .frb input[type=checkbox] ~label {
	position: relative;
	cursor: pointer;
	width: 100%;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #f2f2f2
}

.frb input[type=radio] ~label:focus, .frb input[type=radio] ~label:hover,
	.frb input[type=checkbox] ~label:focus, .frb input[type=checkbox]
	 ~label:hover {
	box-shadow: 0 0 3px #333
}

.frb input[type=radio]:checked ~label, .frb input[type=checkbox]:checked
	 ~label {
	color: #fafafa;
	background-color: #f2f2f2
}

.frb.frb-default input[type=radio]:checked ~label, .frb.frb-default input[type=checkbox]:checked
	 ~label {
	color: #333
}

.frb.frb-primary input[type=radio]:checked ~label, .frb.frb-primary input[type=checkbox]:checked
	 ~label {
	background-color: #337ab7
}

.frb.frb-success input[type=radio]:checked ~label, .frb.frb-success input[type=checkbox]:checked
	 ~label {
	background-color: #5cb85c
}

.frb.frb-info input[type=radio]:checked ~label, .frb.frb-info input[type=checkbox]:checked
	 ~label {
	background-color: #5bc0de
}

.frb.frb-warning input[type=radio]:checked ~label, .frb.frb-warning input[type=checkbox]:checked
	 ~label {
	background-color: #f0ad4e
}

.frb.frb-danger input[type=radio]:checked ~label, .frb.frb-danger input[type=checkbox]:checked
	 ~label {
	background-color: #d9534f
}

.frb input[type=radio]:empty ~label span, .frb input[type=checkbox]:empty
	 ~label span {
	display: inline-block
}

.frb input[type=radio]:empty ~label span.frb-title, .frb input[type=checkbox]:empty
	 ~label span.frb-title {
	font-weight: 700;
	margin: 5px 5px 5px 50px
}

.frb input[type=radio]:empty ~label span.frb-description, .frb input[type=checkbox]:empty
	 ~label span.frb-description {
	font-weight: 400;
	font-style: italic;
	color: #999;
	margin: 5px 5px 5px 50px
}

.frb input[type=radio]:empty:checked ~label span.frb-description, .frb input[type=checkbox]:empty:checked
	 ~label span.frb-description {
	color: #fafafa
}

.frb.frb-default input[type=radio]:empty:checked ~label span.frb-description,
	.frb.frb-default input[type=checkbox]:empty:checked ~label span.frb-description
	{
	color: #999
}
</style>

<style type="text/css">
.no-js #loader {
	display: none;
}

.js #loader {
	display: block;
	position: absolute;
	left: 100px;
	top: 0;
}

.se-pre-con {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background: url("<c:url value = "/resources/images/Preloader_2.gif "/>") center no-repeat #fff;
	opacity: .7;
}


.bgimg {
	
}
</style>

<link
	href="<c:url value="/resources/libs/bootstrap/dist/css/bootstrap.min.css"/>"
	rel="stylesheet" />
<link
	href="<c:url value="/resources/libs/font-awesome/css/font-awesome.min.css"/>"
	rel="stylesheet" />
<link
	href="<c:url value="/resources/libs/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.min.css"/>"
	rel="stylesheet" />
<link href="<c:url value="/resources/libs/build/css/custom.css"/>"
	rel="stylesheet" />


<link
	href="<c:url value="/resources/libs/kiniCintaku/css/customize.css"/>"
	rel="stylesheet" />
<link
	href="<c:url value="/resources/libs/kiniCintaku/css/style.default.css"/>"
	rel="stylesheet" />
<link
	href="<c:url value="/resources/libs/kiniCintaku/css/ekko-lightbox.css"/>"
	rel="stylesheet" />

<link
	href="<c:url value="/resources/libs/jquery-confirm/jquery-confirm.min.css"/>"
	rel="stylesheet">

<%
	if (request.getParameter("datatables") != null) {
%>
<!-- Datatables -->
<link
	href="<c:url value="/resources/libs/datatables.net-bs/css/dataTables.bootstrap.min.css"/>"
	rel="stylesheet">
<link
	href="<c:url value="/resources/libs/datatables.net-buttons-bs/css/buttons.bootstrap.min.css"/>"
	rel="stylesheet">
<link
	href="<c:url value="/resources/libs/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css"/>"
	rel="stylesheet">
<link
	href="<c:url value="/resources/libs/datatables.net-responsive-bs/css/responsive.bootstrap.min.css"/>"
	rel="stylesheet">
<link
	href="<c:url value="/resources/libs/datatables.net-scroller-bs/css/scroller.bootstrap.min.css"/>"
	rel="stylesheet">
<%
	}
%>

<%
	if (request.getParameter("jqueryconfirm") != null) {
%>
<!-- Datatables -->


<%
	}
%>

<%
	if (request.getParameter("monthpicker") != null) {
%>
<!-- Datatables --><link
	href="<c:url value="/resources/libs/monthpicker/src/jquery-ui.min.css"/>"
	rel="stylesheet">
<link
	href="<c:url value="/resources/libs/monthpicker/src/MonthPicker.css"/>"
	rel="stylesheet">
	

<%
	}
%>


<%
	if (request.getParameter("jquerydatepicker") != null) {
%>
<!-- bootstrap-daterangepicker -->
<link
	href="<c:url value="/resources/libs/datepicker2/css/bootstrap-datetimepicker.min.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/libs/jquery/jquery-ui.css"/>"
	rel="stylesheet">
<%
	}
%>

<%
	if (request.getParameter("noityjs") != null) {
%>
<link
	href="<c:url value="/resources/libs/notifyjs/dist/styles/metro/notify-metro.css"/>" />
<%
	}
%>

<%
	if (request.getParameter("multipleselect") != null) {
%>
<link
	href="<c:url value="/resources/libs/notifyjs/dist/select2.min.css"/>"
	rel="stylesheet" />
<%
	}
%>

<%
	if (request.getParameter("treemenu") != null) {
%>
<link
	href="<c:url value="/resources/libs/tree_menu/treemenu.css"/>"
	rel="stylesheet" />
<%
	}
%>

<%
	if (request.getParameter("ass") != null) {
%>
<link
	href="<c:url value="/resources/libs/ass/ass.css"/>"
	rel="stylesheet" />
<%
	}
%>
<%
	if (request.getParameter("timepicker") != null) {
%>
<link
	href="<c:url value="/resources/libs/timepicker/timepicker.css"/>" rel="stylesheet" />

<%
	}
%>
</head>