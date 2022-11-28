<%@page import="com.entity.Admin"%>
<%@page import="com.entity.Student"%>
<%@page import="com.entity.Staff"%>
<%@page import="com.entity.EventJointRequest"%>
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
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Title Page-->
        <title>Forms</title>

        <%@include file="/admin_login/css.jsp"%>
    </head>
    <body class="">
        <!-- Navbar-->

        <%@include file="/admin_login/navbar.jsp"%>
        <%
            EventJointRequest eventJointRequest = (EventJointRequest) session.getAttribute("eventJointRequest");
            ArrayList<Event> listEvent = new ArrayList<Event>();
            listEvent = (ArrayList<Event>) session.getAttribute("getListEvent");
            ArrayList<Staff> listStaff = new ArrayList<Staff>();
            listStaff = (ArrayList<Staff>) session.getAttribute("listStaff");
            ArrayList<Student> listStudent = new ArrayList<Student>();
            listStudent = (ArrayList<Student>) session.getAttribute("listStudent");

            String studentName = "";
            String eventTitle = "";
            for (int j = 0; j < listStudent.size(); j++) {
                if (eventJointRequest.getStudent_id() == (listStudent.get(j).getStudentId())) {
                    studentName = listStudent.get(j).getStudentName();
                    break;
                }
            }
            for (int j = 0; j < listEvent.size(); j++) {
                if (eventJointRequest.getEvent_id() == (listEvent.get(j).getId())) {
                    eventTitle = listEvent.get(j).getTitle();
                    break;
                }
            }

            String updateBy = eventJointRequest.getUpdate_by();
            
            

        %>
        <div class="container mt-5">
            <form action="ControllerEJR" method="post">
                <input type="hidden" name="mode" value="updateEJR">
                <div class='row'>
                    <div class='col col-md-8'>
                        <div class="card">
                            <div class="card-header">
                                <strong>Event Joint Request Details </strong>
                            </div>
                            <div class="card-body card-block">

                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="student" class=" form-control-label">Student_<%=eventJointRequest.getStudent_id()%></label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="student" name="student" readonly value="<%=studentName%>" class="form-control">
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                        <input type="hidden" name="student_id" value="<%=eventJointRequest.getStudent_id()%>">
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="event" class=" form-control-label">Event_<%=eventJointRequest.getEvent_id()%></label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="event" name="event" readonly value="<%=eventTitle%>" class="form-control">
                                        <input type="hidden" name="event_id" value="<%=eventJointRequest.getEvent_id()%>">
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="date_sent" class=" form-control-label">Date Submit</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="date" id="datepicker" readonly name="date_sent" class="form-control" value="<%=eventJointRequest.getDate_sent()%>">
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="update_by" class=" form-control-label">Update By</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="update_by" name="update_by" readonly value="<%=updateBy%>" class="form-control">
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                        <input type ="hidden" name="logedUser2" value="<%=logedUserName%>">
                                    </div>
                                </div>



                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="status" class=" form-control-label">Status</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <select name="status" id="select" class="form-control">
                                            <option value="<%=eventJointRequest.getStatus()%>"><%=eventJointRequest.getStatus()%></option>
                                            <option value="Accepted">Accepted</option>
                                            <option value="Cancelled">Cancelled</option>
                                            <option value="Pending">Pending</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="center">
                                    <c:if test="${not empty succMsg }">
                                        <p class="text-center text-success fs-3">${succMsg}</p>
                                        <c:remove var="succMsg" scope="session" />
                                    </c:if>

                                    <c:if test="${not empty errorMsg }">
                                        <p class="text-center text-danger fs-5">${errorMsg}</p>
                                        <c:remove var="errorMsg" scope="session" />
                                    </c:if>
                                </div>
                            </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary btn-sm">
                                    Update
                                </button>
                                <a href="ControllerEJR?mode=listEventJointRequest" class="btn btn-secondary btn-sm" >Back</a>
                            </div>
                        </div>
                    </div>
                    <div class="col col-md-4">   
                        <div class="card-header">
                            <strong>Event Image</strong> 
                        </div>        
                    </div>

                </div>

            </form>

        </div>
        <%@include file="/admin_login/script.jsp"%>
    </body>

</html>
<!-- end document-->
