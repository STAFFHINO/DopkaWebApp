<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" rel="stylesheet">
<html>
<head>
    <title>Album Change Shop: Home page</title>
    <%@include file="css/allCSS.jsp"%>
</head>
<style>
    a {
        text-decoration: none;
    }
    a:hover {
        text-decoration: none;
    }
</style>
<body style="background-color: #DEE5ED">
<%@include file="navbar.jsp"%>

<div class="container p-3">
    <% User user =(User) session.getAttribute("user"); %>
    <h3 class="text-center" style="color: #EAB3C9">Hello, <%=user.getName()%>!</h3>
    <div class="row p-3">
        <div class="col-md-4">
            <a href="sellAlbum.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <i style="color: #EAB3C9" class="fa-solid fa-compact-disc fa-3x"></i>
                        <h3 style="color: #EAB3C9">Sell Old Album</h3>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-4">
            <a href="userOldAlbums.jsp?userTelegram=<%=user.getTelegram()%>">
                <div class="card">
                    <div class="card-body text-center">
                        <i style="color: #7CCBEA" class="fa-solid fa-lines-leaning fa-3x"></i>
                        <h3 style="color: #7CCBEA">Your Albums</h3>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-4">
            <a href="editProfile.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <i style="color: #7CCBEA" class="fa-solid fa-address-card fa-3x"></i>
                        <h3 style="color: #7CCBEA">Edit Profile</h3>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-4 mt-3 offset-md-2">
            <a href="userOrders.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <i style="color: #7CBA96" class="fa-solid fa-boxes-stacked fa-3x"></i>
                        <h3 style="color: #7CBA96">Your Orders</h3>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-4 mt-3">
            <a href="help.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <i style="color: #7CBA96" class="fa-solid fa-phone fa-3x"></i>
                        <h3 style="color: #7CBA96">Help Center</h3>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>

</body>
</html>
