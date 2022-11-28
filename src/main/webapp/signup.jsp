<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport"
              content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Register Page</title>
        <%@include file="component/css-login.jsp" %>
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
        <section class="form-02-main">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="_lk_de">
                            <div class="form-03-main">
                                <div class="logo">
                                    <img src="images/user.png">
                                </div>
                                <c:if test="${not empty succMsg }">
                                    <p class="text-center text-success fs-3">${succMsg}</p>
                                    <c:remove var="succMsg" scope="session" />
                                </c:if>

                                <c:if test="${not empty errorMsg }">
                                    <p class="text-center text-danger fs-5">${errorMsg}</p>
                                    <c:remove var="errorMsg" scope="session" />
                                </c:if>
                                <form action="Register" method="post" class="needs-validation" novalidate>
                                    <input type="hidden" name="mode" value="registerStudent">
                                    <div class="form-group">
                                        <input type="text" name="username" class="form-control _ge_de_ol"
                                               placeholder="Enter Username" required maxlength="35" id="validationCustom01" oninput="maxLengthCheck(this)"
                                               aria-required="true">
                                        <div class="valid-feedback">
                                            Done!
                                        </div>
                                        <div class="invalid-feedback">
                                            Please enter a valid username.
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <input type="password" name="password" maxlength="45" oninput="maxLengthCheck(this)"
                                               class="form-control _ge_de_ol" id="validationCustom02"
                                               placeholder="Enter Password" required aria-required="true">
                                        <div class="valid-feedback">
                                            Done!
                                        </div>
                                        <div class="invalid-feedback">
                                            Please enter a valid password.
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input name="email" type="email" maxlength="35" oninput="maxLengthCheck(this)"
                                               class="form-control _ge_de_ol" id="validationCustom03"
                                               placeholder="Enter Email" required aria-required="true">
                                        <div class="valid-feedback">
                                            Done!
                                        </div>
                                        <div class="invalid-feedback">
                                            Please enter a valid Email.
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input name="fullname" type="text" maxlength="35" oninput="maxLengthCheck(this)"
                                               class="form-control _ge_de_ol" id="validationCustom04"
                                               placeholder="Enter Full Name" required aria-required="true">
                                        <div class="valid-feedback">
                                            Done!
                                        </div>
                                        <div class="invalid-feedback">
                                            Please enter your full name.
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input name="studentId" type="number" maxlength="10" oninput="maxLengthCheck(this)"
                                               class="form-control _ge_de_ol" id="validationCustom05"
                                               placeholder="Enter Student ID" required
                                               aria-required="true">
                                        <div class="valid-feedback">
                                            Done!
                                        </div>
                                        <div class="invalid-feedback">
                                            Please enter your student ID.
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="_btn_04">
                                            <button type="submit" class="btn btn-outline text-white">Register</button>

                                        </div>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
    <script>
        function maxLengthCheck(object) {
            if (object.value.length > object.maxLength)
                object.value = object.value.slice(0, object.maxLength)
        }
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