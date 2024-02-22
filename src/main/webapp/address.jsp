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
        <div class="col-md-6 offset-md-3">
            <h3 style="color: #EAB3C9" class="text-center">Your Details For Order</h3>
            <div class="card">
                <div class="card-body">
                    <form>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="exampleInputHouse1">House Number</label>
                                <input type="text" class="form-control"
                                       id="exampleInputHouse1" value="">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="exampleInputStreet1">Street</label>
                                <input type="text" class="form-control"
                                       id="exampleInputStreet1" value="">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="exampleInputCity1">City</label>
                                <input type="text" class="form-control"
                                       id="exampleInputCity1" value="">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="exampleInputRegion1">Region</label>
                                <input type="text" class="form-control"
                                       id="exampleInputRegion1" value="">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="exampleInputZipCode1">ZipCode</label>
                                <input type="text" class="form-control"
                                   id="exampleInputZipCode1" value="">
                            </div>
                        </div>
                        <div class="text-center">
                            <button class="btn btn-primary bg-custom4">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
