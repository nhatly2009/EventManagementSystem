<%@page import="com.entity.Event"%>
<%@page import="com.entity.Staff"%>
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
            Event event = (Event) session.getAttribute("event");
            ArrayList<EventType> listType = new ArrayList<EventType>();
            listType = (ArrayList<EventType>) session.getAttribute("getListType");
            ArrayList<Staff> listStaff = new ArrayList<Staff>();
            listStaff = (ArrayList<Staff>) session.getAttribute("listStaff");
            String img = event.getImage();
        %>
        <div class="container mt-5">
            <form action="Controller" method="post" enctype="multipart/form-data">
                <input type="hidden" name="mode" value="updateEvent">
                <input type="hidden" name="id" value="<%=event.getId()%>">
                <div class='row'>
                    <div class='col col-md-6'>
                        <div class="card">
                            <div class="card-header">
                                <strong>Event Details </strong>
                            </div>
                            <div class="card-body card-block">

                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="event_title" class=" form-control-label">Event Title</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="event_title" name="event_title" value="<%=event.getTitle()%>" class="form-control" required>
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="select" class=" form-control-label">Event Type</label>
                                    </div>
                                    <div class="col-12 col-md-9 ">
                                        <select name="event_type" id="event_type" class="form-control">
                                            <%
                                                for (int j = 0; j < listType.size(); j++) {
                                                    if (event.getType() == listType.get(j).getId()) {
                                            %>
                                            <option value="<%=event.getType()%>"><%=listType.get(j).getEventTypeName()%></option>   
                                            <%
                                                        break;
                                                    }
                                                }
                                            %>
                                            <%
                                                for (int j = 0; j < listType.size(); j++) {
                                            %>  
                                            <option value="<%=listType.get(j).getId()%>"><%=listType.get(j).getEventTypeName()%></option> 

                                            <% }%>
                                        </select>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="event_location" class=" form-control-label">Location</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="event_location" name="event_location" value="<%=event.getLocation()%>" class="form-control" required>
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="event_description" class=" form-control-label">Description</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <textarea name="event_description" id="event_description" rows="6" value="" class="form-control" required><%=event.getDescription()%></textarea>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="date_start" class=" form-control-label">Date Start</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="date" id="datepicker" name="date_start" class="form-control" value="<%=event.getDateStart()%>" required>
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="date_forJointRequest" class=" form-control-label">Date For Joint Request</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="date" id="datepicker" name="date_forJointRequest" class="form-control" value="<%=event.getDateForJointRequest()%>" required>
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="select" class=" form-control-label">Select Staff</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <select name="staffId" id="staffId" class="form-control">
                                            <%
                                                for (int j = 0; j < listStaff.size(); j++) {
                                                    if (event.getStaffId() == listStaff.get(j).getStaffId()) {
                                            %>
                                            <option value="<%=event.getStaffId()%>"><%=listStaff.get(j).getName()%></option>   
                                            <%
                                                        break;
                                                    }
                                                }
                                            %>                                            
                                            <%
                                                for (int j = 0; j < listStaff.size(); j++) {

                                            %>
                                            <option value="<%=listStaff.get(j).getStaffId()%>"><%=listStaff.get(j).getName()%></option>      
                                            <%

                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="select" class=" form-control-label">Select Status</label>
                                    </div> 
                                    <div class="col-12 col-md-9">
                                        <select name="status" id="status" class="form-control">
                                            <option value="<%=event.getStatus()%>"><%=event.getStatus()%></option>
                                            <option value="Available">Available</option>
                                            <option value="Unavailable">Unavailable</option>
                                            <option value="Loading">Loading</option>
                                            <option value="Canceled">Canceled</option> 
                                            <option value="Ended">Ended</option> 

                                        </select>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="image" class=" form-control-label">Choose Image </label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="file" class="form-control" name="file" accept=".png, .jpg, .jpeg, .gif" id="fileUpload" >                                                        

                                    </div>

                                </div>

                            </div>
                            <c:if test="${not empty succSignupMsg }">
                                <p class="text-center text-success fs-3">${succSignupMsg}</p>
                                <c:remove var="succSignupMsg" scope="session" />
                            </c:if>

                            <c:if test="${not empty errorMsg }">
                                <p class="text-center text-danger fs-5">${errorMsg}</p>
                                <c:remove var="errorMsg" scope="session" />
                            </c:if>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary btn-sm">
                                    Update
                                </button>
                                <a href="Controller?mode=listEvent" class="btn btn-secondary btn-sm">
                                    Back
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col col-md-6">   
                        <div class="card-header">
                            <strong>Event Image</strong> 
                        </div>  
                        <div class="card-body card-block">
                            <div id="image-holder">
                                <img src="<%=img%>" alt="" class="thumb-image2"/>
                            </div>

                        </div>
                    </div>
                </div>
            </form>

        </div>
        <%@include file="/admin_login/script.jsp"%>
        <script>
            $(document).ready(function () {
                $("#fileUpload").on('change', function () {
                    //Get count of selected files
                    var countFiles = $(this)[0].files.length;
                    var imgPath = $(this)[0].value;
                    var extn = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();
                    var image_holder = $("#image-holder");
                    image_holder.empty();
                    if (extn == "gif" || extn == "png" || extn == "jpg" || extn == "jpeg") {
                        if (typeof (FileReader) != "undefined") {
                            //loop for each file selected for uploaded.
                            for (var i = 0; i < countFiles; i++)
                            {

                                var reader = new FileReader();
                                reader.onload = function (e) {
                                    $("<img />", {
                                        "src": e.target.result,
                                        "class": "thumb-image2",
                                        "title": "Click to choose another image"
                                    }).appendTo(image_holder);
                                }
                                image_holder.show();
                                reader.readAsDataURL($(this)[0].files[i]);
                            }
                        } else {
                            alert("This browser does not support FileReader.");
                        }
                    } else {
                        alert("Pls select only images");
                    }
                });
            });
        </script>
    </body>

</html>
<!-- end document-->
