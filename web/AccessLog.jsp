
<%@page import="uts.isd.model.Access"%>
<%@page import="java.util.ArrayList"%>
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
                <jsp:include page="_myInfoNav.jsp" />
                <div class="col-sm-9">
                    
                <h1>My Access Log</h1>
                 <form class="form-inline" method ="post" action="AccessSearch">
                        <div class="form-group">
                            <input type="submit" class="btn btn-primary mx-1" value="Find">
                            <input type="text" class="form-control" name="logIn" placeholder="Enter log in time">
                        </div>
                    </form>                
                <table class="table-striped table-hover table-bordered my-3">
                        <tr>
                            <th>Email</th>
                            <th>Log In</th>
                            
                        </tr>
                        <%
                            Access accessSearch = (Access) session.getAttribute("accessSearch");
                            if (accessSearch == null) {
                            ArrayList<Access> access = (ArrayList<Access>) request.getAttribute("access");
                            if (access != null) {
                                for (Access a : access) {
                        %>
                        <tr>
                            <td><%= a.getEmail()%></td>
                            <td><%= a.getLogIn()%></td>
                            
                        </tr>
                        <% }
                        } else { %>
                        <tr>
                            <td colspan="6">No users found.</td>
                        </tr>
                        <% } 
                        } else {%>
                            <tr>
                                <td><%= accessSearch.getEmail()%></td>
                                <td><%= accessSearch.getLogIn()%></td>
                            </tr>
                            <% };%>
                    </table>

                </div>
            </div>
        </div>
    </body>
</html>
