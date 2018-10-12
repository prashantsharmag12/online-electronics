<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

</br>
</br>
<div class="container">
	<div class="row">

		<div class="col-md-6 col-md-offset-3">

			<div class="panel panel-primary">

				<div class="panel-heading">
					<h4>Sign Up - Personal</h4>
				</div>

				<div class="panel-body">

					<sf:form method="POST" modelAttribute="customer"
						class="form-horizontal" id="registerForm">


						<div class="form-group">
							<label class="control-label col-md-4">First Name</label>
							<div class="col-md-8">
								<sf:input type="text" path="f_name" class="form-control"
									placeholder="First Name" />
								<sf:errors path="f_name" cssClass="help-block" element="em" />
							</div>
						</div>


						<div class="form-group">
							<label class="control-label col-md-4">Last Name</label>
							<div class="col-md-8">
								<sf:input type="text" path="l_name" class="form-control"
									placeholder="Last Name" />
								<sf:errors path="l_name" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4">Email</label>
							<div class="col-md-8">
								<sf:input type="text" path="email" class="form-control"
									placeholder="abc@xyz.com" />
								<sf:errors path="email" cssClass="help-block" element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4">Contact Number</label>
							<div class="col-md-8">
								<sf:input type="text" path="Mobile_number" class="form-control"
									placeholder="XXXXXXXXXX" maxlength="10" />
								<sf:errors path="Mobile_number" cssClass="help-block"
									element="em" />
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4">Password</label>
							<div class="col-md-8">
								<sf:input type="password" path="password" class="form-control"
									placeholder="****" />
								<sf:errors path="password" cssClass="help-block" element="em" />
							</div>
						</div>
						
						
						<div class="form-group">
							<label class="control-label col-md-4">Confirm Password</label>
							<div class="col-md-8">
								<sf:input type="password" path="confirmPassword" class="form-control"
									placeholder="****" />
								<sf:errors path="confirmPassword" cssClass="help-block" element="em" />
							</div>
						</div>
						

						<div class="form-group">
							<label class="control-label col-md-4">Select Gender</label>
							<div class="col-md-8">
								<label class="radio-inline"> <sf:radiobutton path="sex"
										value="Male" checked="checked" /> Male
								</label> <label class="radio-inline"> <sf:radiobutton
										path="sex" value="Female" /> Female
								</label>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4">Select Role</label>
							<div class="col-md-8">
								<label class="radio-inline"> <sf:radiobutton path="role"
										value="EMPLOYEE" checked="checked" /> Employee
								
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-offset-4 col-md-8">
								<button type="submit" name="_eventId_empregis"
									class="btn btn-primary">
									Registered <span class="glyphicon glyphicon-chevron-right"></span>
								</button>
							</div>
						</div>
					</sf:form>
				</div>
			</div>
		</div>
	</div>
</div>
