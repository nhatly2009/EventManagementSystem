<%@include file="/checkLoginheader.jsp"%>
<div class="page-content--bgf7">
    <!-- HEADER DESKTOP-->

    <header class="header-desktop3 d-none d-lg-block">
        <div class="section__content section__content--p35">
            <div class="header3-wrap">
                <div class="header__logo">
                    <a href='Homepage?mode=viewAdmin'>
                        <h2><span class="text-primary font-weight-bold  px-3 mr-1">Event Management</span></h2>  
                    </a>
                </div>

                <div class="header__navbar mb-8">
                    <ul class="list-unstyled">
                        <li class="menu active">
                            <a href='Homepage?mode=viewAdmin'>Dashboard
                                <span class="bot-line"></span>
                            </a>
                        </li>
                        <li class="has-sub menu">
                            <a href="#">
                                <span class="bot-line"></span>List Account</a>
                            <ul class="header3-sub-list list-unstyled">
                                <li>
                                    <%if (adminLog != null) {%>
                                    <a href="ListAccount?mode=listStaff">List Staff Account</a>
                                    <%}%>
                                    <%if (staffLog != null) {%>
                                    <a href='ListAccount?mode=dontHaveAccess'>List Staff Account</a>
                                    <%}%>

                                </li>
                                <li>
                                    <a href="ListAccount?mode=listStudent">List Student Account</a>
                                </li> 
                            </ul>
                        </li>
                        <li class="has-sub menu">
                            <a href="#">
                                <span class="bot-line"></span>Event</a>
                            <ul class="header3-sub-list list-unstyled">
                                <li>
                                    <a href='Controller?mode=listEvent'>List Event</a>
                                </li>
                                <li>
                                    <a href='ControllerET?mode=listType'>List Event Type</a>
                                </li>
                                <li>
                                    <a href='ControllerEJR?mode=listEventJointRequest'>Event Joint Request</a>
                                </li>
                                <li>
                                    <a href='ControllerESI?mode=listEventSuggestIdeas'>Event Suggest Ideas</a>
                                </li> 
                            </ul>
                        </li>               
                    </ul>
                </div>

                <div class="account-wrap">
                    <div class="account-item clearfix js-item-menu">
                        <%if (adminLog != null) {%>
                        <div class="image">
                            <img src="images/administrator.png" alt="Image" />
                        </div>
                        <div class="content">
                            <a class="js-acc-btn text-light" href="#"><%=logedUserName%></a>
                        </div>
                        <div class="account-dropdown js-dropdown">
                            <div class="info clearfix">
                                <div class="image">
                                    <a href="#">
                                        <img src="images/administrator_male_100px.png" alt="Administrator" />
                                    </a>
                                </div>
                                <div class="content">
                                    <h5 class="name">
                                        <a href="#"><%=logedUserName%></a>
                                    </h5>
                                </div>
                            </div>
                            <div class="account-dropdown__body">
                                <div class="account-dropdown__item">                                 
                                    <a href='ListAccount?mode=registerForStaffForm'>Register for Staff</a>                                   
                                </div>
                            </div>
                            <div class="account-dropdown__footer">
                                <a href="Homepage?mode=Logout">Logout</a>
                            </div>
                        </div>
                        <%}%>
                        <%if (staffLog != null) {
                                String img = staffLog.getImage();
                                if (img == null || img.equals("")) {
                                    img = "images/administrator.png";
                                }
                                String email = staffLog.getEmail();

                        %>

                        <div class="image">
                            <img src="<%=img%>" alt="Image" />
                        </div>
                        <div class="content">
                            <a class="js-acc-btn text-light" href="#"><%=logedUserName%></a>
                        </div>
                        <div class="account-dropdown js-dropdown">
                            <div class="info clearfix">
                                <div class="image">

                                    <a href="#">
                                        <img src="<%=img%>" alt="Loading" />
                                    </a>

                                </div>
                                <div class="content">
                                    <h5 class="name">
                                        <a href="#"><%=logedUserName%></a>
                                    </h5>
                                    <% if (email != null) {%>
                                    <small class="name">
                                        <a href="#"><%=email%></a>
                                    </small>
                                    <%}%>
                                </div>
                            </div>
                            <div class="account-dropdown__body">
                                <div class="account-dropdown__item">                                 
                                    <a href='ListAccount?mode=updateStaffProfileForm&staffId=<%=staffLog.getStaffId()%>'>Profile</a>
                                </div>
                            </div>
                            <div class="account-dropdown__footer">
                                <a href="Homepage?mode=Logout">Logout</a>
                            </div>
                        </div>
                        <%}%>

                    </div>
                </div>
            </div>               
        </div>
    </header>
    <!-- END HEADER DESKTOP-->
</div>