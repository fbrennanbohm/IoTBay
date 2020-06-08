<%-- 
    Document   : shipment
    Created on : 08/06/2020, 4:11:01 PM
    Author     : Jack
--%>

<%@page import="java.util.List"%>
<%@page import="uts.isd.model.User"%>
<%@page import="uts.isd.model.Shipment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTbay - Shipments</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%
            User user = (User) session.getAttribute("user");
            String updated = (String) session.getAttribute("updated");
        %>
        
        <jsp:include page="_header.jsp" />

        <div class="container-fluid px-5 my-3">
            <div class="row">
                <jsp:include page="_myInfoNav.jsp" />
                <div class="col-sm-9">
                    <h1>Shipments</h1>
                    <p>Browse or search your shipments below.</p>
                    <form class="form-horizontal" name="myForm" method="post" action="ShipmentServlet?id=<%= user.getUserId()%>">
                        <div class="form-group">
                            <input type="text" class="form-control" name="search" placeholder="Search for a Shipment by ID or date (in the format YYYY-MM-DD)">
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <input type="submit" class='btn btn-primary' value="Search">
                            </div>
                        </div>
                    </form>
                    <table class="table-striped table-hover table-bordered my-3">
                        <thead>
                            <tr>
                                <th>Shipment ID</th>
                                <th>Placed On</th>
                                <th>Method</th>
                                <th>Address</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                List<Shipment> shipmentList = (List<Shipment>) request.getAttribute("shipmentList");
                                if (shipmentList != null) {
                                    for (Shipment shipment : shipmentList) {
                            %>
                            <tr>
                                <td><%= shipment.getShipmentId()%></td>
                                <td><%=shipment.getPlacedOn()%></td>
                                <td><%=shipment.getMethod()%></td>
                                <td><%=shipment.getAddress()%></td>
                                <td><%=shipment.getStatus()%></td>
                            </tr>
                            <% }
                            } else { %>
                            <tr>
                                <td colspan="7">No shipments found.</td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
