
<%@page import="uts.isd.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - Update Product</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <jsp:include page="_header.jsp" />
        <div class="container-fluid px-5 my-3">
            <div class="row">
                <div class="col-sm-9">
                    <h1>Add a product</h1>
                    <p>Fill in the product details below.</p>
                    <form class="form-horizontal" name="myForm" method="post" action="AddProductController">
                        <h1 class="text-primary"><strong>Add here</strong></h1>

                        <div class="form-group">
                            <label for="firstName">Product Name</label>
                            <input type="text" class="form-control" name="name"value="">
                        </div>

                        <div class="form-group">
                            <label for="lastName">Description</label>
                            <input type="text" class="form-control" name="description" value="">
                        </div>

                        <div class="form-group">
                            <label for="email">Price</label>
                            <input type="number" class="form-control" name="price" value="">
                        </div>

                        <div class="form-group">
                            <label for="text">Stock Quantity</label>
                            <input type="number" class="form-control" name="stockQuantity"  value="">
                        </div>

                        <div class="form-group">
                            <label for="text">Image URL</label>
                            <input type="text"  lass="form-control" name="imageUrl"  value="">
                        </div>


                        <div class="form-group"><div class="col-sm-offset-2 col-sm-10">
                                <input type='submit' class='btn btn-primary'value='Update'>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

