<%--
    Document   : edit
    Created on : Jun 2, 2020, 6:59:27 PM
    Author     : duong
--%>

<%@page import="java.util.List"%>
<%@page import="uts.isd.model.Order"%>
<%@page import="uts.isd.model.OrderItem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - Update Detail</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>s

        <jsp:include page="_header.jsp" />
        <div class="container-fluid px-5 my-3">
            <div class="row">
                <jsp:include page="_myInfoNav.jsp" />
                <div class="col-sm-9">

                    <h1>Order History</h1>
                    <p>All my orders in the IoTBay database are displayed below.</p>
                    <table class="table-striped table-hover table-bordered my-3">
                        <thead>
                            <tr>
                                <th>Order Number</th>
                                <th>Items</th>
                                <th>Placed On</th>
                                <th>Total Price</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                List<Order> orderList = (List<Order>) request.getAttribute("orderList");
                                if (orderList != null) {
                                    for (Order order : orderList) {
                            %>
                            <tr>
                                <td><%= order.getOrderNumber()%></td>
                                <td>
                                    <div>
                                        <%
                                            for (OrderItem orderItem : order.getOrderItemList()) {
                                        %>

                                        <%=orderItem.getProduct().getName()%>
                                        <br/>
                                        <% }%>
                                    </div>
                                </td>
                                <td><%=order.getCreatedOn()%></td>
                                <td><%=order.getTotalPrice()%></td>
                                <td>
                                    <a href="PayOrder?id=<%=order.getUserId()%>" class="btn btn-info mx-2">Pay</a>
                                </td>
                            </tr>
                            <% }
                            } else { %>
                            <tr>
                                <td colspan="6">No orders found.</td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </body>
</html>