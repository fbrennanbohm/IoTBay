
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <title>IoTBay - Home</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
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
              <a class="nav-link active" href="index.jsp">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="catalogue.jsp">Device Catalogue</a>
            </li>
            <% if (loggedIn) { %>
            <li class="nav-item">
              <a class="nav-link" href="main.jsp">My Information</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="UserListController">Admin Menu</a>
            </li>
            <% } %>
            </ul>
        </div>
        <div class="container-fluid px-5">
            <h1 class="my-3">Home</h1>
            <p>Welcome to IoTBay!</p>
            <p>IoTBay is your one-stop shop for all your IoT device needs, such as:</p>
            <ul>
                <li>Sensors</li>
                <li>Actuators</li>
                <li>Gateways</li>
                <li>... and much more!</li>
            </ul>
            </div>
            
            <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>
