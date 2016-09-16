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
							<div>
								<span
									style="text-shadow: 0px 2px 6px #800000; font-size: 17px; color: gold; font-family: initial;">
									Welcome : &nbsp;${SessionAdminName} (Administrator)</span>
							</div>
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
			<td>
				<div class="container text-center">
					<div class="row">
						<h3 style="color: #1E90FF">Add Products</h3>
						<br />
						<div class="col-sm-12">
							<div>
								<form:form class="form-inline" method="post" action="addProduct"
									commandName="Product">
									<div class="form-group">
										<form:label for="productName" path="productName">Product Name&nbsp;:</form:label>
										<form:input type="text" class="form-control"
											Style="background-color: #cce6ff;" name="productName"
											path="productName" placeholder="Enter Product" />
									</div>
									
									&nbsp;&nbsp;&nbsp;&nbsp;
									<div class="form-group">
										<form:label for="productCategory" path="productCategory">Product Category: </form:label>
										<form:select class="form-control"
											Style="background-color: #cce6ff;" name="productCategory"
											path="productCategory">
											<form:option value="Electronics">Electronics</form:option>
											<form:option value="Men's Wearing">Men's Wearing</form:option>
											<form:option value="Girl's Wearing">Girl's Wearing</form:option>
											<form:option value="Furniture">Furniture</form:option>
											<form:option value="Other">Other</form:option>
										</form:select>
									</div>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<div class="form-group"></div>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<div class="form-group">
										<form:label for="quantity" path="quantity">Quantity&nbsp;:</form:label>
										<form:select class="form-control" path="quantity"
											Style="background-color: #cce6ff;" name="quantity">
											<form:option value="1">1</form:option>
											<form:option value="2">2</form:option>
											<form:option value="3">3</form:option>
											<form:option value="4">4</form:option>
										</form:select>
									</div> 
									
									&nbsp;&nbsp;&nbsp;&nbsp;
									<div class="form-group">
										<form:label for="price" path="price">Price&nbsp;: </form:label>
										<form:input type="text" class="form-control"
											Style="background-color: #cce6ff;" name="price"
											placeholder="Enter Price" path="price" />
									</div>
									<br />
									<br />
									<form:button type="submit" class="btn btn-primary">Submit</form:button>
								</form:form>
							</div>
						</div>
					</div>
				</div>
				<hr />
				<div align="center">
					<span  style="color: green;"><h4>${success}</h4></span> <span
						style="color: red;"><h4>${IncorrectId}</h4></span> <span
						style="color: red;"><h4>${fail}</h4></span><br />

				</div>
				<div class="container">
					<div style="text-align: center;">
						<h3 style="color: #1E90FF; font-size: 25px">Your Products</h3>
						&nbsp;
					</div>
					<table class="table table-striped" align="center">
						<thead>
							<tr>
								<th>Product Id</th>
								<th>Product Name</th>
								<th>Product Type</th>
								<th>Quantity</th>
								<th>Price</th>
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

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</td>
		</tr>
		<%-- 	<tr align="center">
			<td><span style="color: green;"><h4>${success}</h4></span> <span
				style="color: red;"><h4>${fail}</h4></span><br /></td>
		</tr> --%>
	</table>
</body>
</html>
<hr style="border-color: white">
<%@ include file="Common-Footer.jsp"%>