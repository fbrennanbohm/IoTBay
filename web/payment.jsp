<%-- 
    Document   : payment
    Created on : 05/06/2020, 5:50:10 PM
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
            String QueryString = "select * from PAYMENT";
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
                            <a class="nav-link" href="PaymentMethodServlet?email='<%= user.getEmail()%>'$password='<%= user.getPassword()%>'"> Payment Method</a>
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
                    
                <h1>${user.firstName} ${user.lastName}'s Payment History</h1>
                <h4>You can search for a specific payment or view all below</h4>
                <form action="PaymentSearchController" method="post" class="form-inline">
                                <label for="name">Payment ID</label>
                                <input type="text" class="form-control mx-3" name="paymentID">

                                <label for="email">Date</label>
                                <input type="text" class="form-control mx-3" name="date">

                                <input type="submit" class="btn btn-primary mx-3" value="Search"/>
                                <input type="reset" class="btn btn-secondary mx-3" value="Clear"/>
                </form>
                
                <p></p>
                <p>Your payment history is listed below:</p>
                <table border ="1" align="left" style ="text-align: center">
                    <thead>
                        <tr>
                            <th>PaymentID</th>
                            <th>Payment Amount</th>
                            <th>Credit-Card Details</th>
                            <th>Payment Method</th>
                            <th>Date Paid</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <%while (rs.next()) { %>
                        <tr>
                            <td><%=rs.getString("PAYMENTID") %></td>
                            <td><%=rs.getString("PAIDAMOUNT") %></td>
                            <td><%=rs.getString("DETAIL") %></td>
                            <td><%=rs.getString("PAYMENTMETHODID") %></td>
                            <td><%=rs.getString("ORDERID") %></td>
                        </tr>
                        <% } %>
                    <% 
                        rs.close();
                        statement.close();
                        connection.close();
                    %>                            
                    </tbody>
                </table>
                </div>
            </div>
        </div>
    </body>
</html>
