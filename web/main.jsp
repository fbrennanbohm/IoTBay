
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - My Dashboard</title>
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
                            <a class="nav-link active" href="#">My Dashboard</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">View Order History</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Update Personal Details</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">View Access Logs</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Delete My Account</a>
                        </li>
                    </ul>
                </div>
                <div class="col-sm-9">

                    <h1>My Dashboard</h1>
                    <p>Your personal information is displayed in the table below.</p>
                    <table class="table-striped table-hover table-bordered my-3">
                        <tr>
                            <td>First Name</td>
                            <td>${user.firstName}</td>
                        </tr>
                        <tr>
                            <td>Last Name</td>
                            <td>${user.lastName}</td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>${user.email}</td>
                        </tr>
                        <tr>
                            <td>Password</td>
                            <td>${user.password}</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
