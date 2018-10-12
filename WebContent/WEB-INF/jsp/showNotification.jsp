<c:choose>

		<c:when test="${not empty LN}">


			<table id="cart" class="table table-hover table-condensed" style="width: 50%; margin-left: 25%; margin-right: 25%;">
				<thead>
				<div style="width=50px">
					<tr>
						<th style="width: 2%"></th>
						<th style="width: 20%">Notice</th>
						<th style="width: 5%">Date and Time</th>
					</tr>
					</div>
				</thead>
				<tbody>
				<c:forEach items="${LN}" var="notifi">
					
					<div style="width=50px">
					<tr>
					
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs">
										
									</div>
								</div>
							</td>
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs">
										<h4 class="nomargin">${notifi.noti}</h4>
									</div>
								</div>
							</td>
							<td data-th="Price">${notifi.noti_date}</td>
							
						</tr>
						</div>
					</c:forEach>


				</tbody>
				
			</table>
		</c:when>
		<c:otherwise>
			<div class="jumbotron">
				<div class="text-center">

					<h1>No new notifications!</h1>

				</div>
			</div>
		</c:otherwise>
	</c:choose>