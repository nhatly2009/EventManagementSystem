<%@page import="com.entity.Staff"%>
<%@page import="com.entity.EventType"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="">

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
            ArrayList<EventType> listType = new ArrayList<EventType>();
            listType = (ArrayList<EventType>) session.getAttribute("getListType");
            ArrayList<Staff> listStaff = new ArrayList<Staff>();
            listStaff = (ArrayList<Staff>) session.getAttribute("listStaff");
        %>
        <div class="container mt-5">
            <form action="Controller" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
                <input type="hidden" name="mode" value="addNewEvent">
                <div class='row'>
                    <div class='col col-md-6'>  
                        <div class="card">
                            <div class="card-header">
                                <strong>Add New Event Form </strong>
                            </div>
                            <div class="card-body card-block">

                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="validationCustom01" class=" form-control-label">Title</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="event_title" name="event_title" placeholder="Enter Title" class="form-control" id="validationCustom01" required>
                                        <div class="valid-feedback">
                                            Done!
                                        </div>
                                        <div class="invalid-feedback">
                                            Please enter a valid event title.
                                        </div>
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

                                            %>
                                            <option value="<%=listType.get(j).getId()%>"><%=listType.get(j).getEventTypeName()%></option>      
                                            <%

                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="validationCustom02" class=" form-control-label">Location</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="validationCustom02" name="event_location" placeholder="Enter Location" class="form-control" required>
                                        <div class="valid-feedback">
                                            Done!
                                        </div>
                                        <div class="invalid-feedback">
                                            Please enter a valid location.
                                        </div>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="validationCustom03" class=" form-control-label">Description</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <textarea name="event_description" id="validationCustom03" rows="6" placeholder="Content..." class="form-control" required></textarea>
                                        <div class="valid-feedback">
                                            Done!
                                        </div>
                                        <div class="invalid-feedback">
                                            Please enter a valid event description.
                                        </div>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="validationCustom04" class=" form-control-label" >Date Start</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="date" id="datepicker validationCustom04" name="date_start" class="form-control" required>
                                        <div class="valid-feedback">
                                            Done!
                                        </div>
                                        <div class="invalid-feedback">
                                            Please select a valid date for starting.
                                        </div>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="validationCustom05" class="form-control-label">Date For Joint Request</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="date" id="datepicker validationCustom05" name="date_forJointRequest" class="form-control" required>
                                        <small class="text-danger">Date for joint request must be less than start date!</small>
                                        <div class="valid-feedback">
                                            Done!
                                        </div>
                                        <div class="invalid-feedback">
                                            Please select a valid date for joint request. It must be less than start date!
                                        </div>
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="staffId" class=" form-control-label">Select Staff</label>
                                    </div>
                                    <div class="col-12 col-md-9">

                                        <%if (adminLog != null) {%>
                                        <select name="staffId" id="staffId" class="form-control">
                                            <%
                                                for (int j = 0; j < listStaff.size(); j++) {

                                            %>
                                            <option value="<%=listStaff.get(j).getStaffId()%>"><%=listStaff.get(j).getName()%></option>      
                                            <%

                                                }
                                            %>
                                        </select>
                                        <%}%>
                                        <%if (staffLog != null) {%>
                                        <input type="hidden" id="staffId" name="staffId" value="<%=staffLog.getStaffId()%>" class="form-control">                                  
                                        <input type="text" name="temp" value="<%=logedUserName%>" class="form-control" readonly>                                  
                                        <%}%>

                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="status" class=" form-control-label">Select Status</label>
                                    </div> <div class="col-12 col-md-9">
                                        <select name="status" id="status" class="form-control">

                                            <option value="Available">Available</option>
                                            <option value="Unavailable">Unavailable</option>
                                            <option value="Loading">Loading</option>
                                            <option value="Canceled">Cancel</option>      
                                        </select>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="validationCustom06" class=" form-control-label">Choose Image </label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="file" class="form-control" name="file" accept=".png, .jpg, .jpeg, .gif" id="fileUpload">                                                        

                                    </div>

                                </div>
                                <c:if test="${not empty succMsg }">
                                    <p class="text-center text-success fs-3">${succMsg}</p>
                                    <c:remove var="succMsg" scope="session" />
                                </c:if>

                                <c:if test="${not empty alertMsg }">
                                    <script>window.alert("${alertMsg}");</script>
                                    <c:remove var="alertMsg" scope="session" />
                                </c:if>   

                                <c:if test="${not empty errorMsg }">
                                    <p class="text-center text-danger fs-5">${errorMsg}</p>
                                    <c:remove var="errorMsg" scope="session" />
                                </c:if>
                            </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary btn-sm">
                                    Submit
                                </button>
                                <button type="reset" class="btn btn-danger btn-sm">
                                    Reset
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


            (function () {
                'use strict';

                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.querySelectorAll('.needs-validation');

                // Loop over them and prevent submission
                Array.prototype.slice.call(forms)
                        .forEach(function (form) {
                            form.addEventListener('submit', function (event) {
                                if (!form.checkValidity()) {
                                    event.preventDefault();
                                    event.stopPropagation();
                                }

                                form.classList.add('was-validated');
                            }, false);
                        });
            })();
        </script>
    </body>

</html>
<!-- end document-->
