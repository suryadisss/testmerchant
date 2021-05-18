<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<% String title = request.getParameter("title");%>
<title><%= request.getParameter("title")%></title>

<link href="<c:url value="/resources/libs/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet" />
<link href="<c:url value="/resources/libs/datatables/css/dataTables.bootstrap.min.css"/>" rel="stylesheet" />
</head>