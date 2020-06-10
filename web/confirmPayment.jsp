<%-- 
    Document   : deletePaymentMethod
    Created on : 06/06/2020, 5:28:38 PM
    Author     : Ricky
--%>

<%@page import="uts.isd.model.PaymentMethod"%>
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
            connection = DriverManager.getConnection(connectionURL, "iotuser", "admin");
            statement = connection.createStatement();
            int userId = Integer.parseInt(request.getParameter("id"));
            String QueryString = "select * from PAYMENTMETHOD where userID=" + userId ;
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
                    
                <h1>${user.firstName} ${user.lastName}'s Payment Method's</h1>
                <form class="form-horizontal" name="myForm" method="post" action="ConfirmAddPayment?id=<%= user.getUserId()%>">
                        <p><strong>These are the details of your selected payment method: </strong></p>
                        <%
                        PaymentMethod payment = (PaymentMethod) request.getAttribute("payment");
                        String successMsg = (String) request.getAttribute("successMsg");
                        String errorMsg = (String) request.getAttribute("errorMsg");
                        if (successMsg != null) {
                        %>
                        <div class="alert alert-success alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <%=successMsg%><br>
                        Click <a href="paymentMethod.jsp?id=<%= user.getUserId()%>" class="alert-link">here</a> to go back to the list of Payment Methods.
                        </div>
                        <% } %>
                        <% if (errorMsg != null) {%>
                        <div class="alert alert-danger alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <strong>Error:</strong> <%=errorMsg%>
                        </div>
                        <% }%>
                        <div class="form-group">
                            <input type="hidden" name="paymentId" value="<%=payment.getPaymentMethodId()%>"/>
                            <label for="paymentType">Payment Type</label>
                            <input type="text" class="form-control" name="paymentType" value="<%=payment.getType()%>"required >
                        </div>

                        <div class="form-group">
                            <label for="Card Number">Card Number</label>
                            <input type="text" class="form-control" name="cardNumber" value="<%=payment.getCardNumber()%>"required>
                        </div>

                        <div class="form-group">
                            <label for="Card Holder">Card Holder</label>
                            <input type="text" class="form-control" name="cardHolder" value="<%=payment.getName()%>"required>
                        </div>

                        <div class="form-group">
                            <label for="Expiry Date">Expiry Date</label>
                            <input type="text" class="form-control" name="expiryDate" value="<%=payment.getExpiryDate()%>" required>
                        </div>
                        <div class="form-group">
                            <label for="CVC">CVC</label>
                            <input type="text" class="form-control" name="cvc" value="<%=payment.getCvc()%>" required>
                        </div>
                        <div class="container mt-4">
                            <input type="submit" class="btn btn-primary" value="Update Payment"/>
                            <a href="paymentMethod.jsp?id=<%= user.getUserId()%>" class="btn btn-secondary mx-4">Cancel</a>
                        </div>
                    </form>    
                </div>            
            </div>
        </div>
    </body>
</html>
