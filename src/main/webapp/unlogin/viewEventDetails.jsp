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
        <%@include file="../component/css.jsp" %>

    </head>
    <body>
        <%@include file="../component/navbar.jsp" %>

        <!-- END nav -->
        <%
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
            SimpleDateFormat newFormat = new SimpleDateFormat("DD-MM-yyyy");
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
            Calendar now = Calendar.getInstance();
            int dayOfMonth = now.get(Calendar.DAY_OF_MONTH);
            int month = now.get(Calendar.MONTH) + 1;
            String dayOfMonthStr = ((dayOfMonth < 10) ? "0" : "") + month;
            String monthStr = ((month < 10) ? "0" : "") + month;
            String today = (dayOfMonthStr + "/" + monthStr + "/" + now.get(Calendar.YEAR));
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
                            <p></p>
                            <div class="row d-flex justify-content-center mt-5">
                                <div class="col-md-8">
                                    <form action="Homepage?mode=loginForm" method="post" class="subscribe-form needs-validation" novalidate>
                                        <div class="form-group d-flex" >
                                            <input type="number" class="form-control" placeholder="Enter Student ID" required>
                                            <div class="valid-feedback">
                                                Please login first!!!
                                            </div>
                                            <div class="invalid-feedback">
                                                Please login first!!!
                                            </div>
                                            <input type="submit" value="Submit" class="submit px-3">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
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
        <%@include file="../component/footer.jsp" %>
        <%@include file="../component/script.jsp" %>


    </body>
</html>