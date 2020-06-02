
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
        <jsp:include page="_header.jsp" />

        <div class="container-fluid px-5 my-3">
            <div class="row">
                <jsp:include page="_usersNav.jsp" />
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
                            List<User> userList = (List<User>) request.getAttribute("userList");
                            if (userList != null) {
                                for (User u : userList) {
                        %>
                        <tr>
                            <td><%= u.getUserId()%></td>
                            <td><%= u.getRoleName()%></td>
                            <td><%= u.getFirstName()%></td>
                            <td><%= u.getLastName()%></td>
                            <td><%= u.getEmail()%></td>
                            <td><a href="#" class="btn btn-info mx-2">Edit</a>
                                <% if (!u.isAdmin()) { %>
                                <a href="#" class="btn btn-secondary mx-2">Delete</a><% } else { %>
                                <a href="#" class="btn btn-secondary disabled mx-2">Delete</a>
                                <% } %>
                            </td>
                        </tr>
                        <% }
                        } else { %>
                        <tr>
                            <td colspan="6">No users found.</td>
                        </tr>
                        <% }%>
                    </table>

                </div>
            </div>
        </div>

        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>
