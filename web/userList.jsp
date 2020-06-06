
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - User List</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    </head>
    <body>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
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
                            <th>Account Status</th>
                            <th>Actions</th>
                        </tr>
                        <%
                            List<User> userList = (List<User>) request.getAttribute("userList");
                            if (userList != null) {
                                for (User u : userList) {
                                    String userStatus = u.isActivated() ? "Activated" : "Deactivated";
                        %>
                        <tr>
                            <td><%= u.getUserId()%></td>
                            <td><%= u.getRoleName()%></td>
                            <td><%= u.getFirstName()%></td>
                            <td><%= u.getLastName()%></td>
                            <td><%= u.getEmail()%></td>
                            <td><% if (u.isActivated()) { %><i class="fas fa-check-circle" style="color: green;"></i>
                                <% } else { %><i class="fas fa-times-circle" style="color: red;"></i><% }%> <%= userStatus%></td>
                            <td><a href="AdminEditUserController?id=<%=u.getUserId()%>" class="btn btn-info mx-2" data-toggle="tooltip" title="Edit this user"><i class="fas fa-edit"></i></a>
                                <a href="AdminConfirmDeleteUserController?id=<%=u.getUserId()%>" class="btn btn-warning mx-2" data-toggle="tooltip" title="Delete this user"><i class="fas fa-trash-alt"></i></a>
                            </td>
                        </tr>
                        <% }
                        } else { %>
                        <tr>
                            <td colspan="7">No users found.</td>
                        </tr>
                        <% }%>
                    </table>

                </div>
            </div>
        </div>

        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>
