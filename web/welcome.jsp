
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - Welcome</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    </head>
    <body>
        
        <%
            String tosResult = request.getParameter("tos");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String gender = request.getParameter("gender");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            if (tosResult != null && tosResult.equals("yes")) {
        %>
        
        <jsp:useBean id="user" class="uts.isd.model.User" scope="session">
            <jsp:setProperty name="user" property="firstName" value="<%= firstName %>"/>
            <jsp:setProperty name="user" property="lastName" value="<%= lastName %>" />
            <jsp:setProperty name="user" property="email" value="<%= email %>" />
            <jsp:setProperty name="user" property="password" value="<%= password %>" />
        </jsp:useBean>
        
        <div class="container-fluid px-5 py-3">
            <div class="row mb-3">
            <div class="col-sm-4"><span class="display-4">IoTBay</span></div>
            <div class="col-sm-8 text-right my-auto">
                You are logged in as ${user.firstName} ${user.lastName} &lt;<b>${user.email}</b>&gt;
                <a href="logout.jsp" class="btn btn-secondary ml-2">Logout</a>
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
            <li class="nav-item">
              <a class="nav-link" href="main.jsp">My Information</a>
            </li>
        </div>
        <div class="container-fluid px-5 my-3">
            <h1>Welcome!</h1>
        </div>

        <div class="container-fluid px-5 mt-4">
            <a href="main.jsp" class="btn btn-primary"><b>Go to your User Dashboard</b></a>
            <a href="logout.jsp" class="btn btn-secondary ml-2">Logout</a>
        </div>
            

        
        <% } else { %>
        <div class="container-fluid px-5 py-3">
            <div class="row mb-3">
            <div class="col-sm-4"><span class="display-4">IoTBay</span></div>
            <div class="col-sm-8 text-right my-auto">
                You are not logged in.
            </div>
            </div>
        </div>
        <div class="container-fluid px-5 my-3">
            <h2>Registration Failed</h2>
            <div class="alert alert-danger my-3">
                Sorry, you must agree to the terms of service to continue.<br>
                Please <a href="register.jsp" class="alert-link">click here</a> to go back.
            </div>
        </div>
        
        <% } %>
        
    </body>
</html>
