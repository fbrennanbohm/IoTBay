
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.Product"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
    <head>
        <title>IoTBay - Catalogue</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    </head>
    <body>
        <jsp:include page="_header.jsp" />

        <div class="container-fluid px-5">
            <h1 class="my-3">Device Catalogue</h1>
        </div>
        <%
            List<Product> productList = (List<Product>) request.getAttribute("productList");

            if (productList != null) {
        %>
        <div class="container-fluid px-5">
            <div class="row">
                <%
                    for (Product p : productList) {
                %>
                <div class="col-sm-3">
                    <div class="card">
                        <img src="<%= p.getImageUrl()%>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%= p.getName()%></h5>
                            <p class="card-text">Item description</p>
                            <a href="#" class="btn btn-primary">Edit</a>
                            <a href="#" class="btn btn-primary">Add to Cart</a>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
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
