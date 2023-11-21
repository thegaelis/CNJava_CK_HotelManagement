<%@page import="BEAN.User"%>
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
<% User user = (User)request.getAttribute("user"); %>
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
					<li class="nav-item"><a class="nav-link" href="RoomController"><i
							class="fas fa-table"></i><span>Material Manage</span></a></li>
					<li class="nav-item"><a class="nav-link active" href="ProfileController"><i
							class="fas fa-user"></i><span>Profile</span></a></li>
					<li class="nav-item"><a class="nav-link " href="<%= request.getContextPath() %>/UserController"><i
							class="fas fa-table"></i><span>Table</span></a></li>
					<li class="nav-item"><a class="nav-link" href="report.jsp"><i
							class="fas fa-tachometer-alt"></i><span>Report</span></a></li>
					<li class="nav-item"><a class="nav-link" href="LogoutController"><i
							class="far fa-user-circle"></i><span>Log Out</span></a></li>
				</ul>
			</div>
		</nav>
		<div class="d-flex flex-column" id="content-wrapper">
			<div id="content">
				<nav
					class="navbar navbar-expand bg-white shadow mb-4 topbar static-top navbar-light">
					<div class="container-fluid">
						<button class="btn btn-link d-md-none rounded-circle me-3"
							id="sidebarToggleTop" type="button">
							<i class="fas fa-bars"></i>
						</button>
						<form
							class="d-none d-sm-inline-block me-auto ms-md-3 my-2 my-md-0 mw-100 navbar-search">
							<div class="input-group">
								<input class="bg-light form-control border-0 small" type="text"
									placeholder="Search for ...">
								<button class="btn py-0" style="background-color: #F0F0F0;"
									type="button">
									<i class="fas fa-search"></i>
								</button>
							</div>
						</form>
						<ul class="navbar-nav flex-nowrap ms-auto">
							<li class="nav-item dropdown d-sm-none no-arrow"><a
								class="dropdown-toggle nav-link" aria-expanded="false"
								data-bs-toggle="dropdown" href="#"><i class="fas fa-search"></i></a>
								<div
									class="dropdown-menu dropdown-menu-end p-3 animated--grow-in"
									aria-labelledby="searchDropdown">
									<form class="me-auto navbar-search w-100">
										<div class="input-group">
											<input class="bg-light form-control border-0 small"
												type="text" placeholder="Search for ...">
											<div class="input-group-append">
												<button class="btn btn-primary py-0" type="button">
													<i class="fas fa-search"></i>
												</button>
											</div>
										</div>
									</form>
								</div></li>
							<li class="nav-item dropdown no-arrow mx-1">
								<div class="nav-item dropdown no-arrow">
									<a class="dropdown-toggle nav-link" aria-expanded="false"
										data-bs-toggle="dropdown" href="#"><span
										class="badge bg-danger badge-counter">3+</span><i
										class="fas fa-bell fa-fw"></i></a>
									<div
										class="dropdown-menu dropdown-menu-end dropdown-list animated--grow-in">
										<h6 class="dropdown-header">alerts center</h6>
										<a class="dropdown-item d-flex align-items-center" href="#">
											<div class="me-3">
												<div class="bg-primary icon-circle">
													<i class="fas fa-file-alt text-white"></i>
												</div>
											</div>
											<div>
												<span class="small text-gray-500">December 12, 2019</span>
												<p>A new monthly report is ready to download!</p>
											</div>
										</a><a class="dropdown-item d-flex align-items-center" href="#">
											<div class="me-3">
												<div class="bg-success icon-circle">
													<i class="fas fa-donate text-white"></i>
												</div>
											</div>
											<div>
												<span class="small text-gray-500">December 7, 2019</span>
												<p>$290.29 has been deposited into your account!</p>
											</div>
										</a><a class="dropdown-item d-flex align-items-center" href="#">
											<div class="me-3">
												<div class="bg-warning icon-circle">
													<i class="fas fa-exclamation-triangle text-white"></i>
												</div>
											</div>
											<div>
												<span class="small text-gray-500">December 2, 2019</span>
												<p>Spending Alert: We've noticed unusually high spending
													for your account.</p>
											</div>
										</a><a class="dropdown-item text-center small text-gray-500"
											href="#">Show All Alerts</a>
									</div>
								</div>
							</li>
							<div class="d-none d-sm-block topbar-divider"></div>
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



				<!-- Trang Profile -->
				<div class="container-fluid">
					<h3 class="text-dark mb-4">Profile</h3>
					<div class="row mb-3">
						<div class="col-lg-4">
							<div class="card mb-3">
								<div class="card-body text-center shadow">
									<img class="rounded-circle mb-3 mt-4"
										src="assets/img/dogs/image2.jpeg" width="160" height="160">
									<p class="h4 fw-bold"><%= user.getEmail() %></p>
									<p class="h4"><%= user.getName() %></p>
									<p class="h4"><%= user.getRole() %></p>
								</div>
							</div>

						</div>
						<div class="col-lg-8">
							<div class="row">
								<div class="col">
									<div class="card shadow mb-3">
										<div class="card-header py-3">
											<p class="text-primary m-0 fw-bold">User Settings</p>
										</div>
										<div class="card-body">
											<form action="ProfileController" method="post">
												<input type="text" value="Update" name="action" hidden>
												<div class="row">
													<div class="col">
														<div class="mb-3">
															<label class="form-label" for="username"><strong>Username</strong></label><input
																class="form-control" type="text" id="username"
																value="<%= user.getEmail() %>" disabled>
														</div>
													</div>
													<div class="col">
														<div class="mb-3">
															<label class="form-label" for="email"><strong>Email
																	Address</strong></label><input class="form-control" type="email"
																id="email" name="email" required="required" value="<%= request.getAttribute("emailchange")!=null?request.getAttribute("emailchange"):user.getEmail() %>">
															<span class="text-danger"><%=request.getAttribute("msg") != null?request.getAttribute("msg"):"" %></span>
														</div>
														
													</div>
												</div>
												<div class="row">
													<div class="col">
														<div class="mb-3">
															<label class="form-label" for="full_name"><strong>Full
																	Name</strong></label><input class="form-control" type="text"
																id="name" name="name" value="<%= user.getName() %>">
														</div>
													</div>
													<div class="col">
														<div class="mb-3">
															<label class="form-label" for="role_user"><strong>Role
																	User</strong></label><input class="form-control" type="text"
																id="role" value=<%= user.getRole() %> disabled>
														</div>
													</div>
												</div>
												<div class="mb-3">
													<button class="btn btn-success btn-sm " type="submit">Save
														Settings</button>
												</div>
											</form>
										</div>
									</div>
									<div class="card shadow mb-3">
										<div class="card-header py-3">
											<p class="text-primary m-0 fw-bold">Change Password</p>
										</div>
										<div class="card-body">
											<form action="ProfileController" method="post">
												<input type="text" value="UpdatePass" name="action" hidden>
												<div class="row">
													<div class="col">
														<div class="mb-3">
															<label class="form-label" for="oldpass"><strong>Old
																	Password</strong></label><input class="form-control" type="password"
																id="oldpass" required="required">
														</div>
													</div>
													<div class="col">
														<div class="mb-3">
															<label class="form-label" for="newpass"><strong>New
																	Password</strong></label><input class="form-control" type="password"
																id="newpass" name="newpass" required="required">
														</div>
													</div>
													<div class="col">
														<div class="mb-3">
															<label class="form-label" for="confpass"><strong>Confirm
																	Password</strong></label><input class="form-control" type="password"
																id="confpass" required="required">
														</div>
													</div>
												</div>
												<div class="mb-3">
													<button class="btn btn-success btn-sm" type="submit" id="btn_changepassword">Save
														Settings</button>
												</div>
											</form>
										</div>
									</div>
								</div>
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
<script type="text/javascript">
	var btn = document.getElementById("btn_changepassword");
	var input_oldpass = document.getElementById("oldpass");
	var input_newpass = document.getElementById("newpass");
	var input_confpass = document.getElementById("confpass");
	var oldpass = "<%= user.getPassword()%>"
	btn.onclick= function(e){
		if(input_oldpass.value != oldpass){
			e.preventDefault()
			alert("Sai mật khẩu")
		}
		else if(input_newpass.value != input_confpass.value){
			e.preventDefault()
			alert("Sai mật khẩu xác nhận")
		}
	}
</script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/chart.min.js"></script>
<script src="assets/js/bs-init.js"></script>
<script src="assets/js/theme.js"></script>
</html>