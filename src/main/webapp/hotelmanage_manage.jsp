<%@page import="BEAN.Service"%>
<%@page import="BEAN.Reservation"%>
<%@page import="DAO.*"%>
<%@page import="BEAN.Room"%>
<%@page import="BEAN.RoomType"%>
<%@page import="java.util.*"%>
<%@page import="BEAN.RoomType"%>
<%@page import="java.util.concurrent.TimeUnit"%>
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
<link rel="stylesheet" href="assets/css/hotelmanage_manage.css">
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
					<li class="nav-item"><a class="nav-link" href="RoomController"><i
							class="fas fa-table"></i><span>Material Manage</span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="ProfileController"><i class="fas fa-user"></i><span>Profile</span></a></li>
					<li class="nav-item"><a class="nav-link "
						href="<%=request.getContextPath()%>/UserController"><i
							class="fas fa-table"></i><span>Table</span></a></li>
					<li class="nav-item"><a class="nav-link" href="ReportController"><i
							class="fas fa-tachometer-alt"></i><span>Report</span></a></li>
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




				<!-- Trang HotelManage Manage -->
				<div>
					<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="ManagerController">Manage</a></li>
						<li class="nav-item"><a class="nav-link "
							href="<%= request.getContextPath() %>/CheckinController">Check-in</a></li>
					</ul>
					<div class="container-fluid p-0">


						<div class="container-fluid p-3">
							<%
							int sum = 0;
							List<RoomType> roomTypes = (List<RoomType>) request.getAttribute("roomTypes");

							for (RoomType rt : roomTypes) {
							%>
							<div class="title my-3"><%=rt.getName()%></div>
							<div class="row">
								<%
								Map<String, Reservation> mapIdRoomAndIdGuest = (Map<String, Reservation>) request.getAttribute("map");
								Map<String, List<Service>> mapService = (Map<String, List<Service>>) request.getAttribute("mapservice");
								List<Room> rooms = (List<Room>) request.getAttribute("rooms");
								for (Room r : rooms) {
									if (r.getTypeId().equals(rt.getId())) {
								%>

								<%
								if (!r.getIsVaiable()) {
								%>
								<button class=" btn col-lg-3 col-md-4 col-sm-6 p-2"
									data-bs-toggle="modal">
									<div class="cards__item">
										<div class="card trong">
											<div class="p-0 card__status">
												<div class="row m-0">
													<div class="col-6 text-start fw-bold"><%=r.getNumber()%></div>
													<div class="col-6 text-end status1">Phòng đã đặt</div>
													<div class="col-6 text-end status2">Phòng trống</div>
												</div>
												<div class="row m-0 pt-3">
													<div class="col-3 p-0 icon1">
														<i class="fa-solid fa-user"></i>
													</div>
													<div class="col-3 p-0 icon2">
														<i class="fa-solid fa-circle-check"></i>
													</div>
													<div class="col-9 my-auto fs-5 text-center fw-bold">Tên
														khách hàng</div>
												</div>
											</div>
											<div class="card__content">
												<div class="row">
													<div class="col-6 cangiua">
														<i class="fa-solid fa-calendar-days"></i> <span>0</span>
													</div>

												</div>

											</div>
											<%
											} else {
											for (Map.Entry<String, Reservation> entry : mapIdRoomAndIdGuest.entrySet()) {
												String idRoom = entry.getKey();
												Reservation reservation = entry.getValue();
												GuestDAO guestDAO = new GuestDAO();
												String name = guestDAO.getName(reservation.getGuestId());

												long diffInMillies = Math.abs(reservation.getEndTime().getTime() - reservation.getStartTime().getTime());
												long daysBetween = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);

												if (idRoom.equals(r.getId())) {
											%>

											<!-- Modal xem phòng-->
											<div class="modal fade" id='<%="ModalInfor" + r.getId()%>'
												data-bs-backdrop="static" data-bs-keyboard="false"
												tabindex="-1" aria-labelledby="staticBackdropLabel"
												aria-hidden="true">
												<div class="modal-dialog modal-lg">
													<div class="modal-content">
														<div class="modal-header">
															<h2><%=r.getNumber()%></h2>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">
															<div class="container-fluid bg-light p-3">
																<div class="row">
																	<div class="col-3 cangiua">
																		<i class="fa-solid fa-user"></i> <span><%=name%></span>
																	</div>
																	<div class="col-3 cangiua">
																		<i class="fa-solid fa-calendar-days"></i> <span><%=reservation.getStartTime()%></span>
																	</div>
																	<div class="col-3 cangiua">
																		<i class="fa-solid fa-calendar-day"></i> <span><%=daysBetween%>
																			ngày</span>
																	</div>

																</div>

																<div class="row pt-5">
																	<div class="col-12 pr-2">
																		<div class="dichvu">
																			<table class="table">
																				<thead>
																					<tr>
																						<th scope="col">Dịch vụ</th>
																						<th scope="col">Số lượng</th>
																						<th scope="col">Thành tiền</th>
																					</tr>
																				</thead>
																				<tbody class="table-group-divider">
																					<%
																					ListServiceDAO listserviceDAO = new ListServiceDAO();
																					ServiceListServiceDAO serviceListServiceDAO = new ServiceListServiceDAO();
																					for (Map.Entry<String, List<Service>> entry2 : mapService.entrySet()) {
																						String idGuest = entry2.getKey();
																						List<Service> serviceWithGuest = entry2.getValue();

																						String idListService = listserviceDAO.getD(idGuest);

																						if (idGuest.equals(reservation.getGuestId())) {
																							
																							for (Service s : serviceWithGuest) {
																						int number = serviceListServiceDAO.getNumber(idListService, s.getId());
																						sum += s.getPrice()*number;
																					%>
																					<tr>
																						<td><%=s.getName()%></td>
																						<td><%=number%></td>
																						<td><%=s.getPrice() * number%></td>
																					</tr>
																					<%
																					}
																					}
																					}
																					%>



																				</tbody>
																			</table>
																		</div>

																		<div class="text-end mt-2">

																			<button class="btn btn-themdv" data-bs-toggle="modal"
																				data-bs-target="#ModalService">Thêm dịch vụ
																			</button>

																		</div>
																	</div>

																</div>
															</div>
														</div>
														
														<div class="modal-footer">
															<form action="ManagerController" method="post">
																<input type="hidden" value="ThanhToan" name="action">
																<input type="hidden" name="guestID"
																	value=<%=reservation.getGuestId()%>> <input
																	type="hidden" name="reservationID"
																	value=<%=reservation.getId()%>> <input
																	type="hidden" name="sum" value=<%=sum %>>
																<button type="submit" class="btn btn-primary">Thanh
																	toán</button>
																<button type="button" class="btn btn-secondary"
																	data-bs-dismiss="modal">Thoát</button>
															</form>
														</div>
													</div>
												</div>
											</div>




											<!-- Model Service -->
											<div class="modal fade" id="ModalService"
												data-bs-backdrop="static" data-bs-keyboard="false"
												tabindex="-1" aria-labelledby="staticBackdropLabel"
												aria-hidden="true">
												<div class="modal-dialog modal-lg">
													<div class="modal-content">
														<div class="modal-header">
															<h2>Thêm dịch vụ</h2>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"
																data-bs-toggle="modal"
																data-bs-target='<%="#ModalInfor" + r.getId()%>'></button>

														</div>
														<div class="modal-body">
															<form action="ManagerController" method="POST"
																class="col-12">
																<input type="text" value="AddService" name="action"
																	hidden> <input type="text"
																	value="<%=reservation.getGuestId()%>" name="idGuest"
																	hidden>



																<table class="table">
																	<thead>
																		<tr>
																			<th scope="col">Dịch vụ</th>
																			<th scope="col">Thành tiền</th>
																			<th scope="col">Thêm</th>
																		</tr>
																	</thead>
																	<tbody class="table-group-divider">

																		<%
																		List<Service> services = (List<Service>) request.getAttribute("services");
																		for (Service s : services) {
																		%>
																		<tr>

																			<td><%=s.getName()%></td>
																			<td><%=s.getPrice()%></td>
																			<td><button type="submit"
																					class="btn btn-primary" value="<%=s.getId()%>"
																					name="idService">Thêm</button></td>
																		</tr>
																		<%
																		}
																		%>


																	</tbody>
																</table>




																<div class="modal-footer">

																	<button type="button" class="btn btn-primary"
																		data-bs-toggle="modal"
																		data-bs-target='<%="#ModalInfor" + r.getId()%>'>
																		Thoát</button>
																</div>
															</form>
														</div>

													</div>

												</div>
											</div>




											<button class=" btn col-lg-3 col-md-4 col-sm-6 p-2"
												data-bs-toggle="modal"
												data-bs-target='<%="#ModalInfor" + r.getId()%>'>
												<div class="cards__item">
													<div class="card dadat">
														<div class="p-0 card__status">
															<div class="row m-0">
																<div class="col-6 text-start fw-bold"><%=r.getNumber()%></div>
																<div class="col-6 text-end status1">Phòng đã đặt</div>
																<div class="col-6 text-end status2">Phòng trống</div>
															</div>
															<div class="row m-0 pt-3">
																<div class="col-3 p-0 icon1">
																	<i class="fa-solid fa-user"></i>
																</div>
																<div class="col-3 p-0 icon2">
																	<i class="fa-solid fa-circle-check"></i>
																</div>
																<div class="col-9 my-auto fs-5 text-center fw-bold"><%=name%></div>
															</div>
														</div>
														<div class="card__content">
															<div class="row">
																<div class="col-6 cangiua">
																	<i class="fa-solid fa-calendar-days"></i> <span><%=daysBetween%></span>
																</div>

															</div>

														</div>

														<%
														}

														}
														}
														%>
													</div>

												</div>

											</button>
											<%
											}
											}
											%>

										</div>
										<%
										}
										%>

									</div>
							</div>
						</div>



					</div>
				</div>
			</div>





			<!-- Modal hóa đơn-->
			<div class="modal fade" id="staticBackdrop2"
				data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 style="margin-left: 40%;" class="modal-title"
								id="staticBackdropLabel">In hóa đơn</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div style="background-color: #fff;" class="modal-body">
							<div class="header-bill">
								<div class="logo-bill">NEXUS HOTEL</div>
								<div class="title-bill">Hóa đơn</div>
								<div>
									<i class="fa-solid fa-print"></i>
								</div>
							</div>
							<div class="body-bill">
								<span class="name-customer">Tên khách: <%= request.getAttribute("nameguest") %></span>
								<div class="row">
									<div class="col col-lg-6">
										
										<div>Nhân viên: <%= request.getAttribute("nameuser") %></div>
									</div>
									
								</div>
								
								<div class="total">
									<span>Tổng tiền: <span class="total-value"><%= request.getAttribute("tien") %>
											000 VND</span></span>
								</div>
								<div class="footer-bill">
									<div class="mess">Cảm ơn quý khách!</div>
									<div class="contact">
										<span class="email">support@gmail.com</span> <span
											style="margin-left: 12px;" class="phone">0123456789</span>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Thoát</button>
							<button type="button" class="btn btn-primary" data-bs-dismiss="modal">Xuất hóa
								đơn</button>
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
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var thanhtoan =
<%=request.getAttribute("Thanhtoan")%>
	window.onload = function() {
		OpenBootstrapPopup();
	};
	function OpenBootstrapPopup() {
		if (thanhtoan == 1) {
			$("#staticBackdrop2").modal('show');
		}
	}

	
</script>


<script src="assets/js/chart.min.js"></script>
<script src="assets/js/bs-init.js"></script>
<script src="assets/js/theme.js"></script>
</html>