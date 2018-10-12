<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


<div class="container">


<c:if test="${not empty message}">
		
		<div class="alert alert-info">
			<h3 class="text-center">${message}</h3>
		</div>		
	
	</c:if>


	<c:choose>

		<c:when test="${not empty cartLines}">


			<table id="cart" class="table table-hover table-condensed">
				<thead>
					<tr>
						<th style="width: 50%">Product</th>
						<th style="width: 10%">Price</th>
						<th style="width: 8%">Quantity</th>
						<th style="width: 22%" class="text-center">Subtotal</th>
						<th style="width: 10%"></th>
					</tr>
				</thead>
				<tbody>
				
				<c:forEach items="${cartLines}" var="cartLine">
				<tr>
						<td data-th="Product">
							<div class="row">
								<div class="col-sm-2 hidden-xs">
									<img src="${images}/${cartLine.product.product_code}.jpg" alt="${cartLine.product.name}"
										class="img-responsive dataTableImg" />
								</div>
								<div class="col-sm-10">
									<h4 class="nomargin">${cartLine.product.name}
									<c:if test="${cartLine.is_available == false}">
											<strong style="color:red">(Out of Stock!)</strong> 
										</c:if>
									</h4>
									<p>Brand : ${cartLine.product.brand}</p>
									<p>Description : ${cartLine.product.description}</p>
								</div>
							</div>
						</td>
						<td data-th="Price"> &#8377;  ${cartLine.product_price}</td>
						<td data-th="Quantity"><input type="number"
						id="count_${cartLine.id}" min="1" max="3"
							class="form-control text-center" value="${cartLine.quantity}"></td>
						<td data-th="Subtotal" class="text-center"> &#8377; ${cartLine.total}</td>
						<td class="actions" data-th="">
							<button   name="refreshCart" value="${cartLine.id}" class="btn btn-info btn-sm">
								<span class="glyphicon glyphicon-refresh"></span>
							</button>
							<a href="${contextRoot}/cart/${cartLine.id}/delete" type="button" class="btn btn-danger btn-sm">
								<span class="glyphicon glyphicon-trash"></span>
							</a>
						</td>
					</tr>
				
				</c:forEach>
				
					
				</tbody>
				<tfoot>
					<tr class="visible-xs">
						<td class="text-center"><strong>Total  &#8377; ${userModel.cart.total} </strong></td>
					</tr>
					<tr>
						<td><a href="${contextRoot}/show/all/product" class="btn btn-warning"><span
								class="glyphicon glyphicon-chevron-left"></span> Continue
								Shopping</a></td>
						<td colspan="2" class="hidden-xs"></td>
						<td class="hidden-xs text-center"><strong>Total
								 &#8377; ${userModel.cart.total}</strong></td>
						<td><a href="${contextRoot}/cart/show/address" class="btn btn-success btn-block">Checkout
								<span class="glyphicon glyphicon-chevron-right"></span>
						</a></td>
					</tr>
				</tfoot>
			</table>
		</c:when>
		<c:otherwise>
			<div class="jumbotron">
				<div class="text-center">

					<h1>No item available in your cart!</h1>

				</div>
			</div>
		</c:otherwise>
	</c:choose>
</div>


	
