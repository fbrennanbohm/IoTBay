
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - Register</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    </head>
    <body>
        <jsp:include page="_header.jsp" />

        <%
            User user = (User) session.getAttribute("user");
            boolean loggedIn = !(user == null || user.getEmail().equals(""));
        %>

        <div class="container-fluid px-5">
            <div class="row">
                <% if (!loggedIn) {  %>
                <div class="col-sm-8">

                    <h1 class="my-3">Register</h1>
                    <p class="mb-3">Please provide your personal information in the form below.</p>

                    <div class="card mb-4">
                        <div class="card-body">

                            <form action="welcome.jsp" method="post">
                                <input type="hidden" name="submitted" value="yes">

                                <div class="form-group">
                                    <label for="firstName">First name</label>
                                    <input type="text" class="form-control" name="firstName" id="firstName">
                                </div>

                                <div class="form-group">
                                    <label for="lastName">Last name</label>
                                    <input type="text" class="form-control" name="lastName" id="lastName">
                                </div>

                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="text" class="form-control" name="email" id="email">
                                </div>

                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" name="password" id="password">
                                </div>

                                <div class="form-text mt-2">
                                    By registering, you confirm that you have read, understood 
                                    and agree to the terms of service.</div>
                                <div class="form-group">
                                </div>

                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input type="checkbox" class="form-check-input" id="tos" name="tos" value="yes">
                                        I agree to the Terms of Service
                                    </label>
                                </div>
                                <div class="container mt-4">
                                    <input type="submit" class="btn btn-primary" value="Register"/>
                                    <a href="index.jsp" class="btn btn-secondary mx-4">Cancel</a>
                                </div>
                            </form>
                        </div>
                    </div> 
                    <% } else { %>
                    <div class="col-sm-8">
                        <div class="alert alert-info my-3">
                            It looks like you are already logged in.<br>
                            If you want to create a new account, you must <a class="alert-link" href="logout.jsp">logout</a> before doing so.
                        </div>
                    </div>
                    <% }%>
                </div>
                <div class="col-sm-4">

                </div>
            </div>
        </div>
    </body>
</html>
