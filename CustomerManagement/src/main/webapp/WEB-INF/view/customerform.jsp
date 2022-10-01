<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
h4 {
	color: blue;
	text-align: left;
}

.design {
	background-color: white;
	padding: 0.1em 0.1em;
	
}

.style {
	background-color: blue;
	padding: 0.1em 0.1em;
	s
}

h2 {
	color: white;
	text-align: center;
}
</style>
<meta charset="UTF-8">
<title>Customer Form</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
	<br>
	<div class="container">
		<div class="style">
			
			<h2>Customer Relationship Management</h2>
			
		</div>
	</div>
	<br>
	<div class="container">
		<div class="design">


			<h4><u style="text-decoration-color:blue">Save Customer</u></h4>
		</div>
		<br>

		<form action="/CustomerManagement/customer/save" method="POST"
			class="form-inline">
			<input type="hidden" name="id" value="${customer.id }" />
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">First
					Name</label> <input type="text" name="fname" value="${customer.fname }"
					class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp">

			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Last
					Name</label> <input type="text" class="form-control"
					id="exampleInputPassword1" name="lname" value="${customer.lname }">
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Email</label>
				<input type="text" name="email" value="${customer.email }"
					class="form-control" id="exampleInputPassword1" name="email">
			</div>
			<button type="submit" class="btn btn-primary">Save</button>
			<br>
			<br>
			<br>
			<h4>
				<a href="/CustomerManagement/customer/list">Back To List</a>
			</h4>
		</form>

	</div>
</body>
</html>