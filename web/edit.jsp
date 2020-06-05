<%--
    Document   : edit
    Created on : Jun 2, 2020, 6:59:27 PM
    Author     : duong
--%>

<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - Update Detail</title>
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

                    <h1>My Dashboard</h1>
                    <p>Your personal information is displayed in the table below.</p>
                    <form class="form-horizontal" name="myForm" method="post" action="UpdateServlet?Id=<%= user.getUserId()%>">
                        <h1 class="text-primary"><strong>Edit here  <span><%= (updated != null) ? updated : ""%></span></strong></h1>

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


                        <div class="form-group"><div class="col-sm-offset-2 col-sm-10">
                                <input type='submit' class='btn btn-primary'value='Update'>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
