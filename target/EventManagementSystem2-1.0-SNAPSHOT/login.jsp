<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport"
              content="width=device-width, initial-scale=1, shrink-to-fit=no">
        
        <title>Login Page</title>
        <%@include file="component/css-login.jsp" %>
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
        <section class="form-02-main">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="_lk_de">
                            <div class="form-03-main">
                                <div class="logo">
                                    <img src="images/user.png">
                                </div>
                                <c:if test="${not empty succSignupMsg }">
                                    <p class="text-center text-success fs-3">${succSignupMsg}</p>
                                    <c:remove var="succSignupMsg" scope="session" />
                                </c:if>

                                <c:if test="${not empty errorMsg }">
                                    <p class="text-center text-danger fs-5">${errorMsg}</p>
                                    <c:remove var="errorMsg" scope="session" />
                                </c:if>
                                <form action="Homepage" method="post">
                                    <input type="hidden" name="mode" value="login">
                                    <div class="form-group">
                                        <input type="text" name="username" class="form-control _ge_de_ol"
                                               placeholder="Enter Username" required maxlength="35" oninput="maxLengthCheck(this)"
                                               aria-required="true">
                                    </div>

                                    <div class="form-group">
                                        <input type="password" name="password"
                                               class="form-control _ge_de_ol"
                                               placeholder="Enter Password" required maxlength="45" oninput="maxLengthCheck(this)" aria-required="true">
                                    </div>

                                    <div class="checkbox form-group">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" >
                                            <label class="form-check-label"> Remember me </label>
                                        </div>
                                        <a href="#">Forgot Password</a>
                                    </div>

                                    <div class="form-group">
                                        <div class="_btn_04">
                                            <button type="submit" class="btn btn-outline text-white">Login</button>
                                        </div>
                                    </div>
                                </form>

                                <div class="form-group nm_lk">
                                    <p>
                                        <a href="Register?mode=registerForm">Sign up</a> Or Login With
                                    </p>
                                </div>

                                <div class="form-group pt-0">
                                    <div class="_social_04">
                                        <ol>
                                            <li><i class="fa fa-facebook"></i></li>
                                            <li><i class="fa fa-twitter"></i></li>
                                            <li><i class="fa fa-google-plus"></i></li>
                                            <li><i class="fa fa-instagram"></i></li>
                                            <li><i class="fa fa-linkedin"></i></li>
                                        </ol>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
    </body>
    <script>
        function maxLengthCheck(object) {
            if (object.value.length > object.maxLength)
                object.value = object.value.slice(0, object.maxLength)
        }
    </script>
</html>