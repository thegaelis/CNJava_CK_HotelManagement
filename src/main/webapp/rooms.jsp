<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>NEXUS HOTEL</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta content="" name="keywords">
<meta content="" name="description">
<link rel="icon" type="image/x-icon" href="favicon.ico">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&family=Montserrat:wght@400;500;600;700&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">


<!-- Libraries Stylesheet -->
<link href="assets/lib/animate/animate.min.css" rel="stylesheet">
<link
	href="assets/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Icon Font Stylesheet -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- Customized Bootstrap Stylesheet -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/styles.css">
<link rel="stylesheet" href="assets/css/rooms.css">
</head>

<body>
	<div class="container-xxl bg-white p-0">
		<!-- Header Start -->
		<div class="container-fluid bg-dark px-0">
			<div class="row gx-0">
				<div class="col-lg-3 bg-dark d-none d-lg-block">
					<a routerLink="/home"
						class="navbar-brand w-100 h-100 m-0 p-0 d-flex align-items-center justify-content-center">
						<h1 class="m-0 text-primary text-uppercase">NEXUS HOTEL</h1>
					</a>
				</div>
				<div class="col-lg-9">

					<nav class="navbar navbar-expand-lg bg-dark navbar-dark p-3 p-lg-0">
						<a href="/home" class="navbar-brand d-block d-lg-none">
							<h1 class="m-0 text-primary text-uppercase">NEXUS HOTEL</h1>
						</a>
						<button type="button" class="navbar-toggler"
							data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse justify-content-between"
							id="navbarCollapse">
							<div class="navbar-nav mr-auto py-0">
								<a class="nav-item nav-link" href="index.jsp">Home</a> <a
									class="nav-item nav-link" href="about.jsp">About</a> <a
									class="nav-item nav-link" href="services.jsp">Services</a> <a
									class="nav-item nav-link active" href="rooms.jsp">Rooms</a>
								<a class="nav-item nav-link" href="BookingController">Booking</a>
								<a class="nav-item nav-link " href="ReportController">Contact</a>
							</div>
						</div>
					</nav>
				</div>
			</div>
		</div>
		<!-- Header End -->
		
		<!-- Page Header Start -->
<div class="container-fluid page-header mb-5 p-0" style="background-image: url(assets/img/carousel-1.jpg);">
    <div class="container-fluid page-header-inner py-5">
        <div class="container text-center pb-5">
            <h1 class="display-3 text-white mb-3 animated slideInDown">Rooms</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb justify-content-center text-uppercase">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Pages</a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page">Rooms</li>
                </ol>
            </nav>
        </div>
    </div>
</div>
<!-- Page Header End -->




<!-- Room Start -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
            <h6 class="section-title text-center text-primary text-uppercase">Our Rooms</h6>
            <h1 class="mb-5">Explore Our <span class="text-primary text-uppercase">Rooms</span></h1>
        </div>
        <div class="row g-4">
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                <div class="room-item shadow rounded overflow-hidden">
                    <div class="position-relative">
                        <img class="img-fluid" src="assets/img/room-1.jpg" alt="">
                        <small
                            class="position-absolute start-0 top-100 translate-middle-y bg-primary text-white rounded py-1 px-3 ms-4">$100/Night</small>
                    </div>
                    <div class="p-4 mt-2">
                        <div class="d-flex justify-content-between mb-3">
                            <h5 class="mb-0">Junior Suite</h5>
                            <div class="ps-2">
                                <small class="fa fa-star text-primary"></small>
                                <small class="fa fa-star text-primary"></small>
                                <small class="fa fa-star text-primary"></small>
                                <small class="fa fa-star text-primary"></small>
                                <small class="fa fa-star text-primary"></small>
                            </div>
                        </div>
                        <div class="d-flex mb-3">
                            <small class="border-end me-3 pe-3"><i class="fa fa-bed text-primary me-2"></i>1 Bed</small>
                            <small class="border-end me-3 pe-3"><i class="fa fa-bath text-primary me-2"></i>1
                                Bath</small>
                            <small><i class="fa fa-wifi text-primary me-2"></i>Wifi</small>
                        </div>
                        <p class="text-body mb-3">Đây là kiểu phòng Suite có độ VIP cơ bản, chất lượng dịch vụ phòng cao
                            hơn so với hạng phòng Deluxe. Junior Suite thường có 1 phòng ngủ + 1 phòng khách - thích hợp
                            phục vụ cho cặp đôi mới cưới hoặc gia đình nhỏ.</p>
                        <div class="d-flex justify-content-between">
                            <!-- <a class="btn btn-sm btn-primary rounded py-2 px-4 view-detail" href="">Xem chi tiết</a> -->
                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#staticBackdrop">
                                Xem chi tiết
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
                                data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel"
                                aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="staticBackdropLabel">Junior Suite
                                            </h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div>
                                                <div>
                                                    <div class="heading-detail">
                                                        Thông tin phòng</div>
                                                    <div class="body-detail"
                                                        style="align-items: stretch; -webkit-box-align: stretch;">
                                                        <div style="display: flex;">
                                                            <svg style="margin-right: 8px;" width="16" height="16"
                                                                viewBox="0 0 24 24" fill="none"
                                                                xmlns="http://www.w3.org/2000/svg"
                                                                data-id="IcHotelRoomMeasure">
                                                                <path
                                                                    d="M12 21H7L21 7V21H18M12 21V20M12 21H15M15 21V20M15 21H18M18 21V20M15 17H17V15"
                                                                    stroke="#0194F3" stroke-width="2"
                                                                    stroke-linecap="round" stroke-linejoin="round">
                                                                </path>
                                                                <path
                                                                    d="M8 8L9 9M8 8L5 11M8 8L11 5M5 11L6 12M5 11L2 14L5 17L17 5L14 2L11 5M11 5L12 6"
                                                                    stroke="#03121A" stroke-width="2"
                                                                    stroke-linecap="round" stroke-linejoin="round">
                                                                </path>
                                                            </svg>
                                                            <div></div>
                                                            <div>
                                                                18.0 m²
                                                            </div>
                                                        </div>
                                                        <div></div>
                                                        <div style="display: flex;">
                                                            <svg style="margin-right: 8px;"
                                                                xmlns="http://www.w3.org/2000/svg" width="16"
                                                                height="16" viewBox="0 0 24 24"
                                                                data-id="IcSystemGuestPassenger">
                                                                <g fill="none" fill-rule="evenodd">
                                                                    <rect width="24" height="24"></rect>
                                                                    <path stroke="#03121A" stroke-linecap="round"
                                                                        stroke-linejoin="round" stroke-width="2"
                                                                        d="M2,21 L13,21 L13,19.5 C13,16.4624339 10.5375661,14 7.5,14 L7.5,14 C4.46243388,14 2,16.4624339 2,19.5 L2,21 Z M7,4 L8,4 C9.65685425,4 11,5.34314575 11,7 L11,8.5 C11,10.4329966 9.43299662,12 7.5,12 L7.5,12 C5.56700338,12 4,10.4329966 4,8.5 L4,7 C4,5.34314575 5.34314575,4 7,4 Z">
                                                                    </path>
                                                                    <path stroke="#0194F3" stroke-linecap="round"
                                                                        stroke-linejoin="round" stroke-width="2"
                                                                        d="M16,19 L22,19 L22,18 C22,14.4624339 19.5581561,12 17,12 C15.6264236,12 14.7600111,12.2294943 14,13 M16,2 L16.3162278,2.9486833 C16.7245699,4.17370972 17.8709864,5 19.1622777,5 L21,5">
                                                                    </path>
                                                                    <path stroke="#0194F3" stroke-linecap="round"
                                                                        stroke-linejoin="round" stroke-width="2"
                                                                        d="M16,2 L17,2 C18.6568542,2 20,3.34314575 20,5 L20,6.5 C20,8.43299662 18.4329966,10 16.5,10 L16.5,10 C14.5670034,10 13,8.43299662 13,6.5 L13,5 C13,3.34314575 14.3431458,2 16,2 Z">
                                                                    </path>
                                                                </g>
                                                            </svg>
                                                            <div></div>
                                                            <div>
                                                                2 khách</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div></div>
                                                <div>
                                                    <div class="heading-detail">
                                                        Tính năng phòng bạn thích</div>
                                                    <div class="body-detail"
                                                        style="align-items: stretch; -webkit-box-align: stretch;">
                                                        <div>
                                                            <div style="display: flex;">
                                                                <img importance="low" loading="lazy"
                                                                    src="https://ik.imagekit.io/tvlk/image/imageResource/2023/07/27/1690451958285-43836c7e0f5321b394371359084fbb6b.png?tr=h-24,q-75,w-24"
                                                                    srcset="https://ik.imagekit.io/tvlk/image/imageResource/2023/07/27/1690451958285-43836c7e0f5321b394371359084fbb6b.png?tr=h-24,q-75,w-24 1x, https://ik.imagekit.io/tvlk/image/imageResource/2023/07/27/1690451958285-43836c7e0f5321b394371359084fbb6b.png?tr=dpr-2,h-24,q-75,w-24 2x, https://ik.imagekit.io/tvlk/image/imageResource/2023/07/27/1690451958285-43836c7e0f5321b394371359084fbb6b.png?tr=dpr-3,h-24,q-75,w-24 3x"
                                                                    decoding="async" width="24" height="24"
                                                                    style="object-fit: fill; object-position: 50% 50%; margin-right: 8px;">
                                                                <div></div>
                                                                <div>
                                                                    Vòi tắm đứng</div>
                                                            </div>
                                                        </div>
                                                        <div style="padding-bottom: 8px;"></div>
                                                        <div>
                                                            <div style="display: flex;">
                                                                <img importance="low" loading="lazy"
                                                                    src="https://s3-ap-southeast-1.amazonaws.com/cntres-assets-ap-southeast-1-250226768838-cf675839782fd369/imageResource/2018/08/13/1534147303404-6f86a86f6f3621d3c9954aeb5b87aa7a.png"
                                                                    decoding="async" width="24" height="24"
                                                                    style="object-fit: fill; object-position: 50% 50%; margin-right: 8px;">
                                                                <div></div>
                                                                <div>
                                                                    Máy lạnh</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div></div>
                                                <div>
                                                    <div class="heading-detail">
                                                        Tiện nghi phòng</div>
                                                    <ul class="body-detail"
                                                        style="display: grid; grid-template-columns: repeat(2, minmax(122px, 1fr)); row-gap: 4px; padding-left: 16px; margin: 0px;">
                                                        <li style="padding-right: 24px;">
                                                            <div>
                                                                Máy lạnh</div>
                                                        </li>
                                                        <li style="padding-right: 0px;">
                                                            <div>
                                                                Nước đóng chai miễn phí</div>
                                                        </li>
                                                        <li style="padding-right: 24px;">
                                                            <div>
                                                                TV</div>
                                                        </li>
                                                        <li style="padding-right: 0px;">
                                                            <div>
                                                                Bàn làm việc</div>
                                                        </li>

                                                    </ul>
                                                    <div style="max-height: 0px;">
                                                        <div>
                                                            <ul
                                                                style="display: grid; grid-template-columns: repeat(2, minmax(122px, 1fr)); row-gap: 4px; padding-left: 16px; margin: 0px;">
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div></div>
                                                <div>
                                                    <div class="heading-detail">
                                                        Tiện nghi phòng tắm</div>
                                                    <ul class="body-detail"
                                                        style="display: grid; grid-template-columns: repeat(2, minmax(122px, 1fr)); row-gap: 4px; padding-left: 16px; margin: 0px;">
                                                        <li style="padding-right: 24px;">
                                                            <div>
                                                                Phòng tắm riêng</div>
                                                        </li>
                                                        <li style="padding-right: 0px;">
                                                            <div>
                                                                Vòi tắm đứng</div>
                                                        </li>
                                                        <li style="padding-right: 24px;">
                                                            <div>
                                                                Bộ vệ sinh cá nhân</div>
                                                        </li>
                                                        <li style="padding-right: 0px;">
                                                            <div>
                                                                Máy sấy tóc</div>
                                                        </li>
                                                    </ul>
                                                    <div style="max-height: 0px;">
                                                        <div>
                                                            <ul
                                                                style="display: grid; grid-template-columns: repeat(2, minmax(122px, 1fr)); row-gap: 4px; padding-left: 16px; margin: 0px;">
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button"
                                                class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a class="btn btn-sm btn-dark rounded py-2 px-4" href="">Book Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.6s">
                <div class="room-item shadow rounded overflow-hidden">
                    <div class="position-relative">
                        <img class="img-fluid" src="assets/img/room-3.jpg" alt="">
                        <small
                            class="position-absolute start-0 top-100 translate-middle-y bg-primary text-white rounded py-1 px-3 ms-4">$100/Night</small>
                    </div>
                    <div class="p-4 mt-2">
                        <div class="d-flex justify-content-between mb-3">
                            <h5 class="mb-0">Super Deluxe</h5>
                            <div class="ps-2">
                                <small class="fa fa-star text-primary"></small>
                                <small class="fa fa-star text-primary"></small>
                                <small class="fa fa-star text-primary"></small>
                                <small class="fa fa-star text-primary"></small>
                                <small class="fa fa-star text-primary"></small>
                            </div>
                        </div>
                        <div class="d-flex mb-3">
                            <small class="border-end me-3 pe-3"><i class="fa fa-bed text-primary me-2"></i>2 Bed</small>
                            <small class="border-end me-3 pe-3"><i class="fa fa-bath text-primary me-2"></i>2
                                Bath</small>
                            <small><i class="fa fa-wifi text-primary me-2"></i>Wifi</small>
                        </div>
                        <p class="text-body mb-3">Loại phòng này thường ở trên tầng cao với chất lượng tốt hơn phòng
                            Superior. Phòng Deluxe có diện tích rộng, có tầm nhìn đẹp với các trang thiết bị cao cấp và
                            vì thế mà mức giá phòng DLX sẽ cao hơn SUP.</p>
                        <div class="d-flex justify-content-between">
                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#staticBackdrop2">
                                Xem chi tiết
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static"
                                data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel"
                                aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="staticBackdropLabel">Super Deluxe</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div>
                                                <div>
                                                    <div class="heading-detail">
                                                        Thông tin phòng</div>
                                                    <div class="body-detail"
                                                        style="align-items: stretch; -webkit-box-align: stretch;">
                                                        <div style="display: flex;">
                                                            <svg style="margin-right: 8px;" width="16" height="16"
                                                                viewBox="0 0 24 24" fill="none"
                                                                xmlns="http://www.w3.org/2000/svg"
                                                                data-id="IcHotelRoomMeasure">
                                                                <path
                                                                    d="M12 21H7L21 7V21H18M12 21V20M12 21H15M15 21V20M15 21H18M18 21V20M15 17H17V15"
                                                                    stroke="#0194F3" stroke-width="2"
                                                                    stroke-linecap="round" stroke-linejoin="round">
                                                                </path>
                                                                <path
                                                                    d="M8 8L9 9M8 8L5 11M8 8L11 5M5 11L6 12M5 11L2 14L5 17L17 5L14 2L11 5M11 5L12 6"
                                                                    stroke="#03121A" stroke-width="2"
                                                                    stroke-linecap="round" stroke-linejoin="round">
                                                                </path>
                                                            </svg>
                                                            <div></div>
                                                            <div>
                                                                50.0 m²
                                                            </div>
                                                        </div>
                                                        <div></div>
                                                        <div style="display: flex;">
                                                            <svg style="margin-right: 8px;"
                                                                xmlns="http://www.w3.org/2000/svg" width="16"
                                                                height="16" viewBox="0 0 24 24"
                                                                data-id="IcSystemGuestPassenger">
                                                                <g fill="none" fill-rule="evenodd">
                                                                    <rect width="24" height="24"></rect>
                                                                    <path stroke="#03121A" stroke-linecap="round"
                                                                        stroke-linejoin="round" stroke-width="2"
                                                                        d="M2,21 L13,21 L13,19.5 C13,16.4624339 10.5375661,14 7.5,14 L7.5,14 C4.46243388,14 2,16.4624339 2,19.5 L2,21 Z M7,4 L8,4 C9.65685425,4 11,5.34314575 11,7 L11,8.5 C11,10.4329966 9.43299662,12 7.5,12 L7.5,12 C5.56700338,12 4,10.4329966 4,8.5 L4,7 C4,5.34314575 5.34314575,4 7,4 Z">
                                                                    </path>
                                                                    <path stroke="#0194F3" stroke-linecap="round"
                                                                        stroke-linejoin="round" stroke-width="2"
                                                                        d="M16,19 L22,19 L22,18 C22,14.4624339 19.5581561,12 17,12 C15.6264236,12 14.7600111,12.2294943 14,13 M16,2 L16.3162278,2.9486833 C16.7245699,4.17370972 17.8709864,5 19.1622777,5 L21,5">
                                                                    </path>
                                                                    <path stroke="#0194F3" stroke-linecap="round"
                                                                        stroke-linejoin="round" stroke-width="2"
                                                                        d="M16,2 L17,2 C18.6568542,2 20,3.34314575 20,5 L20,6.5 C20,8.43299662 18.4329966,10 16.5,10 L16.5,10 C14.5670034,10 13,8.43299662 13,6.5 L13,5 C13,3.34314575 14.3431458,2 16,2 Z">
                                                                    </path>
                                                                </g>
                                                            </svg>
                                                            <div></div>
                                                            <div>
                                                                4 khách</div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div>
                                                    <div class="heading-detail">
                                                        Tính năng phòng bạn thích</div>
                                                    <div class="body-detail"
                                                        style="align-items: stretch; -webkit-box-align: stretch;">
                                                        <div>
                                                            <div style="display: flex;">
                                                                <img importance="low" loading="lazy"
                                                                    src="https://ik.imagekit.io/tvlk/image/imageResource/2023/07/27/1690451958285-43836c7e0f5321b394371359084fbb6b.png?tr=h-24,q-75,w-24"
                                                                    srcset="https://ik.imagekit.io/tvlk/image/imageResource/2023/07/27/1690451958285-43836c7e0f5321b394371359084fbb6b.png?tr=h-24,q-75,w-24 1x, https://ik.imagekit.io/tvlk/image/imageResource/2023/07/27/1690451958285-43836c7e0f5321b394371359084fbb6b.png?tr=dpr-2,h-24,q-75,w-24 2x, https://ik.imagekit.io/tvlk/image/imageResource/2023/07/27/1690451958285-43836c7e0f5321b394371359084fbb6b.png?tr=dpr-3,h-24,q-75,w-24 3x"
                                                                    decoding="async" width="24" height="24"
                                                                    style="object-fit: fill; object-position: 50% 50%; margin-right: 8px;">
                                                                <div></div>
                                                                <div>
                                                                    Vòi tắm đứng</div>
                                                            </div>
                                                        </div>
                                                        <div style="padding-bottom: 8px;"></div>
                                                        <div>
                                                            <div style="display: flex;">
                                                                <img importance="low" loading="lazy"
                                                                    src="https://s3-ap-southeast-1.amazonaws.com/cntres-assets-ap-southeast-1-250226768838-cf675839782fd369/imageResource/2018/08/13/1534147303404-6f86a86f6f3621d3c9954aeb5b87aa7a.png"
                                                                    decoding="async" width="24" height="24"
                                                                    style="object-fit: fill; object-position: 50% 50%; margin-right: 8px;">
                                                                <div></div>
                                                                <div>
                                                                    Máy lạnh</div>
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <div style="display: flex; margin-top: 8px;">
                                                                <img importance="low" loading="lazy"
                                                                    src="https://s3-ap-southeast-1.amazonaws.com/cntres-assets-ap-southeast-1-250226768838-cf675839782fd369/imageResource/2018/08/13/1534147489460-b62e4ca2f5c93564882ab0fbea1d16f0.png"
                                                                    decoding="async" width="24" height="24"
                                                                    style="object-fit: fill; object-position: 50% 50%; margin-right: 8px;">
                                                                <div class="css-1dbjc4n r-1pyaxff"></div>
                                                                <div>
                                                                    Nước nóng</div>
                                                            </div>
                                                        </div>
                                                        <div style="padding-bottom: 8px;"></div>
                                                        <div>
                                                            <div style="display: flex;">
                                                                <img importance="low" loading="lazy"
                                                                    src="https://s3-ap-southeast-1.amazonaws.com/cntres-assets-ap-southeast-1-250226768838-cf675839782fd369/imageResource/2018/08/03/1533288223894-bfc04d321424d07300ef7b2cd3c6fb2a.png"
                                                                    decoding="async" width="24" height="24"
                                                                    style="object-fit: fill; object-position: 50% 50%; margin-right: 8px;">
                                                                <div></div>
                                                                <div>
                                                                    Tủ lạnh</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div></div>
                                                <div>
                                                    <div class="heading-detail">
                                                        Tiện nghi phòng</div>
                                                    <ul class="body-detail"
                                                        style="display: grid; grid-template-columns: repeat(2, minmax(122px, 1fr)); row-gap: 4px; padding-left: 16px; margin: 0px;">
                                                        <li style="padding-right: 24px;">
                                                            <div>
                                                                Máy lạnh</div>
                                                        </li>
                                                        <li style="padding-right: 0px;">
                                                            <div>
                                                                Nước đóng chai miễn phí</div>
                                                        </li>
                                                        <li style="padding-right: 24px;">
                                                            <div>
                                                                TV</div>
                                                        </li>
                                                        <li style="padding-right: 0px;">
                                                            <div>
                                                                Bàn làm việc</div>
                                                        </li>

                                                        <li style="padding-right: 8px;">
                                                            <div>
                                                                Quầy bar mini</div>
                                                        </li>

                                                        <li style="padding-right: 0px;">
                                                            <div>
                                                                Tủ lạnh
                                                            </div>
                                                        </li>

                                                    </ul>
                                                    <div style="max-height: 0px;">
                                                        <div>
                                                            <ul
                                                                style="display: grid; grid-template-columns: repeat(2, minmax(122px, 1fr)); row-gap: 4px; padding-left: 16px; margin: 0px;">
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div></div>
                                                <div>
                                                    <div class="heading-detail">
                                                        Tiện nghi phòng tắm</div>
                                                    <ul class="body-detail"
                                                        style="display: grid; grid-template-columns: repeat(2, minmax(122px, 1fr)); row-gap: 4px; padding-left: 16px; margin: 0px;">
                                                        <li style="padding-right: 24px;">
                                                            <div>
                                                                Phòng tắm riêng</div>
                                                        </li>
                                                        <li style="padding-right: 0px;">
                                                            <div>
                                                                Vòi tắm đứng</div>
                                                        </li>
                                                        <li style="padding-right: 24px;">
                                                            <div>
                                                                Bộ vệ sinh cá nhân</div>
                                                        </li>
                                                        <li style="padding-right: 0px;">
                                                            <div>
                                                                Máy sấy tóc</div>
                                                        </li>
                                                    </ul>
                                                    <div style="max-height: 0px;">
                                                        <div>
                                                            <ul
                                                                style="display: grid; grid-template-columns: repeat(2, minmax(122px, 1fr)); row-gap: 4px; padding-left: 16px; margin: 0px;">
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">Close</button>
                                                
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a class="btn btn-sm btn-dark rounded py-2 px-4" href="">Book Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                <div class="room-item shadow rounded overflow-hidden">
                    <div class="position-relative">
                        <img class="img-fluid" src="assets/img/room-2.jpg" alt="">
                        <small
                            class="position-absolute start-0 top-100 translate-middle-y bg-primary text-white rounded py-1 px-3 ms-4">$100/Night</small>
                    </div>
                    <div class="p-4 mt-2">
                        <div class="d-flex justify-content-between mb-3">
                            <h5 class="mb-0">Executive Suite</h5>
                            <div class="ps-2">
                                <small class="fa fa-star text-primary"></small>
                                <small class="fa fa-star text-primary"></small>
                                <small class="fa fa-star text-primary"></small>
                                <small class="fa fa-star text-primary"></small>
                                <small class="fa fa-star text-primary"></small>
                            </div>
                        </div>
                        <div class="d-flex mb-3">
                            <small class="border-end me-3 pe-3"><i class="fa fa-bed text-primary me-2"></i>3 Bed</small>
                            <small class="border-end me-3 pe-3"><i class="fa fa-bath text-primary me-2"></i>2
                                Bath</small>
                            <small><i class="fa fa-wifi text-primary me-2"></i>Wifi</small>
                        </div>
                        <p class="text-body mb-3">Là kiểu phòng có mức giá đắt đỏ nhất khách sạn. Thường thì mỗi khách
                            sạn 5 sao sẽ chỉ có 1 phòng Executive Suite. Vì có diện tích lớn nhất nên thiết kế phòng
                            không chỉ có phòng khách, 2 đến 3 phòng ngủ mà còn có phòng họp</p>
                        <div class="d-flex justify-content-between">
                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#staticBackdrop3">
                                Xem chi tiết
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="staticBackdrop3" data-bs-backdrop="static"
                                data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel"
                                aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="staticBackdropLabel">Executive Suite</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div>
                                                <div>
                                                    <div class="heading-detail">
                                                        Thông tin phòng</div>
                                                    <div class="body-detail"
                                                        style="align-items: stretch; -webkit-box-align: stretch;">
                                                        <div style="display: flex;">
                                                            <svg style="margin-right: 8px;" width="16" height="16"
                                                                viewBox="0 0 24 24" fill="none"
                                                                xmlns="http://www.w3.org/2000/svg"
                                                                data-id="IcHotelRoomMeasure">
                                                                <path
                                                                    d="M12 21H7L21 7V21H18M12 21V20M12 21H15M15 21V20M15 21H18M18 21V20M15 17H17V15"
                                                                    stroke="#0194F3" stroke-width="2"
                                                                    stroke-linecap="round" stroke-linejoin="round">
                                                                </path>
                                                                <path
                                                                    d="M8 8L9 9M8 8L5 11M8 8L11 5M5 11L6 12M5 11L2 14L5 17L17 5L14 2L11 5M11 5L12 6"
                                                                    stroke="#03121A" stroke-width="2"
                                                                    stroke-linecap="round" stroke-linejoin="round">
                                                                </path>
                                                            </svg>
                                                            <div></div>
                                                            <div>
                                                                90.0 m²
                                                            </div>
                                                        </div>
                                                        <div></div>
                                                        <div style="display: flex;">
                                                            <svg style="margin-right: 8px;"
                                                                xmlns="http://www.w3.org/2000/svg" width="16"
                                                                height="16" viewBox="0 0 24 24"
                                                                data-id="IcSystemGuestPassenger">
                                                                <g fill="none" fill-rule="evenodd">
                                                                    <rect width="24" height="24"></rect>
                                                                    <path stroke="#03121A" stroke-linecap="round"
                                                                        stroke-linejoin="round" stroke-width="2"
                                                                        d="M2,21 L13,21 L13,19.5 C13,16.4624339 10.5375661,14 7.5,14 L7.5,14 C4.46243388,14 2,16.4624339 2,19.5 L2,21 Z M7,4 L8,4 C9.65685425,4 11,5.34314575 11,7 L11,8.5 C11,10.4329966 9.43299662,12 7.5,12 L7.5,12 C5.56700338,12 4,10.4329966 4,8.5 L4,7 C4,5.34314575 5.34314575,4 7,4 Z">
                                                                    </path>
                                                                    <path stroke="#0194F3" stroke-linecap="round"
                                                                        stroke-linejoin="round" stroke-width="2"
                                                                        d="M16,19 L22,19 L22,18 C22,14.4624339 19.5581561,12 17,12 C15.6264236,12 14.7600111,12.2294943 14,13 M16,2 L16.3162278,2.9486833 C16.7245699,4.17370972 17.8709864,5 19.1622777,5 L21,5">
                                                                    </path>
                                                                    <path stroke="#0194F3" stroke-linecap="round"
                                                                        stroke-linejoin="round" stroke-width="2"
                                                                        d="M16,2 L17,2 C18.6568542,2 20,3.34314575 20,5 L20,6.5 C20,8.43299662 18.4329966,10 16.5,10 L16.5,10 C14.5670034,10 13,8.43299662 13,6.5 L13,5 C13,3.34314575 14.3431458,2 16,2 Z">
                                                                    </path>
                                                                </g>
                                                            </svg>
                                                            <div></div>
                                                            <div>
                                                                6 khách</div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div>
                                                    <div class="heading-detail">
                                                        Tính năng phòng bạn thích</div>
                                                    <div class="body-detail"
                                                        style="align-items: stretch; -webkit-box-align: stretch;">
                                                        <div>
                                                            <div style="display: flex;">
                                                                <img importance="low" loading="lazy"
                                                                    src="https://ik.imagekit.io/tvlk/image/imageResource/2023/07/27/1690451958285-43836c7e0f5321b394371359084fbb6b.png?tr=h-24,q-75,w-24"
                                                                    srcset="https://ik.imagekit.io/tvlk/image/imageResource/2023/07/27/1690451958285-43836c7e0f5321b394371359084fbb6b.png?tr=h-24,q-75,w-24 1x, https://ik.imagekit.io/tvlk/image/imageResource/2023/07/27/1690451958285-43836c7e0f5321b394371359084fbb6b.png?tr=dpr-2,h-24,q-75,w-24 2x, https://ik.imagekit.io/tvlk/image/imageResource/2023/07/27/1690451958285-43836c7e0f5321b394371359084fbb6b.png?tr=dpr-3,h-24,q-75,w-24 3x"
                                                                    decoding="async" width="24" height="24"
                                                                    style="object-fit: fill; object-position: 50% 50%; margin-right: 8px;">
                                                                <div></div>
                                                                <div>
                                                                    Vòi tắm đứng</div>
                                                            </div>
                                                        </div>
                                                        <div style="padding-bottom: 8px;"></div>
                                                        <div>
                                                            <div style="display: flex;">
                                                                <img importance="low" loading="lazy"
                                                                    src="https://s3-ap-southeast-1.amazonaws.com/cntres-assets-ap-southeast-1-250226768838-cf675839782fd369/imageResource/2018/08/13/1534147303404-6f86a86f6f3621d3c9954aeb5b87aa7a.png"
                                                                    decoding="async" width="24" height="24"
                                                                    style="object-fit: fill; object-position: 50% 50%; margin-right: 8px;">
                                                                <div></div>
                                                                <div>
                                                                    Máy lạnh</div>
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <div style="display: flex; margin-top: 8px;">
                                                                <img importance="low" loading="lazy"
                                                                    src="https://s3-ap-southeast-1.amazonaws.com/cntres-assets-ap-southeast-1-250226768838-cf675839782fd369/imageResource/2018/08/13/1534147489460-b62e4ca2f5c93564882ab0fbea1d16f0.png"
                                                                    decoding="async" width="24" height="24"
                                                                    style="object-fit: fill; object-position: 50% 50%; margin-right: 8px;">
                                                                <div class="css-1dbjc4n r-1pyaxff"></div>
                                                                <div>
                                                                    Nước nóng</div>
                                                            </div>
                                                        </div>
                                                        <div style="padding-bottom: 8px;"></div>
                                                        <div>
                                                            <div style="display: flex;">
                                                                <img importance="low" loading="lazy"
                                                                    src="https://s3-ap-southeast-1.amazonaws.com/cntres-assets-ap-southeast-1-250226768838-cf675839782fd369/imageResource/2018/08/03/1533288223894-bfc04d321424d07300ef7b2cd3c6fb2a.png"
                                                                    decoding="async" width="24" height="24"
                                                                    style="object-fit: fill; object-position: 50% 50%; margin-right: 8px;">
                                                                <div></div>
                                                                <div>
                                                                    Tủ lạnh</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div></div>
                                                <div>
                                                    <div class="heading-detail">
                                                        Tiện nghi phòng</div>
                                                    <ul class="body-detail"
                                                        style="display: grid; grid-template-columns: repeat(2, minmax(122px, 1fr)); row-gap: 4px; padding-left: 16px; margin: 0px;">
                                                        <li style="padding-right: 24px;">
                                                            <div>
                                                                Máy lạnh</div>
                                                        </li>
                                                        <li style="padding-right: 0px;">
                                                            <div>
                                                                Nước đóng chai miễn phí</div>
                                                        </li>
                                                        <li style="padding-right: 24px;">
                                                            <div>
                                                                TV</div>
                                                        </li>
                                                        <li style="padding-right: 0px;">
                                                            <div>
                                                                Bàn làm việc</div>
                                                        </li>

                                                        <li style="padding-right: 8px;">
                                                            <div>
                                                                Quầy bar mini</div>
                                                        </li>

                                                        <li style="padding-right: 0px;">
                                                            <div>
                                                                Tủ lạnh
                                                            </div>
                                                        </li>

                                                    </ul>
                                                    <div style="max-height: 0px;">
                                                        <div>
                                                            <ul
                                                                style="display: grid; grid-template-columns: repeat(2, minmax(122px, 1fr)); row-gap: 4px; padding-left: 16px; margin: 0px;">
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div></div>
                                                <div>
                                                    <div class="heading-detail">
                                                        Tiện nghi phòng tắm</div>
                                                    <ul class="body-detail"
                                                        style="display: grid; grid-template-columns: repeat(2, minmax(122px, 1fr)); row-gap: 4px; padding-left: 16px; margin: 0px;">
                                                        <li style="padding-right: 24px;">
                                                            <div>
                                                                Phòng tắm riêng</div>
                                                        </li>
                                                        <li style="padding-right: 0px;">
                                                            <div>
                                                                Vòi tắm đứng</div>
                                                        </li>
                                                        <li style="padding-right: 24px;">
                                                            <div>
                                                                Bộ vệ sinh cá nhân</div>
                                                        </li>
                                                        <li style="padding-right: 0px;">
                                                            <div>
                                                                Máy sấy tóc</div>
                                                        </li>

                                                        <li style="padding-right: 8px;">
                                                            <div>
                                                                Áo choàng tắm
                                                            </div>
                                                        </li>
                                                    </ul>
                                                    <div style="max-height: 0px;">
                                                        <div>
                                                            <ul
                                                                style="display: grid; grid-template-columns: repeat(2, minmax(122px, 1fr)); row-gap: 4px; padding-left: 16px; margin: 0px;">
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">Close</button>
                                          
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a class="btn btn-sm btn-dark rounded py-2 px-4" href="">Book Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Room End -->

<!-- Newsletter Start -->
<div class="container newsletter mt-5 wow fadeIn" data-wow-delay="0.1s">
    <div class="row justify-content-center">
        <div class="col-lg-10 border rounded p-1">
            <div class="border rounded text-center p-1">
                <div class="bg-white rounded text-center p-5">
                    <h4 class="mb-4">Subscribe Our <span class="text-primary text-uppercase">Newsletter</span></h4>
                    <div class="position-relative mx-auto" style="max-width: 400px;">
                        <input class="form-control w-100 py-3 ps-4 pe-5" type="text" placeholder="Enter your email">
                        <button type="button"
                            class="btn btn-primary py-2 px-3 position-absolute top-0 end-0 mt-2 me-2">Submit</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Newsletter Start -->





<!-- Back to Top -->
<a  class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

		<!-- Footer Start -->
		<div class="container-fluid bg-dark text-light footer wow fadeIn"
			data-wow-delay="0.1s">
			<div class="container pb-5">
				<div class="row g-5">
					<div class="col-md-6 col-lg-4">
						<div class="bg-primary rounded p-4">
							<a><h1 class="text-white text-uppercase mb-3">NEXUS
									HOTEL</h1></a>
							<p class="text-white mb-0">Chúng tôi cam kết mang đến cho
								khách hàng trải nghiệm khách sạn vượt trội. Từ không gian đẳng
								cấp đến dịch vụ tận tâm để mỗi khách hàng cảm nhận được sự khác
								biệt.</p>
						</div>
					</div>
					<div class="col-md-6 col-lg-3">
						<h6
							class="section-title text-start text-primary text-uppercase mb-4">Contact</h6>
						<p class="mb-2">
							<i class="fa fa-map-marker-alt me-3"></i>123 Street, New York,
							USA
						</p>
						<p class="mb-2">
							<i class="fa-solid fa-phone me-3"></i>+012 345 67890
						</p>
						<p class="mb-2">
							<i class="fa fa-envelope me-3"></i>info@example.com
						</p>
						<div class="d-flex pt-2">
							<a class="btn btn-outline-light btn-social" href=""><i
								class="fab fa-twitter"></i></a> <a
								class="btn btn-outline-light btn-social" href=""><i
								class="fab fa-facebook-f"></i></a> <a
								class="btn btn-outline-light btn-social" href=""><i
								class="fab fa-youtube"></i></a> <a
								class="btn btn-outline-light btn-social" href=""><i
								class="fab fa-linkedin-in"></i></a>
						</div>
					</div>
					<div class="col-lg-5 col-md-12">
						<div class="row gy-5 g-4">
							<div class="col-md-6">
								<h6
									class="section-title text-start text-primary text-uppercase mb-4">Company</h6>
								<a class="btn btn-link" >About Us</a> <a
									class="btn btn-link" >Contact Us</a> <a
									class="btn btn-link" >Privacy Policy</a> <a
									class="btn btn-link" >Terms & Condition</a> <a
									class="btn btn-link" >Support</a>
							</div>
							<div class="col-md-6">
								<h6
									class="section-title text-start text-primary text-uppercase mb-4">Services</h6>
								<a class="btn btn-link" >Food & Restaurant</a> <a
									class="btn btn-link" >Spa & Fitness</a> <a
									class="btn btn-link" >Sports & Gaming</a> <a
									class="btn btn-link" >Event & Party</a> <a
									class="btn btn-link" >GYM & Yoga</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="copyright">
					<div class="row">
						<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
							&copy; <a class="border-bottom" >NEXUS
								HOTEL</a>, All Right Reserved.
						</div>
						<div class="col-md-6 text-center text-md-end">
							<div class="footer-menu">
								<a >Home</a> <a >Cookies</a> <a
									>Help</a> <a >FQAs</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer End -->
	</div>

</body>
<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="assets/lib/wow/wow.min.js"></script>
<script src="assets/lib/easing/easing.min.js"></script>
<script src="assets/lib/waypoints/waypoints.min.js"></script>
<script src="assets/lib/counterup/counterup.min.js"></script>
<script src="assets/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="assets/lib/tempusdominus/js/moment.min.js"></script>
<script src="assets/lib/tempusdominus/js/moment-timezone.min.js"></script>
<script
	src="assets/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

<script src="assets/js/main.js"></script>
<script src="assets/js/animation-tes.js"></script>
</html>