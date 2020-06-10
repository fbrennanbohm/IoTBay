<%--
    Document   : edit
    Created on : Jun 2, 2020, 6:59:27 PM
    Author     : duong
--%>

<%@page import="java.util.List"%>
<%@page import="uts.isd.model.*"%>
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
    <body>

        <jsp:include page="_header.jsp" />
        <div class="container-fluid px-5 my-3">
            <div class="row">
                <jsp:include page="_myInfoNav.jsp" />
                <div class="col-sm-9">

                    <%
                        User user = (User) session.getAttribute("user");
                        List<UserCartProduct> userCartProductList = (List<UserCartProduct>) request.getAttribute("userCartProductList");
                    %>

                    <h1>Checkout</h1>
                    <form action="Checkout" method="post">
                        <input type="hidden" name="id" value="<%=user.getUserId()%>" >

                        <table class="table-striped table-hover table-bordered my-3">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Quantity</th>
                                    <th>Price per unit</th>
                                    <th>Total Price</th>
                            </thead>
                            <tbody>

                                <%
                                    if (userCartProductList != null && userCartProductList.size() > 0) {
                                        double totalPrice = 0;
                                %>
                                <%
                                    for (UserCartProduct userCartProduct : userCartProductList) {
                                        totalPrice += userCartProduct.getTotalPrice();
                                %>
                                <tr>
                                    <td><%= userCartProduct.getProduct().getName()%></td>
                                    <td><%=userCartProduct.getQuantity()%></td>
                                    <td><%=userCartProduct.getProduct().getPrice()%></td>
                                    <td><%=userCartProduct.getTotalPrice()%></td>
                                </tr>
                                <% }%>

                                <tr>
                                    <td colspan="3">Total</td>
                                    <td><b><%=(Math.round(totalPrice * 100.0) / 100.0)%> </b> </td>
                                </tr> <% } else {%>
                                <tr>
                                    <td colspan="4">No items in cart.</td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>

                        <%
                            if (userCartProductList != null && userCartProductList.size() > 0) {
                        %>
                        <div class="row">
                            <div class="container mt-4">
                                <button type="submit" class="btn btn-info">Checkout</button>
                            </div>
                        </div>
                        <%}%>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
