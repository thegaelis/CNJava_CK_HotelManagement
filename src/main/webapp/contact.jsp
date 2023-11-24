<%@page import="BEAN.Report"%>
<%@page import="java.util.List"%>

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
									class="nav-item nav-link" href="rooms.jsp">Rooms</a>
								<a class="nav-item nav-link" href="BookingController">Booking</a>
								<a class="nav-item nav-link active" href="ReportController">Contact</a>
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
                <h1 class="display-3 text-white mb-3 animated slideInDown">Contact</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb justify-content-center text-uppercase">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Pages</a></li>
                        <li class="breadcrumb-item text-white active" aria-current="page">Contact</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
    <!-- Page Header End -->





    <!-- Contact Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title text-center text-primary text-uppercase">Contact Us</h6>
                <h1 class="mb-5"><span class="text-primary text-uppercase">Contact</span> For Any Query</h1>
            </div>
            <div class="row g-4">
                <div class="col-12">
                    <div class="row gy-4">
                        <div class="col-md-4">
                            <h6 class="section-title text-start text-primary text-uppercase">Booking</h6>
                            <p><i class="fa fa-envelope-open text-primary me-2"></i>book@example.com</p>
                        </div>
                        <div class="col-md-4">
                            <h6 class="section-title text-start text-primary text-uppercase">General</h6>
                            <p><i class="fa fa-envelope-open text-primary me-2"></i>info@example.com</p>
                        </div>
                        <div class="col-md-4">
                            <h6 class="section-title text-start text-primary text-uppercase">Technical</h6>
                            <p><i class="fa fa-envelope-open text-primary me-2"></i>tech@example.com</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 wow fadeIn" data-wow-delay="0.1s">
                    <iframe class="position-relative rounded w-100 h-100"
                        src="https://www.google.com/maps/embed/v1/place?q=Trường+Đại+học+Sư+phạm+Thành+phố+Hồ+Chí+Minh,+Đường+An+Đường+Vương,+phường+4,+Quận+5,+Thành+phố+Hồ+Chí+Minh,+Việt+Nam&key=AIzaSyBFw0Qbyq9zTFTd-tUY6dZWTgaQzuU17R8"
                        frameborder="0" style="min-height: 350px; border:0;" allowfullscreen="" aria-hidden="false"
                        tabindex="0"></iframe>
                </div>
                <div class="col-md-6">
                    <div class="wow fadeInUp" data-wow-delay="0.2s">
                        <form action="ReportController" method="post">
                        <p class="text-danger text-center"><%=request.getAttribute("msg")!=null?request.getAttribute("msg"):""%></p>
                            <div class="row g-3">
                                
                                <div class="col-md-12">
                                    <div class="form-floating">
                                        <input type="email" class="form-control" id="email" placeholder="Your Email" name="email">
                                        <label for="email">Your Email</label>
                                    </div>
                                </div>
                                
                                <div class="col-12">
                                    <div class="form-floating">
                                        <textarea class="form-control" placeholder="Leave a message here" id="text" style="height: 150px" name="text"></textarea>
                                        <label for="message">Message</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button class="btn btn-primary w-100 py-3" type="submit" id="btn">Send Message</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact End -->
    
    
    
     <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title text-center text-primary text-uppercase">Comments</h6>
                <h1 class="mb-5"><span class="text-primary text-uppercase">NEXUS</span> HOTEL</h1>
            </div>
            <div class="row g-4">
                <div class="col-12">
                   <div class="row d-flex justify-content-center">
					  <div class="col-md-8 col-lg-6">
					    <div class="card shadow-0 border" style="background-color: #f0f2f5;">
					      <div class="card-body p-4">
					       
					
					        <%
					        	List<Report> list = (List<Report>) request.getAttribute("list");
					        	for(Report rp :list){
					        		
					        	
					        %>
					        	<div class="card mb-4">
					          <div class="card-body">
					            <p><%=rp.getText() %></p>
					
					            <div class="d-flex justify-content-between">
					              <div class="d-flex flex-row align-items-center">
					                
					                <p class="small mb-0 ">Email: <%=rp.getEmail()%></p>
					              </div>
					              
					            </div>
					          </div>
					        </div>
							<%} %>
					        
					      </div>
					    </div>
					  </div>
					</div>
                </div>
              
               
            </div>
        </div>
    </div>


    <!-- Newsletter Start -->
    <div class="container newsletter mt-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="row justify-content-center">
            <div class="col-lg-10 border rounded p-1">
                <div class="border rounded text-center p-1">
                    <div class="bg-white rounded text-center p-5">
                        <h4 class="mb-4">Subscribe Our <span class="text-primary text-uppercase">Newsletter</span></h4>
                        <div class="position-relative mx-auto" style="max-width: 400px;">
                            <input class="form-control w-100 py-3 ps-4 pe-5" type="text" placeholder="Enter your email">
                            <button type="button" class="btn btn-primary py-2 px-3 position-absolute top-0 end-0 mt-2 me-2">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Newsletter Start -->
    

    


    <!-- Back to Top -->
    <a routerLink="/contact" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

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

<script type="text/javascript">

	var btn= document.getElementById("btn")
	var email= document.getElementById("email")
	var text= document.getElementById("text")
	
	btn.onclick= function(e){
		if(!email.value ||!text.value){
			e.preventDefault()
			alert("Please fill input")
		}
		
	}
	
	
</script>

</html>