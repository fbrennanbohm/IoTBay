
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - Create New User</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        
        <div class="container-fluid px-5 py-3">
            <div class="row mb-3">
            <div class="col-sm-4"><span class="display-4">IoTBay</span></div>
            <div class="col-sm-8 text-right my-auto">
                <%
                    User user = (User)session.getAttribute("user");
                    boolean loggedIn = !(user == null || user.getEmail().equals(""));

                    if (!loggedIn) {
                %>
                You are not logged in.
                <a href="register.jsp" class="btn btn-primary m-2">Register</a>
                <a href="login.jsp" class="btn btn-secondary m-2">Login</a>
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
            <% if (loggedIn) { %>
            <li class="nav-item">
              <a class="nav-link" href="main.jsp">My Information</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="UserListController">Admin Menu</a>
            </li>
            <% } %>
        </div>
     
        <div class="container-fluid px-5 my-3">
            <div class="row">
                <div class="col-sm-3">
                    <ul class="nav nav-pills flex-column">
                        <li class="nav-item">
                            <a class="nav-link" href="UserListController">View User list</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Search Users</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="newUser.jsp">Create New User</a>
                        </li>
                    </ul>
                </div>
                <div class="col-sm-9">
                    
                <h1>Create New User</h1>
                <p>Please fill in the form below with the information of the new user.</p>
                <%
                    User currentUser = (User)request.getAttribute("currentUser");
                    String successMsg = (String)request.getAttribute("successMsg");
                    String errorMsg = (String)request.getAttribute("errorMsg");
                    if (successMsg != null) {
                %>
                <div class="alert alert-success alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <%=successMsg%><br>
                    Click <a href="UserListController" class="alert-link">here</a> to go back to the user list.
                </div>
                <% } %>
                <% if (errorMsg != null) { %>
                <div class="alert alert-danger alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>Error:</strong> <%=errorMsg%>
                </div>
                <% } %>
                
                <div class="card mb-4">
                    <div class="card-body">
                        
                        <form action="CreateUserController" method="post">
                            <div class="form-group">
                                <label for="userId">User ID</label>
                                <input type="text" class="form-control" name="userId" id="userId" value="User ID will be automatically generated on user creation." readonly>
                            </div>
                            Role<br>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="roleId" id="customer" value="1" checked>
                                    Customer
                                </label>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="roleId" id="staff" value="2">
                                    Staff
                                </label>
                            </div>
                            <div class="form-check mb-3">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="roleId" id="systemAdmin" value="3" disabled>
                                    System Admin
                                </label>
                            </div>

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
                            <div class="container mt-4">
                                <input type="submit" class="btn btn-primary" value="Create User"/>
                                <a href="UserListController" class="btn btn-secondary mx-4">Cancel</a>
                            </div>
                        </form>
                        
                    </div>
                </div>
                
                </div>
            </div>
        </div>
    </body>
</html>
