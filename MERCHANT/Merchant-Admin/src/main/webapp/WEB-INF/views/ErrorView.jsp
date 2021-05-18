<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%><%@ taglib
	uri="http://www.springframework.org/tags/form" prefix="form"%><%@ taglib
	prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Oops We Getting Problem !</title>

<!-- Bootstrap -->
<script type="text/javascript">
	//<![CDATA[
	window.__cfRocketOptions = {
		byc : 0,
		p : 1508240748,
		petok : "a7739a7fa74c412a8c4c21784cc8257fde14d677-1508392317-1800"
	};
	//]]>
</script>
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
</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<!-- page content -->
			<div class="col-md-12">
				<div class="col-middle">
					<div class="text-center text-center">
						<h1 class="error-number">${errorCode}</h1>
						<h2>${errorHead}</h2>
						<p>
							${errorMsg}</a>
						</p>
						<div class="mid_center">
							<form>
								<div class="col-xs-12 form-group pull-right top_search">


									<a class="btn btn-default clickme" href="<c:url value="/"/>" >Go Back</a>


								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- /page content -->
		</div>
	</div>

	<!-- jQuery -->
	<script
		data-rocketsrc="<c:url value="/resources/libs/vendors/jquery/dist/jquery.min.js"/>"
		type="text/rocketscript"></script>
	<!-- Bootstrap -->
	<script
		data-rocketsrc="<c:url value="/resources/libs/vendors/bootstrap/dist/js/bootstrap.min.js"/>"
		type="text/rocketscript"></script>
	<!-- FastClick -->
	<script
		data-rocketsrc="<c:url value="/resources/libs/vendors/fastclick/lib/fastclick.js"/>"
		type="text/rocketscript"></script>
	<!-- NProgress -->
	<script
		data-rocketsrc="<c:url value="/resources/libs/vendors/nprogress/nprogress.js"/>"
		type="text/rocketscript"></script>

	<!-- Custom Theme Scripts -->
	<script
		data-rocketsrc="<c:url value="/resources/libs/build/js/custom.min.js"/>"
		type="text/rocketscript"></script>
	<!-- Google Analytics -->
	<script type="text/rocketscript">
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-23581568-13', 'auto');
ga('send', 'pageview');

</script>
	<script type="text/javascript">
		$('.clickme').click(function() {

			history.go(-1);

			return false;
		});
	</script>
</body>
</html>
