<%@page import="BEAN.*"%>
<%@page import="java.util.List"%>
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
					<li class="nav-item"><a class="nav-link" href="RoomController"><i
							class="fas fa-table"></i><span>Material Manage</span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="ProfileController"><i class="fas fa-user"></i><span>Profile</span></a></li>
					<li class="nav-item"><a class="nav-link "
						href="<%=request.getContextPath()%>/UserController"><i
							class="fas fa-table"></i><span>Table</span></a></li>
					<li class="nav-item"><a class="nav-link active"
						href="ReportController"><i class="fas fa-tachometer-alt"></i><span>Report</span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="LogoutController"><i class="far fa-user-circle"></i><span>Log
								Out</span></a></li>
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
						
						<ul class="navbar-nav flex-nowrap ms-auto">
							
							<li class="nav-item dropdown no-arrow">
								<div class="nav-item dropdown no-arrow">
									<a class="dropdown-toggle nav-link" aria-expanded="false"
										data-bs-toggle="dropdown" href="#"><span
										class="d-none d-lg-inline me-2 text-gray-600 small"><%=session.getAttribute("username")%>
											/ <%=session.getAttribute("role")%></span><i
										class="fas fa-caret-down"></i></a>
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




				<!-- Trang report -->
				<div class="container-fluid">
					<div
						class="d-sm-flex justify-content-between align-items-center mb-4">
						<h3 class="text-dark mb-0">Revenue</h3>
						<form action="ReportController">
						<input name="action" value="XuatExcel" type="hidden">
						<input name="d1" type="hidden" value = <%= request.getAttribute("d1") %>>
						<input name="d2" type="hidden" value = <%= request.getAttribute("d2") %>>
							<button type="submit" class="btn btn-success btn-sm d-none d-sm-inline-block"
							role="button"><i
							class="fas fa-download fa-sm text-white-50"></i>&nbsp;Xuất file excel</button>
						</form>
					</div>
					<form action="ReportController">
						<div class="row">

							<div class="col-4">
								Từ: <input name="d1" type="date" value = <%= request.getAttribute("d1") %>>
							</div>

							<div class="col-4">
								Đến: <input name="d2" type="date" value = <%= request.getAttribute("d2") %>>
							</div>

							<div class="col-4">
								<button class="btn btn-primary my-auto" type="submit">Submit</button>
							</div>
							
						</div>
					</form>
					<div class="row mt-3">


						<table class="table">
							<thead>
								<tr>
									<th scope="col">Mã hóa đơn</th>
									<th scope="col">Tổng tiền</th>
									<th scope="col">Ngày</th>
								</tr>
							</thead>
							<tbody>
							<%
							List<Bill> bills = (List<Bill>)request.getAttribute("list");
							for(Bill b : bills){
							%>
								<tr>
									<th scope="row"><%= b.getId() %></th>
									<td><%= b.getSum() %></td>
									<td><%= b.getDateCreated() %></td>
								</tr>
							<% } %>
							</tbody>
						</table>

					</div>



				</div>

			<!-- 	report0---------------------- -->
				<div class="container-fluid mt-4">
					<div
						class="d-sm-flex justify-content-between align-items-center mb-4">
						<h3 class="text-dark mb-0">Report</h3>
						
					</div>
					
					<div class="row mt-3">


						<table class="table">
							<thead>
								<tr>
									<th scope="col">Email</th>
									<th scope="col">Nội dung</th>
									<th scope="col">Đã đọc</th>
								</tr>
							</thead>
							<tbody>
							<%
							List<Report> reports = (List<Report>)request.getAttribute("reports");
							for(Report rp : reports){
							%>
								<tr>
									<th scope="row"><%= rp.getEmail() %></th>
									<td><%= rp.getText() %></td>
									<td>
										<form action="ReportController" method="post">
											<input value="<%=rp.getEmail() %>" name="email" hidden>
											<button type="submit" class="btn btn-danger col-4" >
													Xóa
											</button>
										</form>
										
									</td>
								</tr>
							<% } %>
							</tbody>
						</table>

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
</html>