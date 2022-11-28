<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <%@include file="/admin_login/css.jsp" %>
        <title>JSP Page</title>

    </head>
    <body>
        
        <%@include file="/admin_login/navbar.jsp" %>

        <%
            Staff staff = (Staff) session.getAttribute("getStaff");

            String img = staff.getImage();
            if (img == null || img.equals("")) {
                img = "images/administrator.png";
            }

        %>


        <div class="container mt-5 pt-5 mb-5 pb-5">
            <div class="mt-5">

                <div class='row'>

                    <div class="col-4 col-md-4 ">   
                        <div class="card">
                            <form action="updateStaff" method="post" class="g-3" enctype="multipart/form-data" >
                                <input type="hidden" name="mode" value="updateImage">
                                <input type="hidden" name="username" value="<%=staff.getUsername()%>">
                                <input type="hidden" name="staffId" value="<%=staff.getStaffId()%>">
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
                            <form action="updateStaff" method="post" class="g-3 needs-validation" novalidate enctype="multipart/form-data" >
                                <input type="hidden" name="mode" value="updateProfile">
                                <input type="hidden" name="username" value="<%=staff.getUsername()%>">
                                <div class="card-header">
                                    <strong>View And Update Account </strong>
                                </div>
                                <div class="card-body card-block">

                                    <div class="col-md-12 col-12" style="padding-bottom: 20px;">
                                        <label for="validationCustom01" class="form-label">Staff ID</label>
                                        <input type="text" class="form-control" readonly placeholder=""  name="id" id="validationCustom01" value="<%=staff.getStaffId()%>" required>
                                        <div class="valid-feedback">
                                            Done!
                                        </div>
                                        <div class="invalid-feedback">
                                            Please select a valid ID.
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-12" style="padding-bottom: 20px;">
                                        <label for="validationCustom02" class="form-label">Name</label>
                                        <input type="text" class="form-control"  id="validationCustom02" placeholder="Enter name" name="name" value="<%=staff.getName()%>" required>
                                        <div class="valid-feedback">
                                            Done!
                                        </div>
                                        <div class="invalid-feedback">
                                            Please select a valid Name.
                                        </div>
                                    </div>

                                    <div class="col-md-12 col-12" style="padding-bottom: 20px;">
                                        <label for="validationCustom03" class="form-label">Email</label>
                                        <input type="email" class="form-control" name="email" id="validationCustom03" value="<%=staff.getEmail()%>" required>
                                        <div class="valid-feedback">
                                            Done!
                                        </div>
                                        <div class="invalid-feedback">
                                            Please select a valid Email.
                                        </div>
                                    </div>

                                    <div class="col-md-12 col-12" style="padding-bottom: 20px;">
                                        <label for="validationCustom04" class="form-label">Phone Number</label>
                                        <input type="number" class="form-control" name="phone" id="validationCustom04" value="<%=staff.getPhoneNumber()%>"  required>
                                        <div class="invalid-feedback">
                                            Please provide a valid phone number.
                                        </div>
                                        <div class="valid-feedback">
                                            Done!
                                        </div>
                                    </div>
                                    <c:if test="${not empty imageSuccess2 }">
                                        <p class="text-center text-success fs-3">${imageSuccess2}</p>
                                        <c:remove var="imageSuccess2" scope="session" />
                                    </c:if>

                                    <c:if test="${not empty errorMsg2 }">
                                        <p class="text-center text-danger fs-5">${errorMsg2}</p>
                                        <c:remove var="errorMsg2" scope="session" />
                                    </c:if>
                                </div>


                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary btn-sm">
                                        Update
                                    </button>
                                    <a href="Homepage?mode=viewAdmin" class="btn btn-secondary btn-sm"> Back</a>

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
    <%@include file="/admin_login/script.jsp" %>   

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
                                    "class": "thumb-image",
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

</html>
