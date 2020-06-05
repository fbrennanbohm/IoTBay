<%--
    Document   : shipping
    Created on : 04/06/2020, 4:10:34 PM
    Author     : Jack
--%>

<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - Shipping Details</title>
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
                    <% System.out.println(user.getAddress()); %>
                    <h1>My Dashboard</h1>
                    <p>Your shipping information is displayed in the field below.</p>
                    <form class="form-horizontal" name="myForm" method="post" action="ShippingController?Id=<%= user.getUserId()%>">
                        <h1 class="text-primary"><strong>Edit here  <span><%= (updated != null) ? updated : ""%></span></strong></h1>
                        <div class="form-group">
                            <label for="address">Address</label>
                            <input type="text" class="form-control" name="address" value="<%= user.getAddress()%>" >
                        </div>

                        <div class="form-group"><div class="col-sm-offset-2 col-sm-10"><input type='submit' class='btn btn-primary'value='Update'>

                            </div>
                        </div>
                     </form>
                </div>
            </div>
        </div>
    </body>
</html>
