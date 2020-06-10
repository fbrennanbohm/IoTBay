<%-- 
    Document   : payment
    Created on : 05/06/2020, 5:50:10 PM
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
                        String QueryString = "select * from PAYMENT WHERE USERID = " + user.getUserId();
                        rs = statement.executeQuery(QueryString);
                        //String updated =(String)session.getAttribute("updated");     

                        String paymentSearch = "";
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

                    <h1>${user.firstName} ${user.lastName}'s Payment History</h1>
                    <h4>You can search for a specific payment or view all below</h4>
                    <form action="PaymentSearchController?id=<%= user.getUserId()%>" method="get" class="form-inline">
                        <label for="name">Payment ID</label>
                        <input type="hidden" name="id" value="<%=user.getUserId()%>"  />                                
                        <input type="text" class="form-control mx-3" name="paymentID" value="<%=paymentSearch%>">

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
                                <th>OrderID</th>
                                <th>PaymentMethodID</th>
                                <th>Paid Amount</th>
                                <th>Detail</th>
                            </tr>
                        </thead>

                        <tbody>
                            <%
                                if (rs.next() && rs != null) {
                            %>
                            <tr>
                                <td><%=rs.getInt("PAYMENTID")%></td>
                                <td><%=rs.getInt("ORDERID")%></td>
                                <td><%=rs.getInt("PAYMENTMETHODID")%></td>
                                <td><%=rs.getInt("PAIDAMOUNT")%></td>
                                <td><%=rs.getInt("DETAIL")%></td>
                            </tr>
                            <%
                        } else { %>
                            <tr>
                                <td colspan="5">No Payments founds.</td>
                            </tr>
                            <% }%>   
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
