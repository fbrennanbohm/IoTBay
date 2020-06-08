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
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>s

        <jsp:include page="_header.jsp" />
        <div class="container-fluid px-5 my-3">
            <div class="row">
                <jsp:include page="_myInfoNav.jsp" />
                <div class="col-sm-9">

                    <%
                        Order order = (Order) request.getAttribute("order");
                    %>

                    <h1>Update Order</h1>

                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Order Number</label>
                        <div class="col-sm-10">
                            <input type="text" readonly class="form-control-plaintext" value="<%=order.getOrderNumber()%>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Placed On</label>
                        <div class="col-sm-10">
                            <input type="text" readonly class="form-control-plaintext" value="<%=order.getCreatedOn()%>">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Status</label>
                        <div class="col-sm-10">
                            <input type="text" readonly class="form-control-plaintext" value="<%=order.getOrderStatus()%>">
                        </div>
                    </div>

                    <table class="table-striped table-hover table-bordered my-3">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Quantity</th>
                                <th>Price per unit</th>
                                <th>Total Price</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                if (order.getOrderItemList() != null && order.getOrderItemList().size() > 0) {
                                    for (OrderItem orderItem : order.getOrderItemList()) {
                            %>
                            <tr>
                                <td><%= orderItem.getProduct().getName()%></td>
                                <td><%=orderItem.getQuantity()%></td>
                                <td><%=orderItem.getPricePerUnit()%></td>
                                <td><%=orderItem.getTotalPrice()%></td>
                                <td>
                                    <form action="DeleteOrderItem" method="post">
                                        <a href="UpdateOrderItem?id=<%=order.getOrderId()%>" class="btn btn-secondary mx-2"><i class="far fa-edit"></i></a>
                                        <input type="hidden" name="id" value="<%=order.getOrderId()%>" />
                                        <button type="submit" class="btn btn-warning mx-2"><i class="fas fa-trash-alt"></i></button>
                                    </form>
                                </td>
                            </tr>
                            <% }
                            } else { %>
                            <tr>
                                <td colspan="7">No order items found.</td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </body>
</html>
