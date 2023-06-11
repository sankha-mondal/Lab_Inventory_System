
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Forgot Password</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<link href="../resources/css/loginform.css" rel="stylesheet">
<style>
	.container1{
		margin-top: 200px;
	}
</style>
</head>

<body>

	<%
	boolean present = (boolean) request.getAttribute("present");
	%>

	<div class="background container1">

		<div class="row h-100 justify-content-center align-items-center">

			<div class="col-3 forms">

				<form:form method="post" action="changepassword"
					modelAttribute="logindto">

					<div class="forget">

						<h2>Enter Username</h2>

						<%
						if (present) {
						%>

						<small Class="error">* User Not Found</small>

						<%
						}
						%>

						 

						<p>
							<input type="text" class="form-control" name="name"
								placeholder="Enter UserName"><br>
						</p>

						<input type="submit" value="Submit" class="btn btn-primary">

					</div>

 

</form:form>

			</div>

		</div>

		 

	</div>

</body>

</html>





