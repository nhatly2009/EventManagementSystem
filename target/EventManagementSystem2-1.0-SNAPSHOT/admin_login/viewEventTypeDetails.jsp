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

        <!-- Title Page-->
        <title>Event</title>

        <%@include file="/admin_login/css.jsp"%>
    </head>
    <body class="">
        <!-- Navbar-->
        <%@include file="/admin_login/navbar.jsp"%>
        <%
            EventType eventType;
            eventType = (EventType) session.getAttribute("eventType");

        %>
        <div class="container mt-5">
            <form action="ControllerET" method="get">
                <input type="hidden" name="mode" value="updateEventType">

                <div class='row'>
                    <div class='col col-md-6'>
                        <div class="card">
                            <div class="card-header">
                                <strong>Event Type Details </strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="id" class=" form-control-label">ID</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="type" name="id" readonly value="<%=eventType.getId()%>" class="form-control">
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="typeEventName" class=" form-control-label">Type Name</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="typeEventName" name="typeEventName" value="<%=eventType.getEventTypeName()%>" class="form-control">
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="typeDescription" class=" form-control-label">Description</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <textarea name="typeDescription" id="typeDescription" rows="6" value="" class="form-control"><%=eventType.getEventTypeDescription()%></textarea>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="status" class=" form-control-label">Select Status</label>
                                    </div> <div class="col-12 col-md-9">
                                        <select name="status" id="status" class="form-control">
                                            <option value="<%=eventType.getStatus()%>"><%=eventType.getStatus()%></option>
                                            <option value="Available">Available</option>
                                            <option value="Unavailable">Unavailable</option>
                                        </select>
                                    </div>
                                </div>


                            </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary btn-sm">
                                    Update
                                </button>
                                <a href="ControllerET?mode=listType" class="btn btn-secondary btn-sm">
                                    Back
                                </a>
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
