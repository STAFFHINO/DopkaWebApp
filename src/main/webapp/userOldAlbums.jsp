<%@ page import="DAO.AlbumDAOImpl" %>
<%@ page import="DB.DBConnection" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Album" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Album Change Shop: User Albums Page</title>
    <%@include file="css/allCSS.jsp"%>
</head>
<body style="background-color: #DEE5ED">
<%@include file="navbar.jsp"%>
<h3 class="text-center p-3" style="color: #EAB3C9">Your Albums</h3>
<div class="container">
    <table class="table table-striped p-3">
        <thead class="bg-custom1 text-white">
        <tr>
            <th scope="col">Image</th>
            <th scope="col">Album Name</th>
            <th scope="col">Group Name</th>
            <th scope="col">Price</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <% User user = (User) session.getAttribute("user");
            AlbumDAOImpl dao = new AlbumDAOImpl(DBConnection.getConnection());
        List<Album> albums = dao.getUserAlbums(user.getTelegram());
        for (Album album: albums){%>
        <tr>
            <td><img src="album/<%=album.getPhotoName()%>"
                     alt="<%=album.getPhotoName()%>" style="width: 200px; height: 200px"></td>
            <td><%=album.getAlbumName()%></td>
            <td><%=album.getGroupName()%></td>
            <td><%=album.getPrice()%></td>
            <td>
                <a href="userDeleteAlbum?id=<%=album.getId()%>" class="btn btn-success bg-custom1">Delete</a>
            </td>
        </tr>
        <%}
        %>
        </tbody>
    </table>
</div>
</body>
</html>
