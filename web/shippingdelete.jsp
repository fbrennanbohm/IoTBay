<%-- 
    Document   : shippingdelete
    Created on : 07/06/2020, 7:30:54 PM
    Author     : Jack
--%>

<%@page import="uts.isd.model.User"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoTBay - Shipping Details</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        
        <jsp:include page="_header.jsp" />

        <div class="container-fluid px-5 my-3">
            <div class="row">
                <jsp:include page="_myInfoNav.jsp" />
                <div class="col-sm-9">
                    
                    <h1>My Dashboard</h1>
                    <p>Your shipping information has been deleted.</p>
                    
                </div>
            </div>
        </div>
    </body>
</html>
