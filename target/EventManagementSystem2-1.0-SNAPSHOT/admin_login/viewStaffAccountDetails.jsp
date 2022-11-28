<%@page import="com.entity.Staff"%>
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
            Staff staff = (Staff) session.getAttribute("getStaff");
            String img = staff.getImage();
            if (img == null || img.equals("")) {
                img = "images/administrator.png";
            }
        %>
        <div class="container mt-5">
            <form action="ListAccount" method="post" >
                <input type="hidden" name="mode" value="updateStaff">
                <input type="hidden" name="staffId" value="<%=staff.getStaffId()%>">
                <div class='row'>
                    <div class="col col-md-4 ">   
                        <div class="card">
                            <div class="card-header">
                                <strong>Photo</strong>
                            </div>
                            <div id="image-holder">
                                <img src="<%=img%>" alt="" class="thumb-image"/>
                            </div>
                        </div>

                    </div>
                    <div class='col col-md-6'>
                        <div class="card">

                            <div class="card-header">
                                <strong>View And Update Staff Account </strong>
                            </div>
                            <div class="card-body card-block">

                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="staff_username" class="form-control-label">Username</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="staff_username" name="staff_username" readonly="" value="<%=staff.getUsername()%>" class="form-control">
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="staff_email" class=" form-control-label">Email</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="staff_email" name="staff_email" readonly value="<%=staff.getEmail()%>" class="form-control">
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="staff_name" class=" form-control-label">Full Name</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="staff_name" name="staff_name" readonly value="<%=staff.getName()%>" class="form-control">
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="staff_phone" class=" form-control-label">Phone Number</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="staff_phone" name="staff_phone"  readonly value="<%=staff.getPhoneNumber()%>" class="form-control">
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="status" class=" form-control-label">Status</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <select name="status" id="status" class="form-control">
                                            <option value="<%=staff.getStatus()%>"><%=staff.getStatus()%></option>
                                            <option value="Banned">Banned</option>
                                            <option value="Checking">Checking</option>
                                            <option value="Available">Available</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary btn-sm">
                                    Update
                                </button>
                                <a href="ListAccount?mode=listStaff" class="btn btn-secondary btn-sm"> Back</a>

                            </div>
                        </div>
                    </div>
                    <div class="col col-md-2">   

                    </div>
                </div>
            </form>

        </div>
        <%@include file="/admin_login/script.jsp"%>
    </body>

</html>
<!-- end document-->
