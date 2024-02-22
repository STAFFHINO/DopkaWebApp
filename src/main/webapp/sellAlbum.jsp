<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Album Change Shop: Sell Album page</title>
    <%@include file="css/allCSS.jsp"%>
</head>
<body style="background-color: #DEE5ED">
<%@include file="navbar.jsp"%>
<div color="container">
    <div class="row p-3">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 style="color: #EAB3C9" class="text-center">Sell Album</h4>
                    <form action="sellAlbum" method="post" enctype="multipart/form-data">
                        <input name="telegram" type="hidden" value="<%=user1.getTelegram()%>">
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
                                <option value="Old">Old Album</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputFile1">Upload Photo (size 1x1)</label>
                            <input name="photo" type="file" class="form-control-file" id="exampleInputFile1">
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary bg-custom4">Sell</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
