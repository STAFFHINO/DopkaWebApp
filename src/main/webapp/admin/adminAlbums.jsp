<%@ page import="DAO.AlbumDAOImpl" %>
<%@ page import="DB.DBConnection" %>
<%@ page import="entity.Album" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin: All Albums Page</title>
    <%@include file="css/allCSS.jsp"%>
</head>
<body style="background-color: #DEE5ED">
<%@include file="adminNavbar.jsp"%>
<h3 class="text-center p-3" style="color: #EAB3C9">All Albums</h3>
<table class="table table-striped p-3">
    <thead class="bg-custom1 text-white">
    <tr>
        <th scope="col">ID</th>
        <th scope="col">Image</th>
        <th scope="col">Album Name</th>
        <th scope="col">Group Name</th>
        <th scope="col">Price</th>
        <th scope="col">Category</th>
        <th scope="col">Status</th>
        <th scope="col">Telegram</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>
    <%
        AlbumDAOImpl dao = new AlbumDAOImpl(DBConnection.getConnection());
        List<Album> albums = dao.getAllAlbums();
        for(Album album: albums) {
    %>
    <tr>
        <th><%=album.getId()%></th>
        <td><img src="../album/<%=album.getPhotoName()%>"
                 alt="<%=album.getPhotoName()%>" style="width: 100px; height: 100px"></td>
        <td><%=album.getAlbumName()%></td>
        <td><%=album.getGroupName()%></td>
        <td><%=album.getPrice()%></td>
        <td><%=album.getCategory()%></td>
        <td><%=album.getStatus()%></td>
        <td><%=album.getUserTelegram()%></td>
        <td>
            <a href="adminEditAlbum.jsp?id=<%=album.getId()%>" class="btn btn-sm btn-success bg-custom1">Edit</a>
            <a href="adminDeleteAlbum?id=<%=album.getId()%>" class="btn btn-sm btn-primary bg-custom4">Delete</a>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>
