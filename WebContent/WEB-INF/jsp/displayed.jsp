<div class="container">

<h2>Available Shipping Address are</h2>
</br>





</div>






			<table id="cart" class="table table-hover table-condensed" style="width:70%; margin-left:15%; margin-right:15%; ">
				<thead>
				<div style="width=50px">
					<tr>
						<th style="width: 20%">Address Line 1</th>
						<th style="width: 20%">Address Line 2</th>
						<th style="width: 5%">city</th>
						<th style="width: 5%" class="text-center">state</th>
						<th style="width: 5%">pincode</th>
						<th style="width: 5%">Choose</th>>
					</tr>
					</div>
				</thead>
				<tbody>
				<c:forEach items="${LOA}" var="istAddress">
					
					<div style="width=50px">
					<tr>
					
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs">
										<h4 class="nomargin">${istAddress.address1}</h4>
									</div>
								</div>
							</td>
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs">
										<h4 class="nomargin">${istAddress.address2}</h4>
									</div>
								</div>
							</td>
							<td data-th="Price">${istAddress.city}</td>
							<td data-th="Quantity">
								<h4>${istAddress.state}</h4>
								</td>
<td data-th="Price">${istAddress.country}</td>


<td data-th=Choosee>
   
   
   
   <label><input type="radio" id='express'  name = "selectone" value="${istAddress.id}"></label>
   

</td>


						</tr>
						</div>
					</c:forEach>

				
						

					


				</tbody>
				
			</table>
			
			
			<a href="${contextRoot}/cart/edit/address" class="btn btn-success btn-block">AddNewAddress
								<span class="glyphicon glyphicon-chevron-right"></span></a>
			