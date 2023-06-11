<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<div class="background ">
		<div class="row h-100 justify-content-center align-items-center">
			<div class="col-2 forms">
				<table style="margin-left: auto; margin-right: auto;">
					<form:form modelAttribute="item" action="/updateditem"
						method="post">
						<tr>
							<td><h1>Update Item</h1>
							<td>
						</tr>
						<tr>
							<td><form:input type="hidden" path="id" /></td>
						</tr>
						<tr>
							<td><form:input class="form-control" type="text" path="name"
									placeholder="Component Name" /></td>
						</tr>
						<tr>
							<td><form:errors path="name"></form:errors></td>
						</tr>
						
						<tr>
							<td><form:input class="form-control" type="number"
									path="quantity" min='1' placeholder="Enter quantity" /></td>
						</tr>
						<tr>
							<td><form:errors path="quantity"></form:errors></td>
						</tr>
						<tr>
							<td><input type="submit" class="btn btn-primary"
								value="Update" /></td>
						</tr>
					</form:form>
				</table>
			</div>
		</div>
	</div>


</body>
</html>