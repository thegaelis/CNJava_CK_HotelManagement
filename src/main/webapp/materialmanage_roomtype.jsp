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
<link rel="stylesheet" href="assets/css/materialmanage_roomtype.css">
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
						href="RoomController"><i class="fas fa-table"></i><span>Material
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
						<li class="nav-item"><a class="nav-link"
							aria-current="page" href="RoomController">Phòng</a></li>
						<li class="nav-item"><a class="nav-link active"
							href="<%= request.getContextPath() %>/RoomTypeController">Loại phòng</a></li>
						<li class="nav-item"><a class="nav-link "
							href="<%= request.getContextPath() %>/ServiceController?action=list">Dịch vụ</a></li>
					</ul>

					
					
					<div style="text-align: right; padding-right: 20px;">		
						<button type="button" class="header-find" data-bs-toggle="modal"
							data-bs-target="#themloaiphong">Thêm loại phòng</button>
					</div>

					<div class="table-room">
						<table class="table">
							<thead>
					            <tr>
					                <th>Tên phòng</th>
					                <th>Số người</th>
					                <th>Diện tích (m2)</th>
					                <th>Mô tả</th>
					                
					                <th>Giá theo ngày</th>
					         		
					                <th>Sửa</th>
                					<th>Xóa</th>
					            </tr>
					        </thead>
					        <tbody>
					                   <!-- Hiển thị tất cả Loại phòng -->
				        		<% 
				                    List<RoomType> RoomTypes = (List<RoomType>) request.getAttribute("roomTypes");
				
				                    if (RoomTypes != null) {
				                        for (RoomType roomType : RoomTypes) {
				                %>
				                            <tr>
				                                
				                                <td><%= roomType.getName() %></td>
				                                <td><%= roomType.getCapacity() %></td>
				                                <td><%= roomType.getAreaInSquareMeters() %></td>
				                                <td><%= roomType.getDescription() %></td>
				                              
				                                <td><%= roomType.getDailyPrice() %></td>
				                               

				                                <td>
					                                <button style="height: 35.2px" class="header-find edit-button" 
									                    data-bs-toggle="modal" data-bs-target='<%="#sualoaiphong" + roomType.getId()%>'>
									                    <i class="fa-solid fa-pen-to-square"></i>
									                </button>
									                
									                <div class="modal fade" id='<%="sualoaiphong" + roomType.getId()%>' data-bs-backdrop="static"
													    data-bs-keyboard="false" tabindex="-1"
													    aria-labelledby="staticBackdropLabel" aria-hidden="true">
													    <div class="modal-dialog">
													        <div class="modal-content">
													            <form action="<%= request.getContextPath() %>/RoomTypeController?action=update" method="post" >
													                <div class="modal-header">
													                    <button type="button" class="btn-close" data-bs-dismiss="modal"
													                        aria-label="Close"></button>
													                </div>
													                <div class="modal-body">
													                    <h4 class="addroom-heading">Chỉnh Sửa Loại Phòng</h4>
													                    <div class="addroom-body">
													                    	
													                        <input type="text" name="id" id="id" hidden value="<%=roomType.getId() %>" >
													                        <div class="addroom-wrap">
													                            
													                            <input class="addroom-input" type="text" name="name" id="nameedit" placeholder="Tên loại phòng" value="<%=roomType.getName() %>">
													                        </div>
													                       
													                        <div class="addroom-wrap">
													                            
													                            <input class="addroom-input" type="number" name="capacity" id="capacityedit" placeholder="Số người" value="<%=roomType.getCapacity() %>">
													                        </div>
													                        <div class="addroom-wrap">
					
													                            <input class="addroom-input" type="number" name="areaInSquareMeters" id="areaInSquareMetersedit" placeholder="Diện tích"  value="<%=roomType.getAreaInSquareMeters() %>">
													                        </div>
													                        <div class="addroom-wrap">
													                        
													                            <textarea class="addroom-input" name="description" id="descriptionedit" placeholder="Mô tả" ><%=roomType.getDescription()%></textarea>
													                        </div>
													           
													                        <div class="addroom-wrap">
					
													                            <input class="addroom-input" type="number" name="dailyPrice" id="dailyPriceedit" placeholder="Giá theo ngày"  value="<%=roomType.getDailyPrice() %>">
													                        </div>
													                        
													                    </div>
													                </div>
													                <div class="modal-footer">
													                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy bỏ</button>
													                    <button type="submit" class="btn btn-primary" id="edittyperoom">Lưu</button>
													                </div>
													            </form>
													        </div>
													    </div>
													</div>
				                                <td>
				                                	<form action="<%= request.getContextPath() %>/RoomTypeController" method="POST" class="col-12">
													    <input type="text" value="delete" name="action" hidden>
													    <input type="text" value="<%= roomType.getId()%>" name="id" hidden>
													    <button type="submit"><i class="fa-solid fa-trash-can"></i></button>
													</form>
				                                </td>
				                            </tr>
				                <% 
				                        }
				                    } else {
				                %>
				                        <tr>
				                            <td colspan="6">Danh sách dịch vụ trống.</td>
				                        </tr>
				                <% } %>
					        </tbody>
						</table>
					</div>



				</div>




			</div>
		</div>
	</div>


	<!-- Modal thêm loại phòng -->
	<div class="modal fade" id="themloaiphong" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="<%= request.getContextPath() %>/RoomTypeController?action=add" method="post" >
							<div class="modal-header">
							<button type="button" class="btn-close" data-bs-dismiss="modal"
													                        aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<h4 class="addroom-heading">Thêm Loại Phòng</h4>
							<div class="addroom-body">
													                    	
							<div class="addroom-wrap">
													                            
								<input class="addroom-input" type="text" name="name" id="nameadd" placeholder="Tên loại phòng" >
							</div>
													                       
							<div class="addroom-wrap">
													                            
								<input class="addroom-input" type="number" name="capacity" id="capacityadd" placeholder="Số người" >
							</div>
							<div class="addroom-wrap">
					
								 <input class="addroom-input" type="number" name="areaInSquareMeters" id="areaInSquareMetersadd" placeholder="Diện tích"  >
							</div>
							<div class="addroom-wrap">
													                        
								<textarea class="addroom-input" name="description" id="descriptionadd" placeholder="Mô tả" ></textarea>
							</div>
							
							<div class="addroom-wrap">
					
								<input class="addroom-input" type="number" name="dailyPrice" id="dailyPriceadd" placeholder="Giá theo ngày"  >
							</div>
							
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy bỏ</button>
						<button type="submit" class="btn btn-primary" id="add">Lưu</button>
					</div>
				</form>
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
	
	<script>
	function validateForm(nameId, capacityId, areaId, descriptionId, firstHourId, hourlyId, overNightId, dailyId, peakDayId, e) {
	    var name = document.getElementById(nameId).value;
	    var capacity = document.getElementById(capacityId).value;
	    var areaInSquareMeters = document.getElementById(areaId).value;
	    var description = document.getElementById(descriptionId).value;
	    var firstHourPrice = document.getElementById(firstHourId).value;
	    var hourlyPrice = document.getElementById(hourlyId).value;
	    var overNightPrice = document.getElementById(overNightId).value;
	    var dailyPrice = document.getElementById(dailyId).value;
	    var peakDayRateMultiplier = document.getElementById(peakDayId).value;

	    // Perform validation
	    if (name === "" || capacity === "" || areaInSquareMeters === "" || description === "" || firstHourPrice === ""  || hourlyPrice === "" || overNightPrice === "" || dailyPrice === "" || peakDayRateMultiplier === "") {
	        alert("Không được để trống thông tin");
	        e.preventDefault();
	        return false;
	    }

	    return true;
	}
	document.getElementById("add").onclick = function (e) {
	    return validateForm("nameadd", "capacityadd", "areaInSquareMetersadd", "descriptionadd", "firstHourPriceadd", "hourlyPriceadd", "overNightPriceadd", "dailyPriceadd", "peakDayRateMultiplieradd", e);
	};

	</script>
	
	
	
	
</body>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/chart.min.js"></script>
<script src="assets/js/bs-init.js"></script>
<script src="assets/js/theme.js"></script>
</html>