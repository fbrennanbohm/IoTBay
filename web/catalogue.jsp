
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.*"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
    <head>
        <title>IoTBay - Catalogue</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    </head>
    <body>
        <jsp:include page="_header.jsp" />

        <div class="container-fluid px-5">
            <h1 class="my-3">Device Catalogue</h1>
        </div>
        <%
            User user = (User) session.getAttribute("user");
            List<Product> productList = (List<Product>) request.getAttribute("productList");

            if (productList != null) {
        %>
        <div class="container-fluid px-5">
            <div class="row">
                <%
                    for (Product product : productList) {
                %>
                <div class="col-sm-3">
                    <div class="card">
                        <img src="<%= product.getImageUrl()%>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%= product.getName()%></h5>
                            <p class="card-text"><%=product.getDescription()%></p>

                            <form action="AddToCart" method="post">
                                <input type="hidden" name="productId" value="<%=product.getProductId()%>" />
                                <%if (user == null) {%>
                                <input type="number" name="quantity" class="form-control"  placeholder="Enter quantity" value="0" min="0" max="<%=product.getStockQuantity()%>" readonly/>
                                </br>
                                <button type="submit" class="btn btn-primary" disabled>Add to Cart</button>
                                <p class="card-text">$<%=Math.round(product.getPrice())%></p>
                                <% } else {%>

                                <input type="hidden" name="userId" value="<%=user.getUserId()%>" />
                                <input type="number" name="quantity" class="form-control"  placeholder="Enter quantity" value="0" min="0" max="<%=product.getStockQuantity()%>"/>

                                </br>
                                <%if (user.isAdmin() || user.isStaff()) {%>

                                <a href="/IoTBay/EditProductController?id=<%= product.getProductId()%>" class="btn btn-primary">Edit</a>
                                <a href="/IoTBay/ProductManagementController?id=<%= product.getProductId()%>" class="btn btn-primary">Delete</a>

                                <% }%>
                                <button type="submit" class="btn btn-primary">Add to Cart</button>
                                <% } %>
                            </form>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
        <% }%>
    </div>
</body>
</html>
