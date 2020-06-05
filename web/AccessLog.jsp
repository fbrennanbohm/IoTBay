
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
                 
                
                <table class="table-striped table-hover table-bordered my-3">
                        <tr>
                            <th>Email</th>
                            <th>Log In</th>
                            
                        </tr>
                        <%
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
                        <% }%>
                    </table>

                </div>
            </div>
        </div>
    </body>
</html>
