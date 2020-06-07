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
                        OrderItem orderItem = (OrderItem) request.getAttribute("orderItem");
                    %>

                    <h1>Update Order Item</h1>

                    <form action="UpdateOrderItem" method="post">

                        <input type="hidden" name="orderItemId" class="form-control-plaintext" value="<%=orderItem.getOrderItemId()%>">
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Product</label>
                            <div class="col-sm-10">
                                <input type="text" readonly class="form-control-plaintext" value="<%=orderItem.getProduct().getName()%>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Price per unit</label>
                            <div class="col-sm-10">
                                <input type="text" readonly class="form-control-plaintext" value="<%=orderItem.getPricePerUnit()%>">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Quantity</label>
                            <div class="col-sm-10">
                                <input type="number" name="quantity" class="form-control" min="1" max="<%=orderItem.getProduct().getStockQuantity()%>" value="<%=orderItem.getQuantity()%>">
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary mx-2">Save</button>

                        <a href="UpdateOrder?id=<%=orderItem.getOrderId()%>" class="btn btn-info mx-2">Cancel</a>

                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
