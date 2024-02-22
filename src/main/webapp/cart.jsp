<%@ page import="entity.Cart" %>
<%@ page import="DAO.CartDAOImpl" %>
<%@ page import="DB.DBConnection" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Album Change Shop: Cart page</title>
    <%@include file="css/allCSS.jsp"%>
</head>
<body style="background-color: #DEE5ED">
<%@include file="navbar.jsp"%>
<div class="container p-3">
    <div class="row">
        <div class="col-md-6">
            <h3 style="color: #EAB3C9" class="text-center">Your Selected Items</h3>
            <div class="card">
                <div class="card-body">
                    <table class="table">
                        <thead>
                        <tr style="background-color: #7CCBEA; color: white">
                            <th scope="col">Album</th>
                            <th scope="col">Group</th>
                            <th scope="col">Price</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                        User user = (User) session.getAttribute("user");
                            CartDAOImpl dao = new CartDAOImpl(DBConnection.getConnection());
                            List<Cart> carts = dao.getCartByIdUser(user.getId());
                            for (Cart cart:carts){%>
                        <tr>
                            <td><%=cart.getAlbumName()%></td>
                            <td><%=cart.getGroupName()%></td>
                            <td><%=cart.getPrice()%></td>
                            <td><a href="removeFromCart?id_album=<%=cart.getIdAlbum()%>&&id_user=<%=cart.getIdUser()%>&&id=<%=cart.getId()%>" class="btn btn-primary bg-custom4">Remove</a></td>
                        </tr>
                        <%}%>
                        <tr style="background-color: #7CCBEA; color: white">
                            <th>Total Price</th>
                            <td></td>
                            <td><%=carts.get(carts.size()-1).getTotalPrice()%></td>
                            <td></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <h3 style="color: #EAB3C9" class="text-center">Your Details For Order</h3>
            <div class="card">
                <div class="card-body">
                    <form action="order" method="post">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <input name="id_user" value="<%=user.getId()%>" type="hidden">
                                <label for="exampleInputName1">Name</label>
                                <input type="text" class="form-control" name="name"
                                       id="exampleInputName1" value="<%=user.getName()%>" readonly="readonly">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="exampleInputTelegram1">Telegram address</label>
                                <input type="text" class="form-control" name="telegram"
                                       id="exampleInputTelegram1" value="<%=user.getTelegram()%>" readonly="readonly">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="exampleInputPhone1">Phone Number</label>
                                <input type="text" class="form-control" name="phone"
                                       id="exampleInputPhone1" value="<%=user.getPhoneNumber()%>" readonly="readonly">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="exampleInputHouse1">House Number</label>
                                <input type="number" class="form-control" name="house"
                                       id="exampleInputHouse1" value="">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="exampleInputStreet1">Street</label>
                                <input type="text" class="form-control" name="street"
                                       id="exampleInputStreet1" value="">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="exampleInputCity1">City</label>
                                <input type="text" class="form-control" name="city"
                                       id="exampleInputCity1" value="">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="exampleInputRegion1">Region</label>
                                <input type="text" class="form-control" name="region"
                                       id="exampleInputRegion1" value="">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="exampleInputZipCode1">ZipCode</label>
                                <input type="text" class="form-control" name="zipcode"
                                       id="exampleInputZipCode1" value="">
                            </div>
                        </div>
                            <div class="form-group">
                                <label for="exampleInputPayment1">Payment Method</label>
                                <select name="zipcode" class="form-control" id="exampleInputPayment1">
                                    <option value="no" selected>-select-</option>
                                    <option value="Cash On Delivery">Cash On Delivery</option>
                                </select>
                            </div>

                        <div class="text-center">
                            <button class="btn btn-primary bg-custom4">Order Now</button>
                            <a href="index.jsp" class="btn btn-success bg-custom1">Continue Shopping</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
