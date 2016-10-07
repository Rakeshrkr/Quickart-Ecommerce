<%@ include file="/WEB-INF/views/Common-Header.jsp"%>

<table width="50%" align="center"
	style="margin-top: 3%; box-shadow: 0px 9px 30px #888888;">
	<tr>
		<td><hr />
			<div class="container text-center">
				<div class="row">
					<h3 style="color: #1E90FF">Add Products</h3>
					<br />
					<div class="col-sm-12">
						<div>
							<form:form class="form-inline" method="post" action="addProduct"
								enctype="multipart/form-data" modelAttribute="Product">
								<table style="width: 100%">
									<tr>
										<td>
											<div class="form-group" style="padding: 20px">
												<form:label for="productId" path="productId">&nbsp;&nbsp;Product Id&nbsp;&nbsp;:</form:label>
												<form:input type="text" class="form-control"
													Style="background-color: #cce6ff;" name="productId"
													path="productId" placeholder=" Product Id" />
											</div>
										</td>
										<td><div class="form-group" style="padding: 20px">
												<form:label for="productName" path="productName">Product Name&nbsp;:</form:label>
												<form:input type="text" class="form-control"
													Style="background-color: #cce6ff;" name="productName"
													path="productName" placeholder="Enter Product" />
											</div></td>
										<td>
											<div class="form-group" style="padding: 20px">
												<form:label for="quantity" path="quantity">Quantity&nbsp;:</form:label>
												<form:input type="text" class="form-control"
													Style="background-color: #cce6ff;" name="quantity"
													path="quantity" placeholder="00" />
											</div>
										</td>
									</tr>

									<tr>
										<td><div class="form-group" style="padding: 20px">
												<form:label for="category" path="category"> &nbsp;&nbsp;Category &nbsp;&nbsp;: </form:label>
												<form:select class="form-control"
													Style="background-color: #cce6ff;" name="category"
													path="category">
													<form:option value="NONE"
														label="---------- Select ----------" />
													<form:options items="${categorylist}" />
												</form:select>
											</div></td>
										<td><div class="form-group" style="padding: 20px">
												<form:label for="supplier" path="supplier"> Supplier Name&nbsp;: </form:label>
												<form:select class="form-control"
													Style="background-color: #cce6ff;" name="supplier"
													path="supplier">
													<form:option value="NONE"
														label="---------- Select ----------" />
													<form:options items="${supplierlist}"></form:options>

												</form:select>
											</div></td>
										<td><div class="form-group" style="padding: 20px">
												<form:label for="price" path="price">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Price&nbsp;: </form:label>
												<form:input type="text" class="form-control"
													Style="background-color: #cce6ff;" name="price"
													placeholder="Enter Price" path="price" />
											</div></td>
									</tr>
									<tr>
										<td><div class="form-group" style="padding: 20px">
												<form:label for="description" path="description">Description&nbsp;: </form:label>
												<form:input type="text" class="form-control"
													Style="background-color: #cce6ff;" name="description"
													placeholder="description" path="description" />
											</div></td>
										<td>

											<div class="form-group" style="padding: 20px">
												<form:label for="image" path="image">Image&nbsp;: </form:label>
												<form:input type="file" class="form-control"
													Style="background-color: #cce6ff;" name="image"
													placeholder="image" path="image" />
											</div>

										</td>
									</tr>


								</table>





								<form:button type="submit" class="btn btn-primary">Submit</form:button>

								<hr>
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
							<th>Supplier</th>
							<th>Category</th>
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
								<td>${product.getSupplier() }</td>

								<td>${product.getCategory()}</td>
								<td>${product.quantity}</td>
								<td>${product.price}</td>
								<td><a href="delete/${product.productId}"
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
									<label for="name" class="control-label">Quantity</label> <input
										type="text" class="form-control" name="quantity"
										value="${product.quantity}">

								</div>

								<div class="form-group">
									<label for="name" class="control-label">Price</label> <input
										type="text" class="form-control" name="price"
										value="${product.price}" placeholder="Enter New Price">
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

<hr style="border-color: white">
<%@ include file="/WEB-INF/views/Common-Footer.jsp"%>