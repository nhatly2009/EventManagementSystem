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
<html lang="en">
    <head>
        <title>Home page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <%@include file="css.jsp" %>

    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <%

            ArrayList<Event> listEvent = new ArrayList<Event>();
            listEvent = (ArrayList<Event>) session.getAttribute("getPagination");
            ArrayList<Staff> listStaff = new ArrayList<Staff>();
            listStaff = (ArrayList<Staff>) session.getAttribute("listStaff");
            int listSize = (int) session.getAttribute("listSize");

        %>
        <!-- END nav -->

        <section class="ftco-section bg-light">
            <div class="container">
                <div class="row">
                    <%                        for (int i = 0; i < listEvent.size(); i++) {
                            String staffName = "";
                            String staffPhone = "";
                            for (int j = 0; j < listStaff.size(); j++) {
                                if (listEvent.get(i).getStaffId() == (listStaff.get(j).getStaffId())) {
                                    staffName = listStaff.get(j).getName();
                                    staffPhone = listStaff.get(j).getPhoneNumber();
                                    break;
                                }
                            }
                            int id = listEvent.get(i).getId();
                            String title = listEvent.get(i).getTitle();
                            String dateStart = listEvent.get(i).getDateStart();

                            DateFormat formatter = new SimpleDateFormat("yyyy-MM-DD");
                            Date date = (Date) formatter.parse(dateStart);
                            SimpleDateFormat newFormat = new SimpleDateFormat("DD-MM-yyyy");
                            String finalString = newFormat.format(date);
                            String img = "uploadImages/event/event" + id + ".jpg";

                    %>

                    <div class="col-md-4 ftco-animate ">
                        <div class="blog-entry card">
                            <a href="studentEvent?mode=viewEventDetails&id=<%=id%>" class="block-20" style="background-image: url('<%=img%>');" title="click to view more details">
                            </a>
                            <div class="text p-4 d-block">
                                <div class="meta mb-3">
                                    <div><a href="studentEvent?mode=viewEventDetails&id=<%=id%>" title="click to view more details"><span class="icon-calendar">&nbsp;</span><%=finalString%></a></div>
                                    <div><a href="studentEvent?mode=viewEventDetails&id=<%=id%>" title="click to view more details"><span class="icon-person">&nbsp;</span>Manage By <%=staffName%></a></div> <br>         
                                    <div><a href="studentEvent?mode=viewEventDetails&id=<%=id%>" title="click to view more details"><span class="icon icon-phone">&nbsp;</span> <%=staffPhone%></a></div>             
                                </div>
                                <h3 class="heading" ><a href="studentEvent?mode=viewEventDetails&id=<%=id%>" title="click to view more details"><%=title%></a></h3>   
                            </div>
                        </div>
                    </div>
                    <%}%>

                </div>
                <div class="row mt-5">
                    <div class="col-12 text-center">
                        <div class="block-27">
                            <ul>
                                <%
                                    int a, b;
                                    int limit = listSize / 6;
                                    if (limit * 6 < listSize) {
                                        limit += 1;
                                    }
                                    if (limit > 1) {
                                        for (int i = 1; i <= limit; i++) {
                                            a = (i - 1) * 6;
                                            b = i * 6;
                                            if (b > listSize) {
                                                b = listSize;
                                            }
                                %>
                                <!--                                            <li><a href="#">&lt;</a></li>-->

                                <li class="active"><a href="studentEvent?mode=showListEvent&start=<%=a%>&end=<%=b%>">&ensp;<%=i%>&ensp;</a></li>

                                <!--<li><a href="#">&gt;</a></li>-->                
                                <%
                                        }
                                    }
                                %>

                            </ul>
                        </div>
                    </div>
                </div>

        </section>


        <%@include file="footer.jsp" %>
        <%@include file="script.jsp" %>


    </body>
</html>