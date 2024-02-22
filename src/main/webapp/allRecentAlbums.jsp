<%@ page import="DB.DBConnection" %>
<%@ page import="DAO.AlbumDAOImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Album" %>
<%@ page import="entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Album Change Shop: All Recent Albums page</title>
    <%@include file="css/allCSS.jsp"%>
    <style>
        .crd-no:hover{
            background-color: #DEE5ED;
        }
    </style>
</head>
<body style="background-color: #DEE5ED">
<%@include file="navbar.jsp"%>
<% User user =(User) session.getAttribute("user"); %>
<div class="container">
    <div class="row p-3">
        <%AlbumDAOImpl dao = new AlbumDAOImpl(DBConnection.getConnection());
            List<Album> recentAlbums = dao.getAllRecentAlbums();
            for (Album album: recentAlbums){%>
        <div class="col-md-3">
            <div class="card crd-no mt-2">
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
                        <a href="" class="btn btn-success bg-custom1 btn-sm ml-1">View</a>
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
</div>
<%@include file="footer.jsp"%>
</body>
</html>