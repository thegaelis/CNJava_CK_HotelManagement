<%@page import="DAO.UserDAO"%>
<%@page import="BEAN.User"%>
<%@page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Hotel Management</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
<link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
</head>
<body>
	<div id="wrapper">
		<nav
			class="navbar align-items-start sidebar sidebar-dark accordion p-0 navbar-dark"
			style="background-color: #649e81;">
			<div class="container-fluid d-flex flex-column p-0">
				<a
					class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0"
					routerLink="./main">
					<div class="sidebar-brand-icon rotate-n-15">
						<i src=""></i>
					</div>
					<div class="sidebar-brand-text mx-3">
						<span>NEXUS<br>Hotel Manager
						</span>
					</div>
				</a>
				<hr class="sidebar-divider my-0">
				<ul class="navbar-nav text-light" id="accordionSidebar">
					<li class="nav-item"><a class="nav-link "
						href="ManagerController"><i class="fas fa-table"></i><span>Hotel
								Manage</span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="RoomController"><i class="fas fa-table"></i><span>Material
								Manage</span></a></li>
					<li class="nav-item"><a class="nav-link" href="ProfileController"><i
							class="fas fa-user"></i><span>Profile</span></a></li>
					<li class="nav-item"><a class="nav-link active" href="<%= request.getContextPath() %>/UserController"><i
							class="fas fa-table"></i><span>Table</span></a></li>
					<li class="nav-item"><a class="nav-link" href="ReportController"><i
							class="fas fa-tachometer-alt"></i><span>Report</span></a></li>
					<li class="nav-item"><a class="nav-link" href="index.jsp"><i
							class="far fa-user-circle"></i><span>Log Out</span></a></li>
				</ul>
			</div>
		</nav>
		<div class="d-flex flex-column" id="content-wrapper">
			
			<div id="content">
			
			<!-- toast -->
			<% 
				String mess = (String)request.getAttribute("mess");
				
			%>
				
				<nav
					class="navbar navbar-expand bg-white shadow mb-4 topbar static-top navbar-light">
					<div class="container-fluid">
						<button class="btn btn-link d-md-none rounded-circle me-3"
							id="sidebarToggleTop" type="button">
							<i class="fas fa-bars"></i>
						</button>
						
						<ul class="navbar-nav flex-nowrap ms-auto">
							
							
							
							<li class="nav-item dropdown no-arrow">
								<div class="nav-item dropdown no-arrow">
									<a class="dropdown-toggle nav-link" aria-expanded="false"
										data-bs-toggle="dropdown" href="#"><span
										class="d-none d-lg-inline me-2 text-gray-600 small"><%= session.getAttribute("username") %>
											/ <%= session.getAttribute("role") %></span><i class="fas fa-caret-down"></i></a>
									<div
										class="dropdown-menu shadow dropdown-menu-end animated--grow-in">
										<a class="dropdown-item"><i
											class="fas fa-user fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Profile</a><a
											class="dropdown-item" href="#"><i
											class="fas fa-cogs fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Settings</a><a
											class="dropdown-item" href="#"><i
											class="fas fa-list fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Activity
											log</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item"><i
											class="fas fa-sign-out-alt fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Logout</a>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</nav>

				<!-- Trang table -->
				<div class="container-fluid">
				<div class="d-flex  justify-content-between align-items-center">
					<h3 class="text-dark mb-4">User Manage</h3>
					<% if(mess!=null) {%>
						<%=mess %>
						
						<%} %>
					<button type="button" class="btn btn-success"
						data-bs-toggle="modal" data-bs-target="#AddModal">
						Add User</button>
				</div>
					

					<!-- Modal -->
					<div class="modal fade" id="AddModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="exampleModalLabel">Add User</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								
								<div class="modal-body">
									<form action="UserController" method="POST">
										
									<input type="text" value="Add" name="action" hidden>
									 <div class="mb-3">
									    <label for="exampleInputName" class="form-label">Name</label>
									    <input type="text" class="form-control" id="addName" aria-describedby="emailHelp" name="name">
									  </div>
									  
									   <div class="mb-3">
									    <label for="exampleInputAge" class="form-label">Age</label>
									    <input type="number" min="18" max="99999" class="form-control" id="addAge" aria-describedby="emailHelp" name="age">
									  </div>
									  
									   <div class="mb-3">
									    <label for="exampleInputSalary" class="form-label">Salary</label>
									    <input type="number" min="0" class="form-control" id="addSalary" aria-describedby="emailHelp" name="salary" >
									  </div>
									  
									  <div class="mb-3">
									    <label for="exampleInputEmail1" class="form-label">Email address</label>
									    <input type="email" class="form-control" id="addEmail" aria-describedby="emailHelp" name="email">
									  </div>
									  <div class="mb-3">
									    <label for="exampleInputPassword1" class="form-label">Password</label>
									    <input type="password" class="form-control" id="addPassword" name="password">
									  </div>
									  
									  <div class="modal-footer">
											<button type="button" class="btn btn-secondary"data-bs-dismiss="modal">Close</button>
											<button type="submit" class="btn btn-primary" id="btn">Add</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>

					
					
					<div class="card shadow">
						<div class="card-header py-3">
							<p class="text-primary m-0 fw-bold">Employee Info</p>
						</div>
						<div class="card-body">
							
							<div class="table-responsive table mt-2" id="dataTable"
								role="grid" aria-describedby="dataTable_info">
								<table class="table my-0" id="dataTable">
									<thead>
										<tr>
											<th>STT</th>
											<th>Name</th>
											<th>Age</th>
											<th>Start date</th>
											<th>Salary</th>
											<th>Email</th>
											<th>Password</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
						<% 	
                    	 	SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-YYYY");
                    		int i=0;
                    	
							List<User> users = (List<User>)request.getAttribute("users");
							for (User u : users) {
								if ("NV".equals(u.getRole())){
									i=i+1;
						%>
										<tr>
											<td><%= i %></td>
											<td><%= u.getName() %></td>
											<td><%= u.getAge() %></td>
											<td><%= dateFormat.format(u.getStartDate()) %></td>
											<td><%= u.getSalary() %></td>
											<td><%= u.getEmail() %></td>
											<td><%= u.getPassword() %></td>
											<td class="d-flex">
								
												
												<button type="button" class="btn btn-primary col-4"
													data-bs-toggle="modal" data-bs-target='<%="#UpdateModal"+u.getId() %>'>
													Update
												</button>
												
												<button type="button" class="btn btn-danger col-4 mx-2"
													data-bs-toggle="modal" data-bs-target='<%="#DeleteModal"+u.getId() %>'>
													Delete
												</button>
												
												<div class="modal fade" id='<%="UpdateModal"+u.getId() %>' tabindex="-1"
													aria-labelledby="exampleModalLabel" aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h1 class="modal-title fs-5" id="exampleModalLabel">Update User</h1>
																<button type="button" class="btn-close" data-bs-dismiss="modal"
																	aria-label="Close"></button>
															</div>
															
															<div class="modal-body">
				
																 <form action="UserController" method="POST" class="col-12">
																		<input type="text" value="Update" name="action" hidden>	
																		<input type="text" value="<%= u.getId()%>" name="id" hidden>			
																		<div class="mb-3">
																		    <label for="exampleInputName" class="form-label">Name</label>
																		    <input type="text" value="<%=u.getName()%>" class="form-control" id="upName" aria-describedby="emailHelp" name="name">
																		  </div>
																		  
																		   <div class="mb-3">
																		    <label for="exampleInputAge" class="form-label">Age</label>
																		    <input type="number" value="<%=u.getAge()%>" min="18" max="99999" class="form-control" id="upAge" aria-describedby="emailHelp" name="age">
																		  </div>
																		  
																		   <div class="mb-3">
																		    <label for="exampleInputSalary" class="form-label">Salary</label>
																		    <input type="number" min="0" value="<%=u.getSalary()%>" class="form-control" id="upSalary" aria-describedby="emailHelp" name="salary" >
																		  </div>
																		  
																		  <div class="mb-3">
																		    <label for="exampleInputEmail1" class="form-label">Email address</label>
																		    <input type="email" class="form-control" id="upEmail" value="<%=u.getEmail()%>" aria-describedby="emailHelp" name="email">
																		  </div>
																		  
																		  <div class="mb-3">
																		    <label for="exampleInputPassword1" class="form-label">Password</label>
																		    <input type="text" class="form-control" value="<%=u.getPassword() %>" id="upPassword" name="password">
																		  </div>
																		<div class="modal-footer">
																			<button type="button" class="btn btn-secondary"data-bs-dismiss="modal">Close</button>
																			<button type="submit" class="btn btn-primary" id="upbtn">Update</button>
																		</div>
																</form>  
																   
															</div>
															 
														</div>
													</div>
												</div>
												
												
												<div class="modal fade" id='<%="DeleteModal"+u.getId() %>' tabindex="-1"
													aria-labelledby="exampleModalLabel" aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h1 class="modal-title fs-5" id="exampleModalLabel">Confirm Delete</h1>
																<button type="button" class="btn-close" data-bs-dismiss="modal"
																	aria-label="Close"></button>
															</div>
															
															<div class="modal-body">
																<h4>Are you sure to want to delete user @<%=u.getEmail() %> ?</h4>
																 <form action="UserController" method="POST" class="col-12">
																		<input type="text" value="Delete" name="action" hidden>	
																		<input type="text" value="<%= u.getId()%>" name="id" hidden>			
																		
																		<div class="modal-footer">
																			<button type="button" class="btn btn-secondary"data-bs-dismiss="modal">Close</button>
																			<button type="submit" class="btn btn-primary">Delete</button>
																		</div>
																</form>  
																   
															</div>
															 
														</div>
													</div>
												</div>
												
											</td>
										</tr>
										<% 	
								}
							}
						%>
									</tbody>
								</table>
							</div>
							
						</div>
					</div>
				</div>







			</div>
		</div>
	</div>


	<!--Footer-->
	<footer class="sticky-footer" style="background-color: #649e81;">
		<div class="container my-auto">
			<div class="text-center my-auto copyright" style="color: #FFFFFF">
				<span>Copyright © The Nexus Hotel Manager 2023</span>
			</div>
		</div>
	</footer>
	<!--Footer-->
</body>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/chart.min.js"></script>
<script src="assets/js/bs-init.js"></script>
<script src="assets/js/theme.js"></script>
<script type="text/javascript">
	var btn = document.getElementById("btn");
	var addName = document.getElementById("addName");
	var addAge = document.getElementById("addAge");
	var addSalary = document.getElementById("addSalary");
	var addEmail = document.getElementById("addEmail");
	var addPassword = document.getElementById("addPassword");
	
	var btnup = document.getElementById("upbtn");
	var upName = document.getElementById("upName");
	var upAge = document.getElementById("upAge");
	var upSalary = document.getElementById("upSalary");
	var upEmail = document.getElementById("upEmail");
	var upPassword = document.getElementById("upPassword");
	
	
	btn.onclick= function(e){
		if(!addName.value ||!addAge.value ||!addSalary.value ||!addEmail.value ||!addPassword.value){
			e.preventDefault()
			alert("Please fill input")
		}
		
	}
	
	btnup.onclick= function(e){
		if(!upName.value ||!upAge.value ||!upSalary.value ||!upEmail.value ||!upPassword.value){
			e.preventDefault()
			alert("Please fill input")
		}
		
	}
	
	var mess="<%=(String)request.getAttribute("messUser")%>"
	console.log(mess);
	if(mess.length>0 &&mess!="null"){
		alert(mess)
	}

</script>
</html>