<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
<c:choose>

		<c:when test="${not empty list}">
	<h2>Your Unordered Delivery are:</h2>
	</br>
</div>
<table id="cart" class="table table-hover table-condensed"
	style="width: 70%; margin-left: 15%; margin-right: 15%;">
	<thead>
		<div style="">
			<tr>
				<th style="width: 20%">Order_code</th>
				<th style="width: 20%">Amount</th>
				<th style="width: 5%">Quantity</th>
				<th style="width: 5%" class="text-center">Date</th>
				
				<th style="width: 5%">Select if Delivered</th>
			</tr>
		</div>
	</thead>
	<tbody>
		<c:forEach items="${list}" var="istAddress">

			<div style="">
				<tr>

					<td data-th="Product">
						<div class="row">
							<div class="col-sm-2 hidden-xs">
								<h4 class="nomargin">${istAddress.order_code}</h4>
							</div>
						</div>
					</td>
					<td data-th="Product">
						<div class="row">
							<div class="col-sm-2 hidden-xs">
								<h4 class="nomargin">${istAddress.amount}</h4>
							</div>
						</div>
					</td>
					<td data-th="Price">${istAddress.quantity}</td>
					<td data-th="Quantity">
						<h4>${istAddress.order_date}</h4>
					</td>
			
					<td data-th=Choosee>
					<a href="${contextRoot}/employee/${istAddress.id}/delivered" class="btn btn-primary">
				Delivered</a></td>
				</tr>
			</div>
		</c:forEach>
	</tbody>

</table>
</c:when>
		<c:otherwise>
			<div class="jumbotron">
				<div class="text-center">

					<h1>All Your ASsigned Orders Are Delivered!!</h1>

				</div>
			</div>
		</c:otherwise>
	</c:choose>
	</div>