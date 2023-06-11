<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="com.wipro.inventory.entity.Admin"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update User</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="../resources/css/inputalign.css" rel="stylesheet">
<style type="text/css">
td {
	text-align: center;
}

.bull{
background-color:gold;
}
.mode{
background-color:aqua;
}
</style>


</head>
<body>
<%

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

%>
	<button>
		<a href="getitems">Home</a>
	</button>
	<%
	int i = 0;
	List<Admin> users = (List<Admin>) request.getAttribute("users");
	int size1 = users.size();
	%>
	<%
	if (size1 > 0) {
	%>
	<table class="table class mode">
		<tr class="table-dark">
			<td>S.No</td>
			<td>User Name</td>
			<td>Email</td>
			<td>Update</td>
			<td>Delete</td>
		</tr>
		<%
		for (Admin admin : users) {
		%>
		<tr>
			<%
			i += 1;
			%>
			<td><%=i%></td>
			<td><%=admin.getUsername()%></td>
			<td><%=admin.getEmail()%>        
			<td><form:form action="/updateuser" method="get">
                <input type="hidden" value="<%=admin.getUsername()%>"
						name="name" />
                <input type="submit" class="btn class bull"
						value="Update" class="request" />
                </form:form></td>
			</td>
			<td><form:form action="/deleteuser" method="get">
                <input type="hidden" value="<%=admin.getUsername()%>"
						name="name" />
                <input type="submit" class="btn btn-danger"
						value="Delete" />
                </form:form></td>
			</td>
			<%
			}
			%>
		</tr>
	</table>
	       
	<%
	} else {
	%>
	       
	<p>No users present</p>
	       
	<%
	}
	%>


</body>
</html>