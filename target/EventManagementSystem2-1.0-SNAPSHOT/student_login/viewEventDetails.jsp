<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.entity.Staff"%>
<%@page import="com.entity.EventType"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.Event"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <title>Home page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <%@include file="css.jsp" %>

    </head>
    <body>
        <%@include file="navbar.jsp" %>

        <!-- END nav -->
        <%
            int studentId = (int) session.getAttribute("getStudentId");

            ArrayList<Event> listEvent = new ArrayList<Event>();
            listEvent = (ArrayList<Event>) session.getAttribute("getListEvent");
            ArrayList<EventType> listType = new ArrayList<EventType>();
            listType = (ArrayList<EventType>) session.getAttribute("getListType");
            ArrayList<Staff> listStaff = new ArrayList<Staff>();
            listStaff = (ArrayList<Staff>) session.getAttribute("listStaff");
            Event event = (Event) session.getAttribute("getEvent");
            int id = event.getId();
            String title = event.getTitle();
            String description = event.getDescription();

            DateFormat formatter = new SimpleDateFormat("yyyy-MM-DD");
            Date date = (Date) formatter.parse(event.getDateStart());
            SimpleDateFormat newFormat = new SimpleDateFormat("DD/MM/yyyy");
            String dateStart = newFormat.format(date);

            date = (Date) formatter.parse(event.getDateForJointRequest());
            String dateForJointRequest = newFormat.format(date);

            String img = event.getImage();
            String staffName = "";
            String staffPhone = "";
            String staffImg = "";
            for (int j = 0; j < listStaff.size(); j++) {
                if (event.getStaffId() == (listStaff.get(j).getStaffId())) {
                    staffName = listStaff.get(j).getName();
                    staffPhone = listStaff.get(j).getPhoneNumber();
                    staffImg = listStaff.get(j).getImage();

                    break;
                }
            }
            String typeName = "";
            String typeDescription = "";
            for (int j = 0; j < listType.size(); j++) {
                if (event.getType() == listType.get(j).getId()) {
                    typeName = listType.get(j).getEventTypeName();
                    typeDescription = listType.get(j).getEventTypeDescription();
                    break;
                }
            }

            //get date today
            SimpleDateFormat formatterToday = new SimpleDateFormat("yyyy-MM-dd");
            Date dateToday = new Date();
            String today = formatterToday.format(dateToday);
            ///

        %>
        <section class="ftco-section ftco-degree-bg">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 ftco-animate">
                        <h2 class="mb-3">#<%=id%>.&nbsp; <%=title%></h2>
                        <p><%=description%></p>
                        <p>
                            <img src="<%=img%>" alt="" class="img-fluid">
                        </p>
                        <p> Type:&nbsp; <%=typeName%>
                            <br>
                            <small><%=typeDescription%></small></p>
                        <p class="text-red">
                            Start Date: &nbsp; <%=dateStart%>
                        </p>
                        <p class="text-blue">
                            Registration closing date: &nbsp; <%=dateForJointRequest%>
                        </p>
                      
                        <div class="about-author d-flex p-5 bg-light">
                            <div class="bio align-self-md-center mr-5">
                                <img src="<%=staffImg%>" alt="Loading" class="staffImg mb-4">
                            </div>
                            <div class="desc align-self-md-center">
                                <p><small>This Event Manage By</small></p>
                                <h3><%=staffName%></h3>
                                <p><span class="icon icon-phone">&nbsp;</span> <%=staffPhone%></p>
                            </div>
                        </div>
                    </div> <!-- .col-md-8 -->

                    <div class="col-md-4 sidebar ftco-animate">


                        <div class="sidebar-box ftco-animate">
                            <h3>Recent Event</h3>
                            <%
                                if (listEvent.size() > 3) {
                                    for (int i = 0; i < 3; i++) {
                                        int idRE = listEvent.get(i).getId();
                                        String titleRE = listEvent.get(i).getTitle();
                                        date = (Date) formatter.parse(listEvent.get(i).getDateStart());
                                        String dateRE = newFormat.format(date);
                                        String imgRE = "uploadImages/event/event" + idRE + ".jpg";
                                        String staffNameRE = "";
                                        String staffPhoneRE = "";
                                        for (int j = 0; j < listStaff.size(); j++) {
                                            if (listEvent.get(i).getStaffId() == (listStaff.get(j).getStaffId())) {
                                                staffNameRE = listStaff.get(j).getName();
                                                staffPhoneRE = listStaff.get(j).getPhoneNumber();
                                                break;
                                            }
                                        }
                            %>
                            <div class="block-21 mb-4 d-flex" >
                                <a class="blog-img mr-4" style="background-image: url(<%=imgRE%>);"></a>
                                <div class="text">
                                    <h3 class="heading"><a href="index?mode=viewEventDetails&id=<%=idRE%>"><%=titleRE%></a></h3>
                                    <div class="meta">
                                        <div><a href="index?mode=viewEventDetails&id=<%=idRE%>" title="click to view more details"><span class="icon-calendar">&nbsp;</span><%=dateRE%></a></div>
                                        <div><a href="index?mode=viewEventDetails&id=<%=idRE%>" title="click to view more details"><span class="icon-person">&nbsp;</span>Manage By <%=staffNameRE%></a></div> <br>         
                                        <div><a href="index?mode=viewEventDetails&id=<%=idRE%>" title="click to view more details"><span class="icon icon-phone">&nbsp;</span> <%=staffPhoneRE%></a></div>
                                    </div>
                                </div>
                            </div>
                            <%}
                            } else {
                                for (int i = 0; i < listEvent.size(); i++) {
                                    int idRE = listEvent.get(i).getId();
                                    String titleRE = listEvent.get(i).getTitle();
                                    date = (Date) formatter.parse(listEvent.get(i).getDateStart());
                                    String dateRE = newFormat.format(date);
                                    String imgRE = "uploadImages/event/event" + idRE + ".jpg";
                                    String staffNameRE = "";
                                    String staffPhoneRE = "";
                                    for (int j = 0; j < listStaff.size(); j++) {
                                        if (listEvent.get(i).getStaffId() == (listStaff.get(j).getStaffId())) {
                                            staffNameRE = listStaff.get(j).getName();
                                            staffPhoneRE = listStaff.get(j).getPhoneNumber();
                                            break;
                                        }
                                    }
                            %>
                            <div class="block-21 mb-4 d-flex" >
                                <a class="blog-img mr-4" style="background-image: url(<%=imgRE%>);"></a>
                                <div class="text">
                                    <h3 class="heading"><a href="index?mode=viewEventDetails&id=<%=idRE%>"><%=titleRE%></a></h3>
                                    <div class="meta">
                                        <div><a href="index?mode=viewEventDetails&id=<%=idRE%>" title="click to view more details"><span class="icon-calendar">&nbsp;</span><%=dateRE%></a></div>
                                        <div><a href="index?mode=viewEventDetails&id=<%=idRE%>" title="click to view more details"><span class="icon-person">&nbsp;</span>Manage By <%=staffNameRE%></a></div> <br>         
                                        <div><a href="index?mode=viewEventDetails&id=<%=idRE%>" title="click to view more details"><span class="icon icon-phone">&nbsp;</span> <%=staffPhoneRE%></a></div>
                                    </div>
                                </div>
                            </div><% }
                                }%>
                        </div>
                    </div>

                </div>
            </div>
        </section> <!-- .section -->

        <section class="ftco-section-parallax">
            <div class="parallax-img d-flex align-items-center">
                <div class="container">
                    <div class="row d-flex justify-content-center">
                        <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
                            <h2>Submit Your Joint Request</h2>
                            <p>Please Enter Your Student ID And Click Submit<br>If you want to join this event</p>
                            <div class="row d-flex justify-content-center ">
                                <div class="col-md-8">
                                    <form action="studentEvent?mode=sentRequest" method="post" class="subscribe-form needs-validation" novalidate>
                                        <input type="hidden" name="eventId" value="<%=id%>">
                                        <input type="hidden" name="today" value="<%=today%>">
                                        <div class="form-group">
                                            <div class="d-flex">
                                                <input type="number" class="form-control" name="studentId" value="" placeholder="Student ID" id="validationCustom01" maxlength="10" oninput="maxLengthCheck(this)" required>
                                                <div class="valid-feedback">
                                                    Done!
                                                </div>
                                                <div class="invalid-feedback">
                                                    Please select a valid ID before submit.
                                                </div>
                                                <input type="submit" value="Submit" class="submit px-3">

                                            </div> 

                                        </div>

                                        <c:if test="${not empty succJoint }">
                                            <p class="text-center text-success fs-3">${succJoint}</p>
                                            <c:remove var="succJoint" scope="session" />
                                        </c:if>

                                        <c:if test="${not empty errorJoint }">
                                            <p class="text-center text-danger fs-5">${errorJoint}</p>
                                            <c:remove var="errorJoint" scope="session" />
                                        </c:if>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--        <div class="row">
                    <div class="col-md-12 text-center">
        
                        <p> Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. 
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                             Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. </p>
                    </div>
                </div>-->




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
        <%@include file="footer.jsp" %>
        <%@include file="script.jsp" %>
    </body>
</html>