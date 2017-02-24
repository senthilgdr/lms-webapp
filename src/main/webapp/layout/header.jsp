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
	if (employee != null) {
		roleName = employee.getRole().getName();
	}
%>

<nav class="navbar-default">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand"
				href="<%=request.getContextPath()%>/index.jsp"><span
				class="glyphicon glyphicon-home"> LeaveManagementSystem(LMS)</span></a>
		</div>
		<%
			if (isLoggedIn) {
		%>
		<ul class="nav navbar-nav">

			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">Leave <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="<%=request.getContextPath()%>/addLeaveDetail">ApplyLeave</a></li>
					<li><a href="<%=request.getContextPath()%>/SelectLeaveDetail">My
							Leaves </a></li>
					<li><a href="<%=request.getContextPath()%>/SelectMyLeaveRole">My
							Leave Eligibility </a></li>
							
				</ul></li>

			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">MyTeam <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="<%=request.getContextPath()%>/TeamPendingLeaves">MyTeam
							LeaveDetails </a></li>
					<li><a
						href="<%=request.getContextPath()%>/employeeHierarchy/SelectMyTeamHierarchy">MyTeam
							Hierarchy</a>
				</ul></li>

			<%
				if (roleName.equals("HR")) {
			%>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">Admin <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a
						href="<%=request.getContextPath()%>/SelectPendingLeaves">All
							Leaves </a></li>
					<li><a
						href="<%=request.getContextPath()%>/employee/SelectEmployee">All
							Employees </a></li>
					<li><a
						href="<%=request.getContextPath()%>/employeeHierarchy/SelectEmployeeHierarchy">All
							EmployeeHierarchy </a></li>
							<li><a href="<%=request.getContextPath()%>/employeeTax/SelectEmployeeTax">All Employees Tax Details</a></li>
				<li><a
						href="<%=request.getContextPath()%>/employeeSalary/SelectEmployeeSalary">All
							Employee Salary </a></li>
				</ul></li>
			<%
				}
			%>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">HR <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="<%=request.getContextPath()%>/SelectHoliday">Holidays
					</a></li>
					<li><a href="<%=request.getContextPath()%>/SelectLeaveRole">Leave
							Role </a></li>

				</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">TaxDeclaration <span class="caret"></span></a>
				<ul class="dropdown-menu">
				<li><a href="<%=request.getContextPath()%>/employeeTax/addEmployeeTax">Apply Tax</a></li>
				<li><a href="<%=request.getContextPath()%>/employeeTax/SelectMyTax">My Tax Details</a></li>
						</ul></li>		
		</ul>

		<div class="navbar-header pull-right">

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
				<a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Welcome <span
						class="glyphicon glyphicon-user"></span><%=employee.getName()%>(<%=roleName%>)!!!
				</a>

					<ul class="dropdown-menu">
					<li><a href="<%=request.getContextPath()%>/employee/MyProfile">My Profile </a></li>
					<li><a href="<%=request.getContextPath()%>/employeeSalary/SelectMySalary">My Salary </a></li>
						<li><a href="<%=request.getContextPath()%>/employee/Logout">Sign
								Out ! </a></li>
						<li><a href="<%=request.getContextPath()%>/employee/changepassword">Change Password ! </a></li>
					</ul></li>
			</ul>
		

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