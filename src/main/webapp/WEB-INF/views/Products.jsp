<%@ include file="Common-Header.jsp"%>

	<table width="50%" align="center"
		style="margin-top: 3%; box-shadow: 0px 9px 30px #888888;">
	<%-- 	<tr>
			<td>
				<div class="container-fluid">
					<div class="row"
						style="background-color: #003366; text-align: center; padding: 10px;">
						<div class="col-sm-4"></div>
						<div class="col-sm-4">
							<div>
								<span
									style="text-shadow: 0px 2px 6px #800000; font-size: 17px; color: gold; font-family: initial;">
									Welcome : &nbsp;${user}</span>
							</div>
						</div>
						<!-- <div class="col-sm-4" align="right">
							<button type="submit" onclick="location.href='goback'"
								class="btn btn-default">Go Home</button>
							&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
							<button type="submit" onclick="location.href='index'"
								class="btn btn-default">Log Out</button>
						</div> -->
					</div>
				</div>
			</td>
		</tr> --%>
		<tr>
			<td><hr />
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
											data-toggle="modal" data-target="#${product.productId}"
											style="padding: 5px;">Edit</button></td>
								</tr>

							</c:forEach>
						</tbody>
					</table>
				</div></td>
		</tr>
	</table>
	<c:forEach items="${ProductList}" var="product">
		<div class="modal fade" id="${product.productId}" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-body">
						<h3 style="color: green">Update Your Products</h3>
						<form method="post" action="edit/${product.productId}">
							<div class="row">
								<div class="col-sm-12">
									<div class="form-group">
										<label for="name" class="control-label">Provide the
											Product Id</label> <input type="text" class="form-control"
											value="${product.productId}" name="productId"
											placeholder="${product.productId}" readonly="true">
									</div>

									<div class="form-group">
										<label for="name" class="control-label">Product Name</label> <input
											type="text" class="form-control" name="productName"
											value="${product.productName}" placeholder="Enter New Name">
									</div>

									<div class="form-group">
										<label for="name" class="control-label">Product
											Category</label> <select class="form-control" name="productCategory"
											value="${product.productCategory}">
											<option>Electronics</option>
											<option>Men's Wearing</option>
											<option>Girl's Wearing</option>
											<option>Furniture</option>
											<option>Other</option>
										</select>

									</div>

									<div class="form-group">
										<label for="name" class="control-label">Quantity</label> <select
											class="form-control" name="quantity"
											value="${product.quantity}">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
										</select>
									</div>

									<div class="form-group">
										<label for="name" class="control-label">Price</label> <input
											type="text" class="form-control" name="price"
											value="${product.price}" placeholder="Enter New Price">
									</div>
								</div>

							</div>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>

<hr style="border-color: white">
<%@ include file="Common-Footer.jsp"%>