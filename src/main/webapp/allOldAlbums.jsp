<%@ page import="DB.DBConnection" %>
<%@ page import="DAO.AlbumDAOImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Album" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Album Change Shop: All Old Albums page</title>
    <%@include file="css/allCSS.jsp"%>
    <style>
        .crd-no:hover{
            background-color: #DEE5ED;
        }
    </style>
</head>
<body style="background-color: #DEE5ED">
<%@include file="navbar.jsp"%>
<div class="container">
    <div class="row p-3">
        <%AlbumDAOImpl dao = new AlbumDAOImpl(DBConnection.getConnection());
            List<Album> oldAlbums = dao.getAllAlbumsByCategory("Old");
            for (Album album: oldAlbums){%>
        <div class="col-md-3">
            <div class="card crd-no mt-2">
                <div class="card-body text-center">
                    <img src="album/<%=album.getPhotoName()%>" alt="<%=album.getPhotoName()%>" style="width: 200px; height:200px;">
                    <p><%=album.getAlbumName()%></p>
                    <p><%=album.getGroupName()%></p>
                    <p>Categories: <%=album.getCategory()%></p>
                    <div>
                        <a href="view.jsp?id=<%=album.getId()%>" class="btn btn-success bg-custom1 btn-sm ml-1">View</a>
                        <a href="" class="btn btn-primary bg-custom4 btn-sm ml-1"><%=album.getPrice()%></a>
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