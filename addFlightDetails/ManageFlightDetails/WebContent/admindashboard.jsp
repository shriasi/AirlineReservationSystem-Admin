	<!-- IT19024882 *  Senevirathna D.M.S * --> 
	<!-- This is the admin dashboard page -->
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	    pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html>
	<html lang="en">
	
	<head>
	  <meta charset="utf-8">
	
	  <title>AdminPanel</title>
	
	  <!-- font plug in-->
	  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	  
	  <!-- Bootstrap CDN -->
	  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	</head>
	
	<body id="page-top">
	  <!-- Page Wrapper -->
	  <div id="wrapper">
	  
	    <!-- Content Wrapper -->
	    <div id="content-wrapper" class="d-flex flex-column">
	
	      <!-- Main Content -->
	      <div id="content">
	
	        <!-- Topbar -->
	        <nav class="navbar navbar-expand navbar-dark bg-dark topbar mb-4 static-top shadow">
	         <!-- Page Heading -->
	          <div class="d-sm-flex align-items-center justify-content-between mb-4">
	            <h1 class="h3 mb-0 text-white">Admin Dashboard</h1>
	          </div>
	        
	          <!-- Topbar Navbar -->
	          <ul class="navbar-nav ml-auto">
	            <div class="topbar-divider d-none d-sm-block"></div>
	                  <p style="color:white"> Shrimali Senevirathna</p>        
	          </ul>
	    </nav>
	        <!-- End of Top bar -->
	
	    <!-- Begin Page Content -->
	    <!-- retrieves flight data from database and displays -->
	  	<div class="container-fluid">    
	       <!-- Content Row -->
	     <div class="row">
			<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->
	
			<div class="container">
				<h3 class="text-center">Flight List</h3>
				<hr>
				<div class="container text-right">
					<a href="<%=request.getContextPath()%>/new" class="btn btn-primary">Add New Flight</a>
			    </div>
				<br>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>ID</th>
							<th>Flight Number</th>
							<th>Flight from</th>
							<th>Flight to</th>
							<th>Arrival time</th>
							<th>Departure time</th>
							<th>Price</th>
							<th>Flight Type</th>			
						</tr>
					</thead>
					<tbody>
						<!--   for (Todo todo: todos) {  -->
						<c:forEach var="flight" items="${listFlight}">
							<tr>
								<td><c:out value="${flight.id}" /></td>
								<td><c:out value="${flight.flight_No}" /></td>
								<td><c:out value="${flight.from_}" /></td>
								<td><c:out value="${flight.to_}" /></td>
								<td><c:out value="${flight.arrivetime}" /></td>
								<td><c:out value="${flight.departtime}" /></td>
								<td><c:out value="${flight.price}" /></td>
							    <td><c:out value="${flight.type_}" /></td>
								<td><a href="edit?id=<c:out value='${flight.id}' />" class="btn btn-primary">Edit </a>
									&nbsp;&nbsp;&nbsp;&nbsp; <a
									href="delete?id=<c:out value='${flight.id}' />" class="btn btn-primary">Delete</a></td>
							</tr>
						</c:forEach>
						<!-- } -->
					</tbody>
				</table>
			</div>
		</div>
	 <!-- end of the flight data section -->
		<br>
		<br>
		 <!-- Content Row -->
	      <div class="row">  
	            <div class="col-xl-3 col-md-6 mb-4">
	              <div class="card border-left-primary shadow h-100 py-2">
	                <div class="card-body">
	                  <div class="row no-gutters align-items-center">
	                    <div class="col mr-2">
	                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Earnings (Monthly)</div>
	                      <div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
	                    </div>
	                    <div class="col-auto">
	                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
	                    </div>
	                  </div>
	                </div>
	              </div>
	            </div>
	
	            <!-- annual air trips -->
	            <div class="col-xl-3 col-md-6 mb-4">
	              <div class="card border-left-success shadow h-100 py-2">
	                <div class="card-body">
	                  <div class="row no-gutters align-items-center">
	                    <div class="col mr-2">
	                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Annual Air trips</div>
	                      <div class="h5 mb-0 font-weight-bold text-gray-800">230000</div>
	                    </div>
	                    <div class="col-auto">
	                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
	                    </div>
	                  </div>
	                </div>
	              </div>
	            </div>
	
	            <!-- tasks -->
	            <div class="col-xl-3 col-md-6 mb-4">
	              <div class="card border-left-info shadow h-100 py-2">
	                <div class="card-body">
	                  <div class="row no-gutters align-items-center">
	                    <div class="col mr-2">
	                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks</div>
	                      <div class="row no-gutters align-items-center">
	                        <div class="col-auto">
	                          <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">70%</div>
	                        </div>
	                        <div class="col">
	                          <div class="progress progress-sm mr-2">
	                            <div class="progress-bar bg-info" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
	                          </div>
	                        </div>
	                      </div>
	                    </div>
	                    <div class="col-auto">
	                      <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
	                    </div>
	                  </div>
	                </div>
	              </div>
	            </div>
	
	            <!-- Pending Requests Card Example -->
	            <div class="col-xl-3 col-md-6 mb-4">
	              <div class="card border-left-warning shadow h-100 py-2">
	                <div class="card-body">
	                  <div class="row no-gutters align-items-center">
	                    <div class="col mr-2">
	                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Transactions</div>
	                      <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
	                    </div>
	                    <div class="col-auto">
	                      <i class="fas fa-comments fa-2x text-gray-300"></i>
	                    </div>
	                  </div>
	                </div>
	              </div>
	            </div>
	          </div>
		         
	
	    <!-- Content Row progression bars -->
	       <div class="row">
	      <!-- Content Column -->
	            <div class="col-lg-6 mb-4">
	              <!-- Project Card Example -->
	              <div class="card shadow mb-4">
	                <div class="card-header py-3">
	                  <h6 class="m-0 font-weight-bold text-primary">Projects</h6>
	                </div>
	                <div class="card-body">
	                  <h4 class="small font-weight-bold">Site Usage<span class="float-right">20%</span></h4>
	                  <div class="progress mb-4">
	                    <div class="progress-bar bg-danger" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
	                  </div>
	                  <h4 class="small font-weight-bold">Average Users <span class="float-right">80%</span></h4>
	                  <div class="progress mb-4">
	                    <div class="progress-bar bg-warning" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
	                  </div>
	                </div>
	           </div>
	
	          <!-- page connections -->
	              <div class="row">
	                <div class="col-lg-6 mb-4">
	                  <div class="card bg-primary text-white shadow">
	                    <div class="card-body">
	                      HomePage
	                      <div class="text-white-50 small">Go to home page</div>
	                    </div>
	                  </div>
	                </div>
	                <div class="col-lg-6 mb-4">
	                  <div class="card bg-danger text-white shadow">
	                    <div class="card-body">
	                      User Profiles
	                      <div class="text-white-50 small">Go to User profiles</div>
	                    </div>
	                  </div>
	                </div>
	              </div>
	            </div>
	
	        <div class="col-lg-6 mb-4">
	              <!-- Illustrations -->
	              <div class="card shadow mb-4">
	                <div class="card-header py-3">
	                  <h6 class="m-0 font-weight-bold text-primary">Notes Section</h6>
	                </div>
	                <div class="card-body">
	                  <div class="input-group">
						  <div class="input-group-prepend">
						    <span class="input-group-text">Notes</span>
						  </div>
						  <textarea class="form-control" aria-label="With textarea"></textarea>
						</div>
	                </div>
	              </div>
	
	              <!-- time and date-->
	              <div class="card shadow mb-4">
	                <div class="card-header py-3">
	                  <h6 class="m-0 font-weight-bold text-primary">Date and Time</h6>
	                </div>
	                <div class="card-body">
	                  <p>From here admin can check date.</p>
	                  <p class="mb-0">Today's date: <%= (new java.util.Date()).toLocaleString()%></p>
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	      <!-- End of Main Content -->
	
	      <!-- Footer -->
	      <footer class="sticky-footer bg-white">
	        <div class="container my-auto">
	          <div class="copyright text-center my-auto">
	            <span>Copyright &copy; ShrimaliS</span>
	          </div>
	        </div>
	      </footer>
	      <!-- End of Footer -->
	
	    </div>
	    <!-- End of Content Wrapper -->
	
	  </div>
	  <!-- End of Page Wrapper -->
	
	  <!-- Scroll to Top Button-->
	  <a class="scroll-to-top rounded" href="#page-top">
	    <i class="fas fa-angle-up"></i>
	  </a>
	  
	 </body>
	</html>
	<!-- IT19024882 *  Senevirathna D.M.S * --> 