<%@ page import="java.util.UUID" %>
<%@ page import="DAO.AlbumDAOImpl" %>
<%@ page import="DB.DBConnection" %>
<%@ page import="entity.Album" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin: Edit Album Page</title>
    <%@include file="css/allCSS.jsp"%>
</head>
<body style="background-color: #DEE5ED">
<%@include file="adminNavbar.jsp"%>
<div color="container">
    <div class="row p-3">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 style="color: #EAB3C9" class="text-center">Edit Album</h4>

                    <%String id = request.getParameter("id");
                        AlbumDAOImpl dao = new AlbumDAOImpl(DBConnection.getConnection());
                        Album album = dao.getAlbumById(id);
                    %>
                    <input type="hidden" name="id" value="<%=album.getId()%>">
                    <form action="../adminEditAlbum" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="exampleInputGroup1">Group Name</label>
                            <input name="group" type="text" class="form-control"
                                   id="exampleInputGroup1" value="<%=album.getGroupName()%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputAlbum1">Album Name</label>
                            <input name="name" type="text" class="form-control"
                                   id="exampleInputAlbum1" value="<%=album.getAlbumName()%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPrice1">Price</label>
                            <input name="price" type="text" class="form-control"
                                   id="exampleInputPrice1" value="<%=album.getPrice()%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputStatus1">Album Status</label>
                            <select name="status" class="form-control" id="exampleInputStatus1">
                                <option selected>-select-</option>
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary bg-custom4">Edit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
