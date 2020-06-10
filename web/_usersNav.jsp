<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.User"%>

<%
    String url = request.getRequestURL().toString();
%>

<div class="col-sm-3">
    <ul class="nav nav-pills flex-column">
        <li class="nav-item">
            <a class="nav-link <%=(url.indexOf("userList.jsp") > -1 ? "active" : "")%>" href="UserListController">View User list</a>
        </li>
        <li class="nav-item">
            <a class="nav-link <%=(url.indexOf("userSearch.jsp") > -1 ? "active" : "")%>" href="userSearch.jsp">Search Users</a>
        </li>
        <li class="nav-item">
            <a class="nav-link <%=(url.indexOf("newUser.jsp") > -1 ? "active" : "")%>" href="newUser.jsp">Create New User</a>
        </li>
    </ul>
</div>