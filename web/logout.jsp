
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    </head>
    <body>
        <%
            // Terminate the session
             User user = (User) session.getAttribute("user");
        %>

        <div class="container-fluid px-5 mt-4">
            <h1>Logout</h1>
            <div class="alert alert-success my-3">
                <b>You have been logged out.</b><br>
                Please <a href="LogoutController?email='<%= user.getEmail()%>'$password='<%= user.getPassword()%>'" class="alert-link">click here</a> to go back to the home page.
            </div>
        </div>


    </body>
</html>
