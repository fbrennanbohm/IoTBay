
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - Login</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    </head>
    <body>

        <%
            String existErr = (String) session.getAttribute("existErr");
            String emailErr = (String) session.getAttribute("emailErr");
            User user = (User) session.getAttribute("user");
            boolean loggedIn = !(user == null || user.getEmail().equals(""));
        %>

        <jsp:include page="_header.jsp" />

        <div class="container-fluid px-5">
            <div class="row">
                <% if (!loggedIn) {%>
                <div class="col-sm-8">
                    <h1 class="my-3">Login</h1>
                    <p>Please provide your email address and password.</p>
                    <div class="card">
                        <div class="card-body">
                            <form method="post"action="LoginServlet">
                                <div class="form-group">
                                    <p> <%=(existErr != null ? existErr : "")%></p>
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" name="email" placeholder="<%=(emailErr != null ? emailErr : "Enter email")%>" required value="admin@iotbay.com" >
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label><br>
                                    <input type="password" class="form-control" name="password" placeholder="<%=(emailErr != null ? emailErr : "Enter password")%>" required value="admin123" >
                                </div>

                                <input type="hidden" name="tos" value="yes">
                                <div class="container mt-4">
                                    <input type="submit" class="btn btn-primary mx-1" value="Login"/>
                                    <a href="index.jsp" class="btn btn-secondary mx-4">Cancel</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <% } else { %>
                <div class="col-sm-8">
                    <div class="alert alert-info my-3">
                        It looks like you are already logged in.<br>
                        Please <a class="alert-link" href="index.jsp">click here</a> to return to the home page.
                    </div>
                </div>
                <% }%>
                <div class="col-sm-4">
                </div>

            </div>
        </div>
    </body>
</html>
