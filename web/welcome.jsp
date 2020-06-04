

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
        <jsp:include page="_header.jsp" />
        <div class="container-fluid px-5 my-3">
            <h1>Welcome!</h1>
        </div>

        <div class="container-fluid px-5 mt-4">
            <a href="main.jsp" class="btn btn-primary"><b>Go to your User Dashboard</b></a>
            <a href="logout.jsp" class="btn btn-secondary ml-2">Logout</a>
        </div>



    </body>
</html>
