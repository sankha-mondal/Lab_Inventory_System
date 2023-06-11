<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="../resources/css/loginform.css" rel="stylesheet">

<style>
.dell{
background-color:yellow;
}
</style>

</head>
<body>
<%

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

%>

	<div class="background ">
		<%
boolean present = (boolean) request.getAttribute("present");
%>
		<div class="row h-100 justify-content-center align-items-center">
			<div class="col-2 forms">
				<h1 style="color: mediumBlue; text-align:center">Hello User</h1>
				<table>
					<form:form modelAttribute="admin" method="post"
						action="/updateuser">
						<tr>
							<td>
								<%
								if (present == true) {
								%>
								<p class="present">Username already present, Please enter new user</p>
								<%
}
%>
							</td>
						</tr>
						<tr>
							<td><form:input type="hidden" path="id" /></td>
						</tr>
						<tr>
							<td><form:input class="form-control" type="username"
									path="username" placeholder="Enter UserName" /></td>
						</tr>
						<tr>
							<td><form:input class="form-control" type="email"
									path="email" placeholder="Email"/></td>
						</tr>
						<tr>
							<td><small><form:errors path="email"
										cssClass="error"></form:errors></small></td>
						</tr>
						<tr>
							<td><form:input class="form-control" type="hidden"
									path="password" placeholder="Password" /></td>
						</tr>
						<tr>
							<td><small><form:errors path="password"
										cssClass="error"></form:errors></small></td>
						</tr>
						<tr>
							<td><input type="submit" class="btn dell"
								value="Continue" /></td>
						</tr>
					</form:form>
				</table>
			</div>
		</div>
	</div>


</body>
</html>