<%@page import="DAO.RoomDAO"%>
<%@page import="DAO.RoomTypeDAO"%>
<%@page import="BEAN.Room"%>
<%@page import="BEAN.RoomType"%>
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

<link rel="stylesheet" href="assets/css/materialmanage.css">
<link rel="stylesheet" href="assets/css/materialmanage_room.css">
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
					<li class="nav-item"><a class="nav-link active"
						href="RoomController"><i class="fas fa-table "></i><span>Material
								Manage</span></a></li>
					<li class="nav-item"><a class="nav-link" href="ProfileController"><i
							class="fas fa-user"></i><span>Profile</span></a></li>
					<li class="nav-item"><a class="nav-link " href="<%= request.getContextPath() %>/UserController"><i
							class="fas fa-table"></i><span>Table</span></a></li>
					<li class="nav-item"><a class="nav-link " href="report.jsp"><i
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




				<!--Trang material manage room-->
				<div>
					<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="RoomController">Phòng</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%= request.getContextPath() %>/RoomTypeController">Loại phòng</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%= request.getContextPath() %>/ServiceController?action=list">Dịch vụ</a></li>
					</ul>

					<div style="text-align: right; padding-right: 20px;">
						
						<button type="button" style="height: 35.2px"  class="header-find" data-bs-toggle="modal"
							data-bs-target="#themphong">Thêm phòng</button>
					</div>
					
					

					<div class="table-room">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Số phòng</th>
									<th scope="col">Tình trạng</th>
									<th scope="col">Loại phòng</th>
									<th scope="col">Sửa</th>
									<th scope="col">Xóa</th>
								</tr>
							</thead>
							<tbody>
								<% 	
									List<Room> rooms = (List<Room>)request.getAttribute("rooms");
									for (Room r : rooms) {
										
								%>
										<tr>
											<td><%= r.getNumber() %></td>
											<td>
											<% 
												if(!r.getIsVaiable()){%>
													 Sẵn sàng
												<% }
												else{%>
													 Không sẵn sàng
											<%}%>
											
											</td>
											<td><%=  r.getTypeId() %></td>
											<td>
												<i class="fa-solid fa-pen-to-square"
												data-bs-toggle="modal" data-bs-target='<%="#UpdateModal"+r.getId() %>'></i>
												<!-- Modal sửa phòng -->
												<div class="modal fade" id='<%="UpdateModal"+r.getId() %>' data-bs-backdrop="static"
													data-bs-keyboard="false" tabindex="-1"
													aria-labelledby="staticBackdropLabel" aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="btn-close" data-bs-dismiss="modal"
																	aria-label="Close"></button>
															</div>
															<div class="modal-body">
																<h4 class="addroom-heading">Sửa thông tin phòng</h4>
																<form action="RoomController" method="POST">
																	<div class="addroom-body">
																		<input type="text" value="Update" name="action" hidden>
																		<input type="text" value="<%=r.getId() %>" name="id" hidden>
																		<div class="addroom-wrap">
																			<i class="fa-solid fa-house"></i> <input class="addroom-input"
																				type="number" value="<%=r.getNumber() %>" name="number" id="upNumber"  min="100" max="300" placeholder="Nhập số phòng">
																		</div>
																		<div class="addroom-wrap">
																			<i class="fa-solid fa-power-off"></i> 
																			<select name="status" id="upStatus" 
																				class="addroom-input" style="color: #7d7d7d;">
																				<option value="null">Tình trạng</option>
																				<option value="true">Sẵn sàng</option>
																				<option value="false">Không sẵn sàng</option>
																			</select>
																		</div>
																		<div class="addroom-wrap">
																			<i class="fa-solid fa-layer-group"></i> 
																			<select name="roomType" id="upRoomType" 
																				class="addroom-input" style="color: #7d7d7d;">
																				<option value="null">Loại phòng</option>
																				<% 	
																					List<RoomType> roomTypes = (List<RoomType>)request.getAttribute("roomTypes");
																					for (RoomType rt : roomTypes) {
																						
																				%>
																						<option value="<%= rt.getId() %>"><%= rt.getName() %></option>
																				<% 									
																					}
																				%>
																				
																			</select>
																		</div>
																		<div class="modal-footer">
																			<button type="button" class="btn btn-secondary"
																				data-bs-dismiss="modal">Hủy bỏ</button>
																			<button type="submit" class="btn btn-primary" id="upRoom">Sửa</button>
																		</div>
																	</div>
																	
																</form>
															</div>
														</div>
													</div>
												</div>
											</td>
											<td>
												
													<form action="RoomController" method="POST" class="col-12">
															<input type="text" value="Delete" name="action" hidden>	
															<input type="text" value="<%= r.getId()%>" name="id" hidden>			
																		
															
						
																<button type="submit"><i class="fa-solid fa-trash-can" ></i></button>
															
													</form>  
																   
															
											</td>
										</tr>
								<% 									
									}
								%>
							</tbody>
						</table>
					</div>

				</div>




			</div>
		</div>
	</div>


	<!-- Modal thêm phòng -->
	<div class="modal fade" id="themphong" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<h4 class="addroom-heading">Nhập thông tin phòng</h4>
					<form action="RoomController" method="POST">
						<div class="addroom-body">
							<input type="text" value="Add" name="action" hidden>
							<div class="addroom-wrap">
								<i class="fa-solid fa-house"></i> <input class="addroom-input"
									type="number" name="number" id="addNumber"  min="100" max="300"placeholder="Nhập số phòng">
							</div>
							<div class="addroom-wrap">
								<i class="fa-solid fa-power-off"></i> <select name="status" id="addStatus"
									class="addroom-input" style="color: #7d7d7d;">
									<option value="null">Tình trạng</option>
									<option value="true">Sẵn sàng</option>
									<option value="false">Không sẵn sàng</option>
								</select>
							</div>
							<div class="addroom-wrap">
								<i class="fa-solid fa-layer-group"></i> <select name="roomType" id="addRoomType"
									class="addroom-input" style="color: #7d7d7d;">
									<option value="null">Loại phòng</option>
									<% 	
										List<RoomType> roomTypes = (List<RoomType>)request.getAttribute("roomTypes");
										for (RoomType rt : roomTypes) {
											
									%>
											<option value="<%= rt.getId() %>"><%= rt.getName() %></option>
									<% 									
										}
									%>
									
								</select>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Hủy bỏ</button>
								<button type="submit" class="btn btn-primary" id="addRoom">Thêm</button>
							</div>
						</div>
						
					</form>
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
	var btn = document.getElementById("addRoom");
	var input_number_add = document.getElementById("addNumber");
	var input_status_add = document.getElementById("addStatus");
	var input_roomType_add = document.getElementById("addRoomType");
	
	var btn_up = document.getElementById("upRoom");
	var input_number_up = document.getElementById("upNumber");
	var input_status_up = document.getElementById("upStatus");
	var input_roomType_up = document.getElementById("upRoomType");
	
	btn.onclick= function(e){
		if(!input_number_add.value || input_status_add.value=="null" ||input_roomType_add.value=="null"){
			e.preventDefault()
			alert("Please fill input")
		}
		
	}
	
	btn_up.onclick= function(e){
		if(!input_number_up.value || input_status_up.value=="null" ||input_roomType_up.value=="null"){
			e.preventDefault()
			alert("Please fill input")
		}
		
	}
	
	var mess="<%=(String)request.getAttribute("messRoom")%>"
	console.log(mess);
	if(mess.length>0 &&mess!="null"){
		alert(mess)
	}

</script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/chart.min.js"></script>
<script src="assets/js/bs-init.js"></script>
<script src="assets/js/theme.js"></script>
</html>