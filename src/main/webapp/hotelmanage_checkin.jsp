<%@page import="DAO.*"%>
<%@page import="BEAN.*"%>
<%@page import="java.util.*"%>
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
<link rel="stylesheet" href="assets/css/hotelmanage.css">
<link rel="stylesheet" href="assets/css/hotelmanage_checkin.css">
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
					<li class="nav-item"><a class="nav-link active"
						href="ManagerController"><i class="fas fa-table"></i><span>Hotel
								Manage</span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="RoomController"><i class="fas fa-table"></i><span>Material
								Manage</span></a></li>
					<li class="nav-item"><a class="nav-link" href="ProfileController"><i
							class="fas fa-user"></i><span>Profile</span></a></li>
					<li class="nav-item"><a class="nav-link " href="<%= request.getContextPath() %>/UserController"><i
							class="fas fa-table"></i><span>Table</span></a></li>
					<li class="nav-item"><a class="nav-link" href="ReportController"><i
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




				<!-- Trang HotelManage Manage -->
				<div>
					<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link "
						href="ManagerController"><span>Manage</span></a></li>
						<li class="nav-item"><a class="nav-link active"
							href="<%= request.getContextPath() %>/CheckinController">Check-in</a></li>
					</ul>
			
					<!-- Button đặt phòng -->
					<button type="button" style="margin: 8px 24px;"
						class="btn btn-primary" data-bs-toggle="modal"
						data-bs-target="#staticBackdrop">Đặt phòng</button>
					<div class="container-fluid">
					<p class="text-danger text-center"><%=request.getAttribute("msg")!=null?request.getAttribute("msg"):""%></p>
						<% 	
							int i=0;
							Map<Reservation, Integer> mapRoom = (Map<Reservation, Integer>)request.getAttribute("mapRoom");
							Map<Reservation,Map<String,Integer>> mapRoomTypeNumber = (Map<Reservation,Map<String,Integer>>)request.getAttribute("mapRoomTypeNumber");
						
							GuestDAO guestDAO= new GuestDAO();
							List<Reservation> reservations = (List<Reservation>)request.getAttribute("reservations");
							for (Reservation re : reservations) {
								if(!re.getIsConfirmed()){
								i=i+1;
								
								Guest guest = guestDAO.detailGuest(re.getGuestId());
								
								
								for (Map.Entry<Reservation, Integer> entry : mapRoom.entrySet()) {
								   	Reservation reservation= entry.getKey();
								    int number = entry.getValue();  
								   	if(reservation.getId().equals(re.getId())){ 
								   		for (Map.Entry<Reservation,Map<String,Integer>> entry2 : mapRoomTypeNumber.entrySet()) {
								   			Reservation reservation2= entry2.getKey();
								   			Map<String,Integer> map = entry2.getValue();
								   			if(reservation2.getId().equals(reservation.getId())){
								   				
						%>
							<div class="card-checkin">
								<div class="card-checkin-title fs-3 fw-bold">#00<%=i %></div>
								<div class="card-checkin-text">
									<p>From: <%=guest.getEmail() %></p>
									<p>Name: <%=guest.getName()  %></p>
									<p>Check in: <%= re.getStartTime().toString() %> </p>
									<p>Check out: <%= re.getEndTime().toString()%> </p>
									<p><%=number %> room</p>

								</div>
								<div>
									<form action="CheckinController" method="post">
									<input type="hidden" name="reservationId" value= <%=re.getId() %>>
									<input type="hidden" name="guestId" value= <%=guest.getId() %>>
									<input type="hidden" name="action" value= "Huy">
									<button class="btn btn-danger me-3" type="submit" 
										>Hủy</button>
									
									
									<button class="btn btn-primary" data-bs-toggle="modal" type="button"
										data-bs-target='<%="#modal"+re.getId()%>'>View</button>
										
									</form>
								</div>
							</div>
							
							<!-- Modal checkin -->
							<div class="modal fade" id='<%="modal"+re.getId()%>' data-bs-backdrop="static"
								data-bs-keyboard="false" tabindex="-1"
								aria-labelledby="staticBackdropLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="modal-title fs-5" id="staticBackdropLabel">Thông
												tin đặt phòng</h1>
											<button type="button" class="btn-close" data-bs-dismiss="modal"
												aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<table class="table my-0" id="dataTable">
												<thead>
													<tr>
														<th>Loại Phòng</th>
														<th>Số Phòng</th>
													</tr>
												</thead>
												<tbody>
											<%
												for (Map.Entry<String,Integer> entry3 : map.entrySet()) {
										   			String name= entry3.getKey();
										   			int numberRoomType = entry3.getValue();
											%>			
													<tr>
														<td><%=name %></td>
														<td><%=numberRoomType %></td>
													</tr>
											<%} %>
												</tbody>
											</table>
										</div>
										<div class="modal-footer">
											<form action="CheckinController" method="POST" >
												<input type="text" value="CheckIn" name="action" hidden>	
												<input type="text" value="<%=reservation.getId() %>" name="reservationID" hidden>	
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Hủy</button>
												<button type="submit" class="btn btn-primary"
													data-bs-dismiss="modal">Duyệt</button>
											</form>
											
										</div>
									</div>
								</div>
							</div>
							
							
						<%
											} 
								   		}
								   	}
								}
						
							}
						}
						%>
						
					</div>
				</div>



			</div>
		</div>
	</div>


	<!-- Modal đặt phòng thủ công  -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div style="width: auto; max-width: unset" class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title title-modal" id="staticBackdropLabel">Đặt
						phòng</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
				
				<!-- --------------------------------------------------------------------------------------- -->
				 <form class="form-user" action="CheckinController" method="post">
				 	<input type="text" value="booking" name="action" hidden>	
				 	<p class="text-danger text-center"><%=request.getAttribute("msg")!=null?request.getAttribute("msg"):""%></p>
					<div class="row">
						<div style="border-right: 2px solid;" class="col col-lg-5">
							<h3 class="title-body">Thông tin khách hàng</h3>
							
								<div class="wrap-info">
									<i class="fa-solid fa-user"></i> <input class="input-info"
										id="name" placeholder="Nhập họ tên khách hàng"
										type="text" name ="name">
								</div>
								<br>
								<div class="wrap-info">
									<i class="fa-solid fa-address-card"></i> <input
										class="input-info" id="cccd" placeholder="Nhập CCCD"
										type="number" name="cccd">
								</div>
								<br>
								<div class="wrap-info">
									<i class="fa-solid fa-phone"></i> <input class="input-info"
										id="sdt" placeholder="Nhập số điện thoại" type="number" name="sdt">
								</div>
								<br>
								<div class="wrap-info">
									<i class="fa-solid fa-envelope"></i> <input class="input-info"
										id="email" placeholder="Nhập Email" type="email" name="email">
								</div>
								<br>
								
								
								
							
						</div>
						<div class="col col-lg-7">
							<h3 class="title-body">Thông tin phòng</h3>
							<div class="form-room">
								<div class="row" style="text-align: center;">
									<div class="col col-lg-6">
										<div class="info-phong">
											<label for="start">Ngày bắt đầu</label> <br> <i
												class="fa-solid fa-calendar-days"></i> <input
												class="input-phong" type="date" name="checkin" id="start">
										</div>
										<div class="info-phong">
											<label for="end">Ngày kết thúc</label> <br> <i
												class="fa-solid fa-calendar-days"></i> <input
												class="input-phong" type="date" name="checkout" id="end">
										</div>
									</div>
									
								</div>
								<div class="row" style="padding: 20px 50px;">
									<div class="col-12">
										<h4 class="title-table">Danh sách phòng trống</h4>
										<table class="table">
											<thead>
												<tr>
													
													<th scope="col">Loại phòng</th>
													<th scope="col">Số lượng phòng còn trống</th>
													<th scope="col">Số lượng phòng muốn đặt</th>
												</tr>
											</thead>
											<tbody>
												<%
													
													Map<String, Integer> mapNumberWithRoomChuaDat = (Map<String, Integer>)request.getAttribute("mapNumberWithRoomChuaDat");
										
													List<RoomType> roomTypes = (List<RoomType>)request.getAttribute("roomTypes");
													for(RoomType rt:roomTypes){
														for (Map.Entry<String, Integer> entry : mapNumberWithRoomChuaDat.entrySet()) {
															String name=entry.getKey();
															int number = entry.getValue();
															if(rt.getName().equals(name)){
																
															
												%>
													<tr>
														<td><%=rt.getName() %></td>
														<td><%=number %></td>
														<td><input type="number" min="0" value="0" name=<%=rt.getName()%> max=<%=number%> ></td>
													</tr>
												<%
															}
														}
													} %>
												
											</tbody>
										</table>
									</div>
									
								</div>
							</div>
						</div>
					</div>
					
				
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Hủy</button>
						<button type="submit" class="btn btn-primary" id="btn">Lưu</button>
					</div>
				
				</form>
				
				<!-- ----------------------------------------------------------------------------- ---------->
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

	var btn= document.getElementById("btn")
	
	var name= document.getElementById("name")
	var cccd= document.getElementById("cccd")
	var sdt= document.getElementById("sdt")
	var email= document.getElementById("email")
	
	var checkin = document.querySelector("input[name=checkin]")
	var checkout = document.querySelector("input[name=checkout]")
	
	btn.onclick=(e)=>{
		if(!cccd.value ||!sdt.value ||!email.value ){
			e.preventDefault()
			alert("Please fill input")
		}
		else if(checkin.value == "" || checkout.value == ""){
			e.preventDefault()
			alert("Bạn phải nhập ngày đến và ngày đi")
		}
		else if(new Date(checkout.value) <= new Date(checkin.value)){
			e.preventDefault()
			alert("Ngày đi phải cách ngày đến ít nhất 1 ngày")
		}
		else if(new Date(checkin.value) <= Date.now()){
			e.preventDefault()
			alert("Bạn phải đặt phòng trước ngày đến ít nhất 1 ngày")
		}
		
	}
	
	
	
	
	
</script>

</html>