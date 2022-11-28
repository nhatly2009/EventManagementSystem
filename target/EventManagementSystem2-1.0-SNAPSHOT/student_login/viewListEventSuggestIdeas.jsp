<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.entity.EventType"%>
<%@page import="com.entity.EventSuggestIdeas"%>
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
                    ArrayList<EventSuggestIdeas> listEventSuggestIdeas = new ArrayList<EventSuggestIdeas>();
                    listEventSuggestIdeas = (ArrayList<EventSuggestIdeas>) session.getAttribute("getListESI");
                    ArrayList<EventType> listTypeAvailable = new ArrayList<EventType>();
                    listTypeAvailable = (ArrayList<EventType>) session.getAttribute("getListTypeAvailable");
                    //get date today
                    SimpleDateFormat formatterToday = new SimpleDateFormat("yyyy-MM-dd");
                    Date dateToday = new Date();
                    String today = formatterToday.format(dateToday);
                    ///
                %>
                <div class="row">
                    <div class="col-md-12 col-lg-12">
                        <!-- Event-->
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
                                <table class="table table-borderless table-striped table-sm">
                                    <thead class="table-dark">
                                    <th>ID</th>   
                                    <th>Title</th>                                       
                                    <th>Location</th>        
                                    <th>Date Submit</th>
                                    <th>Status</th>  
                                    <th>Function</th>
                                    </thead>
                                    <tbody>
                                        <% for (int i = 0; i < listEventSuggestIdeas.size(); i++) {%>
                                        <tr>
                                            <td><%=listEventSuggestIdeas.get(i).getId()%></td>
                                            <td><%=listEventSuggestIdeas.get(i).getTitle()%></td>           
                                            <td><%=listEventSuggestIdeas.get(i).getLocation()%></td>
                                            <td><%=listEventSuggestIdeas.get(i).getSubmitDate()%></td>                                  
                                            <td><%=listEventSuggestIdeas.get(i).getStatus()%></td>
                                            <td><a href='studentEvent?mode=viewEventSuggestIdeaDetails&id=<%=listEventSuggestIdeas.get(i).getId()%>' class="btn btn-sm">View Details</a></td>
                                        </tr>

                                        <%}%>
                                    </tbody>
                                </table>
                            </div>
                            <div class="table-data__tool">
                                <div class="table-data__tool-right ml-5">   
                                    <!--<a class="btn btn-primary" href="studentEvent?mode=addNewIdeas">Add New Event Idea</a>-->
                                    <button type="button" class="btn btn-primary" 
                                            data-toggle="modal" data-target="#exampleModalCenter">Create New Event Ideas</button>
                                </div>
                            </div>
                        </div>

                        <!-- END Event-->
                    </div>
                </div>
            </div>
        </section>
        <%@include file="script.jsp" %>
        <!-- Add Type Dialog-->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Create Idea Form</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="studentEvent" method="get">
                            <input type="hidden" name="mode" value="addNewIdeas">
                            <input type="hidden" name="today" value="<%=today%>">
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="event_title" class=" form-control-label">Title</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" id="event_title" name="event_title" placeholder="Enter Title" class="form-control">       
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="select" class=" form-control-label">Event Type</label>
                                </div>
                                <div class="col-12 col-md-9 ">
                                    <select name="event_type" id="event_type" class="form-control">
                                        <%
                                            for (int j = 0; j < listTypeAvailable.size(); j++) {

                                        %>
                                        <option value="<%=listTypeAvailable.get(j).getId()%>"><%=listTypeAvailable.get(j).getEventTypeName()%></option>      
                                        <%

                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="event_location" class=" form-control-label">Location</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" id="event_location" name="event_location" placeholder="Enter Location" class="form-control">   
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="event_description" class=" form-control-label">Description</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <textarea name="event_description" id="event_description" rows="6" placeholder="Content..." class="form-control"></textarea>
                                </div>
                            </div>

                            <div >
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Submit</button> 
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Add Type -->
        <%@include file="footer.jsp" %>
        <%@include file="script.jsp" %>
    </body>
</html>