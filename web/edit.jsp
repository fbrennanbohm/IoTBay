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
    <div class="container-fluid px-5 py-3">
            <div class="row mb-3">
            <div class="col-sm-4"><span class="display-4">IoTBay</span></div>
            <div class="col-sm-8 text-right my-auto">
                 <%
            User user = (User) session.getAttribute("user");
            String updated =(String)session.getAttribute("updated");      
                    %>
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
              <a class="nav-link active" href="main.jsp">My Information</a>
            </li>
        </div>       
                
        <div class="container-fluid px-5 my-3">
            <div class="row">
                <div class="col-sm-3">
                    <ul class="nav nav-pills flex-column">
                        <li class="nav-item">
                            <a class="nav-link" href="main.jsp">My Dashboard</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">View Order History</a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="EditServlet?email='<%= user.getEmail()%>'$password='<%= user.getPassword()%>'"> Update Personal Details</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="DeleteServlet?email='<%= user.getEmail()%>'$password='<%= user.getPassword()%>'">Delete My Account</a>
                        </li>
                    </ul>
                </div>
                <div class="col-sm-9">
                    
                <h1>My Dashboard</h1>
                <p>Your personal information is displayed in the table below.</p>
                 <form class="form-horizontal" name="myForm" method="post" action="UpdateServlet">
                        <h1 class="text-primary"><strong>Edit here  <span><%= (updated!=null)? updated :""%></span></strong></h1>
                       <div class="form-group">
                    <label for="firstName">User ID</label>
                    <input type="text" class="form-control" name="userId"value="<%=user.getUserId()%>" >
                </div>
                  <div class="form-group">
                    <label for="firstName">Role ID</label>
                    <input type="text" class="form-control" name="roleId" value="<%=user.getRoleId()%>">
                </div>
                
                        <div class="form-group">
                    <label for="firstName">First name</label>
                    <input type="text" class="form-control" name="firstName"value="<%=user.getFirstName()%>">
                </div>
                
                <div class="form-group">
                    <label for="lastName">Last name</label>
                    <input type="text" class="form-control" name="lastName" value="<%=user.getLastName()%>">
                </div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="text" class="form-control" name="email" value="<%=user.getEmail()%>">
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" name="password"  value="<%=user.getPassword()%>">
                </div>
                     
            
                        <div class="form-group"><div class="col-sm-offset-2 col-sm-10"><input type='submit' class='btn btn-primary'value='Update'>                       
                                
                  </form>
                </div>
            </div>
        </div>
    </body>
</html>
