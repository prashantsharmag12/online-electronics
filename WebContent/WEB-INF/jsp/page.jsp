<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />


<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>


<meta name="description" content="">
<meta name="author" content="">

<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">


<title>Online shopping-${title}</title>
<style>


/*!
 * Start Bootstrap - Shop Homepage (http://startbootstrap.com/)
 * Copyright 2013-2016 Start Bootstrap
 * Licensed under MIT (https://github.com/BlackrockDigital/startbootstrap/blob/gh-pages/LICENSE)
 */

html {
	height:100%;
}

body {
    padding-top: 70px; /* Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes. */
    height:100%;
}



.carousel-holder {
    margin-bottom: 30px;
}

.carousel-control,
.item {
    border-radius: 4px;
}

.caption {
    height: 130px;
    overflow: hidden;
}

.caption h4 {
    white-space: nowrap;
}

.thumbnail img {
    width: 100%;
}

.ratings {
    padding-right: 10px;
    padding-left: 10px;
    color: #d17581;
}

.thumbnail {
    padding: 0;
}

.thumbnail .caption-full {
    padding: 9px;
    color: #333;
}

footer {
    margin: 0;
}


/*
	custom styling
*/

.wrapper {	
	min-height:100%;
	position: relative;
}


.content {
	padding-bottom: 60px; /*height of the footer*/	
}


.footer {
	width:100%;
	position:absolute;
	bottom:20px;
	height: 60px;
	
}


.dataTableImg {
	
	width:100px;
	height: 100px;
	
}

.has-success {
	color: #4582ec;
}

/*Toggle Switch code*/

/* The switch - the box around the slider */
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 30px;
}

.switch input {display:none;}

/* Hide default HTML checkbox */
.switch input {display:none;}

/* The slider */
.slider {
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}

/* overridden css */
.help-block {
	color: #ff0000;
}


/*Shopping Cart*/
.table>tbody>tr>td, .table>tfoot>tr>td{
    vertical-align: middle;
}
@media screen and (max-width: 600px) {
    table#cart tbody td .form-control{
		width:20%;
		display: inline !important;
	}
	.actions .btn{
		width:36%;
		margin:1.5em 0;
	}
	
	.actions .btn-info{
		float:left;
	}
	.actions .btn-danger{
		float:right;
	}
	
	table#cart thead { display: none; }
	table#cart tbody td { display: block; padding: .6rem; min-width:320px;}
	table#cart tbody tr td:first-child { background: #333; color: #fff; }
	table#cart tbody td:before {
		content: attr(data-th); font-weight: bold;
		display: inline-block; width: 8rem;
	}
	
	
	
	table#cart tfoot td{display:block; }
	table#cart tfoot td .btn{display:block;}
	
}


/* cart checkout */
.panel-title {display: inline;font-weight: bold;}
.checkbox.pull-right { margin: 0; }
.pl-ziro { padding-left: 0px; }

/* order receipt */
.invoice-title h2, .invoice-title h3 {
    display: inline-block;
}

.table > tbody > tr > .no-line {
    border-top: none;
}

.table > thead > tr > .no-line {
    border-bottom: none;
}

.table > tbody > tr > .thick-line {
    border-top: 2px solid;
}


/* landing css */

.landingImg {
	width: auto;
	height : 180px;
}


.se-pre-con{
		position:fixed;
		left:0;
		top:0;
		width:98%;
		height:100%;
		z-index:9999;
		background:url(../images/pre-loader.gif) 50% no-repeat #fff
}





</style>



<script>
	window.menu = '${title}';
	window.contextRoot = '${contextRoot}'
</script>

<link href="${css}/bootstrap.min.css" rel="stylesheet">

<link href="${css}/bootstrap-readable-theme.css" rel="stylesheet">

<link href="${css}/dataTables.bootstrap.css" rel="stylesheet">

<link href="${css}/myapp.css" rel="stylesheet">


<!-- Bootstrap core CSS -->


<!-- Custom styles for this template -->


</head>

<body  style="background:url(../assets/images/bi2.jpeg) no-repeat; background-size: cover;">

	<!-- Navigation -->



	<%@include file="./shared/navbar.jsp"%>


	<!-- Page Content -->
	<div class="content">


		<c:if test="${UserClickHome ==true}">
			<%@include file="home.jsp"%>
		</c:if>
		<c:if test="${UserClickAbout ==true}">
			<%@include file="about.jsp"%>
		</c:if>
		<c:if test="${UserClickContact ==true}">
			<%@include file="contact.jsp"%>
		</c:if>
		<c:if
			test="${UserClickAllProducts ==true or UserClickCategoryProducts==true}">
			<%@include file="listproduct.jsp"%>
		</c:if>
        <c:if
			test="${UserClickShowProduct == true}">
			<%@include file="singleproduct.jsp"%>
		</c:if>
		<c:if
			test="${UserClickManageProducts == true}">
			<%@include file="manageproduct.jsp"%>
		</c:if>
		<c:if
			test="${userClickShowCart == true}">
			<%@include file="cart.jsp"%>
		</c:if>
		<c:if
			test="${userClickShowAddress == true}">
			<%@include file="displayed.jsp"%>
		</c:if>
		<c:if
			test="${payment == true}">
			<%@include file="checkout.jsp"%>
		</c:if>
		<c:if
			test="${userClickhistory == true}">
			<%@include file="gethis.jsp"%>
		</c:if>
		
		
		
		
		<c:if
			test="${UserClickAddAddress == true}">
			
			<%@include file="editaddress.jsp"%>
		</c:if>
		
		
		<c:if
			test="${userClickDisplayEmployee == true}">			
			<%@include file="displayEmployee.jsp"%>
		</c:if>
		
		<c:if
			test="${userClickUpdateOrder == true}">			
			<%@include file="updateorder.jsp"%>
		</c:if>
		
		<c:if
			test="${UserClickManageNotification == true}">			
			<%@include file="displayNotification.jsp"%>
		</c:if>
		<c:if
			test="${userClickShowNotification == true}">			
			<%@include file="showNotification.jsp"%>
		</c:if>
		
		
		<c:if
			test="${UserClickUndelivered == true}">			
			<%@include file="notreached.jsp"%>
		</c:if>
		
		<c:if
			test="${UserClickdelivered == true}">			
			<%@include file="reached.jsp"%>
		</c:if>
		<c:if
			test="${userClickManageOrders == true}">			
			<%@include file="assign_order.jsp"%>
		</c:if>
		
		
		
		

	</div>




	<div style="margin-top: 500px">
		<%@include file="./shared/footer.jsp"%>
	</div>



	<script src="${js}/jquery.js"></script>


   

	<script src="${js}/bootstrap.min.js"></script>

	<script src="${js}/jquery.dataTables.js"></script>
	<script src="${js}/dataTables.bootstrap.js"></script>
	<script src="${js}/bootbox.min.js"></script>











	<script>
		
	
	
	
	
	
	var token = $('meta[name="_csrf"]').attr('content');
	var header = $('meta[name="_csrf_header"]').attr('content');
	
	if((token!=undefined && header !=undefined) && (token.length > 0 && header.length > 0)) {		
		// set the token header for the ajax request
		$(document).ajaxSend(function(e, xhr, options) {			
			xhr.setRequestHeader(header,token);			
		});				
	}
		
	
		var $table = $('#productListTable');

		var products = [

		[ '1', 'ABC' ], [ '2', 'BCD' ], [ '3', 'ABlC' ], [ '4', 'ABoC' ],
				[ '5', 'AByC' ], [ '6', 'ABddC' ], [ '7', 'AddBC' ] ];

		// execute the below code only where we have this table
		if ($table.length) {

			//console.log('hi lbfj')
			var jsonUrl = '';
			if (window.categoryId == '') {
				jsonUrl = window.contextRoot + '/json/data/all/products';
			} else {
				jsonUrl = window.contextRoot + '/json/data/category/'
						+ window.categoryId + '/products';
			}

			$table
					.DataTable({

						lengthMenu : [
								[ 3, 5, 10, -1 ],
								[ '3 Records', '5 Records', '10 Records', 'ALL' ] ],
						ajax : {
							url : jsonUrl,
							dataSrc : ''
						},

						columns : [
								{
									data : 'product_code',
									mRender : function(data, type, row) {
										return '<img src="'+window.contextRoot+'/resources/images/'+data+'.jpg" class="dataTableImg	"/>';
									}
								},
								{
									data : 'name'
								},
								{
									data : 'brand'
								},
								{
									data : 'price'
								},
								{
									data : 'quantity',
									mRender: function(data, type, row) {
										if(data<1){
										return '<span style="color:red">Out of Stock!</span>';}
										return data;
									}
								},
								{
									data : 'discount'
								},
								{
									data : 'id',
									bSortable : false,
									mRender : function(data, type, row) {

										var str = '';
										str += '<a href="'+ window.contextRoot+ '/show/'+data+'/product" class="btn btn-primary"><span class="glyphicon glyphicon-eye-open"></span></a> &#160;';
										
										if(userRole=='ADMIN'){
											str += '<a href="'+ window.contextRoot+ '/manage/'+data+'/products" class="btn btn-warning"><span class="glyphicon glyphicon-pencil"></span></a>';
											
										}
										else{
										if(row.quantity < 1){
											str += '<a href="javascript: void(0)" class="btn btn-success disabled"><span class="glyphicon glyphicon-shopping-cart"></span></a>';
										}
										else{
											
											
												str += '<a href="'+ window.contextRoot+ '/cart/add/'+data+'/product" class="btn btn-success"><span class="glyphicon glyphicon-shopping-cart"></span></a>';
												
										
										}}
										return str;
									}

								} ]

					});

		};

		
		
		
       
		
		
		
		
		/*$('[id^="prodcut"]').on('change',function(){
			
			//
			var checkbox=$(this);
			
			
			var checked=checkbox.prop('checked');
			var dMsg=(checked)?'You want to activatte the product ?':'You want to deactivate the product';
			var value=checkbox.prop('value');
			
			bootbox.confirm({
				title:'Product Activaton and Deactivation',
				message:dMsg,
				callback: function(confirmed)
				{
					
					if(confirmed)
						{
						    bootbox.alert({
						    	
						    	message: 'Your are going to perform on product '+value 
						    	
						    	
						    });
						}
					else
						{
						checkbox.prop('checked',!checked);
						
						}
				}
			})
			
			
		});*/
		
	
		
		
		
		

		
		
		
		var $Atable = $('#adminManageProducts');

		var products = [

		[ '1', 'ABC' ], [ '2', 'BCD' ], [ '3', 'ABlC' ], [ '4', 'ABoC' ],
				[ '5', 'AByC' ], [ '6', 'ABddC' ], [ '7', 'AddBC' ] ];

		
		console.log('hi lbfj')
		// execute the below code only where we have this table
		if ($Atable.length) {

			
			var jsonUrl = window.contextRoot+'/json/data/admin/all/products';
			

			$Atable
					.DataTable({

						lengthMenu : [
								[ 5, 6, 7, -1 ],
								[ '50 Records', '50 Records', '50 Records', 'ALL' ] ],
						ajax : {
							url : jsonUrl,
							dataSrc : ''
						},

						columns : [
							
							    {
							    	data: 'id'
							    },
								{
									data : 'product_code',
									mRender : function(data, type, row) {
										return '<img src="'+window.contextRoot+'/resources/images/'+data+'.jpg" style="height:50px;width:50px" 	"/>';
									}
								},
								{
									data : 'name'
								},
								{
									data : 'brand'
								},
								{
									data : 'price'
								},
								{
									data : 'quantity',
									mRender: function(data, type, row) {
										if(data<1){
										return '<span style="color:red">Out of Stock!</span>';}
										return data;
									}
								},
								
								{
									data : 'active',
									bSortable : false,
									mRender : function(data, type, row) {

										var str = '';
										str+='<label class="switch" id="product">';
										if(data){
											str+='<input type="checkbox" checked="checked" value="'+row.id+'" />';
										}
										else{
											str+='<input type="checkbox" value="'+row.id+'" />';
										}
										
										str+='<div class="slider" sytle="background-color:blue;"></div></label>';
										return str;
									}

								},					
								
								{
									data : 'id',
									bSortable : false,
									mRender : function(data, type, row) {

										var str = '';
										str+='<a href="'+window.contextRoot+'/manage/'+ data+'/products" class="btn btn-warning">';
										str+='<span class="glyphicon glyphicon-pencil"></span></a>';
										return str;
									}
								}

								 ],
								 
								 
								 initComplete: function() {
										var api = this.api();
										api.$('.switch input[type="checkbox"]').on('change',function(){
											
											//console.log("shristi")
											var checkbox=$(this);
											var checked=checkbox.prop('checked');
											var dMsg=(checked)?'Confirm to activate the product ?':'Confirm to deactivate the product';
											var value=checkbox.prop('value');
											//console.log(value);
											bootbox.confirm({
												size: 'medium',
												title: 'Activation & Deactivation',
												message:dMsg,
												callback: function(confirmed)
												{
													
													if(confirmed)
														{
														    console.log(value);
														    var activationUrl = window.contextRoot + '/manage/product/'+ value +'/activation';
														    
														    $.post(activationUrl, function(data) {
														    	bootbox.alert({
															    	size: 'medium',
															    	title: 'information to the user',
															    	message: data	
															    });
														    	
														    });
														
														}
													else
														{
														checkbox.prop('checked',!checked);
														
														}
												}
											})
											});		
									}
											
									});

					}

		
		
		

		
		
		$('button[name="refreshCart"]').click(function(){
			
			
			var cartLineId = $(this).attr('value');
			var countField = $('#count_' + cartLineId);
			var originalCount = countField.attr('value');
			// do the checking only the count has changed
			if(countField.val() !== originalCount) {	
				// check if the quantity is within the specified range
				if(countField.val() < 1 || countField.val() > 3) {
					// set the field back to the original field
					countField.val(originalCount);
					bootbox.alert({
						size: 'medium',
				    	title: 'Error',
				    	message: 'Product Count should be minimum 1 and maximum 3!'
					});
				}
				else {
					
					//console.log('prashant')
					// use the window.location.href property to send the request to the server
					
					var updateUrl = window.contextRoot + '/cart/' + cartLineId + '/update?count=' + countField.val();
					window.location.href = updateUrl;
					
				}
			}
		});		

		
		
		
		$("input:radio[name=selectone]").click(function(){
			 disp($(this).attr('value'));
			});

			function disp(v){
			//console.log(v);
				var updateUrl = window.contextRoot + '/cart/add/' + v + '/order ';
				window.location.href = updateUrl;
			
			
			}
		//console.log('78');
		
		
		
		
		
		
		
		
	</script>

    

</body>

</html>
