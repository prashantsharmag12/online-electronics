<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="container">

	<div class="row">
		
		<div class="col-md-offset-2 col-md-8">

			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4>Notification Management</h4>
				</div>
				<div class="panel-body">
					<!-- Form -->
					<sf:form class="form-horizontal" modelAttribute="enoti"
						action="${contextRoot}/manage/notificat" method="POST"
						enctype="multipart/form-data">
						<div class="form-group">
							<label class="control-label col-md-4" for="name">Enter
								Product Name:</label>
							<div class="col-md-8">
								<sf:input type="text" path="noti" id="name"
									placeholder="Product Name" class="form-control" />
								<sf:errors path="noti" cssclass="help-block" element="em" />
							</div>
						</div>

												<div class="form-group">

							<div class="col-md-offset-4 col-md-8">
								<input type="submit" name="submit" id="submit" value="Submit"
									class="btn btn-primary" />

								<sf:hidden path="id" />
								<sf:hidden path="noti_date" />

							</div>
						</div>

					</sf:form>
				</div>

			</div>


		</div>
	</div>



	</div>