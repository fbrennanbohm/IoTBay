
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
        <jsp:include page="_header.jsp" />

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
