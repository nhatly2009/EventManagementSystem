<%@page import="com.entity.Student"%>
<%@page import="com.entity.Staff"%>
<%@page import="com.entity.Event"%>
<%@page import="com.entity.EventType"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Dashboard</title>
        <%@include file="/admin_login/css.jsp"%>
    </head>
    <body class="">

        <!-- Navbar-->
        <%@include file="/admin_login/navbar.jsp"%>

        <!-- PAGE CONTENT-->
        <div class="page-content--bgf7">         

            <!-- WELCOME-->
            <section class="welcome p-t-10">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="title-4">Welcome to  <%=logedUserName%> Dashboard!!!
                                <!-- <span>Nhat!</span> -->
                            </h1>
                            <hr class="line-seprate">
                        </div>
                    </div>
                </div>
            </section>
            <!-- END WELCOME-->

            <%
                int countEvent, countEventJointRequest, countStaff, countStudent;
                countEvent = (int) session.getAttribute("countEvent");
                countEventJointRequest = (int) session.getAttribute("countEventJointRequest");
                countStaff = (int) session.getAttribute("countStaff");
                countStudent = (int) session.getAttribute("countStudent");
            %>
            <c:if test="${not empty succSignupMsg }">
                <p class="text-center text-success fs-3">${succSignupMsg}</p>
                <c:remove var="succSignupMsg" scope="session" />
            </c:if>

            <c:if test="${not empty errorMsg }">
                <p class="text-center text-danger fs-5">${errorMsg}</p>
                <c:remove var="errorMsg" scope="session" />
            </c:if>
            <!-- VIEW-->
            <section class="statistic statistic2">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-lg-6">
                            <div class="statistic__item statistic__item--green"  
                                 <%if (adminLog != null) {%>
                                 onclick="myhref('ListAccount?mode=listStaff');"
                                 <%}%>
                                 <%if (staffLog != null) {%>
                                 onclick="myhref('ListAccount?mode=dontHaveAccess');"
                                 <%}%>>
                                <h2 class="number"><%=countStaff%></h2>
                                <span class="desc">Staff Account</span>

                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6">
                            <div class="statistic__item statistic__item--orange" onclick="myhref('ListAccount?mode=listStudent');">
                                <h2 class="number"><%=countStudent%></h2>
                                <span class="desc">Student Account</span>

                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6">
                            <div class="statistic__item statistic__item--blue" onclick="myhref('Controller?mode=listEvent');">
                                <h2 class="number"><%=countEvent%></h2>
                                <span class="desc">Total Event</span>

                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6">
                            <div class="statistic__item statistic__item--red" onclick="myhref('ControllerEJR?mode=listEventJointRequest');">
                                <h2 class="number"><%=countEventJointRequest%></h2>
                                <span class="desc">Student Joint Request</span>

                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- END VIEW-->


            <%@include file="/admin_login/script.jsp"%>
    </body>

</html>
<!-- end document-->
