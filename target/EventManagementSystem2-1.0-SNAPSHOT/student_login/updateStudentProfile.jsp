<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.entity.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <%@include file="css.jsp" %>
        <title>Student Profile</title>

    </head>
    <body>
        <%@include file="navbar.jsp" %>

        <%
            Student student = (Student) session.getAttribute("getStudent");

            String img = student.getStudentImage();
            if (img == null || img.equals("")) {
                img = "images/administrator.png";
            }

        %>


        <div class="container mt-5 pt-5 mb-5 pb-5">
            <div class="mt-5">

                <div class='row'>

                    <div class="col-4 col-md-4 ">   
                        <div class="card">
                            <form action="updateStudent" method="post" class="g-3" enctype="multipart/form-data" >
                                <input type="hidden" name="mode" value="updateImage">
                                <input type="hidden" name="username" value="<%=student.getStudentUsername()%>">
                                <div class="card-header">
                                    <strong>Photo</strong>
                                </div>
                                <div id="image-holder">
                                    <img src="<%=img%>" alt="" class="thumb-image"/>
                                </div>
                                <div class="card-footer">
                                    <input type="file" class="form-group form-control-file" name="file" accept=".png, .jpg, .jpeg, .gif" id="fileUpload" required>
                                    <button type="submit" class="btn btn-primary btn-sm">
                                        Update
                                    </button>                                  
                                </div>

                            </form>
                        </div>

                    </div>


                    <div class='col-8 col-md-8'>
                        <div class="card">
                            <form action="updateStudent" method="post" class="g-3 needs-validation" novalidate enctype="multipart/form-data" >
                                <input type="hidden" name="mode" value="updateProfile">
                                <input type="hidden" name="username" value="<%=student.getStudentUsername()%>">
                                <div class="card-header">
                                    <strong>View And Update Student Account </strong>
                                </div>
                                <div class="card-body card-block">

                                    <div class="col-md-12 col-12" style="padding-bottom: 20px;">
                                        <label for="validationCustom01" class="form-label">Student ID</label>
                                        <input type="text" class="form-control" readonly placeholder=""  name="id" id="validationCustom01" value="<%=student.getStudentId()%>" required>
                                        <div class="valid-feedback">
                                            Done!
                                        </div>
                                        <div class="invalid-feedback">
                                            Please select a valid ID.
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-12" style="padding-bottom: 20px;">
                                        <label for="validationCustom02" class="form-label">Name</label>
                                        <input type="text" class="form-control"  id="validationCustom02" placeholder="Enter name" name="name" value="<%=student.getStudentName()%>" maxlength="45" oninput="maxLengthCheck(this)" required>
                                        <div class="valid-feedback">
                                            Done!
                                        </div>
                                        <div class="invalid-feedback">
                                            Please select a valid Name.
                                        </div>
                                    </div>

                                    <div class="col-md-12 col-12" style="padding-bottom: 20px;">
                                        <label for="validationCustom03" class="form-label">Email</label>
                                        <input type="email" class="form-control" name="email" id="validationCustom03" value="<%=student.getStudentEmail()%>" maxlength="45" oninput="maxLengthCheck(this)" required>
                                        <div class="valid-feedback">
                                            Done!
                                        </div>
                                        <div class="invalid-feedback">
                                            Please select a valid Email.
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-12" style="padding-bottom: 20px;">
                                        <label for="validationCustom04" class="form-label">Major</label>
                                        <input type="text" class="form-control" name="major" id="validationCustom04" value="<%=student.getStudentMajor()%>" maxlength="45" oninput="maxLengthCheck(this)" required>
                                        <div class="invalid-feedback">
                                            Please enter your major.
                                        </div>
                                        <div class="valid-feedback">
                                            Done!
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-12" style="padding-bottom: 20px;">
                                        <label for="validationCustom05" class="form-label">Phone Number</label>
                                        <input type="number" class="form-control" name="phone" id="validationCustom05" value="<%=student.getStudentPhoneNumber()%>" maxlength="11" oninput="maxLengthCheck(this)" required>
                                        <div class="invalid-feedback">
                                            Please provide a valid phone number.
                                        </div>
                                        <div class="valid-feedback">
                                            Done!
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
                                </div>


                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary btn-sm">
                                        Update
                                    </button>
                                    <a href="Homepage?mode=viewStudent" class="btn btn-secondary btn-sm"> Back</a>

                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="col col-md-2">   

                    </div>
                </div>

            </div>
        </div>
    </body>   
    <%@include file="footer.jsp" %>
    <%@include file="script.jsp" %>

    <script>

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

</html>
