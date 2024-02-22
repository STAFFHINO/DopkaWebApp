<%@ page import="DB.DBConnection" %>
<%@ page import="DAO.AlbumDAOImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Album" %>
<%@ page import="entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Album Change Shop: Main page</title>
    <%@include file="css/allCSS.jsp"%>
    <style>
        .back-img {
            background: url("img/bg.jpg");
            height: 50vh;
            width: 100%;
            background-repeat: no-repeat;
            background-size: cover;
            color: #EAB3C9;
        }

        .crd-no:hover{
            background-color: #DEE5ED;
        }
    </style>
</head>
<body style="background-color: #DEE5ED">
    <% User user =(User) session.getAttribute("user"); %>
    <%@include file="navbar.jsp"%>
    <div class="container-fluid back-img">
        <h2 class="text-left">K-POP Albums Stock</h2>
    </div>
    <div class="container">
        <h3 class="text-center" style="color: #EAB3C9">Recent Albums</h3>
        <div class="row">
            <%AlbumDAOImpl dao = new AlbumDAOImpl(DBConnection.getConnection());
                List<Album> recentAlbums = dao.getResentAlbums();
                for (Album album: recentAlbums){%>
            <div class="col-md-3">
                <div class="card crd-no">
                    <div class="card-body text-center">
                        <img src="album/<%=album.getPhotoName()%>" alt="<%=album.getPhotoName()%>" style="width: 200px; height:200px;">
                        <p><%=album.getAlbumName()%></p>
                        <p><%=album.getGroupName()%></p>
                        <p>Categories: <%=album.getCategory()%></p>
                        <div>
                            <%if(album.getCategory().equals("New")){
                                %>
                            <% if(user == null){%><a href="login.jsp" class="btn btn-primary bg-custom4 btn-sm ml-1">Add Cart</a><%
                            } else {%><a href="cart?id_album=<%=album.getId()%>&&id_user=<%=user.getId()%>" class="btn btn-primary bg-custom4 btn-sm ml-1">Add Cart</a><%}%>
                            <a href="view.jsp?id=<%=album.getId()%>" class="btn btn-success bg-custom1 btn-sm ml-1">View</a>
                            <a href="" class="btn btn-primary bg-custom4 btn-sm ml-1"><%=album.getPrice()%></a>
                            <%
                            } else {%>
                            <a href="view.jsp?id=<%=album.getId()%>" class="btn btn-success bg-custom1 btn-sm ml-1">View</a>
                            <a href="" class="btn btn-primary bg-custom4 btn-sm ml-1"><%=album.getPrice()%></a>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
            <%}%>
        </div>
        <div class="text-center mt-1">
            <a href="allRecentAlbums.jsp" class="btn btn-success bg-custom1">View All</a>
        </div>
    </div>

    <hr>

    <div class="container" style="background-color: #DEE5ED">
        <h3 class="text-center" style="color: #EAB3C9">New Albums</h3>
            <div class="row">
            <%AlbumDAOImpl dao1 = new AlbumDAOImpl(DBConnection.getConnection());
                List<Album> newAlbums = dao1.getAlbumsByCategory("New");
            for (Album album: newAlbums){%>
                <div class="col-md-3">
                    <div class="card crd-no">
                        <div class="card-body text-center">
                            <img src="album/<%=album.getPhotoName()%>" alt="<%=album.getPhotoName()%>" style="width: 200px; height:200px;">
                            <p><%=album.getAlbumName()%></p>
                            <p><%=album.getGroupName()%></p>
                            <p>Categories: <%=album.getCategory()%></p>
                            <div>
                                <% if(user == null){%><a href="login.jsp" class="btn btn-primary bg-custom4 btn-sm ml-1">Add Cart</a><%
                            } else {%><a href="cart?id_album=<%=album.getId()%>&&id_user=<%=user.getId()%>" class="btn btn-primary bg-custom4 btn-sm ml-1">Add Cart</a><%}%>
                                <a href="view.jsp?id=<%=album.getId()%>" class="btn btn-success bg-custom1 btn-sm ml-1">View</a>
                                <a href="" class="btn btn-primary bg-custom4 btn-sm ml-1"><%=album.getPrice()%></a>
                            </div>
                        </div>
                    </div>
                </div>
            <%}%>
            </div>
        <div class="text-center mt-1">
            <a href="allNewAlbums.jsp" class="btn btn-success bg-custom1">View All</a>
        </div>
    </div>

    <hr>

    <div class="container" style="background-color: #DEE5ED">
        <h3 class="text-center" style="color: #EAB3C9">Old Albums</h3>
        <div class="row">
            <% AlbumDAOImpl dao2 = new AlbumDAOImpl(DBConnection.getConnection());
                List<Album> OldAlbums = dao2.getAlbumsByCategory("Old");
                for (Album album: OldAlbums){%>
            <div class="col-md-3">
                <div class="card crd-no">
                    <div class="card-body text-center">
                        <img src="album/<%=album.getPhotoName()%>" alt="<%=album.getPhotoName()%>" style="width: 200px; height:200px;">
                        <p><%=album.getAlbumName()%></p>
                        <p><%=album.getGroupName()%></p>
                        <p>Categories: <%=album.getCategory()%></p>
                        <div class="text-center">
                            <a href="view.jsp?id=<%=album.getId()%>" class="btn btn-success bg-custom1 btn-sm ml-1">View</a>
                            <a href="" class="btn btn-primary bg-custom4 btn-sm ml-1"><%=album.getPrice()%></a>
                        </div>
                    </div>
                </div>
            </div>
            <%}%>
        </div>
        <div class="text-center mt-1">
            <a href="allOldAlbums.jsp" class="btn btn-success bg-custom1">View All</a>
        </div>
    </div>

    <hr>
    <%@include file="footer.jsp"%>
</body>
</html>
