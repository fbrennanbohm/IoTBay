
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="uts.isd.model.User"%>


<!DOCTYPE html>
<html>
    <%
        User user = (User) session.getAttribute("user");
        boolean loggedIn = !(user == null);

        String url = request.getRequestURL().toString();
    %>
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
            <%
                List<Product> productList = (List<Product>) request.getAttribute("productList");

                if (productList != null) {
                    for (Product p : productList) {
            %>
        </div>
        <div class="card" style="width: 18rem;">
            <img src="<%= p.getImageUrl()%>" class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title"><%= p.getName()%></h5>
                <p class="card-text"><%=p.getDescription()%></p>
                <% if (loggedIn) { %>
                <%if (user.isAdmin() || user.isStaff()) {%>
                <a href="/IoTBay/EditProductController?id=<%= p.getProductId()%>" class="btn btn-primary">Edit</a>
                <a href="/IoTBay/DeleteProductController?id=<%= p.getProductId()%>" class="btn btn-primary">Delete</a>

                <% }
                    } %>

                <a href="#" class="btn btn-primary">Add to Cart</a>
            </div>
        </div>
        <% }
        } else {
        %>
        <div class="card" style="width: 18rem;">
            <img src="..." class="card-img-top" alt="...">
            <div class="card-body">
                <h5 class="card-title">NO PRODUCTS</h5>
                <p class="card-text"></p>
                <a href="#" class="btn btn-primary">Edit</a>
                <a href="#" class="btn btn-primary">Add to Cart</a>
                <a href="#" class="btn btn-primary">Go somewhere</a>
            </div>
        </div>
        <% }%>
    </div>
</body>
</html>
