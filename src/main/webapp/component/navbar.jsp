
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Event Management</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>
        <div id="topheader"> 
            <div class="collapse navbar-collapse" id="ftco-nav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active"><a href="index?mode=viewHomepage" class="nav-link ">Home</a></li>   
                    <li class="nav-item"><a href="index?mode=showListEvent" class="nav-link">Event</a></li>
                    <li class="nav-item"><a href="Homepage?mode=loginForm" class="nav-link">Sent Request</a></li>
                    <li class="nav-item"><a href="Homepage?mode=loginForm" class="nav-link">New Ideas</a></li>
                    <li class="nav-item cta"><a href="Homepage?mode=loginForm" class="nav-link"><span>Login</span></a></li>
                </ul>
            </div>
        </div>

    </div>
</nav>
<script>
    $('#topheader .navbar-nav a').on('click',
            function () {
                $('#topheader .navbar-nav').find('li.active')
                        .removeClass('active');
                $(this).parent('li').addClass('active');
            });
</script>