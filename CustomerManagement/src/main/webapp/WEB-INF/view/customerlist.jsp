<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Record</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style>
h1 {
	margin: auto;
	text-align: center;
	font-size: 60px;
	color: white;
}

.button {
	background-color: #1c87c9;
	box-shadow: 0 5px 0 #105cad;
	color: white;
	padding: 1em 1.5em;
	position: relative;
	text-decoration: none;
	display: inline-block;
}

.look {
	background-color: #1c87c9;
	color: white;
	padding: 0.2em 1em;
	display: inline-block;
	border-color: #1c87c9;
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: center;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}

.main {
	font-size: 50px;
	font-weight: bold;
}

.color {
	font-size: 50px;
	background-color: blue;
	padding: 0.4em 0.4em;
}
</style>
</head>
<body>

	<div class="container">

		<br>

		<div class="color">
			<p class="main">
			<h1>Customer Relationship Management</h1>
			</p>
		</div>
		<br> <br>
		<!--  JSP expression language  -->
		<%-- <p>${customer }</p>
 --%>

		<div>
			<form action="/CustomerManagement/customer/search" method="Get">
				<a href=" /CustomerManagement/customer/showform" class="button">ADD
					Customer</a> <br> <br> <input type="search" name="fname"
					placeholder="Search by fname" /> <input type="search" name="email"
					placeholder="Search by email" />
				<button class="look" type="submit">Search</button>
			</form>
			<br>

		</div>
		<table class="table">
			<tr style="background-color: blue; color: white;">
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
				<th>Action</th>
			</tr>
			<c:forEach items="${customer }" var="customer">
				<tr>
					<td>${customer.fname }</td>
					<td>${customer.lname }</td>
					<td>${customer.email }</td>
					<td><a
						href="/CustomerManagement/customer/edit/${customer.id }"
						class="btn btn-info btn-sm">Update</a> <a
						href="/CustomerManagement/customer/delete/${customer.id }"
						class="btn btn-danger btn-sm"
						onclick="if(!(confirm('Are you sure you want to delete ? ')))return false">
							Delete</a></td>
				</tr>

			</c:forEach>
		</table>
	</div>
</body>
</html>