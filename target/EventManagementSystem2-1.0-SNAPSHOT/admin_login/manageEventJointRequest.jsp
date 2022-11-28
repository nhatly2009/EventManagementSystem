<%@page import="com.entity.Student"%>
<%@page import="com.entity.EventJointRequest"%>
<%@page import="com.entity.Staff"%>
<%@page import="com.entity.Event"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags-->
        <meta charset="UTF-8">
        <!--<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">-->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <!-- Title Page-->
        <title>Event Page</title>
        <%@include file="/admin_login/css.jsp"%>
    </head>
    <body class="">
        <!-- Navbar-->
        <%@include file="/admin_login/navbar.jsp"%>

        <!-- DATA-->
        <section class="statistic-chart">
            <div class="container-fluid">

                <%
                    ArrayList<Event> listEvent = new ArrayList<Event>();
                    listEvent = (ArrayList<Event>) session.getAttribute("getListEvent");
                    ArrayList<Staff> listStaff = new ArrayList<Staff>();
                    listStaff = (ArrayList<Staff>) session.getAttribute("listStaff");
                    ArrayList<EventJointRequest> listEventJointRequest = new ArrayList<EventJointRequest>();
                    listEventJointRequest = (ArrayList<EventJointRequest>) session.getAttribute("getPagination");
                    ArrayList<Student> listStudent = new ArrayList<Student>();

                    listStudent = (ArrayList<Student>) session.getAttribute("listStudent");
                    int listSize = (int) session.getAttribute("listSize");
                %>
                <div class="row">
                    <div class="col-md-12 col-lg-12">
                        <!-- Event-->
                        <div class="top-campaign">
                            <h3 class="title-3 m-b-30">List Event Joint Request</h3> 
                            <c:if test="${not empty succSignupMsg }">
                                <p class="text-center text-success fs-3">${succSignupMsg}</p>
                                <c:remove var="succSignupMsg" scope="session" />
                            </c:if>

                            <c:if test="${not empty errorMsg }">
                                <p class="text-center text-danger fs-5">${errorMsg}</p>
                                <c:remove var="errorMsg" scope="session" />
                            </c:if>
                            <div class="table-responsive table--no-card m-b-30 ">
                                <table class="table table-borderless table-striped table-earning">
                                    <thead>

                                    <th>Student ID</th>
                                    <th>Student Name</th>
                                    <th>Event Title</th>        
                                    <th>Date Submit</th>     
                                    <th>Update By</th>
                                    <th>Status</th>
                                    <th>Function</th>
                                    </thead>
                                    <tbody>
                                        <% for (int i = 0; i < listEventJointRequest.size(); i++) {%>
                                        <tr>

                                            <td><%=listEventJointRequest.get(i).getStudent_id()%></td>
                                            <td><%
                                                for (int j = 0; j < listStudent.size(); j++) {
                                                    if (listEventJointRequest.get(i).getStudent_id() == (listStudent.get(j).getStudentId())) {
                                                %>
                                                <%=listStudent.get(j).getStudentName()%>
                                                <%
                                                            break;
                                                        }
                                                    }
                                                %>
                                            </td>
                                            <td><%
                                                for (int j = 0; j < listEvent.size(); j++) {
                                                    if (listEventJointRequest.get(i).getEvent_id() == (listEvent.get(j).getId())) {
                                                %>
                                                <%=listEvent.get(j).getTitle()%>
                                                <%
                                                            break;
                                                        }
                                                    }
                                                %>
                                            </td>
                                            <td><%=listEventJointRequest.get(i).getDate_sent()%></td>
                                            <td><%=listEventJointRequest.get(i).getUpdate_by()%></td>
                                            <td><%=listEventJointRequest.get(i).getStatus()%></td>
                                            <td><a href='ControllerEJR?mode=viewEventJointRequestDetails&student_id=<%=listEventJointRequest.get(i).getStudent_id()%>&event_id=<%=listEventJointRequest.get(i).getEvent_id()%>' class="btn btn-primary btn-sm">View & Update</a></td>
                                        </tr>

                                        <%}%>
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

                                            <li class="active"><a href="ControllerEJR?mode=listEventJointRequest&start=<%=a%>&end=<%=b%>">&ensp;<%=i%>&ensp;</a></li>

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

                        <!-- END Event-->
                    </div>
                </div>
            </div>
        </section>
        <!-- END DATA-->


        <%@include file="/admin_login/script.jsp"%>

    </body>

</html>
<!-- end document-->
