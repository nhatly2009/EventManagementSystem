<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Home page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <%@include file="component/css.jsp" %>

    </head>
    <body>
        <%@include file="component/navbar.jsp" %>

        <!-- END nav -->

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
                        <p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><a href="Homepage?mode=loginForm" class="btn btn-primary px-4 py-3">Login</a> <a href="Register?mode=registerForm" class="btn btn-primary btn-outline-primary px-4 py-3">Sign up</a></p>
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


 
        <%@include file="component/footer.jsp" %>
        <%@include file="component/script.jsp" %>


    </body>
</html>