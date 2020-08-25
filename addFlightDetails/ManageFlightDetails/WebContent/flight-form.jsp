	<!-- IT19024882 *  Senevirathna D.M.S -->
	<!-- This is the form -->
	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<html>
	<head>
	<title>flight form</title>
	<!-- IT19024882 *  Senevirathna D.M.S -->
	<!-- Bootstrap CDN  -->
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
		crossorigin="anonymous">
	</head>
	
	<body>
	
	<!-- header nav -->
		<header>
			<nav class="navbar navbar-expand-md navbar-dark bg-dark" >      	
	          <div class="d-sm-flex align-items-center justify-content-between mb-4">
	            <h1 class="h3 mb-0 text-white">Admin Dashboard</h1>
	          </div>  
	          <ul class="navbar-nav ml-auto">
	            <div class="topbar-divider d-none d-sm-block"></div>
	               <a href="admindashboard.jsp"><button type="button" class="btn btn-primary">Dashboard</button></a>		  
	           </ul>    		 	        		
	       	</nav>
		</header>
	<!--end of the header nav -->	
		<br>
	<!-- form taking flight details-->
		<div class="container col-md-5">
			<div class="card">
				<div class="card-body">
					<c:if test="${flight != null}">
						<form name="flightform" action="update" method="post"  onsubmit="return validateform()">
					</c:if>
					<c:if test="${flight == null}">
						<form name="flightform" action="insert" method="post" onsubmit="return validateform()" >
					</c:if>
	                	<!-- IT19024882 *  Senevirathna D.M.S -->
					<caption>
						<h2>
							<c:if test="${flight != null}">
	            			Edit Flight
	            		</c:if>
							<c:if test="${flight == null}">
	            			Add New Flight
	            		</c:if>
						</h2>
					</caption>
	
					<c:if test="${flight != null}">
						<input type="hidden" name="id" value="<c:out value='${flight.id}' />" />
					</c:if>
					
					<fieldset class="form-group">
						<label>Flight Number</label> <input type="text"
							value="<c:out value='${flight.flight_No}' />" class="form-control"
							name="flight_No" required="required">
					</fieldset>
	
					<fieldset class="form-group">
						<label>Flight from</label> <input type="text"
							value="<c:out value='${flight.from_}' />" class="form-control"
							name="from_" required="required">
					</fieldset>
	
					<fieldset class="form-group">
						<label>Flight To</label> <input type="text"
							value="<c:out value='${flight.to_}' />" class="form-control"
							name="to_" required="required">
					</fieldset>
	
					<fieldset class="form-group">
						<label>Arrive time</label> <input type="text"
							value="<c:out value='${flight.arrivetime}' />" class="form-control"
							name="arrivetime" required="required">
					</fieldset>
						<!-- IT19024882 *  Senevirathna D.M.S -->
					<fieldset class="form-group">
						<label>Departure time</label> <input type="text"
							value="<c:out value='${flight.departtime}' />" class="form-control"
							name="departtime" required="required">
					</fieldset>
					
					<fieldset class="form-group">
						<label>Price</label> <input type="text"
							value="<c:out value='${flight.price}' />" class="form-control"
							name="price" required="required">
					</fieldset>
					
					<fieldset class="form-group">
						<label>Airline Type</label> <input type="text"
							value="<c:out value='${flight.type_}' />" class="form-control"
							name="type_" required="required">
					</fieldset>
	
					<button type="submit" class="btn btn-primary">Save</button>	
				</div>
			</div>
		</div>
	<!--  end of the form content  -->	
	
	<!-- Java script form validation -->
	<script>
	function validateform() {
		  var flight_Number = document.forms["flightform"]["flight_No"].value;
		  var arrive_time = document.forms["flightform"]["arrivetime"].value;
		  var depar_time = document.forms["flightform"]["departtime"].value;
		  var price = document.forms["flightform"]["price"].value;
		 
		  if (flight_Number.length > 5 || flight_Number.length < 5 ) {
		    alert("cannot have more than or less than 5 characters");
		    return false;
		  }
		  else if(arrive_time == ""){
			  
			  alert("arrive time is essential!");
			  return false;
		  }
		  else if(depar_time == ""){
			  
			  alert("arrive time is essential!");
			  return false;		  			  
		  }
		  else if(price == ""){
			  
			  alert("price should not be empty!");
			  return false;		  
		  }
		  else if(price.length == "0"){
			  
			  alert("price value should not be 0");
			  return false;
		  }
		 else if(price.length > "5000000"){
			  
			  alert("price should be lower than Rs.5000000");
			  return false;
		  }
		  else{
			  
			  return true;
		  }
		}
	</script>
	<!-- end of the front end validation -->
	<!-- IT19024882 *  Senevirathna D.M.S -->
	</body>
</html>
