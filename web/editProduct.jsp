<%--
    Document   : editProduct
    Created on : 08/06/2020, 9:06:43 PM
    Author     : felix
--%>
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

        <%
            Product product = (Product) request.getAttribute("currentProduct");
        %>
        <jsp:include page="_header.jsp" />
        <div class="container-fluid px-5 my-3">
            <div class="row">
                <div class="col-sm-9">

                    <h1>Product Editor</h1>
                    <p>Your personal information is displayed in the table below.</p>
                    <% if (product != null) {%>
                    <form class="form-horizontal" name="myForm" method="post" action="UpdateProductController">
                        <h1 class="text-primary"><strong>Edit here</strong></h1>

                        <input type="text" value="<%=product.getProductId()%>" class="form-control" name="productId" id="productId" readonly>

                        <div class="form-group">
                            <label for="firstName">Product Name</label>
                            <input type="text" class="form-control" name="name"value="<%=product.getName()%>">
                        </div>

                        <div class="form-group">
                            <label for="lastName">Description</label>
                            <input type="text" class="form-control" name="description" value="<%=product.getDescription()%>">
                        </div>

                        <div class="form-group">
                            <label for="email">Price</label>
                            <input type="number" class="form-control" name="price" value="<%=product.getPrice()%>">
                        </div>

                        <div class="form-group">
                            <label for="text">Stock Quantity</label>
                            <input type="number" class="form-control" name="stockQuantity"  value="<%=product.getStockQuantity()%>">
                        </div>

                        <div class="form-group">
                            <label for="text">Image URL</label>
                            <input type="text"  lass="form-control" name="imageUrl"  value="<%=product.getImageUrl()%>">
                        </div>


                        <div class="form-group"><div class="col-sm-offset-2 col-sm-10">
                                <input type='submit' class='btn btn-primary'value='Update'>
                            </div>
                        </div>
                    </form>
                    <%} else {%>
                    <h1>Something went wrong.</h1>
                    <%}%>
                </div>
            </div>
        </div>
    </body>
</html>

