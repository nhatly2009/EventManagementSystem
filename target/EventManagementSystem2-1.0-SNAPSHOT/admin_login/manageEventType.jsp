<%@page import="com.entity.EventType"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
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
        <title>Event Page</title>
        <%@include file="/admin_login/css.jsp"%>
    </head>
    <body class="">
        <!-- Navbar-->
        <%@include file="/admin_login/navbar.jsp"%>

        <!-- DATA-->
        <section class="statistic-chart">
            <div class="container">

                <%
                    ArrayList<EventType> listType = new ArrayList<EventType>();
                    listType = (ArrayList<EventType>) session.getAttribute("getListType");

                %>
                <div class="row">
                    <div class="col-md-12 col-lg-12">
                        <!-- Event Type-->
                        <div class="top-campaign">
                            <h3 class="title-3 m-b-30">List Event Type (Total Type: <%=listType.size()%>)</h3> 
                            <c:if test="${not empty succSignupMsg }">
                                <p class="text-center text-success fs-3">${succSignupMsg}</p>
                                <c:remove var="succSignupMsg" scope="session" />
                            </c:if>

                            <c:if test="${not empty errorMsg }">
                                <p class="text-center text-danger fs-5">${errorMsg}</p>
                                <c:remove var="errorMsg" scope="session" />
                            </c:if>
                            <div class="table-responsive table--no-card m-b-30">
                                <table class="table table-borderless table-striped table-earning">
                                    <thead>
                                    <th>ID</th>
                                    <th>Type Name</th>
                                    <th>Description</th>
                                    <th>Status</th>
                                    <th>Function</th>
                                    </thead>
                                    <tbody>
                                        <%
                                            for (int i = 0; i < listType.size(); i++) {
                                        %>
                                        <tr >
                                            <td><font color="blue"><%=listType.get(i).getId()%></font></td>
                                            <td><font color="red"><%=listType.get(i).getEventTypeName()%></font></td>
                                            <td><%=listType.get(i).getEventTypeDescription()%></td>
                                            <td><%=listType.get(i).getStatus()%></td>
                                            <td><a href='ControllerET?mode=viewEventTypeDetails&id=<%=listType.get(i).getId()%>' class="btn btn-primary btn-sm">View & Update</a></td>

                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                            <div class="table-data__tool">
                                <div class="table-data__tool-left ml-5">   
                                    <!--<a class="au-btn au-btn-icon au-btn--green au-btn--small" href="ListType?mode=eventTypeForm">Add New Type</a>-->
                                    <button type="button" class="au-btn au-btn-icon au-btn--green au-btn--small" 
                                            data-toggle="modal" data-target="#exampleModalCenter">Add New Type</button>
                                </div>
                            </div>
                        </div>
                        <!-- END Event Type-->
                    </div>
                </div>
            </div>
        </section>
        <!-- END DATA-->


        <!-- Add Type Dialog-->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Add New Type</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ControllerET" method="get" class="needs-validation" novalidate>
                            <input type="hidden" name="mode" value="addNewEventType"/>
                            <div class="form-group">
                                <label for="validationCustom01">Enter Event Type Name</label>
                                <input type="text" name="typeEventName" class="form-control" id="validationCustom01" required>
                                <div class="valid-feedback">
                                    Done!
                                </div>
                                <div class="invalid-feedback">
                                    Please enter the name of type!
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Enter Type Description</label> 
                                <input type="text" name="typeDescription" class="form-control">

                            </div>
                            <div>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Add</button> 
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Add Type -->

        <%@include file="/admin_login/script.jsp"%>
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
    </body>

</html>
<!-- end document-->
