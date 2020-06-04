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
        <jsp:include page="_header.jsp" />

        <div class="container-fluid px-5 my-3">
            <div class="row">
                <jsp:include page="_myInfoNav.jsp" />
                <div class="col-sm-9">

                    <h1>My Dashboard</h1>
                    <p>Your shipping information is displayed in the table below.</p>
                    <form class="form-horizontal" name="myForm" method="post" action="UpdateServlet">
                        <h1 class="text-primary"><strong>Edit here  <span><%= (updated != null) ? updated : ""%></span></strong></h1>
                        <div class="form-group">
                            <label for="address">Address</label>
                            <input type="text" class="form-control" name="address" value="<%=user.getAddress()%>" >
                        </div>
                        <div class="form-group">
                            <label for="firstName">Role ID</label>
                            <input type="text" class="form-control" name="roleId" value="<%=user.getRoleId()%>">
                        </div>

                        <div class="form-group">
                            <label for="firstName">First name</label>
                            <input type="text" class="form-control" name="firstName"value="<%=user.getFirstName()%>">
                        </div>

                        <div class="form-group">
                            <label for="lastName">Last name</label>
                            <input type="text" class="form-control" name="lastName" value="<%=user.getLastName()%>">
                        </div>

                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="text" class="form-control" name="email" value="<%=user.getEmail()%>">
                        </div>

                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" name="password"  value="<%=user.getPassword()%>">
                        </div>


                        <div class="form-group"><div class="col-sm-offset-2 col-sm-10"><input type='submit' class='btn btn-primary'value='Update'>

                                </form>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </body>
</html>
