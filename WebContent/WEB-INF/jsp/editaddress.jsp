<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>





<div class="col-md-offset-2 col-md-8">

	<div class="panel panel-primary">
		<div class="panel-heading">
			<h4>Address Management</h4>
		</div>
		<div class="panel-body">
			<!-- Form -->
			<sf:form class="form-horizontal" modelAttribute="address"
				action="${contextRoot}/cart/address" method="POST"
				enctype="multipart/form-data">
			 
			 
			 <div class="form-group">
					<label class="control-label col-md-4" for="address1">Enter
						Address1:</label>
					<div class="col-md-8">
						<sf:input type="text" path="address1" id="address1"
							placeholder="address2" class="form-control" />
						
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-md-4" for="address2">Enter
						Address2:</label>
					<div class="col-md-8">
						<sf:input type="text" path="address2" id="brand"
							placeholder="address2" class="form-control" />
						
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4" for="city">Enter
						City:</label>
					<div class="col-md-8">
						<sf:input type="text" path="city" id="city" placeholder="city"
							class="form-control" />
						
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4" for="price">Enter
						 State:</label>
					<div class="col-md-8">
						<sf:input type="text" path="state" placeholder="Enter state!"
							class="form-control" />
						
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4" for="country">Enter
					Country:</label>
					<div class="col-md-8">
						<sf:input type="text" path="country" placeholder="Enter country!"
							class="form-control" />

					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-4" for="pincode">Enter
						Pincode:</label>
					<div class="col-md-8">
						<sf:input type="text" path="pincode" placeholder="Enter pincode!"
							class="form-control" />

					</div>
				</div>
				
				
				




				

				<div class="form-group">

					<div class="col-md-offset-4 col-md-8">
						<input type="submit" name="submit" id="submit" value="Submit"
							class="btn btn-primary" />

						<sf:hidden path="id" />
						<sf:hidden path="cust_id" />
						<sf:hidden path="is_shipping" />
						<sf:hidden path="is_billing" />
						

					</div>
				</div>

			</sf:form>
		</div>

	</div>


</div>






