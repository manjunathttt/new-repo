<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>

<!-- Bootstrap Core CSS -->
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet"> 
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="<c:url value="/resources/js/angular.min.js"/>"></script>
<script src="<c:url value="/resources/js/jquery.js"/>"></script>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

</head>

<body>

<div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                <ul class="nav navbar-nav">
                    
                    <li>
                        <a href="home" data-toggle="tooltip" data-placement="left" title="GO TO HOME!"><span class="glyphicon glyphicon-home"></span></a>
                    </li>
                </ul>
</div>
<br>

<h1 style="color:red;">ADD CUSTOMER BELOW.....</h1>

<c:url var="addAction" value="/customer/add"></c:url>
<hr>
<form:form role="customer" commandName="customer" action="${addAction}">
               
			   
			   
			   <div class="form-group">
			   <c:choose>
			   <c:when test="${customer.cid > 0}">
                  <label class="control-label">Enter ID: </label>
                  <form:input class="form-control" placeholder="Enter Customer ID" type="text" path="cid" disabled="true" readonly="true"/>
                  <form:hidden path="cid" />
                  </c:when>
                  <c:otherwise>
                  <label class="control-label">Enter ID: </label>
				<td><form:input class="form-control" path="cid"  type="text" pattern=".{3,7}" required="true" title="id should be between 3 to 7 numbers"/></td>
				</c:otherwise>
				</c:choose>
                </div>
                
			   <br>
                <div class="form-group">
                  <label class="control-label">Enter Name: </label>
                  <form:input class="form-control" placeholder="Enter Customer Name" type="text" path="cname"/>
                </div>
               <br>
                <div class="form-group">
                  <label class="control-label">Enter Address: 
                  </label>
                  <form:input class="form-control" placeholder="Enter Customer Address" rows="10" path="caddress"/>
                </div>
               <br>
               <div class="form-group">
                  <label class="control-label">Enter Phone: 
                  </label>
                  <form:input class="form-control" placeholder="Enter Customer Phone" rows="10" path="cphone"/>
                </div>
               
               <div class="form-group">
               <c:if test="${customer.cid > 0}">
				<input type="submit" class="btn btn-primary"
					value="<spring:message text="Edit Customer"/>" />
			</c:if>
			
			<c:if test="${customer.cid == 0}">
				<input type="submit" class="btn btn-primary"
					value="<spring:message text="Add Customer"/>" />
			</c:if>
			
               </div>
               
<!--                 <button type="submit" class="btn btn-primary">ADD CUSTOMER</button> -->
                
               
                
              </form:form>
              <br>
              <hr>
  <!-- Listing Customers -->
              
   <div  ng-app="repeatSample" class="section">
	<div class="container">
	
	<!-- Angular script -->
	
	  <script>
			var f = ${customers};
			angular.module('repeatSample', []).controller('repeatController',
					function($scope) {
						$scope.customers = f;
						$scope.sort = function(keyname) {
							$scope.sortKey = keyname; 
							$scope.reverse = !$scope.reverse; 
						}
					});
		</script>

		<div class="bs-component" ng-controller="repeatController">

			<form class="form-inline">
				<div class="form-group">
					<label>Search Customers</label> 
					<div class="input-group">
					<input type="text" ng-model="search"
						class="form-control" placeholder="Search">
						<span class="input-group-btn">
        					<button class="btn btn-secondary" type="button">Go!</button>
      					</span>
      				</div>
				</div>
			</form>
			<br>
			<hr>
		<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th ng-click="sort('cid')">CUSTOMER ID <span
							class="glyphicon sort-icon" ng-show="sortKey=='cid'"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
						</th>
						
						<th ng-click="sort('cname')">CUSTOMER NAME <span
							class="glyphicon sort-icon" ng-show="sortKey=='cname'"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
						</th>
						<th ng-click="sort('caddress')">CUSTOMER ADDRESS <span
							class="glyphicon sort-icon" ng-show="sortKey=='caddress'"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
						</th>
						<th ng-click="sort('cphone')">CUSTOMER PHONE NO <span
							class="glyphicon sort-icon" ng-show="sortKey=='cphone'"
							ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
						</th>
 						<th>EDIT <span 
							class="glyphicon sort-icon"></span> 
						</th> 
						<th>DELETE <span
							class="glyphicon sort-icon"></span>
						</th>
						
					</tr>
				</thead>
				<tbody>
					

					<tr
						ng-repeat="customer in customers|orderBy:sortKey:reverse|filter:search">
						<td>{{customer.cid}}</td>
						<td>{{customer.cname}}</td>
						<td>{{customer.caddress}}</td>
						<td>{{customer.cphone}}</td>
 						<td style="color:#000000;font-size:120%" align="center"><a href="<c:url value='customer/edit/{{customer.cid}}' />"><button type="button" class="btn btn-warning">Edit</button></a></td> 
						<td style="color:#000000;font-size:120%" align="center"><a href="<c:url value='customer/remove/{{customer.cid}}' />"><button type="button" class="btn btn-danger">Delete</button></a></td>
					</tr>
				</tbody>
			</table>

		</div>
	</div>
</div>
              
              
              
              
</body>
</html>