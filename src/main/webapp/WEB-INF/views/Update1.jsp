	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<h3 style="color: green">Update Your Products</h3>
					<form method="post" action="editProducts">
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<label for="name" class="control-label">Provide the
										Product Id</label> <input type="text" class="form-control"
										name="productId" placeholder="Enter Product ID">
								</div>

								<div class="form-group">
									<label for="name" class="control-label">Product Name</label> <input
										type="text" class="form-control" name="productName"
										placeholder="Enter New Name">
								</div>

								<div class="form-group">
									<label for="name" class="control-label">Product
										Category</label> <select class="form-control" name="productCategory">
										<option>Electronics</option>
										<option>Men's Wearing</option>
										<option>Girl's Wearing</option>
										<option>Furniture</option>
										<option>Other</option>
									</select>

								</div>

								<div class="form-group">
									<label for="name" class="control-label">Quantity</label> <select
										class="form-control" name="quantity">
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
									</select>
								</div>

								<div class="form-group">
									<label for="name" class="control-label">Price</label> <input
										type="text" class="form-control" name="price"
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