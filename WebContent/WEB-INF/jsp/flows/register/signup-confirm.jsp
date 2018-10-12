<%@include file="../shared/flows-header.jsp" %>

</br>
</br>
</br>
</br>
<div class="container">
<div class="row">
	
		<div class="col-sm-6">
	
			<div class="panel panel-primary">
				
				<div class="panel-heading">
					<h4>Personal Details</h4>
				</div>
			
				<div class="panel-body">
					<div class="text-center">
					<h4>${registerModel.customer.f_name} ${registerModel.customer.l_name}</h4>
						<h5>Email: ${registerModel.customer.email}</h5>
						<h4>Contact : <strong>${registerModel.customer.getMobile_number()}</strong></h4>
						<h4>Role : <strong>${registerModel.customer.role}</strong></h4>
						
						
						<p>
							<a href="${flowExecutionUrl}&_eventId_personal" class="btn btn-primary">Edit Personal</a>
						</p>
					</div>
				</div>
			
			</div>
					
		
		</div>
		
		<div class="col-sm-6">
		
			<div class="panel panel-primary">
				
				<div class="panel-heading">
					<h4>Billing Address</h4>
				</div>
			
				<div class="panel-body">
					<div class="text-center">
						<p>${registerModel.billing.address1}, </p>
						<p>${registerModel.billing.address2}, </p>
						<p>${registerModel.billing.city} -  ${registerModel.billing.pincode}, </p>
						<p>${registerModel.billing.state}</p>
						<p>${registerModel.billing.country}</p>
						
						<p>
							<a href="${flowExecutionUrl}&_eventId_billing" class="btn btn-primary">Edit Billing</a>
						</p>
					</div>
				</div>
			
			</div>
		
		</div>
	
	</div>
	
	<div class="row">
		
		<div class="col-sm-4 col-sm-offset-4">
			
			<div class="text-center">
				
				<a href="${flowExecutionUrl}&_eventId_success" class="btn btn-lg btn-primary">Confirm</a>
				
			</div>
			
		</div>
		
	</div>

</div>
