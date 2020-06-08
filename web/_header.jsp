<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.User"%>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

<%
    User user = (User) session.getAttribute("user");
    boolean loggedIn = !(user == null || user.getEmail().equals(""));

    String url = request.getRequestURL().toString();
%>
<div class="container-fluid px-5 py-3">
    <div class="row mb-3">
        <div class="col-sm-4"><span class="display-4">IoTBay </span></div>
        <div class="col-sm-8 text-right my-auto">
            <% if (!loggedIn) { %>
            You are not logged in.
            <a href="register.jsp" class="btn btn-primary m-2">Register</a>
            <a href="login.jsp" class="btn btn-secondary m-2">Login</a>
            <% } else {%>
            You are logged in as ${user.firstName} ${user.lastName} &lt;<b>${user.email}</b>&gt;
            <a href="Checkout?id=<%=user.getUserId()%>" class="btn btn-primary ml-2">
                <i class="fas fa-shopping-cart"></i>
            </a>
            <a href="LogoutController" class="btn btn-secondary ml-2">Logout</a>
            <% }%>
        </div>
    </div>
</div>


<div class="container-fluid px-5">
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link <%=(url.indexOf("index.jsp") > -1 ? "active" : "")%>" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link <%=(url.indexOf("catalogue.jsp") > -1 ? "active" : "")%>" href="ProductListController">Device Catalogue</a>
        </li>
        <% if (loggedIn) {%>
        <li class="nav-item">
            <a class="nav-link <%=(url.indexOf("main.jsp") > -1 ? "active" : "")%>" href="main.jsp">My Information</a>
        </li>

        <%if (user.isAdmin()) {%>
        <li class="nav-item">
            <a class="nav-link <%=(url.indexOf("userList.jsp") > -1 ? "active" : "")%>" href="UserListController">Admin Menu</a>
        </li>
        <% }
            }%>
</div>
