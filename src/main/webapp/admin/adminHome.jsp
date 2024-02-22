<%@ page import="entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" rel="stylesheet">
<html>
<head>
    <title>Admin: Home Page</title>
    <%@include file="css/allCSS.jsp"%>
    <%User user1 = null;
    try {
        user1 = (User) session.getAttribute("user");} finally {}
    %>
    <style>
        a {
            text-decoration: none;
        }
        a:hover {
            text-decoration: none;
        }
    </style>
</head>
<body style="background-color: #DEE5ED">
<%@include file="adminNavbar.jsp"%>
<% if(user1!=null){%>
<h3 style="color: #EAB3C9" class="text-center p-3">Hello, Admin</h3>
<div class="container">
    <div class="row p-5">
        <div class="col-md-3">
            <a href="adminAddAlbum.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <i style="color: #EAB3C9" class="fa-solid fa-plus fa-3x"></i>
                        <h4 style="color: #EAB3C9">Add Album</h4>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-3">
            <a href="adminAlbums.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <i style="color: #7CBA96" class="fa-solid fa-book fa-3x"></i>
                        <h4 style="color: #7CBA96">Albums</h4>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-3">
            <a href="adminOrders.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <i style="color: #7CCBEA" class="fa-solid fa-boxes-stacked fa-3x"></i>
                        <h4 style="color: #7CCBEA">Orders</h4>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-3">
            <a href="" data-toggle="modal" data-target="#exampleModalCenter">
                <div class="card">
                    <div class="card-body text-center">
                        <i style="color: #EAB3C9" class="fa-solid fa-door-open fa-3x"></i>
                        <h4 style="color: #EAB3C9">Log Out</h4>
                    </div>
                </div>
            </a>
        </div>

        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-custom2">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="text-center">
                            <h4 style="color: #EAB3C9">Do you want to Log Out?</h4>
                            <a href="../logout" type="button" class="btn btn-primary bg-custom4">Yes</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<%} else {%>
    <h3 style="color: #EAB3C9" class="text-center p-3">Hey, You Are Not Admin, Get Out...</h3>
<div class="container text-center">
    <a href="../index.jsp">
        <div class="card">
            <div class="card-body text-center">
                <i style="color: #EAB3C9" class="fa-solid fa-door-open fa-3x"></i>
                <h4 style="color: #EAB3C9">To Main</h4>
            </div>
        </div>
    </a>
</div>
<%}%>
</body>
</html>
