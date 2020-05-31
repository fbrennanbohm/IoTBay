
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - User List</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
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
                            <a class="nav-link active" href="UserListController">View User list</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Search Users</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="newUser.jsp">Create New User</a>
                        </li>
                    </ul>
                </div>
                <div class="col-sm-9">
                    
                <h1>User List</h1>
                <p>All the users in the IoTBay database are displayed below.</p>
                <table class="table-striped table-hover table-bordered my-3">
                    <tr>
                        <th>User ID</th>
                        <th>Role</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Actions</th>
                    </tr>
                    <% 
                        List<User> userList = (List<User>)request.getAttribute("userList");
                        if (userList != null) {for (User u : userList) {
                    %>
                    <tr>
                        <td><%= u.getUserId() %></td>
                        <td><%= u.getRoleName() %></td>
                        <td><%= u.getFirstName() %></td>
                        <td><%= u.getLastName() %></td>
                        <td><%= u.getEmail() %></td>
                        <td><a href="#" class="btn btn-info mx-2">Edit</a>
                            <% if (!u.isAdmin()) { %>
                            <a href="#" class="btn btn-secondary mx-2">Delete</a><% } else { %>
                            <a href="#" class="btn btn-secondary disabled mx-2">Delete</a>
                            <% } %>
                        </td>
                    </tr>
                    <% }} else { %>
                    <tr>
                        <td colspan="6">No users found.</td>
                    </tr>
                    <% } %>
                </table>
                
                </div>
            </div>
        </div>
        
    </body>
</html>
