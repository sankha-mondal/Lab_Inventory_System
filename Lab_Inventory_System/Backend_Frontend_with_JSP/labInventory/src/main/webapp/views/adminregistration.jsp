<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Registration Page</title>

	<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="../resources/css/loginform.css" rel="stylesheet"> -->

 
<link rel="stylesheet" type="text/css" href="/webjars/bootstrap/css/bootstrap.min.css" />

<script type="text/javascript" src="/webjars/jquery/jquery.min.js"></script>

<script type="text/javascript" src="/webjars/bootstrap/js/bootstrap.min.js"></script>

<style type="text/css">

body{
background-image:url("/images/img26.png");

opacity:10.00;

position:absolute;

width:100%;

height:100%;

background-repeat: no-repeat;

background-size: cover;
}
h1 {

  text-align:center;

}

</style>

</head>

<body>

		<%
	boolean present = (boolean) request.getAttribute("present");
	%>
		<div class="background ">
		<div class="input" style="text-align: center;" >   
		
		<div class="row h-100 justify-content-center align-items-center">

			<div class="col-2 forms">
		<h1 style="color: purple; text-align:center">Physics Lab Inventory</h1> 

				<table style="margin-left: auto; margin-right: auto">

					<form:form modelAttribute="admin" method="post"
						action="/registrationsuccess">

						<tr>

							<td>
								<%
								if (present == true) {
								%>

								<p class="present">username already present please change it</p>

								<%
								}
								%>
							</td>

						</tr>

						<tr>
							
							<td><form:input class="form-control" style="border-radius: 5px;" type="text"
									path="username" placeholder="Enter UserName" /></td>
						
						</tr>

						<tr>

							<td><small><form:errors path="username"
										cssClass="error"></form:errors></small></td>

						</tr>

						<tr>


							<td><form:input class="form-control" style="border-radius: 5px;" type="email"
									path="email" placeholder="Email" /></td>

						</tr>

						<tr>


							<td><small><form:errors path="email"
										cssClass="error"></form:errors></small></td>

						</tr>

						<tr>

							<td><form:input class="form-control" style="border-radius: 5px;" type="password"
									path="password" placeholder="password" /></td>

						</tr>

						<tr>

							<td><small><form:errors path="password"
										cssClass="error"></form:errors></small></td>

						</tr>

						<tr>


							<td><input type="submit" class="btn btn-primary" style="border-radius: 5px;"
								value="register" /></td>

						</tr>

						<tr>


							<td><a href="adminlogin">Already have an account?</a></td>

						</tr>

					</form:form>

				</table>

			</div>

		</div>

	</div>
</div>

	 

</body>

</html>