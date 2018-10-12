
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" >
<script id="bolt" src="https://checkout-static.citruspay.com/bolt/run/bolt.min.js" bolt-color="<color-
code>" bolt-logo="<image path>"></script>

<html>
<head>
<link href="${css}/bootstrap.min.css" rel="stylesheet">
<script src="${css}/angular.min.js"></script>
<script src="${js}/bootstrap.min.js"></script>
    <meta charset="UTF-8"/>
    
    
    <title>Hello Thymeleaf!</title>
</head>
<body ng-app="paymentApp" ng-controller="paymentCtrl">

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<script>
	window.menu = '${title}';
	window.contextRoot = '${contextRoot}'
</script>

<div class="col-md-6">
    <h2>Payment Form</h2>
<form action="https://test.payu.in/_payment" name="payuform" method="POST">
    <div class="form-group">
        <label for="productInfo">Product Name:</label>
        <input type="text" class="form-control" id="productInfo" name="productinfo" ng-model="productinfo">
    </div>
    <div class="form-group">
        <label for="firstname">Name:</label>
        <input type="text" class="form-control" id="firstname" name="firstname" ng-model="firstname">
    </div>
    <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" class="form-control" id="email" name="email" ng-model="email">
    </div>
    <div class="form-group">
        <label for="email">Phone:</label>
        <input type="number" class="form-control" id="phone" name="phone" ng-model="phone">
    </div>
    <div class="form-group">
        <label for="amount">Amount:</label>
        <input type="number" class="form-control" id="amount" name="amount" ng-model="amount">
    </div>
    <textarea name="surl" id="surl" ng-model="surl" rows="2" cols="2" hidden></textarea>
    <textarea name="furl" id="furl" ng-model="furl" rows="2" cols="2" hidden></textarea>
    <textarea name="key" id="key" ng-model="key" rows="2" cols="2" hidden></textarea>
    <textarea name="hash" id="hash" ng-model="hash" rows="2" cols="2" hidden></textarea>
    <textarea name="txnid" id="txnid" ng-model="txnid" rows="2" cols="2" hidden></textarea>
    <textarea name="service_provider" id="service_provider" rows="2" cols="2" hidden></textarea>
    <button type="button" class="btn btn-default" ng-show="!showSubmitButton" ng-click="confirmPayment()">Confirm</button>
    <button type="submit" class="btn btn-danger" ng-show="showSubmitButton">Submit</button>
</form>
</div>
<script>
console.log('1');
var App = angular.module('CrunchifySpringMVCTutorial', []);
App.controller('paymentCtrl',['$scope','$http','$q', function($scope, $http, $q) {

    $scope.showSubmitButton = false;
    $scope.productinfo = '';
    $scope.firstname = '';
    $scope.email = '';
    $scope.phone = '';
    $scope.amount = '';
    $scope.surl = '';
    $scope.furl = '';
    $scope.key = '';
    $scope.hash = '';
    $scope.txnid = '';

    $scope.confirmPayment = function() {
    	
    	
    	//console.log(window.contextRoot);
        var url = 'http://localhost:8080/CrunchifySpringMVCTutorial/payment/payment-details';
        console.log('2');
        var data = {productInfo: $scope.productinfo, email: $scope.email, name: $scope.firstname, phone: $scope.phone, amount:$scope.amount};
       
        
        $http({
        
        	method:'POST',
        	url: url,
        	data: "message="+data;
        	
        	
        });
        
        
        console.log(data);
        
        
       /* $http.post(url, data)
            .then(function (response) {
            	
                    console.log(response.data);
                    $scope.txnid = response.data.txnId;
                    $scope.surl = response.data.sUrl;
                    $scope.furl = response.data.fUrl;
                    $scope.key = response.data.key;
                    $scope.hash = response.data.hash;
                    $scope.showSubmitButton = true;
                },
                function (errResponse) {
                	
                	
                	
                	
                	
                	console.log('6');
                	console.log(errResponse);
                    if (errResponse.status == -1) {
                        errResponse.status = 408;
                        errResponse.statusText = 'Server Timeout.';
                    }
                    alert(errResponse.status + ':' + errResponse.statusText);
                });*/
    
}]);


</script>
</body>
</html>
