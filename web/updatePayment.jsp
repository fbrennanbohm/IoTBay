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
                <%
                        Payment payment = (Payment) request.getAttribute("payment");
                %>
                    
                <h1>${user.firstName} ${user.lastName}'s Payment Method's</h1>
                <div align="left" ><a href="addPayment.jsp"  class='btn btn-primary' align="right">Add</a> <a href="deletePaymentMethod.jsp"  class='btn btn-primary' align="right">Remove</a> <a href="updatePaymentMethod.jsp"  class='btn btn-primary' align="right">Update</a></div>
                <p>Please enter your new payment details:</p>
                
                <form action="updateConfimPayment" method="post">
                <input type="hidden" name="submitted" value="yes">
                <div class="form-group">
                    <label for="paymentType">Payment Type</label>
                    <input type="text" class="form-control" name="paymentType" placeholder="<%=payment.getPaymentMethodID()%>"required >
                </div>
                
                <div class="form-group">
                    <label for="Card Number">Card Number</label>
                    <input type="text" class="form-control" name="cardNumber" placeholder="15-16 Digit Card Number"required>
                </div>

                <div class="form-group">
                    <label for="Card Holder">Card Holder</label>
                    <input type="text" class="form-control" name="cardHolder" placeholder="First name of cardholder"required>
                </div>
                
                <div class="form-group">
                    <label for="Expiry Date">Expiry Date</label>
                    <input type="text" class="form-control" name="expiryDate" placeholder="Date of Expiry" required>
                </div>
                <div class="form-group">
                    <label for="CVC">CVC</label>
                    <input type="text" class="form-control" name="cvc" placeholder="3 Digit CVC" required>
                </div>
                <div class="container mt-4">
                    <input type="submit" class="btn btn-primary" value="Add Payment"/>
                    <a href="paymentMethod.jsp" class="btn btn-secondary mx-4">Cancel</a>
                </div>
                </form>
                
                
                </div>        
            </div>
        </div>
    </body>
</html>
