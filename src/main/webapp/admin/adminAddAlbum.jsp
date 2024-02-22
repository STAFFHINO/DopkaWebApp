<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin: Add Album Page</title>
    <%@include file="css/allCSS.jsp"%>
</head>
<body style="background-color: #DEE5ED">
<%@include file="adminNavbar.jsp"%>
<div color="container">
    <div class="row p-3">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 style="color: #EAB3C9" class="text-center">Add Album</h4>
                    <form action="../adminAddAlbum" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="exampleInputGroup1">Group Name</label>
                            <input name="group" type="text" class="form-control" id="exampleInputGroup1">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputAlbum1">Album Name</label>
                            <input name="name" type="text" class="form-control" id="exampleInputAlbum1">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPrice1">Price</label>
                            <input name="price" type="text" class="form-control" id="exampleInputPrice1">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputCategory1">Album Category</label>
                            <select name="category" class="form-control" id="exampleInputCategory1">
                                <option selected>-select-</option>
                                <option value="New">New Album</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputStatus1">Album Status</label>
                            <select name="status" class="form-control" id="exampleInputStatus1">
                                <option selected>-select-</option>
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputFile1">Upload Photo (size 1x1)</label>
                            <input name="photo" type="file" class="form-control-file" id="exampleInputFile1">
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary bg-custom4">Add</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
