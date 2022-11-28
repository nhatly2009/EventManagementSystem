<%@page import="com.entity.EventType"%>
<%@page import="com.entity.Student"%>
<%@page import="com.entity.EventSuggestIdeas"%>
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
            EventSuggestIdeas eventSuggestIdeas = (EventSuggestIdeas) session.getAttribute("eventSuggestIdeas");
            ArrayList<EventType> listType = new ArrayList<EventType>();
            listType = (ArrayList<EventType>) session.getAttribute("getListType");
            ArrayList<Student> listStudent = new ArrayList<Student>();
            listStudent = (ArrayList<Student>) session.getAttribute("listStudent");
            String studentName = "";
            for (int j = 0; j < listStudent.size(); j++) {
                if (eventSuggestIdeas.getStudentId() == (listStudent.get(j).getStudentId())) {
                    studentName = listStudent.get(j).getStudentName();
                    break;
                }
            }
            String typeName = "";
            for (int j = 0; j < listType.size(); j++) {
                if (eventSuggestIdeas.getEventTypeId() == listType.get(j).getId()) {
                    typeName = listType.get(j).getEventTypeName();
                    break;
                }
            }
        %>
        <div class="container mt-5">
            <form action="ControllerESI" method="post">
                <input type="hidden" name="mode" value="updateESI">
                <div class='row'>
                    <div class='col col-md-8'>
                        <div class="card">
                            <div class="card-header">
                                <strong>Event Joint Request Details </strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="eventSuggestId" class=" form-control-label">ID</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="eventSuggestId" name="id" readonly value="<%=eventSuggestIdeas.getId()%>" class="form-control">
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="student" class=" form-control-label">Student_<%=eventSuggestIdeas.getStudentId()%></label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="student" name="student" readonly value="<%=studentName%>" class="form-control">
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>
                                
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="title" class=" form-control-label">Event Title</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="title" name="title" readonly value="<%=eventSuggestIdeas.getTitle()%>" class="form-control">
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="type" class=" form-control-label">Event Type</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="type" name="type" readonly value="<%=typeName%>" class="form-control">
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="location" class=" form-control-label">Location</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="location" name="location" readonly value="<%=eventSuggestIdeas.getLocation()%>" class="form-control">
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="description" class=" form-control-label">Description</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <textarea name="description" id="description" readonly rows="6" class="form-control"><%=eventSuggestIdeas.getDescription()%></textarea>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="date_submit" class=" form-control-label">Date Submit</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="date" id="datepicker" readonly name="date_submit" class="form-control" value="<%=eventSuggestIdeas.getSubmitDate()%>">
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="select" class=" form-control-label">Status</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <select name="status" id="select" class="form-control">
                                            <option value="<%=eventSuggestIdeas.getStatus()%>"><%=eventSuggestIdeas.getStatus()%></option>
                                            <option value="Seen">Seen</option>
                                            <option value="Pending">Pending</option>
                                        </select>
                                    </div>
                                </div>



                            </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary btn-sm">
                                    Update
                                </button>
                                <a href="ControllerESI?mode=listEventSuggestIdeas" class="btn btn-secondary btn-sm" >Back</a>
                            </div>
                        </div>
                    </div>
                   

                </div>

            </form>

        </div>
        <%@include file="/admin_login/script.jsp"%>
    </body>

</html>
<!-- end document-->
