<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Album Change Shop: login Page</title>
    <%@include file="css/allCSS.jsp"%>
</head>
<body style="background-color: #DEE5ED">
<%@include file="navbar.jsp"%>

<div class="container p-2">
    <div class="row">
        <div class="col-md-4 offset-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center" style="color: #EAB3C9">Login page</h4>
                    <form action="login" method="post">
                        <div class="form-group">
                            <label for="exampleInputTelegram1">Telegram address</label>
                            <input type="text" class="form-control" id="exampleInputTelegram1"
                                   placeholder="Enter your telegram (@your_name)" required="required"
                                   pattern="^@[\w\d_]{1,}$" name="telegram">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input type="password" class="form-control"
                                   id="exampleInputPassword1" placeholder="Password"
                                   required="required" name="password">
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary bg-custom4 text-center">Login</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
