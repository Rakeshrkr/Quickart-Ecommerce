
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="Common-Header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Management</title>
</head>
<%-- <body>
<table>
  <tr>
    <th>Product ID</th>
    <th>Product Name</th>
    <th>Category</th>
    <th>Price</th>
  </tr>
  <c:forEach items="${productlist}" var="product">
  <tr>
    <td>${product.product_Id}</td>
    <td>${product.product_Name}</td>
    <td>${product.category}</td>
    <td>${product.price}</td>
  </tr>
  </c:forEach>
</table>
</body>
</html> --%>

<body>
<h1>Product Data</h1>
<form:form action="product.do" method="POST" commandName="product">
	<table>
		<tr>
			<td>Product Id</td>
			<td><form:input path="productId"  /></td>
		</tr>
		<tr>
			<td>Product Name</td>
			<td><form:input path="productName"  /></td>
		</tr>
		<tr>
			<td>Product Category</td>
			<td><form:input path="productCategory"  /></td>
		</tr>
		<tr>
			<td>Price</td>
			<td><form:input path="price"  /></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" name="action" value="Add" />
				<input type="submit" name="action" value="Edit" />
				<input type="submit" name="action" value="Delete" />
				<input type="submit" name="action" value="Search" />
			</td>
		</tr>
	</table>
</form:form>
<br>
<table border="1">
	<th>Product Id</th>
	<th>Product Name</th>
	<th>Product Category</th>
	<th>Price</th>
	<c:forEach items="${productList}" var="product">
		<tr>
			<td>${product.productId}</td>
			<td>${product.productName}</td>
			<td>${product.productCategory}</td>
			<td>${product.price}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>
