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
                            <td><a href="AdminEditUserController?id=<%=u.getUserId()%>" class="btn btn-info mx-2">Edit</a>
                                <a href="AdminConfirmDeleteUserController?id=<%=u.getUserId()%>" class="btn btn-secondary mx-2">Delete</a>
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
    </body>
</html>
