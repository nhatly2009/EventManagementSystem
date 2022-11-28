<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.Staff"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Title Page-->
        <title>List Account Page</title>
        <%@include file="/admin_login/css.jsp"%>
    </head>
    <body class="">
        <!-- Navbar-->
        <%@include file="/admin_login/navbar.jsp"%>
        <%
            ArrayList<Staff> listStaff = (ArrayList<Staff>) session.getAttribute("getPagination");
            int listSize = (int) session.getAttribute("listSize");
        %>
        <!-- DATA-->
        <section class="statistic-chart">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="title-5 m-b-35"></h3>
                        <c:if test="${not empty succSignupMsg }">
                            <p class="text-center text-success fs-3">${succSignupMsg}</p>
                            <c:remove var="succSignupMsg" scope="session" />
                        </c:if>

                        <c:if test="${not empty errorMsg }">
                            <p class="text-center text-danger fs-5">${errorMsg}</p>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>

                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 col-lg-12">
                        <!-- Event Type-->
                        <div class="">

                            <h3 class="title-3 m-b-30 ml-5">List Staff Account</h3> 
                            <div class="table-responsive table--no-card m-b-40">
                                <table class="table table-borderless table-striped table-earning">
                                    <thead>
                                    <th>ID</th>
                                    <th>Username</th>                               
                                    <th>Email</th>
                                    <th>Full Name</th>
                                    <th>Phone Number</th>
                                    <th>Image</th>
                                    <th>Status</th>
                                    <th>Function</th>
                                    </thead>
                                    <tbody>
                                        <%
                                            for (int i = 0; i < listStaff.size(); i++) {
                                                String img = listStaff.get(i).getImage();
                                        %>
                                        <tr>
                                            <td><%=listStaff.get(i).getStaffId()%></td>
                                            <td><%=listStaff.get(i).getUsername()%></td>                                         
                                            <td><%=listStaff.get(i).getEmail()%></td>
                                            <td><%=listStaff.get(i).getName()%></td>
                                            <td><%=listStaff.get(i).getPhoneNumber()%></td>
                                            <td><img src="<%=img%>" alt="loading" class="manage-image"/></td>
                                            <td><%=listStaff.get(i).getStatus()%></td>     
                                            <td><a class="btn btn-primary btn-sm" href="ListAccount?mode=viewStaffAccountDetails&staffId=<%=listStaff.get(i).getStaffId()%>">View & Update</a></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                            <div class="mt-5">
                                <div class="col-12 text-center">
                                    <div class="block-27">
                                        <ul>
                                            <%
                                                int a, b;
                                                int limit = listSize / 7;
                                                if (limit * 7 < listSize) {
                                                    limit += 1;
                                                }
                                                if (limit > 1) {
                                                    for (int i = 1; i <= limit; i++) {
                                                        a = (i - 1) * 7;
                                                        b = i * 7;
                                                        if (b > listSize) {
                                                            b = listSize;
                                                        }
                                            %>
                                            <!--                                            <li><a href="#">&lt;</a></li>-->

                                            <li class="active"><a href="ListAccount?mode=listStaff&start=<%=a%>&end=<%=b%>">&ensp;<%=i%>&ensp;</a></li>

                                            <!--<li><a href="#">&gt;</a></li>-->                
                                            <%
                                                    }
                                                }
                                            %>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="table-data__tool">
                            <div class="table-data__tool-left">   
                            </div>
                            <div class="table-data__tool-right">   
                                <a class="au-btn au-btn-icon au-btn--green au-btn--small mr-5" href="ListAccount?mode=registerForStaffForm">Register New Account</a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- END DATA-->


        <%@include file="/admin_login/script.jsp"%>
    </body>

</html>
<!-- end document-->
