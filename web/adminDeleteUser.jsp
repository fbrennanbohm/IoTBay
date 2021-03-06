<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - Delete User</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <jsp:include page="_header.jsp" />
        <div class="container-fluid px-5 my-3">
            <div class="row">
                <jsp:include page="_usersNav.jsp" />
                <div class="col-sm-9">

                    <h1>Delete User</h1>
                    <%
                        User currentUser = (User) request.getAttribute("currentUser");
                        String successMsg = (String) request.getAttribute("successMsg");
                        String errorMsg = (String) request.getAttribute("errorMsg");
                        if (successMsg != null) {
                    %>
                    <div class="alert alert-success">
                        <%=successMsg%><br>
                        Click <a href="UserListController" class="alert-link">here</a> to go back to the user list.
                    </div>
                    <% } else if (errorMsg != null) {%>
                    <div class="alert alert-danger">
                        <strong>Error:</strong> <%=errorMsg%><br>
                        Click <a href="UserListController" class="alert-link">here</a> to go back to the user list.
                    </div>
                    <% }%>

                    <% if (currentUser != null) { %>
                    <div class="alert alert-warning my-3">
                        You are about to delete this user.<br>
                        <strong>This action cannot be undone.</strong>
                    </div>
                    <div class="card mb-4">
                        <div class="card-body">

                            <form action="AdminDeleteUserController" method="post">
                                <div class="form-group">
                                    <label for="userId">User ID</label>
                                    <input readonly type="text" value="${currentUser.userId}" class="form-control" name="userId" id="userId">
                                </div>
                                Role<br>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input disabled class="form-check-input" type="radio" name="roleId" id="customer" value="1"
                                               <% if (currentUser.isCustomer()) { %> checked="true" <% } %>>
                                        Customer
                                    </label>
                                </div>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input disabled class="form-check-input" type="radio" name="roleId" id="staff" value="2"
                                               <% if (currentUser.isStaff()) { %> checked="true" <% } %>>
                                        Staff
                                    </label>
                                </div>
                                <div class="form-check mb-3">
                                    <label class="form-check-label">
                                        <input disabled class="form-check-input"
                                               <% if (currentUser.isAdmin()) { %> checked="true" <% } %> type="radio" name="roleId" id="systemAdmin" value="3">
                                        System Admin
                                    </label>
                                </div>

                                <div class="form-group">
                                    <label for="firstName">First name</label>
                                    <input readonly type="text" value="${currentUser.firstName}" class="form-control" name="firstName" id="firstName">
                                </div>

                                <div class="form-group">
                                    <label for="lastName">Last name</label>
                                    <input readonly type="text" value="${currentUser.lastName}" class="form-control" name="lastName" id="lastName">
                                </div>

                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input readonly type="text" value="${currentUser.email}" class="form-control" name="email" id="email">
                                </div>

                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input readonly type="text" value="${currentUser.password}" class="form-control" name="password" id="password">
                                </div>
                                <div class="container mt-4">
                                    <input type="submit" class="btn btn-danger" value="Delete User"/>
                                    <a href="UserListController" class="btn btn-secondary mx-4">Cancel</a>
                                </div>
                            </form>
                        </div>
                    </div>
                    <% }%>
                </div>
            </div>
        </div>
    </body>
</html>
