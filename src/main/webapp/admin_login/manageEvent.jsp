<%@page import="com.entity.Staff"%>
<%@page import="com.entity.Event"%>
<%@page import="com.entity.EventType"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">

    <head>
        <!-- Required meta tags-->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
                    ArrayList<EventType> listType = new ArrayList<EventType>();
                    listType = (ArrayList<EventType>) session.getAttribute("getListType");
                    ArrayList<Event> listEvent = new ArrayList<Event>();
                    listEvent = (ArrayList<Event>) session.getAttribute("getPagination");
                    ArrayList<Staff> listStaff = new ArrayList<Staff>();
                    listStaff = (ArrayList<Staff>) session.getAttribute("listStaff");
                    int listSize = (int) session.getAttribute("listSize");
                %>
                <div class="row">
                    <div class="col-md-12 col-lg-12">
                        <!-- Event Type-->
                        <div class="top-campaign">
                            <h3 class="title-3 m-b-30">List Event</h3> 
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
                                    <th>ID</th>
                                    <th>Title</th>
                                    <th>Type</th>        
                                    <th>Date Start</th>     
                                    <th>Staff Name</th>
                                    <th>Status</th>
                                    <th>Function</th>
                                    </thead>
                                    <tbody>
                                        <% for (int i = 0; i < listEvent.size(); i++) {%>
                                        <tr>
                                            <td><%=listEvent.get(i).getId()%></td>
                                            <td><%=listEvent.get(i).getTitle()%></td>
                                            <td>
                                                <%
                                                    for (int j = 0; j < listType.size(); j++) {
                                                        if (listEvent.get(i).getType() == (listType.get(j).getId())) {
                                                %>
                                                <%=listType.get(j).getEventTypeName()%>
                                                <%
                                                            break;
                                                        }
                                                    }
                                                %>
                                            </td>
                                            <td><%=listEvent.get(i).getDateStart()%></td>

                                            <td><%
                                                for (int j = 0; j < listStaff.size(); j++) {
                                                    if (listEvent.get(i).getStaffId() == (listStaff.get(j).getStaffId())) {
                                                %>
                                                <%=listStaff.get(j).getName()%>
                                                <%
                                                            break;
                                                        }
                                                    }
                                                %>
                                            </td>
                                            <td><%=listEvent.get(i).getStatus()%></td>
                                            <td><a href='Controller?mode=viewEventDetails&id=<%=listEvent.get(i).getId()%>' class="btn btn-primary btn-sm">View & Update</a></td>
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

                                            <li class="active"><a href="Controller?mode=listEvent&start=<%=a%>&end=<%=b%>">&ensp;<%=i%>&ensp;</a></li>

                                            <!--<li><a href="#">&gt;</a></li>-->                
                                            <%
                                                    }
                                                }
                                            %>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="table-data__tool">
                                <div class="table-data__tool-left ml-5">   
                                    <a class="au-btn au-btn-icon au-btn--green au-btn--small" href="Controller?mode=eventForm">Add New Event</a>
                                    <!--                                <button type="button" class="au-btn au-btn-icon au-btn--green au-btn--small" 
                                                                            data-toggle="modal" data-target="#exampleModalCenter">Add New Event</button>-->
                                </div>
                            </div>
                        </div>
                        <!-- END Event Type-->
                    </div>
                </div>

            </div>
        </section>
        <!-- END DATA-->


        <%@include file="/admin_login/script.jsp"%>

    </body>

</html>
<!-- end document-->
