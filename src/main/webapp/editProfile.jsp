<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Album Change Shop: Edit Profile Page</title>
    <%@include file="css/allCSS.jsp"%>
</head>
<body style="background-color: #DEE5ED">
<%@include file="navbar.jsp"%>
<% User user = (User) session.getAttribute("user"); %>
<div class="container p-2">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center" style="color: #EAB3C9">Edit Profile</h4>
                    <form action="editProfile" method="post">
                        <input type="hidden" name="id" value="<%=user.getId()%>">
                        <div class="form-group">
                            <label for="exampleInputName1">Full name</label>
                            <input type="text" class="form-control" id="exampleInputName1"
                                   required="required" name="name" value="<%=user.getName()%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputTelegram1">Telegram address</label>
                            <input type="text" class="form-control" id="exampleInputTelegram1" pattern="^@[\w\d_]{1,}$"
                                   required="required" name="telegram" value="<%=user.getTelegram()%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputNumber1">Phone number</label>
                            <input type="text" class="form-control" id="exampleInputNumber1"
                                   required="required" name="phoneNumber" value="<%=user.getPhoneNumber()%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input type="password" class="form-control" id="exampleInputPassword1"
                                   placeholder="Enter Password" required="required" name="password" value="">
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
