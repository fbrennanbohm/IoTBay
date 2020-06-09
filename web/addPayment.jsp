<%--
    Document   : addPayment
    Created on : 05/06/2020, 8:55:15 PM
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
                        //Error codes
                        User user = (User) session.getAttribute("user");
                        request.setAttribute("userId", user.getUserId());
                        String existErr = (String) session.getAttribute("existErr");
                        String emailErr = (String) session.getAttribute("emailErr");
                        String passErr = (String) session.getAttribute("passErr");
                        String nameErr = (String) session.getAttribute("nameErr");
                    %>
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
                            <a class="nav-link" href="DeleteServlet?email='<%= user.getEmail()%>'$password='<%= user.getPassword()%>'">Delete My Account</a>
                        </li>
                    </ul>
                </div>
                <div class="col-sm-9">

                    <h1>Add Payment Method</h1>
                    <%
                        //Where the feedback of user interaction is displayed
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
                    <p></p>
                    <form action="AddPaymentMethodServlet?Id=<%= user.getUserId()%>" method="post">
                        <input type="hidden" name="submitted" value="yes"/>
                        <div class="form-group">
                            <label for="paymentType">Payment Type</label>
                            <input type="text" class="form-control" name="paymentType" placeholder="Visa/Mastercard"required >
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
                            <input type="text" class="form-control" name="expiryDate" placeholder="MM/YY" required>
                        </div>
                        <div class="form-group">
                            <label for="CVC">CVC</label>
                            <input type="text" class="form-control" name="cvc" placeholder="3 Digit CVC" required>
                        </div>
                        <div class="container mt-4">
                            <input type="submit" class="btn btn-primary" value="Add Payment"/>
                            <a href="paymentMethod.jsp?id=<%= user.getUserId()%>" class="btn btn-secondary mx-4">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
