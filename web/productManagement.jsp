
<%@page import="java.util.List"%>
<%@page import="uts.isd.model.Order"%>
<%@page import="uts.isd.model.OrderItem"%>
<%@page import="uts.isd.model.Product"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - Update Detail</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>s

        <jsp:include page="_header.jsp" />
        <div class="container-fluid px-5 my-3">
            <div class="row">
                <jsp:include page="_myInfoNav.jsp" />
                <div class="col-sm-9">

                    <h1>Product Management</h1>
                    <p>All products are listed below.</p>
                    <table class="table-striped table-hover table-bordered my-3">
                        <thead>
                            <tr>
                                <th>Product ID</th>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Price</th>
                                <th>Stock</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                List<Product> productList = (List<Product>) request.getAttribute("productList");
                                if (productList != null) {
                                    for (Product product : productList) {
                            %>
                            <tr>
                                <td><%= product.getProductId()%></td>
                                <td><%=product.getName()%></td>
                                <td><%=product.getDescription()%></td>
                                <td><%=product.getPrice()%></td>
                                <td><%=product.getStockQuantity()%></td>
                                <td>
                                    <a href="AdminConfirmDeleteUserController?id=<%=product.getProductId()%>" class="btn btn-warning mx-2" data-toggle="tooltip" title="Delete this user"><i class="fas fa-trash-alt"></i></a>
                                </td>
                            </tr>
                            <% }
                            } else { %>
                            <tr>
                                <td colspan="7">No products found.</td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </body>
</html>
