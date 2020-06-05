<%-- 
    Document   : paymentMethod
    Created on : 06/06/2020, 2:40:04 AM
    Author     : Ricky
--%>

<%@page import="java.sql.*"%>
<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - View Payment Details</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
        <body>
    <div class="container-fluid px-5 py-3">
            <div class="row mb-3">
            <div class="col-sm-4"><span class="display-4">IoTBay</span></div>
            <div class="col-sm-8 text-right my-auto">
                 <%
            User user = (User) session.getAttribute("user");
            String connectionURL = "jdbc:derby://localhost:1527/iotdb";
            Connection connection = null;
            Statement statement = null;
            ResultSet rs = null;
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(connectionURL, "iotuser", "admin");
            statement = connection.createStatement();
            String QueryString = "select * from PAYMENTMETHOD";
            rs = statement.executeQuery(QueryString);
            //String updated =(String)session.getAttribute("updated");      
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
                <div class="col-sm-3">
                    <ul class="nav nav-pills flex-column">
                        <li class="nav-item">
                            <a class="nav-link" href="main.jsp">My Dashboard</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">View Order History</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="PaymentServlet?email='<%= user.getEmail()%>'$password='<%= user.getPassword()%>'"> Payment History</a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="EditServlet?email='<%= user.getEmail()%>'$password='<%= user.getPassword()%>'"> Update Personal Details</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="DeleteServlet?email='<%= user.getEmail()%>'$password='<%= user.getPassword()%>'"> Delete My Account</a>
                        </li>
                    </ul>
                </div>
                <div class="col-sm-9">
                    
                <h1>${user.firstName} ${user.lastName}'s Payment Method's</h1>
                <div align="right" class="container mt-4"><a href="index.jsp"  class='btn btn-primary' align="right">Add</a> <a href="index.jsp"  class='btn btn-primary' align="right">Remove</a></div>
                <p>Your payment methods are listed below:</p>
                
                <table border ="1" align="left" style ="text-align: center">
                    <thead>
                        <tr>
                            <th>Payment Method</th>
                            <th>Payment Type</th>
                            <th>Card Number</th>
                            <th>Name</th>
                            <th>Expiry Date</th>
                            <th>CVC</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <%while (rs.next()) { %>
                        <tr>
                            <td><%=rs.getString("PAYMENTMETHODID") %></td>
                            <td><%=rs.getString("TYPE") %></td>
                            <td><%=rs.getString("CARDNUMBER") %></td>
                            <td><%=rs.getString("NAME") %></td>
                            <td><%=rs.getString("VALIDUNTIL") %></td>
                            <td><%=rs.getString("CVC") %></td>
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
