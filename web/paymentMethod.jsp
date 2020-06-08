<%-- 
    Document   : paymentMethod
    Created on : 06/06/2020, 2:40:04 AM
    Author     : Ricky
--%>

<%@page import="uts.isd.model.Payment"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - View Payment Details</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    </head>
    <body>
        <div class="container-fluid px-5 py-3">
            <div class="row mb-3">
                <div class="col-sm-4"><span class="display-4">IoTBay</span></div>
                <div class="col-sm-8 text-right my-auto">

                    <%
                        User user = (User) session.getAttribute("user");
                        String connectionURL = "jdbc:derby://localhost:1527/iotdb";
                        Connection connection = connection = DriverManager.getConnection(connectionURL, "iotuser", "admin");
                        Statement statement = statement = connection.createStatement();

                        //Gets the id from before and searches the table with the id given
                        int userId = Integer.parseInt(request.getParameter("id"));
                        String QueryString = "select * from PAYMENTMETHOD where userID=" + userId;
                        ResultSet rs = rs = statement.executeQuery(QueryString);
                    %>

                </div>

            </div>
        </div>
        <div class="container-fluid px-5">
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="catalogue.jsp">Device Catalogue</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="main.jsp">My Information</a>
                </li>
        </div>       
        <div class="container-fluid px-5 my-3">
            <div class="row">
                <jsp:include page="_myInfoNav.jsp" />
                <div class="col-sm-9">

                    <h1>${user.firstName} ${user.lastName}'s Payment Method's</h1>
                    <div align="left" ><a href="addPayment.jsp"  class='btn btn-primary' align="right">Add</a> <a href="deletePaymentMethod.jsp?id=<%= user.getUserId()%>"  class='btn btn-primary' align="right">Remove</a> <a href="updatePayment.jsp?id=<%= user.getUserId()%>"  class='btn btn-primary' align="right">Update</a></div>
                    <p>Your payment methods are listed below:</p>

                    <table border ="1" align="left" style ="text-align: center">
                        <thead>
                            <tr>
                                <th>Payment Method</th>
                                <th>Payment Type</th>
                                <th>Card Number</th>
                                <th>Card Holder</th>
                                <th>Expiry Date</th>
                                <th>CVC</th>
                            </tr>
                        </thead>


                        <tbody>
                            <%while (rs.next()) {%>
                            <tr>
                                <td><%=rs.getString("PAYMENTMETHODID")%></td>
                                <td><%=rs.getString("TYPE")%></td>
                                <td><%=rs.getString("CARDNUMBER")%></td>
                                <td><%=rs.getString("NAME")%></td>
                                <td><%=rs.getString("VALIDUNTIL")%></td>
                                <td><%=rs.getString("CVC")%></td>
                                <% } %>
                                <%
                                    rs.close();
                                    statement.close();
                                    connection.close();
                                %>        
                            </tr>                      
                        </tbody>
                    </table>
                </div>        
            </div>
        </div>
    </body>
</html>
