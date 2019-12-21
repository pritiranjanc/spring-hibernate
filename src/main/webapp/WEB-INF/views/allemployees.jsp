<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>University Enrollments</title>
	<jsp:include page="../common.jsp"></jsp:include>
</head>


<body style="margin-left:175px;">
	<h3>List of Employees</h3>	
	<hr class="header_underlne"/>
	<table class="list_employee" border="1">
		<tr>
			<th>Name</th>
			<th>Joining Date</th>
			<th>Designation</th>
			<th>Gender</th>
			<th>Salary</th>
			<th>SSN</th>
			<th>Actions</th>
		</tr>
		<c:forEach items="${employees}" var="employee">
			<tr>
			<td>${employee.name}</td>
			<td><fmt:formatDate pattern="dd/MM/yyyy" value="${employee.joiningDate}"/></td>
			<td>${employee.designation}</td>
			<td>${employee.gender}</td>
			<td>${employee.salary}</td>
			<td><a href="<c:url value='/edit-${employee.ssn}-employee' />">${employee.ssn}</a></td>
			<td><a href="<c:url value='/delete-${employee.ssn}-employee' />" class="btn btn-danger">delete</a></td>
			</tr>
		</c:forEach>
	</table>
	<br/>
	<a href="<c:url value='/new'/>" >Add New Employee</a>
</body>
</html>