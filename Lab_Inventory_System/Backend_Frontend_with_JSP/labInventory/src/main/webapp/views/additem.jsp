<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add component</title>

<link rel="stylesheet" type="text/css" href="/webjars/bootstrap/css/bootstrap.min.css" />

<script type="text/javascript" src="/webjars/jquery/jquery.min.js"></script>

<script type="text/javascript" src="/webjars/bootstrap/js/bootstrap.min.js"></script>

 <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="../resources/css/loginform.css" rel="stylesheet">
 <style>
    .bg-container{
		background-image: url("");
		background-size: cover;
		height: 100vh;
	}
 </style>

</head>
<body st class="bg-container">
<%

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

%>
	<%
	boolean present = (boolean) request.getAttribute("present");
	%>
	<div class="background"  style="text-align:center;padding-top: 150px;">
		<div class="row h-100 justify-content-center align-items-center">
			<div class="col-2 forms">
				<h1 style="color:#030a67;" > Add Component </h1>
				<table>
					<form:form modelAttribute="item" action="/addedItem" method="post">
						<%
						if (present) {
						%>
					<tr>
							<td class="error">* Component already exists!
							<td></td>
						</tr>
						<%
						}
						%>
						<tr>
							<td><form:input type="hidden" path="id" /></td>
						</tr>
						<tr>
							<td><form:input class="form-control" type="text" path="name"
									placeholder="Component Name" /></td>
						</tr>
						<tr>
							<td><form:errors path="name" cssClass="error"></form:errors></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<br>				
						<tr>
							<td><form:input type="number" class="form-control"
									path="quantity" min='0' placeholder="Enter quantity" /></td>
						</tr>
						<tr>
							<td><form:errors path="quantity" cssClass="error"></form:errors></td>
						</tr>
						<tr>
							<td><input class="btn btn-primary" type="submit" value="Add" /></td>
						</tr>
					</form:form>
				</table>
			</div>
		</div>
	</div>


</body>
</html>