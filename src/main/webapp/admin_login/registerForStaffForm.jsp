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
        <%@include file="/component/css-login.jsp" %>
        <%@include file="/admin_login/css.jsp"%>
    </head>
    <body class="">
        <!-- Navbar-->
        <%@include file="/admin_login/navbar.jsp"%>

        <!-- FORM  REGISTER-->
        <section class="form-02-main">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="_lk_de">
                            <div class="form-03-main">
                                <div class="logo">
                                    <img src="images/user.png">
                                </div>
                                <h1 class="title-4 text-center">Create New Staff</h1>
                                <div>

                                </div>
                                <form action="ListAccount" method="post">
                                    <input type="hidden" name="mode" value="registerForStaff"/>
                                    <div class="form-group">
                                        <input type="text" name="username" class="form-control _ge_de_ol"
                                               placeholder="Enter Username" required=""
                                               aria-required="true">
                                    </div>

                                    <div class="form-group">
                                        <input type="password" name="password"
                                               class="form-control _ge_de_ol"
                                               placeholder="Enter Password" required="" aria-required="true">
                                    </div>

                                    <div class="form-group">
                                        <input type="text" name="fullname"
                                               class="form-control _ge_de_ol"
                                               placeholder="Enter Staff Name" required="" aria-required="true">
                                    </div>
                                    <c:if test="${not empty succMsg }">
                                        <p class="text-center text-success fs-3">${succMsg}</p>
                                        <c:remove var="succMsg" scope="session" />
                                    </c:if>

                                    <c:if test="${not empty errorMsg }">
                                        <p class="text-center text-danger fs-5">${errorMsg}</p>
                                        <c:remove var="errorMsg" scope="session" />
                                    </c:if>
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="_btn_04">
                                                    <button type="submit" class="btn btn-outline text-white">Register</button>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="_btn_04">
                                                    <a href="ListAccount?mode=listStaff" class="btn btn-outline text-white"> Back                                                    </a> </div>
                                            </div>
                                        </div>                         
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
    <%@include file="/admin_login/script.jsp"%>
</html>