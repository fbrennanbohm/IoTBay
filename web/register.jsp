
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - Register</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    </head>
    <body>
         <% 
            String existErr = (String) session.getAttribute("existErr");
            String emailErr = (String) session.getAttribute("emailErr");
            String passErr = (String) session.getAttribute("passErr");
            String nameErr = (String) session.getAttribute("nameErr");
            %>
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
                <a href="register.jsp" class="btn btn-primary m-2 disabled">Register</a>
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
              <a class="nav-link" href="index.jsp">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="catalogue.jsp">Device Catalogue</a>
            </li>
        </ul>
        </div>
        <div class="container-fluid px-5">
            <div class="row">
                <% if(!loggedIn) {  %>
                <div class="col-sm-8">
            
            <h1 class="my-3">Register <span class="text-warning"><%=(existErr !=null ? existErr : "")%></span></h1>
            <p class="mb-3">Please provide your personal information in the form below.</p>
            
            <div class="card mb-4">
            <div class="card-body">
            
                <form action="RegisterServlet" method="post">
                <input type="hidden" name="submitted" value="yes">
                
                <div class="form-group">
                    <label for="firstName">First name</label>
                    <input type="text" class="form-control" name="firstName" placeholder="<%=(nameErr != null ? nameErr : "Enter First Name")%>"required >
                </div>
                
                <div class="form-group">
                    <label for="lastName">Last name</label>
                    <input type="text" class="form-control" name="lastName" placeholder="<%=(nameErr != null ? nameErr : "Enter last name")%>"required>
                </div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="text" class="form-control" name="email" placeholder="<%=(emailErr != null ? emailErr : "Enter email")%>"required>
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" name="password" placeholder="<%=(passErr != null ? passErr : "Enter password")%>" required>
                </div>
                <div class="container mt-4">
                    <input type="submit" class="btn btn-primary" value="Register"/>
                    <a href="index.jsp" class="btn btn-secondary mx-4">Cancel</a>
                </div>
                </form>
                </div>
                </div> 
                <% } else { %>
                <div class="col-sm-8">
                    <div class="alert alert-info my-3">
                        It looks like you are already logged in.<br>
                        If you want to create a new account, you must <a class="alert-link" href="logout.jsp">logout</a> before doing so.
                    </div>
                </div>
                <% } %>
                </div>
                <div class="col-sm-4">
                    
                </div>
                </div>
            </div>
    </body>
</html>
