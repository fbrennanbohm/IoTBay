
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

        <div class="container-fluid px-5 py-3">
            <div class="row mb-3">
                <div class="col-sm-4"><span class="display-4">IoTBay</span></div>
                <div class="col-sm-8 text-right my-auto">
                    <%
                        String existErr = (String) session.getAttribute("existErr");
                        String emailErr = (String) session.getAttribute("emailErr");
                        String passErr = (String) session.getAttribute("passErr");
                        User user = (User) session.getAttribute("user");
                        boolean loggedIn = !(user == null || user.getEmail().equals(""));

                        if (!loggedIn) {
                    %>
                    You are not logged in.
                    <a href="register.jsp" class="btn btn-primary m-2">Register</a>
                    <a href="login.jsp" class="btn btn-secondary m-2 disabled">Login</a>

                    <% } else { %>
                    You are logged in as ${user.firstName} ${user.lastName} &lt;<b>${user.email}</b>&gt;
                    <a href="logout.jsp" class="btn btn-secondary ml-2">Logout</a>
                    <% } %>
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
            </ul>
        </div>

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
                                    <input type="text" class="form-control" name="email" placeholder="<%=(emailErr != null ? emailErr : "Enter email")%>" required >
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label><br>
                                    <input type="password" class="form-control" name="password" placeholder="<%=(emailErr != null ? emailErr : "Enter email")%>" required >
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
