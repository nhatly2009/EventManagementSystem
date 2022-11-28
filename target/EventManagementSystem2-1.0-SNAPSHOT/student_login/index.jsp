<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Home page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <%@include file="css.jsp" %>

    </head>
    <body>
        <%@include file="navbar.jsp" %>

        <!-- END nav -->
        <%
           
            String imageSuccess = (String) session.getAttribute("imageSuccess");
            if (imageSuccess != null) {
        %>
        <script>
            alert("<%=imageSuccess%>");
        </script>
        <%
            }
            session.removeAttribute("imageSuccess");
        %>
        <div class="hero-wrap">
            <div class="overlay"></div>
            <div class="container-fluid">
                <div class="slider-text d-md-flex align-items-center" data-scrollax-parent="true">

                    <div class="one-forth ftco-animate align-self-md-center" data-scrollax=" properties: { translateY: '70%' }">
                        <h1 class="mb-4">
                            Welcome to <strong class="typewrite" data-period="4000"
                                               data-type='[ "Event Management Page","Event Management Page"]'>
                                <span class="wrap"></span>
                            </strong>
                        </h1>
                        <p class="mb-md-5 mb-sm-3" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"></p>
                        <!--<p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><a href="Homepage?mode=loginForm" class="btn btn-primary px-4 py-3">Logout</a> <a href="Register?mode=registerForm" class="btn btn-primary btn-outline-primary px-4 py-3">Sign up</a></p>-->
                    </div>
                    <div class="one-half align-self-md-end align-self-sm-center">
                        <div class="slider-carousel owl-carousel">
                            <div class="item">
                                <img src="images/dashboard_full_1.png" class="img-fluid img"alt="">
                            </div>
                            <div class="item">
                                <img src="images/dashboard_full_2.png" class="img-fluid img"alt="">
                            </div>
                            <div class="item">
                                <img src="images/dashboard_full_3.png" class="img-fluid img"alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <section class="ftco-section ftco-section-2">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <h3 class="heading-white">We Provide High Quality Services</h3>
                    </div>
                </div>
            </div>
        </section>



        <footer class="ftco-footer ftco-bg-dark ftco-section">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-md-3">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Event Management</h2>
                            <p>Place to join in events in Binh Duong</p>
                        </div>
                        <ul class="ftco-footer-social list-unstyled float-md-left float-lft ">
                            <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                            <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                            <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                        </ul>
                    </div>

                    <div class="col-md-6 pr-md-6">
                        <div class="ftco-footer-widget mb-6">
                            <h2 class="ftco-heading-2">Recent Blog</h2>

                            <div class="block-21 mb-4 d-flex">
                                <a class="blog-img mr-4" style="background-image: url(images/image_1.jpg);"></a>
                                <div class="text">
                                    <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about</a></h3>
                                    <div class="meta">
                                        <div><a href="#"><span class="icon-calendar"></span> Sept 15, 2018</a></div>
                                        <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                                        <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                                    </div>
                                </div>
                            </div>

                            <div class="block-21 mb-4 d-flex">
                                <a class="blog-img mr-4" style="background-image: url(images/image_2.jpg);"></a>
                                <div class="text">
                                    <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about</a></h3>
                                    <div class="meta">
                                        <div><a href="#"><span class="icon-calendar"></span> Sept 15, 2018</a></div>
                                        <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                                        <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Contact Info</h2>
                            <div class="block-23 mb-3">
                                <ul>
                                    <li><span class="icon icon-map-marker"></span><span class="text">Thu Dau Mot City, Binh Duong Province</span></li>
                                    <li><a href="#"><span class="icon icon-phone"></span><span class="text">0799 200 999</span></a></li>
                                    <li><a href="#"><span class="icon icon-envelope"></span><span class="text">nhat.ly.set17@eiu.edu.vn</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </footer>



        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

        <%@include file="script.jsp" %>


    </body>
</html>