<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Album Change Shop: Register Page</title>
    <%@include file="css/allCSS.jsp"%>
</head>
<body style="background-color: #DEE5ED">
<%@include file="navbar.jsp"%>

<div class="container p-2">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center" style="color: #EAB3C9">Registration page</h4>
                    <form action="register" method="post">
                        <div class="form-group">
                            <label for="exampleInputName1">Full name</label>
                            <input type="text" class="form-control" id="exampleInputName1"
                                   placeholder="Enter Full Name" required="required" name="name">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputTelegram1">Telegram address</label>
                            <input type="text" class="form-control" id="exampleInputTelegram1"
                                   placeholder="Enter your telegram (@your_name)" pattern="^@[\w\d_]{1,}$"
                                   required="required" name="telegram">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputNumber1">Phone number</label>
                            <input type="text" class="form-control" id="exampleInputNumber1" placeholder="Enter Number"
                                   required="required" name="phoneNumber">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input type="password" class="form-control" id="exampleInputPassword1"
                                   placeholder="Enter Password" required="required" name="password">
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check">
                            <label class="form-check-label" for="exampleCheck1">Agree terms & condition</label>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary bg-custom4">Register</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
