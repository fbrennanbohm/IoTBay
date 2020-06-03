
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - Search Users</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <jsp:include page="_header.jsp" />
       
        <div class="container-fluid px-5 my-3">
            <div class="row">
                <div class="col-sm-3">
                    <ul class="nav nav-pills flex-column">
                        <li class="nav-item">
                            <a class="nav-link" href="UserListController">View User list</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="userSearch.jsp">Search Users</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="newUser.jsp">Create New User</a>
                        </li>
                    </ul>
                </div>
                <div class="col-sm-9">
                <%
                    String name = (String)request.getAttribute("name");
                    String email = (String)request.getAttribute("email");
                %>
                    
                <h1>User List</h1>
                <p>You can search users by name and/or email.</p>
                <div class="card mb-4">
                    <div class="card-body">
                        
                        <form action="UserSearchController" method="post" class="form-inline">
                            <label for="name">Name</label>
                            <input type="text" class="form-control mx-3" name="name" id="name">

                            <label for="email">Email</label>
                            <input type="text" class="form-control mx-3" name="email" id="email">

                            <input type="submit" class="btn btn-primary mx-3" value="Search"/>
                            <input type="reset" class="btn btn-secondary mx-3" value="Clear"/>
                        </form>
                        
                    </div>
                </div>
                <% if (name != null || email != null) { %>
                <div class="container-fluid">
                    Searching for users with <% if(name.length()>0) {%>name "<b><%=name%></b>"<% }%>
                    <% if (name.length()>0 && email.length()>0) { %> and <% }%>
                    <% if(email.length()>0) {%> email "<b><%= email%></b>"<% }%>
                </div>
                <% } %>
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
                        <td><a href="AdminEditUserController?id=<%=u.getUserId()%>" class="btn btn-info mx-2">Edit</a>
                            <% if (!u.isAdmin()) { %>
                            <a href="AdminConfirmDeleteUserController?id=<%=u.getUserId()%>" class="btn btn-secondary mx-2">Delete</a><% } else { %>
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
