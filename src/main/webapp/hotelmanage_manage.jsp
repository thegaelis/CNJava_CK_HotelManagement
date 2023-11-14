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
					<li class="nav-item"><a class="nav-link"
						href="hotelmanage_manage.jsp"><i class="fas fa-table"></i><span>Hotel
								Manage</span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="materialmanage_room.jsp"><i class="fas fa-table"></i><span>Material
								Manage</span></a></li>
					<li class="nav-item"><a class="nav-link" href="profile.jsp"><i
							class="fas fa-user"></i><span>Profile</span></a></li>
					<li class="nav-item"><a class="nav-link" href="table.jsp"><i
							class="fas fa-table"></i><span>Table</span></a></li>
					<li class="nav-item"><a class="nav-link" href="report.jsp"><i
							class="fas fa-tachometer-alt"></i><span>Report</span></a></li>
					<li class="nav-item"><a class="nav-link" href="index.jsp"><i
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
										class="d-none d-lg-inline me-2 text-gray-600 small">{{user}}
											/ {{role}}</span><i class="fas fa-caret-down"></i></a>
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
							aria-current="page" href="hotelmanage_manage.jsp">Manage</a></li>
						<li class="nav-item"><a class="nav-link"
							href="hotelmanage_checkin.jsp">Check-in</a></li>
					</ul>
					<div class="container-fluid p-0">

						<div class="container-fluid sb">
							<div class="row">
								<div class="col-2 title">Trạng thái</div>
								<div class="col-10">
									<div class="row h-100">
										<div class="form-check col-3 my-auto">
											<input class="form-check-input" type="radio"
												name="trangthaiphong"> <label
												class="form-check-label" for="flexRadioDefault1">
												Phòng trống </label>
										</div>
										<div class="form-check col-3 my-auto">
											<input class="form-check-input" type="radio"
												name="trangthaiphong"> <label
												class="form-check-label" for="flexRadioDefault1">
												Phòng đã đặt </label>
										</div>
										<div class="form-check col-3 my-auto">
											<input class="form-check-input" type="radio"
												name="trangthaiphong"> <label
												class="form-check-label" for="flexRadioDefault1">
												Phòng đang thuê </label>
										</div>
										<div class="form-check col-3 my-auto">
											<input class="form-check-input" type="radio"
												name="trangthaiphong"> <label
												class="form-check-label" for="flexRadioDefault1">
												Tất cả phòng </label>
										</div>
									</div>
								</div>
							</div>
							<div class="row mt-2">
								<div class="col-2 title">Loại phòng</div>
								<div class="col-10">
									<div class="row h-100">
										<div class="form-check col-3 my-auto">
											<input class="form-check-input" type="radio" name="loaiphong">
											<label class="form-check-label" for="flexRadioDefault1">
												Phòng đơn </label>
										</div>
										<div class="form-check col-3 my-auto">
											<input class="form-check-input" type="radio" name="loaiphong">
											<label class="form-check-label" for="flexRadioDefault1">
												Phòng đôi </label>
										</div>
										<div class="form-check col-3 my-auto">
											<input class="form-check-input" type="radio" name="loaiphong">
											<label class="form-check-label" for="flexRadioDefault1">
												Phòng gia đình </label>
										</div>
										<div class="form-check col-3 my-auto">
											<input class="form-check-input" type="radio" name="loaiphong">
											<label class="form-check-label" for="flexRadioDefault1">
												Tất cả loại phòng </label>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="container-fluid p-3">
							<div class="title my-3">Phòng đơn</div>
							<div class="row">
								<button class=" btn col-lg-3 col-md-4 col-sm-6 p-2"
									data-bs-toggle="modal" data-bs-target="#modal3">
									<div class="cards__item">
										<div class="card trong">
											<div class="p-0 card__status">
												<div class="row m-0">
													<div class="col-6 text-start fw-bold">P101</div>
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
													<div class="col-9 my-auto fs-5 text-center fw-bold">Nguyễn
														Văn A</div>
												</div>
											</div>
											<div class="card__content">
												<div class="row">
													<div class="col-6 cangiua">
														<i class="fa-solid fa-calendar-days"></i> <span>3
															ngày</span>
													</div>
													<div class="col-6 cangiua text-end">
														<i class="fa-solid fa-check pe-2"></i> <span>Đã dọn
															dẹp</span>
													</div>
												</div>

											</div>
										</div>

									</div>
								</button>
								<button class=" btn col-lg-3 col-md-4 col-sm-6 p-2"
									data-bs-toggle="modal" data-bs-target="#modal3">
									<div class="cards__item">
										<div class="card trong">
											<div class="p-0 card__status">
												<div class="row m-0">
													<div class="col-6 text-start fw-bold">P101</div>
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
													<div class="col-9 my-auto fs-5 text-center fw-bold">Nguyễn
														Văn A</div>
												</div>
											</div>
											<div class="card__content">
												<div class="row">
													<div class="col-6 cangiua">
														<i class="fa-solid fa-calendar-days"></i> <span>3
															ngày</span>
													</div>
													<div class="col-6 cangiua text-end">
														<i class="fa-solid fa-check pe-2"></i> <span>Đã dọn
															dẹp</span>
													</div>
												</div>

											</div>
										</div>

									</div>
								</button>
								<button class=" btn col-lg-3 col-md-4 col-sm-6 p-2"
									data-bs-toggle="modal" data-bs-target="#modal3">
									<div class="cards__item">
										<div class="card trong">
											<div class="p-0 card__status">
												<div class="row m-0">
													<div class="col-6 text-start fw-bold">P101</div>
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
													<div class="col-9 my-auto fs-5 text-center fw-bold">Nguyễn
														Văn A</div>
												</div>
											</div>
											<div class="card__content">
												<div class="row">
													<div class="col-6 cangiua">
														<i class="fa-solid fa-calendar-days"></i> <span>3
															ngày</span>
													</div>
													<div class="col-6 cangiua text-end">
														<i class="fa-solid fa-check pe-2"></i> <span>Đã dọn
															dẹp</span>
													</div>
												</div>

											</div>
										</div>

									</div>
								</button>
								<button class=" btn col-lg-3 col-md-4 col-sm-6 p-2"
									data-bs-toggle="modal" data-bs-target="#modal3">
									<div class="cards__item">
										<div class="card trong">
											<div class="p-0 card__status">
												<div class="row m-0">
													<div class="col-6 text-start fw-bold">P101</div>
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
													<div class="col-9 my-auto fs-5 text-center fw-bold">Nguyễn
														Văn A</div>
												</div>
											</div>
											<div class="card__content">
												<div class="row">
													<div class="col-6 cangiua">
														<i class="fa-solid fa-calendar-days"></i> <span>3
															ngày</span>
													</div>
													<div class="col-6 cangiua text-end">
														<i class="fa-solid fa-check pe-2"></i> <span>Đã dọn
															dẹp</span>
													</div>
												</div>

											</div>
										</div>

									</div>
								</button>
								<button class=" btn col-lg-3 col-md-4 col-sm-6 p-2"
									data-bs-toggle="modal" data-bs-target="#modal3">
									<div class="cards__item">
										<div class="card trong">
											<div class="p-0 card__status">
												<div class="row m-0">
													<div class="col-6 text-start fw-bold">P101</div>
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
													<div class="col-9 my-auto fs-5 text-center fw-bold">Nguyễn
														Văn A</div>
												</div>
											</div>
											<div class="card__content">
												<div class="row">
													<div class="col-6 cangiua">
														<i class="fa-solid fa-calendar-days"></i> <span>3
															ngày</span>
													</div>
													<div class="col-6 cangiua text-end">
														<i class="fa-solid fa-check pe-2"></i> <span>Đã dọn
															dẹp</span>
													</div>
												</div>

											</div>
										</div>

									</div>
								</button>
								<button class=" btn col-lg-3 col-md-4 col-sm-6 p-2"
									data-bs-toggle="modal" data-bs-target="#modal3">
									<div class="cards__item">
										<div class="card trong">
											<div class="p-0 card__status">
												<div class="row m-0">
													<div class="col-6 text-start fw-bold">P101</div>
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
													<div class="col-9 my-auto fs-5 text-center fw-bold">Nguyễn
														Văn A</div>
												</div>
											</div>
											<div class="card__content">
												<div class="row">
													<div class="col-6 cangiua">
														<i class="fa-solid fa-calendar-days"></i> <span>3
															ngày</span>
													</div>
													<div class="col-6 cangiua text-end">
														<i class="fa-solid fa-check pe-2"></i> <span>Đã dọn
															dẹp</span>
													</div>
												</div>

											</div>
										</div>

									</div>
								</button>
								<button class=" btn col-lg-3 col-md-4 col-sm-6 p-2"
									data-bs-toggle="modal" data-bs-target="#modal3">
									<div class="cards__item">
										<div class="card trong">
											<div class="p-0 card__status">
												<div class="row m-0">
													<div class="col-6 text-start fw-bold">P101</div>
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
													<div class="col-9 my-auto fs-5 text-center fw-bold">Nguyễn
														Văn A</div>
												</div>
											</div>
											<div class="card__content">
												<div class="row">
													<div class="col-6 cangiua">
														<i class="fa-solid fa-calendar-days"></i> <span>3
															ngày</span>
													</div>
													<div class="col-6 cangiua text-end">
														<i class="fa-solid fa-check pe-2"></i> <span>Đã dọn
															dẹp</span>
													</div>
												</div>

											</div>
										</div>

									</div>
								</button>
								<button class=" btn col-lg-3 col-md-4 col-sm-6 p-2"
									data-bs-toggle="modal" data-bs-target="#modal3">
									<div class="cards__item">
										<div class="card trong">
											<div class="p-0 card__status">
												<div class="row m-0">
													<div class="col-6 text-start fw-bold">P101</div>
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
													<div class="col-9 my-auto fs-5 text-center fw-bold">Nguyễn
														Văn A</div>
												</div>
											</div>
											<div class="card__content">
												<div class="row">
													<div class="col-6 cangiua">
														<i class="fa-solid fa-calendar-days"></i> <span>3
															ngày</span>
													</div>
													<div class="col-6 cangiua text-end">
														<i class="fa-solid fa-check pe-2"></i> <span>Đã dọn
															dẹp</span>
													</div>
												</div>

											</div>
										</div>

									</div>
								</button>
								<button class=" btn col-lg-3 col-md-4 col-sm-6 p-2"
									data-bs-toggle="modal" data-bs-target="#modal3">
									<div class="cards__item">
										<div class="card dadat">
											<div class="p-0 card__status">
												<div class="row m-0">
													<div class="col-6 text-start fw-bold">P101</div>
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
													<div class="col-9 my-auto fs-5 text-center fw-bold">Nguyễn
														Văn A</div>
												</div>
											</div>
											<div class="card__content">
												<div class="row">
													<div class="col-6 cangiua">
														<i class="fa-solid fa-calendar-days"></i> <span>3
															ngày</span>
													</div>
													<div class="col-6 cangiua text-end">
														<i class="fa-solid fa-check pe-2"></i> <span>Đã dọn
															dẹp</span>
													</div>
												</div>

											</div>
										</div>

									</div>
								</button>
							</div>



							<div class="title my-3">Phòng đôi</div>
							<div class="row">
								<button class=" btn col-lg-3 col-md-4 col-sm-6 p-2"
									data-bs-toggle="modal" data-bs-target="#modal3">
									<div class="cards__item">
										<div class="card trong">
											<div class="p-0 card__status">
												<div class="row m-0">
													<div class="col-6 text-start fw-bold">P101</div>
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
													<div class="col-9 my-auto fs-5 text-center fw-bold">Nguyễn
														Văn A</div>
												</div>
											</div>
											<div class="card__content">
												<div class="row">
													<div class="col-6 cangiua">
														<i class="fa-solid fa-calendar-days"></i> <span>3
															ngày</span>
													</div>
													<div class="col-6 cangiua text-end">
														<i class="fa-solid fa-check pe-2"></i> <span>Đã dọn
															dẹp</span>
													</div>
												</div>

											</div>
										</div>

									</div>
								</button>
							</div>
						</div>

					</div>
				</div>



			</div>
		</div>
	</div>


	<!-- Modal xem phòng-->
	<div class="modal fade" id="modal3" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h2>P101</h2>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container-fluid bg-light p-3">
						<div class="row">
							<div class="col-3 cangiua">
								<i class="fa-solid fa-user"></i> <span>Nguyễn Văn A</span>
							</div>
							<div class="col-3 cangiua">
								<i class="fa-solid fa-calendar-days"></i> <span>5/11/2023
									12:00</span>
							</div>
							<div class="col-3 cangiua">
								<i class="fa-solid fa-calendar-day"></i> <span>3 ngày</span>
							</div>
							<div class="col-3 cangiua">
								<i class="fa-solid fa-user-group"></i> <span>2 người</span>
							</div>
						</div>

						<div class="row pt-5">
							<div class="col-6 pr-2">
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
											<tr>
												<td>Mì xào</td>
												<td>1</td>
												<td>50000</td>
											</tr>
											<tr>
												<td>Pepsi</td>
												<td>1</td>
												<td>15000</td>
											</tr>

										</tbody>
									</table>
								</div>

								<div class="text-end mt-2">
									<button class="btn btn-themdv">Thêm dịch vụ</button>
								</div>
							</div>
							<div class="col-6">
								<div class="box">
									<div class="title">Cập nhật tình trạng phòng</div>
									<input type="text" class="form-control" value="Phòng đang thuê">
									<div class="title">Cập nhật tình trạng dọn dẹp</div>
									<select class="form-select">
										<option value="1">Đã dọn dẹp</option>
										<option value="2">Chưa dọn dẹp</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal">Lưu</button>
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#staticBackdrop2">
						Thanh toán</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Thoát</button>
				</div>
			</div>
		</div>
	</div>


	<!-- Modal hóa đơn-->
	<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
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
						<span class="name-customer">Phạm Trần Tiến</span>
						<div class="row">
							<div class="col col-lg-6">
								<div>Ngày lập hóa đơn: value</div>
								<div>Số hóa đơn: value</div>
								<div>Nhân viên: value</div>
							</div>
							<div class="col col-lg-6">
								<div>Số phòng: value</div>
								<div>Số người: value</div>
								<div>Số ngày: value</div>
							</div>
						</div>
						<table style="margin-top: 15px;" class="table">
							<thead>
								<tr>

									<th scope="col">Dịch vụ</th>
									<th scope="col">Giá tiền</th>
									<th scope="col">Số lượng</th>
									<th scope="col">Thành tiền</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>value</td>
									<td>value</td>
									<td>value</td>
									<td>value</td>
								</tr>
								<tr>

									<td>value</td>
									<td>value</td>
									<td>value</td>
									<td>value</td>
								</tr>
								<tr>
									<td>value</td>
									<td>value</td>
									<td>value</td>
									<td>value</td>
								</tr>
								<tr>
									<td>value</td>
									<td>value</td>
									<td>value</td>
									<td>value</td>
								</tr>
							</tbody>
						</table>
						<div class="total">
							<span>Tổng tiền: <span class="total-value">500,000
									VND</span></span>
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
					<button type="button" class="btn btn-primary">Xuất hóa đơn</button>
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