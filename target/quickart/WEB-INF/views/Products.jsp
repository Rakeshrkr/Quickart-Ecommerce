<%@ include file="Common-Header.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
	<table width="50%" align="center"
		style="margin-top: 3%; box-shadow: 0px 9px 30px #888888;">
		<tr>
			<td>
				<div class="container-fluid">
					<div class="row"
						style="background-color: #003366; text-align: center; padding: 10px;">
						<div class="col-sm-4"></div>
						<div class="col-sm-4">
							<%-- <div>
								<span
									style="text-shadow: 0px 2px 6px #800000; font-size: 17px; color: gold; font-family: initial;">
									Welcome : &nbsp;${SessionAdminName} (Administrator)</span>
							</div> --%>
						</div>
						<div class="col-sm-4" align="right">
							<button type="submit" onclick="location.href='goback'"
								class="btn btn-default">Go Home</button>
							&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
							<button type="submit" onclick="location.href='index'"
								class="btn btn-default">Log Out</button>
						</div>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td><hr />
				<div class="container">
					<div style="text-align: center;">
						<h3 style="color: #1E90FF">Your Products
							&nbsp;&nbsp;&nbsp;&nbsp;</h3>
					</div>
					<table class="table table-striped" align="center">
						<thead>
							<tr>
								<th>Product Id</th>
								<th>Product Name</th>
								<th>Product Category</th>
								<th>Quantity</th>
								<th>Price</th>
								<th>Delete</th>
								<th>Edit</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ProductList}" var="product">
								<tr>

									<td>${product.productId}</td>
									<td>${product.productName}</td>
									<td>${product.productCategory}</td>
									<td>${product.quantity}</td>
									<td>${product.price}</td>
									<td><a href="${product.productId}"
										value="${product.productId}" style="color: red">Delete</a></td>
									<td><button type="button" class="btn btn-primary btn-xs"
											data-toggle="modal" data-target="#exampleModal" data-whatever="product.productId"
											style="padding: 5px;">Edit</button></td> 
								</tr>

							</c:forEach>
						</tbody>
					</table>
				</div></td>
		</tr>
	</table>
<c:forEach items="${ProductList}" var="product">
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<h3 style="color: green">Update Your Products</h3>
					<form method="post" action="edit/${product.productId}">
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<label for="name" class="control-label">Provide the
										Product Id</label> <input type="text" class="form-control" value="${product.productId}"
										name="productId" placeholder="${product.productId}" readonly="true">
								</div>

								<div class="form-group">
									<label for="name" class="control-label">Product Name</label> <input
										type="text" class="form-control" name="productName" value="${product.productName}"
										placeholder="Enter New Name">
								</div>

								<div class="form-group">
									<label for="name" class="control-label">Product
										Category</label> <select class="form-control" name="productCategory" value="${product.productCategory}" >
										<option >Electronics</option>
										<option>Men's Wearing</option>
										<option>Girl's Wearing</option>
										<option>Furniture</option>
										<option>Other</option>
									</select>

								</div>

								<div class="form-group">
									<label for="name" class="control-label">Quantity</label> <select
										class="form-control" name="quantity" value="${product.quantity}">
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
									</select>
								</div>

								<div class="form-group">
									<label for="name" class="control-label">Price</label> <input
										type="text" class="form-control" name="price" value="${product.price}"
										placeholder="Enter New Price">
								</div>
							</div>

						</div>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Update</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
</body>

</html>
<%@ include file="Common-Footer.jsp"%>