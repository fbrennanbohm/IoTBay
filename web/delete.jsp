<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - Delete Account</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>

        <%
            User user = (User) session.getAttribute("user");
        %>

        <jsp:include page="_header.jsp" />

        <div class="container-fluid px-5 my-3">
            <div class="row">
                <jsp:include page="_myInfoNav.jsp" />
                <div class="col-sm-9">

                    <form class="form-horizontal" name="myForm" method="post" action="DeleteController">
                        <h1 class="text-primary"><strong>Edit here  </strong></h1>
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


                        <div class="form-group"><div class="col-sm-offset-2 col-sm-10"><input type='submit' class='btn btn-primary'value='Delete'>


                                </form>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </body>
</html>
