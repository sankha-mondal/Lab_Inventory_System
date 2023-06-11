<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="com.wipro.inventory.entity.Admin"%>
<%@ page import="com.wipro.inventory.entity.Inventory"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>accept/delete</title>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style>

.book{
background-color:aqua;
}

.accept {
	background-color: black;
	color: white;
}

.decline {
	background-color: red;
	color: white;
}
.coll{
background-color: yellow;
}
td{
text-align:center;
}
</style>


</head>
<body>
<%

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

%>
	 <%List<Inventory> items = ((ArrayList<Inventory>) request.getAttribute("items"));
int size2 = items.size();
%>
	<button>
		<a href="getitems">home</a>
	</button>
	<%
	if (size2 > 0) {
	%>
	<table class="table class book">
		<tr class="table-dark">
		<td>S.No</td>
			<td>UserName</td>
			<td>Component</td>
			
			<td>Accept</td>
			<td>Decline</td>
			
		</tr>

		<%int i=1;
		for (Inventory j : items) {
			if (j.isRequested() && !j.isAccepted()) {
		%>
		<tr>
		<td><%=i %></td>
		<%i+=1; %>
			<td><%=j.getUsername() %></td>
			<td><%=j.getName() %></td>
			<td><form:form action="/acceptitem" method="get">
                <input type="hidden" value="<%=j.getName()%>"
						name="name" />               
               <input type="submit" class="btn class coll" 
					style="border-radius: 15px;" value="Accept" class="accept" />
                </form:form></td>



			<td><form:form action="/decline" method="get">
                <input type="hidden" value="<%=j.getName()%>"
						name="name" />               						
                <input class="btn btn-danger" type="submit"
						style="border-radius: 15px;" value="Decline" class="decline" />
                </form:form></td>
		</tr>

		<%
		}
		%>
		<%
		}
		%>
	</table>
	       
	<%
	} else {
	%>
	       
	<div style="height: 100vh">
		       
		<div class="row h-100 justify-content-center align-items-right">
			<div class="col-2 forms">
				       
				<p>No Components Requested</p>
				       
			</div>
			       
		</div>
		       
	</div>
	       
	<%
			}
			%>
</body>
</html>


