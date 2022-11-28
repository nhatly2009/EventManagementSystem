<%@page import="com.entity.Student"%>
<%@page import="com.entity.EventSuggestIdeas"%>
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
                    ArrayList<EventSuggestIdeas> listEventSuggestIdeas = new ArrayList<EventSuggestIdeas>();
                    listEventSuggestIdeas = (ArrayList<EventSuggestIdeas>) session.getAttribute("getListEventSuggestIdeas");
                    ArrayList<EventType> listType = new ArrayList<EventType>();
                    listType = (ArrayList<EventType>) session.getAttribute("getListType");
                    ArrayList<Student> listStudent = new ArrayList<Student>();
                    listStudent = (ArrayList<Student>) session.getAttribute("listStudent");
                    int listSize = (int) session.getAttribute("listSize");

                %>
                <div class="row">
                    <div class="col-md-12 col-lg-12">
                        <!-- Event Type-->
                        <div class="top-campaign">
                            <h3 class="title-3 m-b-30">List Event Suggest Ideas</h3> 
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
                                    <th>Date Submit</th>
                                    <th>Student Name</th>
                                    <th>Status</th>  
                                    <th>Function</th>
                                    </thead>
                                    <tbody>
                                        <% for (int i = 0; i < listEventSuggestIdeas.size(); i++) {%>
                                        <tr>

                                            <td><%=listEventSuggestIdeas.get(i).getId()%></td>
                                            <td><%=listEventSuggestIdeas.get(i).getTitle()%></td>
                                            <td>
                                                <%
                                                    for (int j = 0; j < listType.size(); j++) {
                                                        if (listEventSuggestIdeas.get(i).getEventTypeId() == (listType.get(j).getId())) {
                                                %>
                                                <%=listType.get(j).getEventTypeName()%>
                                                <%
                                                            break;
                                                        }
                                                    }
                                                %>
                                            </td>
                                            <td><%=listEventSuggestIdeas.get(i).getSubmitDate()%></td>

                                            <td><%
                                                for (int j = 0; j < listStudent.size(); j++) {
                                                    if (listEventSuggestIdeas.get(i).getStudentId() == (listStudent.get(j).getStudentId())) {
                                                %>
                                                <%=listStudent.get(j).getStudentName()%>
                                                <%
                                                            break;
                                                        }
                                                    }
                                                %>
                                            </td>
                                            <td><%=listEventSuggestIdeas.get(i).getStatus()%></td>
                                            <td><a href='ControllerESI?mode=viewEventSuggestIdeaDetails&id=<%=listEventSuggestIdeas.get(i).getId()%>' class="btn btn-primary btn-sm">View & Update</a></td>
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

                                            <li class="active"><a href="ControllerESI?mode=listEventSuggestIdeas&start=<%=a%>&end=<%=b%>">&ensp;<%=i%>&ensp;</a></li>

                                            <!--<li><a href="#">&gt;</a></li>-->                
                                            <%
                                                }}
                                            %>

                                        </ul>
                                    </div>
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
