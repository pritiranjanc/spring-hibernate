<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Employee Registration Form</title>
    <jsp:include page="../common.jsp"></jsp:include>
</head>

<body style="margin-left:175px;">

	<h3>Registration Form</h3>
	<hr class="header_underlne"/>
 
	<form:form method="POST" modelAttribute="employee">
	
		<form:input type="hidden" path="id" id="id"/>
		     
		    <div class="row">
				<div class="col-sm-2">Name: </div>
				<div class="col-md-3">
					<form:input path="name" id="name" cssClass="form-control"/>
				</div>
				<div class="col-md-4">
					<form:errors path="name" cssClass="error"/>
				</div>
		   </div>
	      <br/>
	      
		  <div class="row">
				<div class="col-sm-2">Joining Date: </div>
				<div class="col-md-3">
				    <form:input path="joiningDate" id="joiningDate" cssClass="form-control" autocomplete="off"/>
				</div>
				<div class="col-md-4">
					<form:errors path="joiningDate" cssClass="error"/>
				</div>
		   </div>
		   <br/>
		   
		   <div class="row">
				<div class="col-sm-2">Designation: </div>
				<div class="col-md-3">
				    <form:select path="designation" id="designation" cssClass="form-control">
				        <form:option value=""> Select</form:option>
				        <form:options items="${testDesignationMap}"/>
				     </form:select>
				</div>
				<div class="col-md-4">
					<form:errors path="designation" cssClass="error"/>
				</div>
		   </div>
		   
	      <br/>
			<div class="row">
				<div class="col-sm-2">Salary: </div>
				<div class="col-md-3">
					<form:input path="salary" id="salary" cssClass="form-control"/>
				</div>
				<div class="col-md-4">
					<form:errors path="salary" cssClass="error"/>
				</div>
		   </div>
	    <br/>
	    
		<div class="row">
				<div class="col-sm-2">SSN: </div>
				<div class="col-md-3">
					<form:input path="ssn" id="ssn" cssClass="form-control"/>
				</div>
				<div class="col-md-4">
					<form:errors path="ssn" cssClass="error"/>
					<div class="alert alert-danger hidden" id="ssnUnique">SSN already exist. Please fill in different value</div>
				</div>
		</div>
		<br/>
		<div class="row">
				<div class="col-sm-2">Gender: </div>
				<div class="col-md-3">
					<form:radiobutton path="gender" id="mgender" value="M" />Male
					<form:radiobutton path="gender" id="fgender" value="F"/>Female
				</div>
				<div class="col-md-4">
					<form:errors path="gender" cssClass="error"/>
				</div>
		</div>
		
		 <br/>
		 
		<div class="row">
		     <div class="col-md-1">
				<c:choose>
					<c:when test="${edit}">
						<input type="submit" value="Update" class="btn btn-success"/>
					</c:when>
					<c:otherwise>
						<input type="submit" value="Register" class="btn btn-success"/>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
			
	</form:form>
	<br/>
	<br/>
	Go back to <a href="<c:url value='/list'/>">List of All Employees</a>
	
	<script>
	
	 $(function() {
		$("#joiningDate").datepicker(
		    {dateFormat:'dd/mm/yy'}
		);
		
		$("#ssn").change(function() {
	        var ssnValue = $(this).val();
	        if(ssnValue.trim() == ""){
	        	return ;
	        }
	        var idValue = $("#id").val();
	        var jsonValue = {
	         "ssn" : ssnValue,
	         "id":idValue
	        };
	   
	        $.ajax({
	         type : "POST",
	         url : "${pageContext.request.getContextPath()}/validatessn",
	         data : jsonValue,
	         dataType : 'json',
	         cache : false,
	         timeout : 600000,
	         success : function(data) {
	            console.log("Data "+data)
	          	if(data==false){
	          		$("#ssnUnique").removeClass("hidden");
	          		setTimeout(function(){
	          			$("#ssn").val("");
	          			$("#ssnUnique").addClass("hidden");
	          		}, 3000);
	          		
	          	}
	         },
	         error : function(e) {
	            alert(e);
	         }
	        });
	      });
	 
	 });
	
	</script>
</body>
</html>