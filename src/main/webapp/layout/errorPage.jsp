
<%
String errorMessage = (String) request.getAttribute("errorMessage");
if (errorMessage != null) {
		%>
<div class="alert alert-danger">
	<%=errorMessage %>
</div>
<%
}

String sessionErrorMessage = (String) session.getAttribute("errorMessage");
if (sessionErrorMessage != null) {
		%>
<div class="alert alert-danger">
	<%=sessionErrorMessage %>
</div>
<%
}

String infoMessage = (String) request.getAttribute("INFO_MESSAGE");
if (infoMessage != null) {
		%>
<div class="alert alert-success">
	<%=infoMessage %>
</div>
<%
}

String sessionInfoMessage = (String) session.getAttribute("INFO_MESSAGE");
if (sessionInfoMessage != null) {
		%>
<div class="alert alert-success">
	<%=sessionInfoMessage %>
</div>
<%
}

%>