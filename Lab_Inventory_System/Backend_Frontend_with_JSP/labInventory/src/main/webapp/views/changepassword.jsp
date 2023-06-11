
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Change password</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<link href="../resources/css/loginform.css" rel="stylesheet">

</head>

<body>
<%

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

%>
	<%
	String present = (String) request.getAttribute("username");
	%>

	<%
	boolean greater = (boolean) request.getAttribute("greater");
	%>
	
	<%
	boolean valid = (boolean) request.getAttribute("validate");
	%>
	
	<%
	boolean contain = (boolean) request.getAttribute("passwordcontains");
	%>

	<div class="background ">

		<div class="row h-100 justify-content-center align-items-center">

			<div class="col-3 forms">

				<form:form method="post" action="change">

					<div class="forget">

						<h3>Enter New Password</h3>

						<input type="hidden" value=<%=present%> name="username" />

						<%
						if (!greater) {
						%>

						<small>Minimum length of the password should be eight</small>

						<%
						}
						%>
						
						<%
						   if (valid) {
						%>
						<small>Your new password and old password cannot be same.</small>

						<%
						}
						%>
						
						<%
						   if (contain) {
						%>
						<small>Password should not have any spaces in between.</small>
						<%
						}
						%>
						
						<p>
							<input type="password" class="form-control" name="password"
								placeholder="Enter the password"><br>
						<p>

							<input type="submit" value="Submit" class="btn btn-primary">
					</div>

 

</form:form>

			</div>

		</div>

		 

	</div>

</body>

</html>
