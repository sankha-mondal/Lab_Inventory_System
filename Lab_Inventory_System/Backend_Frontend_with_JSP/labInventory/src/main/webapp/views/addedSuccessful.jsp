<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="com.wipro.inventory.entity.*"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Inventory page</title>
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

.pen{
background-color:violet;
}
.ball{
background-color:orange;
}
.dog{
background-color:orangeRed;
}
.egg{
background-color:lime;
}
.apple{
background-color:lawngreen;
}

table {
	margin-top: 30px;
}
.button-design{
	text-align: center;
	margin-bottom: 20px;
}
.search-design{
	height: 35px;
}

</style>
</head>

<body>
<%

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

%>
	<%
	List<Inventory> items = ((ArrayList<Inventory>) request.getAttribute("items"));
	int size1 = items.size();
	%>
	<%
	boolean isuser = (boolean) request.getAttribute("isuser");
	%>
	<h1 style="color: rgb(0, 9, 128); text-align:center">Inventory Panel</h1> 
	
	<div class="input" style="text-align: right;" >
		<button class="btn class egg"><a href="/logout">Logout</a></button>
		</div>
		
	<div class="input" style="text-align: left;" >
	<form:form action="requesteditems" method="get">
			<input type="submit" class="btn class dog" value="Check for Requested components" >
		</form:form>
	</div>
	<br>
	<div class="input" style="text-align: left;" >
		<form:form action="getusers" method="get">
			<input type="submit" class="btn class egg" value="View Users List" >
		</form:form>
	</div>
	<div class="input" style="text-align: right;">
	<form:form action="forgetpassword" method="get">
	<input type ="submit" class="btn class egg" value="Change Your Password">
	</form:form>
	</div> 

	<form:form action="/additem" method="get" class="button-design" >
		<input type="submit" value="Add Component" class="btn btn-success" />
	</form:form>
		
		<div class="input" style="text-align: center;" >
	<form:form action="search" method="get">
			<input name="name" type="text" class="search search-design" placeholder="Search for components" />
			<input type="submit" class="btn class ball" value="Go">
		</form:form>
	</div>
	
	
	
	${added}
	<%
	int size2 = items.size();
	int j = 0;
	%>
	<%
	if (size2 > 0) {
	%>
	<table class="table class pen">
		<tr class="table-dark">
			<td>S.No</td>
			<td>Component Name</td>
			<td>Quantity</td>
			<%
			if (!isuser) {
			%>
			<td>Update</td>
			<td>Delete</td>
			<%
			} else {
			%>
			<td>request</td>
			<%
			}
			%>
		</tr>
		<%
		for (Inventory i : items) {
		%>
		<tr class="table-warning">
			<%
			j += 1;
			%>
			<td><%=j%></td>
			<td><%=i.getName()%></td>
			<td><%=i.getQuantity()%></td>

			<%
			if (!isuser) {
			%>
			
			<td><form:form action="/updateitem" method="get">
                <input type="hidden" value="<%=i.getName()%>"
						name="name" />
                <input class="btn class apple" type="submit"
						style="border-radius: 5px;" value="Update" class="update" />
                </form:form></td>

			<td><form:form action="/deleteitem" method="get">
					<input type="hidden" value="<%=i.getName()%>" name="name" />
					<input type="submit" class="btn btn-danger" value="Delete"
						class="delete" />
                </form:form></td>

			<%
			}
			%>
			<%
			if (isuser) {
			%>
			<%
			if (i.isRequested() == false) {
			%>
			<%
			if (i.getQuantity() < 1) {
			%>
			<td>No items Left</td>
			<%
			} else {
			%>
			<td><form:form action="/requestitem" method="get">
                <input type="hidden" value="<%=i.getName()%>"
						name="name" />
                <input type="submit" class="btn btn-secondary"
						value="request" class="request" />
                </form:form></td>
			<%
			}
			%>
			<%
			} else {
			%>
			<td>
				<button class="btn btn-success" type="button" class="requested"
					disabled>requested</button>
			</td>
			<%
			}
			}
			%>
		</tr>
		<%
		}
		%>
	</table>
	       
	<%
	} else {
	%>
	       
	<div style="height: 100vh">
		       
		<div class="row h-100 justify-content-center align-items-center">
			<div class="col-2 forms">
				       
				<p>No Items found</p>
				       
			</div>
			       
		</div>
		       
	</div>

	       
	<%
			}
			%>
			
</body>
</html>