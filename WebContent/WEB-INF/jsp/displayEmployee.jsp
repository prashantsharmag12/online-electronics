
<div class="container">

<h2>All employees are</h2>
</br>





</div>






			<table id="employee" class="table table-hover table-condensed" style="width:70%; margin-left:15%; margin-right:15%; ">
				<thead>
				<div style="width=50px">
					<tr>
						<th style="width: 20%">Id</th>
						<th style="width: 20%">First-Name</th>
						<th style="width: 5%">Email_id</th>
						<th style="width: 5%">Mobile</th>
						<th style="width: 5%">Sex</th>
					
						
					</tr>
					</div>
				</thead>
				<tbody>
				<c:forEach items="${EL}" var="istAddress">
					
					<div style="width=25px">
					<tr>
					
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs">
										<h4 class="nomargin">${istAddress.id}</h4>
									</div>
								</div>
							</td>
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs">
										<h4 class="nomargin">${istAddress.f_name} ${ istAddress.l_name}</h4>
									</div>
								</div>
							</td>
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs">
										<h4 class="nomargin">${istAddress.email}</h4>
									</div>
								</div>
							</td>
							
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs">
										<h4 class="nomargin">${istAddress.getMobile_number()}</h4>
									</div>
								</div>
							</td>
							
							
							<td data-th="Product">
								<div class="row">
									<div class="col-sm-2 hidden-xs">
										<h4 class="nomargin">${istAddress.sex}</h4>
									</div>
								</div>
							</td>
							<td data-th="Product">
							
									<label class="switch" )>
								    <c:if test="${istAddress.active==true}">
								    <input type="checkbox" checked="checked" value="${istAddress.getId()}" />
								    </c:if>
								    <c:if test="${istAddress.active==false}">
								    <input type="checkbox" value="${istAddress.getId()}" />
								    </c:if>
									
									<div class="slider"></div></label>
									</label>
									</td>
							
			            


						</tr>
						</div>
					</c:forEach>

				
						

					


				</tbody>
				
			</table>
			
		
			