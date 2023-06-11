<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Homepage</title>


<!-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="../resources/css/loginform.css" rel="stylesheet">-->

<link rel="stylesheet" type="text/css" href="/webjars/bootstrap/css/bootstrap.min.css" />

<script type="text/javascript" src="/webjars/jquery/jquery.min.js"></script>

<script type="text/javascript" src="/webjars/bootstrap/js/bootstrap.min.js"></script>

<style type="text/css">

body{


background-image:url("https://www.thoughtco.com/thmb/sNm3j9LtVGB7-aMSAI5uYgWTIEc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/newton-s-cradle-103017630-5ac4bf380e23d90036c8113a.jpg");

opacity:10.00;

position:absolute;

width:100%;

height:100%;

background-repeat: no-repeat;

background-size: cover;
}
.user-design{
	height: 30px;
	width: 150px;
	margin-bottom: 10px;
}
.button-design{
	text-align: center;
	height: 30px;
	width: 60px;
	margin-left: 50px;
	margin-bottom: 20px;
}

.forgot-design{
	text-align: center;
	margin-left: 30px;
	
}
 </style>
 
 
</head>
<body >
	<%
	boolean login = (boolean) request.getAttribute("login");
	%>
	<%
	boolean admin = (boolean) request.getAttribute("admin");
	%>
	<div class="background ">

		<div class="row h-100 justify-content-center align-items-center">

			<div class="col-2x forms">

				<h1 style="color: orange; text-align: center; padding-top: 150px;">Physics Lab Inventory</h1> 
				<h3 style="color: white; text-align:center">Please Enter Your Login Credentials</h3>
				
				<table style="margin-left: auto; margin-right: auto">
					<form:form modelAttribute="logindto" action="logintest"
						method="post">
						<%
						if (!login) {
						%>
						<tr>
							<td><p class="error" style="color: palegreen;">* Username or Password is incorrect</p></td>
						</tr>
						<%
						}
						%>
						<%
						if (admin) {
						%>
						<tr>
							<td><p class="error" style="color: palegreen;">* you are user</p></td>
						</tr>
						<%
						}
						%>
						
						<tr>
							<td><form:input class="form-control user-design" style="border-radius: 5px;" placeholder="Username"
									type="text" path="username" /></td>  
						<br>
						</tr>
						<tr>
							<td><small><form:errors cssClass="error" style="color: palegreen;" path="username"></form:errors></small></td> 
						</tr>
						<tr>
							<td><form:input class="form-control user-design" style="border-radius: 5px;" type="password"
									placeholder="Password" path="password" /></td>
						</tr>
						
						<tr>
							<td><small><form:errors cssClass="error"
										path="password"></form:errors></small></td> 
						</tr> 
						
						
						<tr>
							<td><input type="submit" class="btn btn-primary button-design" style="border-radius: 5px;"
								value="Submit" /></td>
						</tr>

						<tr>
							<td><a style="color:palegreen;" href="/forgetpassword" class="forgot-design">Forgot Password?</a></td>
						</tr>
						<tr>
							<!--<td><a href="/">Create an account</a></td>-->
						</tr>
					</form:form>
				</table>
			</div>
		</div>
	</div>


</body>
</html>
