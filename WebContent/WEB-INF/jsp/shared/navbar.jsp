<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<head>
<link href="${css}/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${css}/myapp.css" rel="stylesheet">

</head>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        
        
        
        
        
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto"   style="list-style: none; font-size:25px;">
            <li  id="home" class="nav-item active">
            <span class="glyphicon glyphicon-home"></span> 
              <a class="nav-link" href="${contextRoot}/home">Home
                <span class="sr-only">(current)</span>
              </a>
            <li id="services" class="nav-item">
             <span class="glyphicon glyphicon-shopping-cart"></span> 
              <a class="nav-link" href="${contextRoot}/show/all/product">View product</a>
            </li>
            <li id="contact" class="nav-item">
             <span class="glyphicon glyphicon-phone-alt"></span> 
              <a class="nav-link" href="${contextRoot}/contact">Contact</a>
            </li>
            <li class="nav-item" id="listProducts"><span
					class="glyphicon glyphicon-bell"></span><a class="nav-link"
					href="${contextRoot}/show/all/notifications">Notifications</a></li>
            <security:authorize access="hasAuthority('ADMIN')">
            <li id="manageProducts" class="nav-item">
              <a class="nav-link" href="${contextRoot}/manage/products">Manage Product</a>
            </li>
            </security:authorize>
            
            
            <security:authorize access="hasAuthority('ADMIN')">
            <li id="manageProducts" class="nav-item">
              <a class="nav-link" href="${contextRoot}/register">Manage Employees</a>
            </li>
            </security:authorize>
            
            <security:authorize access="hasAuthority('ADMIN')">
            <li id="displayEmployee" class="nav-item">
              <a class="nav-link" href="${contextRoot}/display/employee">Display Employees</a>
            </li>
            <li id="showDelivery_boy" class="nav-item"><a
								class="nav-link" href="${contextRoot}/manage/orders">Manage
									Orders</a></li>
            </security:authorize>
            
            
            
             <security:authorize access="hasAuthority('ADMIN')">
            <li id="displayEmployee" class="nav-item">
              <a class="nav-link" href="${contextRoot}/manage/notificat">Notification Update</a>
            </li>
            </security:authorize>
            
            
            <security:authorize access="hasAuthority('EMPLOYEE')">
					<li class="nav-item" id="about"><a class="nav-link"
					href="${contextRoot}/employee/undelivered">Undelivered_list</a></li>
					<li class="nav-item" id="about"><a class="nav-link"
					href="${contextRoot}/employee/delivered">Delivered_list</a></li>
					</security:authorize>
            
            
            
            
          </ul>
          
          <ul class="nav navbar-nav navbar right">
          
         <security:authorize access="isAnonymous()">
	                    <li id="signup">
	                        <a href="${contextRoot}/register">Sign Up</a>
	                    </li>
						<li id="login">
	                        <a href="${contextRoot}/login">Login</a>
	                    </li> 			    	
			    	</security:authorize>
             
         <security:authorize access="isAuthenticated()">
						<li class="dropdown" id="userModel" >
						
						  <a class="btn btn-default dropdown-toggle" href="javascript:void(0)" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
						    <div style="font-size:25px;"><span class="glyphicon glyphicon-user"></span>  ${userModel.getFullname()}</div>
						    <span class="caret"></span>
						  </a>
						  
						  <security:authorize access="hasAuthority('CUSTOMER')">
						  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
		                   
			                    <li id="cart">
			                        <a href="${contextRoot}/cart/show">
			                        	<span class="glyphicon glyphicon-shopping-cart"></span>&#160;<span class="badge">${userModel.cart.cart_lines}</span> - &#8377; ${userModel.cart.total} 
			                        </a>
			                    </li>		     
			                	<li role="separator" class="divider"></li>
			                		<li id="logout">
		                        <a href="${contextRoot}/cart/history">History</a>
		                    </li>
		                                     <li role="separator" class="divider"></li>                  
		                    </security:authorize>
							<li id="logout">
							<span class="glyphicon glyphicon-logout"></span> 
		                        <a href="${contextRoot}/perform-logout">Logout</a>
		                    </li>                    			    	
						  </ul>		
						</li>    			    
			    	</security:authorize> 
			    	
			    	
			    	
			    	
          </ul>
          
          
        </div>
      </div>
    </nav>
    
    <script>
    
    window.userRole='${userModel.role}';	
    </script>