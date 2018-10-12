


			<table id="cart" class="table table-hover table-condensed" style="width: 50%; margin-left: 25%; margin-right: 25%;">
				<thead>
				<div style="width=50px">
					<tr>
						<th style="width: 20%">Order Code</th>
						<th style="width: 20%">Amount</th>
						<th style="width: 20%">Number of different Products</th>
						<th style="width: 5%" class="text-center">Delivered</th>
						<th style="width: 5%">Date and Time</th>
					</tr>
					</div>
				</thead>
				<tbody>
				<c:forEach items="${listhistory}" var="his">
					
					<div style="width=50px">
					<tr>
					
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs">
										<h4 class="nomargin">${his.order_code}</h4>
									</div>
								</div>
							</td>
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs">
										<h4 class="nomargin">${his.amount}</h4>
									</div>
								</div>
							</td>
							<td data-th="Price">${his.quantity}</td>
							<td data-th="Quantity">
								<h4>${his.delivered}</h4>
								</td>
<td data-th="Price">${his.order_date}</td>
						</tr>
						</div>
					</c:forEach>


				</tbody>
				
			</table>