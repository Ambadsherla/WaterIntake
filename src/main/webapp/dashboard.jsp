<%@ page import="dao.IntakeDAO" %>
<%@ page import="model.Intake" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    HttpSession s = request.getSession(false);

    if (s == null || s.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    User user = (User) s.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Water Intake - Dashboard</title>
</head>
<body>

<h1>Dashboard – Hello, <%= user.getUsername() %>!</h1>

<!-- BACK BUTTON -->
<a href="index.jsp" style="font-size:18px;">⬅ Back to To-Do List</a>
<br><br>

<!-- LOAD RECORDS ONLY -->
<jsp:include page="view.jsp" />

<!-- LOGOUT -->
<p><a href="logout">Logout</a></p>


</body>
</html>
