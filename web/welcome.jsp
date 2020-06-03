

<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - Welcome</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    </head>
    <body>
        <% User user = (User) session.getAttribute("user");%>    
        <div class="container-fluid px-5 py-3">
            <div class="row mb-3">
            <div class="col-sm-4"><span class="display-4">IoTBay</span></div>q
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
            <li class="nav-item">
              <a class="nav-link" href="EditServlet?email='<%= user.getEmail()%>'$password='<%= user.getPassword()%>'">Edit</a>
            </li>
        </div>
        <div class="container-fluid px-5 my-3">
            <h1>Welcome!</h1>
        </div>

        <div class="container-fluid px-5 mt-4">
            <a href="main.jsp" class="btn btn-primary"><b>Go to your User Dashboard</b></a>
            <a href="logout.jsp" class="btn btn-secondary ml-2">Logout</a>
        </div>
            

        
    </body>
</html>
