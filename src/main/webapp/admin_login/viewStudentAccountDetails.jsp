<%@page import="com.entity.Student"%>
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
            Student student = (Student) session.getAttribute("getStudent");
            String img = student.getStudentImage();
        %>
        <div class="container mt-5">
            <form action="ListAccount" method="post" >
                <input type="hidden" name="mode" value="updateStudent">
                <input type="hidden" name="studentId" value="<%=student.getStudentId()%>">
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
                                <strong>View And Update Student Account </strong>
                            </div>
                            <div class="card-body card-block">

                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="username" class="form-control-label">Username</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="username" readonly="" name="username" value="<%=student.getStudentUsername()%>" class="form-control">
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="email" class=" form-control-label">Email</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="email" readonly name="email" value="<%=student.getStudentEmail()%>" class="form-control">
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="name" class=" form-control-label">Full Name</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="name"  readonly name="name" value="<%=student.getStudentName()%>" class="form-control">
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="phone" class=" form-control-label">Phone Number</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="phone" readonly name="phone" value="<%=student.getStudentPhoneNumber()%>" class="form-control">
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="status" class=" form-control-label">Status</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <select name="status" id="status" class="form-control">
                                            <option value="<%=student.getStudentStatus()%>"><%=student.getStudentStatus()%></option>
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
                                <a href="ListAccount?mode=listStudent" class="btn btn-secondary btn-sm"> Back</a>

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
