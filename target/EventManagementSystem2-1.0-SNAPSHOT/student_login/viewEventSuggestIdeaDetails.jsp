
<%@page import="com.entity.EventType"%>
<%@page import="com.entity.EventSuggestIdeas"%>
<%@page import="java.util.ArrayList"%>
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

        <!-- END nav -->

        <section class="ftco-section ftco-degree-bg ">
            <%
                EventSuggestIdeas eventSuggestIdeas = (EventSuggestIdeas) session.getAttribute("eventSuggestIdeas");
                ArrayList<EventType> listType = new ArrayList<EventType>();
                listType = (ArrayList<EventType>) session.getAttribute("getListType");
                String typeName = "";
                for (int j = 0; j < listType.size(); j++) {
                    if (eventSuggestIdeas.getEventTypeId() == listType.get(j).getId()) {
                        typeName = listType.get(j).getEventTypeName();
                        break;
                    }
                }
            %>
            <div class="container mt-5">
                <div class='row'>
                    <div class='col col-md-8 '>
                        <div class="card">
                            <div class="card-header">
                                <strong>Event Suggest Idea Details </strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="eventSuggestId" class=" form-control-label" readonly>ID</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="eventSuggestId" name="id" readonly value="<%=eventSuggestIdeas.getId()%>" class="form-control">
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>                             

                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="title" class=" form-control-label">Event Title</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="title" name="title" readonly value="<%=eventSuggestIdeas.getTitle()%>" class="form-control">
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="type" class=" form-control-label">Event Type</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="type" name="type" readonly value="<%=typeName%>" class="form-control">
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="location" class=" form-control-label">Location</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="location" name="location" readonly value="<%=eventSuggestIdeas.getLocation()%>" class="form-control">
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="description" class=" form-control-label">Description</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <textarea name="description" id="description" readonly rows="6" class="form-control"><%=eventSuggestIdeas.getDescription()%></textarea>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="date_submit" class=" form-control-label">Date Submit</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="date" id="datepicker" readonly name="date_submit" class="form-control" value="<%=eventSuggestIdeas.getSubmitDate()%>">
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="status" class=" form-control-label">Date Submit</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text"  readonly name="status" class="form-control" value="<%=eventSuggestIdeas.getStatus()%>">
                                        <!--<small class="form-text text-muted">This is a help text</small>-->
                                    </div>
                                </div>

                            </div>
                            <div class="card-footer">

                                <a href="studentEvent?mode=showListNewIdeas" class="btn btn-secondary btn-sm" >Back</a>
                            </div>
                        </div>
                    </div>


                </div>


            </div>
        </section>
        <%@include file="footer.jsp" %>
        <%@include file="script.jsp" %>


    </body>
</html>