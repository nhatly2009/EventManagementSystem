<%@page import="com.entity.EventJointRequest"%>
<%@page import="com.entity.Event"%>
<%@page import="java.util.ArrayList"%>
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

        <section class="ftco-section ftco-degree-bg ">
            <div class="container ">

                <%
                    ArrayList<Event> listEvent = new ArrayList<Event>();
                    listEvent = (ArrayList<Event>) session.getAttribute("getListEvent");
                    ArrayList<EventJointRequest> listEventJointRequest = new ArrayList<EventJointRequest>();
                    listEventJointRequest = (ArrayList<EventJointRequest>) session.getAttribute("getListEJR");

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
                                <table class="table table-borderless table-striped table-sm">
                                    <thead class="table-dark">
                                    <th>No</th>     
                                    <th>Event Title</th>        
                                    <th>Location</th>        
                                    <th>Date Start</th>     
                                    <th>Date Submit</th>     
                                    <th>Status</th>
                                    <th>Function</th>
                                    </thead>
                                    <tbody>
                                        <%                                            int eventId = 0;
                                            String eventTitle = "";
                                            String dateStart = "";
                                            String dateSubmit = "";
                                            String status = "";
                                            String location = "";
                                            for (int i = 0; i < listEventJointRequest.size(); i++) {
                                                for (int j = 0; j < listEvent.size(); j++) {
                                                    if (listEventJointRequest.get(i).getEvent_id() == listEvent.get(j).getId()) {
                                                        eventTitle = listEvent.get(j).getTitle();
                                                        dateStart = listEvent.get(j).getDateStart();
                                                        location = listEvent.get(j).getLocation();
                                                        eventId = listEvent.get(j).getId();
                                                        break;
                                                    }
                                                }
                                                dateSubmit = listEventJointRequest.get(i).getDate_sent();
                                                status = listEventJointRequest.get(i).getStatus();
                                                int no = i + 1;
                                        %>
                                        <tr>
                                            <td><%=no%></td>
                                            <td><%=eventTitle%></td>
                                            <td><%=location%></td>
                                            <td><%=dateStart%></td>
                                            <td><%=dateSubmit%></td>
                                            <td><%=status%></td>
                                            <td><a href="studentEvent?mode=viewEventDetails&id=<%=eventId%>">View Details</a></td>
                                            <%}%>
                                        </tr> 
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- END Event-->
                    </div>
                </div>
            </div>
        </section>
        <%@include file="footer.jsp" %>
        <%@include file="script.jsp" %>


    </body>
</html>