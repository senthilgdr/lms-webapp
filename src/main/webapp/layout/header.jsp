
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap_custom_nav_bar.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.css">

<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>


<nav class="navbar-default">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.jsp"><span
				class="glyphicon glyphicon-home"> LeaveManagementSystem(LMS)</span></a>
		</div>
		
		<ul class="nav navbar-nav">
			<li><a href="index.jsp">Home</a></li>
		</ul>


		<div class="navbar-header pull-right">

		</div>
	</div>
</nav>

<div class="container">
	<div class="row">
		<jsp:include page="errorPage.jsp"></jsp:include>
	</div>
</div>