<%@ page import="java.util.List" %>
<%@page import="BEAN.Service"%>
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
<link rel="stylesheet" href="assets/css/materialmanage_service.css">
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
					<li class="nav-item"><a class="nav-link " href="ReportController"><i
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




				<!--Trang material manage room-->
				<div>
					<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link"
							aria-current="page" href="RoomController">Phòng</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<%= request.getContextPath() %>/RoomTypeController">Loại phòng</a></li>
						<li class="nav-item"><a class="nav-link active"
							href="<%= request.getContextPath() %>/ServiceController?action=list">Dịch vụ</a></li>
					</ul>
					
					<div style="text-align: right; padding-right: 20px;">
    <button style="height: 35.2px" class="header-find" data-bs-toggle="modal"
							data-bs-target="#themdichvu">Thêm dịch vụ </button>
</div>
<div class="table-room">
    <table class="table">
        <thead>
          <tr>
          	
            <th scope="col">Tên dịch vụ</th>
            <th scope="col">Giá tiền</th>
            <th scope="col">Mô tả</th>
            <th scope="col">Sửa</th>
            <th scope="col">Xóa</th>
          </tr>
        </thead>
        <tbody>
                  <!-- Hiển thị tất cả dịch vụ -->
        		<% 
                    List<Service> services = (List<Service>) request.getAttribute("services");

                    if (services != null) {
                        for (Service service : services) {
                %>
                            <tr>
                                
                                <td><%= service.getName() %></td>
                                <td><%= service.getPrice() %></td>
                                <td><%= service.getDescription() %></td>
                                <td>
	                                <button style="height: 35.2px" class="header-find edit-button" 
					                    data-bs-toggle="modal" data-bs-target='<%="#suadichvu" + service.getId()%>'>
					                    <i class="fa-solid fa-pen-to-square"></i>
					                </button>
					                
					                <div class="modal fade" id='<%="suadichvu" + service.getId()%>' data-bs-backdrop="static"
									    data-bs-keyboard="false" tabindex="-1"
									    aria-labelledby="staticBackdropLabel" aria-hidden="true">
									    <div class="modal-dialog">
									        <div class="modal-content">
									            <form action="<%= request.getContextPath() %>/ServiceController?action=update" method="post">
									                <div class="modal-header">
									                    <button type="button" class="btn-close" data-bs-dismiss="modal"
									                        aria-label="Close"></button>
									                </div>
									                <div class="modal-body">
									                    <h4 class="addroom-heading">Chỉnh sửa dịch vụ</h4>
									                    <p>Bắt buộc phải nhập mã dịch dịch vụ, chỉ cần nhập những thông tin muốn thay đổi!</p>
									                    <div class="addroom-body">
									                    	
									                        <input type="text" name="id" id="serviceName" hidden value="<%=service.getId() %>" >
									                       
									                        <div class="addroom-wrap">
									                            <i class="fas fa-service"></i>
									                            <input class="addroom-input" type="text" name="name" id="upserviceName" placeholder="Tên dịch vụ" value="<%=service.getName() %>">
									                        </div>
									                        <div class="addroom-wrap">
									                            <i class="fas fa-dollar-sign"></i>
									                            <input class="addroom-input" type="number" name="price" id="upservicePrice" placeholder="Giá tiền"  min="0" max="300" value="<%=service.getPrice() %>">
									                        </div>
									                        <div class="addroom-wrap">
									                            <i class="fas fa-info-circle"></i>
									                            <textarea class="addroom-input" name="description" id="upserviceDescription" placeholder="Mô tả" ><%=service.getDescription()%></textarea>
									                        </div>
									                    </div>
									                </div>
									                <div class="modal-footer">
									                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy bỏ</button>
									                    <button type="submit" class="btn btn-primary" id="btnup">Lưu</button>
									                </div>
									            </form>
									        </div>
									    </div>
									</div>
                                <td>
                                	<a href="<%= request.getContextPath() %>/ServiceController?action=delete&id=<%= service.getId() %>"><i class="fa-solid fa-trash-can"></i></a>
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


	<!--Footer-->
	<footer class="sticky-footer" style="background-color: #649e81;">
		<div class="container my-auto">
			<div class="text-center my-auto copyright" style="color: #FFFFFF">
				<span>Copyright © The Nexus Hotel Manager 2023</span>
			</div>
		</div>
	</footer>
	<!--Footer-->
	
	<div class="modal fade" id="themdichvu" data-bs-backdrop="static"
    data-bs-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="<%= request.getContextPath() %>/ServiceController?action=add" method="post">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <h4 class="addroom-heading">Thêm dịch vụ</h4>
                    <div class="addroom-body">
                    	
                        <div class="addroom-wrap">
                            <i class="fas fa-service"></i>
                            <input class="addroom-input" type="text" name="name" id="serviceName" placeholder="Tên dịch vụ">
                        </div>
                        <div class="addroom-wrap">
                            <i class="fas fa-dollar-sign"></i>
                            <input class="addroom-input" type="number" name="price" id="servicePrice " min="0" max="300" placeholder="Giá tiền">
                        </div>
                        <div class="addroom-wrap">
                            <i class="fas fa-info-circle"></i>
                            <textarea class="addroom-input" name="description" id="serviceDescription" placeholder="Mô tả"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy bỏ</button>
                    <button type="submit" class="btn btn-primary" id="btnThem">Thêm</button>
                </div>
            </form>
        </div>
    </div>
</div>


		
</body>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/chart.min.js"></script>
<script src="assets/js/bs-init.js"></script>
<script src="assets/js/theme.js"></script>
<script type="text/javascript">
	var btn = document.getElementById("btnThem");
	var serviceName = document.getElementById("serviceName");
	var servicePrice = document.getElementById("servicePrice");
	
	var btnup = document.getElementById("btnup");
	var upserviceName = document.getElementById("upserviceName");
	var upservicePrice = document.getElementById("upservicePrice");
	var upserviceDescription = document.getElementById("upserviceDescription");
	
	
	btn.onclick= function(e){
		if(!serviceName.value ||!servicePrice.value ||!serviceDescription.value){
			e.preventDefault()
			alert("Please fill input")
		}
		
	}
	
	btnup.onclick= function(e){
		if(!upserviceName.value ||!upservicePrice.value ||!upserviceDescription.value){
			e.preventDefault()
			alert("Please fill input")
		}
		
	}
	

</script>
</html>