<%@ page import="entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid" style="height: 10px; background-color: #EAB3C9"></div>
<div class="container-fluid p-3" style="background-color: white">
    <div class="row">
        <div class="col-md-3">
            <h3 style="color: #EAB3C9">Album Change</h3>
        </div>
        <div class="col-md-6">
            <form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
                <input class="form-control mr-sm-2"  type="search" placeholder="Search" aria-label="Search" name="search">
                <button class="btn btn-success my-2 my-sm-0 bg-custom1" type="submit">Search</button>
            </form>
        </div>
        <div class="col-md-3">
            <%
                User user1 = null;
                try {
                user1 = (User) session.getAttribute("user");
                } finally {}
                if(user1!=null){%>
            <a href="cart.jsp" class="btn btn-success bg-custom1 ml-1">Cart</a>
            <a style="cursor: default" class="btn bg-custom4 ml-1 text-white" ><%=user1.getName()%></a>
            <a href="logout" class="btn btn-primary bg-custom4 ml-1">Log Out</a>
                <%} else {%>
            <a href="login.jsp" class="btn btn-primary bg-custom4 ml-1">Login</a>
            <a href="register.jsp" class="btn btn-primary bg-custom4 ml-1">Register</a>
            <%}%>
        </div>
    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom2">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp">Main</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="allRecentAlbums.jsp">Resent Albums</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="allNewAlbums.jsp">New Albums</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link disabled" href="allOldAlbums.jsp">Old Albums</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <%if(user1!=null){%>
            <a href="home.jsp" class="btn btn-primary bg-custom4 ml-1" type="submit">Home</a>
            <%} else {%>
            <a href="login.jsp" class="btn btn-primary bg-custom4 ml-1" type="submit">Home</a>
            <%}%>
            <a href="help.jsp" class="btn btn-primary bg-custom4 ml-1" type="submit">Contact Us</a>
        </form>
    </div>
</nav>