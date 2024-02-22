<%@ page import="DAO.AlbumDAOImpl" %>
<%@ page import="DB.DBConnection" %>
<%@ page import="entity.Album" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Album Change Shop: View Details</title>
    <%@include file="css/allCSS.jsp"%>
    <%
        String id = request.getParameter("id");
        AlbumDAOImpl dao = new AlbumDAOImpl(DBConnection.getConnection());
        Album album = dao.getAlbumById(id);
    %>
</head>
<body style="background-color: #DEE5ED">
<%@include file="navbar.jsp"%>
<div class="container">
    <div class="row p-3">
        <div class="col-md-6 text-center p-5 bg-white border">
            <img src="album/<%=album.getPhotoName()%>" style="height: 300px; width: 300px"><br>
            <h4 class="mt-4">Album Name: <span style="color: #EAB3C9"><%=album.getAlbumName()%></span></h4>
            <h4>Author Name: <span style="color: #EAB3C9"><%=album.getGroupName()%></span></h4>
            <h4>Category: <span style="color: #EAB3C9"><%=album.getCategory()%></span></h4>
        </div>

        <div class="col-md-6 text-center p-5 bg-white border">
            <h2 style="color: #EAB3C9"><%=album.getAlbumName()%></h2>
            <% if("Old".equals(album.getCategory())){ %>
                <h5>Contact to Seller</h5>
                <h5>TG: <%=album.getUserTelegram()%></h5>
            <% } %>
            <div class="row">
                <div class="col-md-4 text-center p-2">
                    <h6 style="color: #7CBA96">Cash On Delivery</h6>
                </div>
                <div class="col-md-4 text-center p-2">
                    <h6 style="color: #7CCBEA">Return Not Available</h6>
                </div>
                <div class="col-md-4 text-center p-2">
                    <h6 style="color: #7CBA96">Free Delivery</h6>
                </div>
            </div>
            <div class="text-center p-3">
                <% if("Old".equals(album.getCategory())){ %>
                <a href="index.jsp" class="btn btn-primary bg-custom4">Continue Shopping</a>
                <a class="btn btn-success bg-custom1"><%=album.getPrice()%></a>
                <% } else { %>
                <a href="cart?id_album=<%=album.getId()%>&&id_user=<%=user1.getId()%>" class="btn btn-primary bg-custom4">Add Cart</a>
                <a class="btn btn-success bg-custom1"><%=album.getPrice()%></a>
                <% }
                %>
            </div>
        </div>
    </div>
</div>
</body>
</html>
