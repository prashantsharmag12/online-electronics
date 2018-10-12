<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${listOrders}" var="o">

<div class="container">
<div class="form-group">
							<label class="control-label col-md-4" for="categoryId">
								${o.order_code}</label>
							<div class="col-md-8">
								<select id="list" name="list" onChange="getSelectValue();">
								<c:forEach items="${deliveryboys}" var="db">
								<option  value="${db.id}" ${peesu} = ${db.id}>${db.f_name} ${db.l_name}</option>
							</c:forEach>
								</select>
								<script>
								function getSelectValue(){
									var selectedValue = document.getElementById("list").value;
									
									bootbox.confirm({
										size: 'medium',
										title: 'Activation & Deactivation',
										message:'confirm to assign the order',
										callback: function(confirmed)
										{
											
											if(confirmed)
												{
												console.log(selectedValue);
												    var updateUrl = window.contextRoot + '/manage/${o.id}/' + selectedValue;
													window.location.href = updateUrl;
												    
												   
												}
											else
												{
												var updateUrl = window.contextRoot + '/manage/orders';
												
												}
										}
									})
									
									window.location.href = updateUrl;
								}
								
								</script>
						
							</div>
						</div>

</div>
</c:forEach>