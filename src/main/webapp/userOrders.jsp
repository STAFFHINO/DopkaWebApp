<%@ page import="entity.User" %>
<%@ page import="DAO.OrderDAOImpl" %>
<%@ page import="DB.DBConnection" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.Order" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Album Change Shop: User Orders Page</title>
    <%@include file="css/allCSS.jsp"%>
</head>
<body style="background-color: #DEE5ED">
<%@include file="navbar.jsp"%>
<h3 class="text-center p-3" style="color: #EAB3C9">Your Orders</h3>
<table class="table table-striped p-3">
    <thead class="bg-custom4 text-white">
    <%
        User user = (User) session.getAttribute("user");
        OrderDAOImpl dao = new OrderDAOImpl(DBConnection.getConnection());
        List<Order> orders = dao.getOrderDetailsByTelegram(user.getTelegram());%>
    <tr>
        <th scope="col">Order ID</th>
        <th scope="col">Full Name</th>
        <th scope="col">Telegram</th>
        <th scope="col">Address</th>
        <th scope="col">Phone Number</th>
        <th scope="col">Album Name</th>
        <th scope="col">Group Name</th>
        <th scope="col">Price</th>
        <th scope="col">Payment Type</th>
        <th><%=user.getTelegram()%> telegram</th>
    </tr>
    </thead>
    <tbody>
        <%for (Order order:orders){%>
    <tr>
        <th><%=order.getOrderType()%></th>
        <td><%=order.getUserName()%></td>
        <td><%=order.getUserTelegram()%></td>
        <td><%=order.getUserAddress()%></td>
        <td><%=order.getUserPhone()%></td>
        <td><%=order.getAlbumName()%></td>
        <td><%=order.getGroupName()%></td>
        <td><%=order.getPrice()%></td>
        <td><%=order.getPaymentMethod()%></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>
