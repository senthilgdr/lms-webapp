<%@page import="model.Employee"%>
<%@page import="dao.LeaveDetailDAO"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap_custom_nav_bar.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.css">

<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>

<%
	Employee employee = (Employee) session.getAttribute("LOGGED_IN_USER");
	boolean isLoggedIn = employee != null;
	
	String roleName = "";
	if ( employee != null ){
		roleName = employee.getRole().getName();
	}
%>

<nav class="navbar-default">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp"><span
				class="glyphicon glyphicon-home"> LeaveManagementSystem(LMS)</span></a>
		</div>
		<%
				if (isLoggedIn) {
					
			%>
		<ul class="nav navbar-nav">
			<li><a href="<%=request.getContextPath()%>/addLeaveDetail">ApplyLeave</a></li>
			<li><a href="<%=request.getContextPath()%>/SelectLeaveDetail">My Leaves </a></li>
			<% if ( roleName.equals("HR")){ %>			
			<li><a href="<%=request.getContextPath()%>/SelectPendingLeaves">All Leaves </a></li>
			<li><a href="<%=request.getContextPath()%>/employee/SelectEmployee">All Employees </a></li>
			<%} %>
			<li><a href="<%=request.getContextPath()%>/TeamPendingLeaves">My Team </a></li>	
			<li><a href="<%=request.getContextPath()%>/SelectMyLeaveRole">My Leave Eligibility </a></li>
			<li><a href="<%=request.getContextPath()%>/employeeHierarchy/SelectMyTeamHierarchy">MyTeam Hierarchy</a>
			<li><a href="<%=request.getContextPath()%>/SelectLeaveRole">Leave Role </a></li>		
			<li><a href="<%=request.getContextPath()%>/SelectHoliday">Holidays </a></li>
			<li><a href="<%=request.getContextPath()%>/employeeHierarchy/SelectEmployeeHierarchy">EmployeeHierarchy </a></li>
			<li><a href="<%=request.getContextPath()%>/employeeTax/addEmployeeTax">TaxDeclaration </a></li>
		
		</ul>		


		<div class="navbar-header pull-right">


			<p class="navbar-text">


				Welcome <span class="glyphicon glyphicon-user"></span>
				<%=employee.getName()%>
				(<%=roleName%>) !!! <a href="<%=request.getContextPath()%>/employee/Logout" class="navbar-link">
					<span class="glyphicon glyphicon-off"></span> Sign Out !
				</a>
				<a
					href="employee/changepassword" class="navbar-link">
				<span class="glyphicon glyphicon-edit"></span> Change Password !</a>
			</p>

		</div>
		<%
			} else {

			}
		%>

	</div>
</nav>

<div class="container">
	<div class="row">
		<jsp:include page="errorPage.jsp"></jsp:include>
	</div>
</div>