<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Dashboard" />
	<jsp:param name="datatables" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
	<jsp:param name="jquerydatepicker" value="1" />
	<jsp:param name="noityjs" value="1" />
</jsp:include>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">

			<jsp:include page='_Side_Navigation.jsp'></jsp:include>
			<jsp:include page='_Top_Navigation.jsp'></jsp:include>

			<div class="right_col" role="main">

				<div class="alert alert-success" style="margin-top: 60px;">Selamat Datang ke Situs Admin Danakini</div>
				
			</div>

			<jsp:include page='_Footer_Note.jsp'></jsp:include>
		</div>
	</div>
</body>
<jsp:include page='_Footer_Gentellela.jsp'>
<jsp:param name="datatables" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
	<jsp:param name="jquerydatepicker" value="1" />
	<jsp:param name="noityjs" value="1" />
	</jsp:include>
<script>
	function checkExists(sel) {
		var status = false;
		if ($(sel).length)
			status = true;
		return status;
	}
</script>
</html>

