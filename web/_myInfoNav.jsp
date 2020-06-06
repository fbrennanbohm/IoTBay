<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.User"%>

<%
    User user = (User) session.getAttribute("user");
    String url = request.getRequestURL().toString();
%>

<div class="col-sm-3">
    <ul class="nav nav-pills flex-column">
        <li class="nav-item">
            <a class="nav-link  <%=(url.indexOf("main.jsp") > -1 ? "active" : "")%>" href="main.jsp">My Dashboard</a>
        </li>
        <li class="nav-item">
            <a class="nav-link  <%=(url.indexOf("orderHistory.jsp") > -1 ? "active" : "")%>" href="OrderHistory?id=<%= user.getUserId()%>">View Order History</a>
        </li>
         <li class="nav-item">
            <a class="nav-link  <%=(url.indexOf("AccessLog.jsp") > -1 ? "active" : "")%>" href="AccessServlet?email='<%= user.getEmail()%>'$password='<%= user.getPassword()%>'">View Access Log</a>
        </li>
        <li class="nav-item">
            <a class="nav-link  <%=(url.indexOf("edit.jsp") > -1 ? "active" : "")%>" href="EditServlet?id=<%= user.getUserId()%>"> Update Personal Details</a>
        </li>
        <li class="nav-item">
            <a class="nav-link  <%=(url.indexOf("shipping.jsp") > -1 ? "active" : "")%>" href="ShippingServlet?id=<%= user.getUserId()%>"> View/Update Shipping Details</a>
        </li>
        <li class="nav-item">
            <a class="nav-link  <%=(url.indexOf("delete.jsp") > -1 ? "active" : "")%>" href="DeleteServlet?id=<%= user.getUserId()%>">Delete My Account</a>
        </li>
    </ul>
</div>
