<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.IntakeDAO" %>
<%@ page import="model.Intake" %>
<%@ page import="java.util.List" %>

<%
    HttpSession sessionObj = request.getSession(false);

    // If user not logged in → redirect to login
    if (sessionObj == null || sessionObj.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Get logged-in user data
    model.User user = (model.User) sessionObj.getAttribute("user");
    int userId = user.getId();

    // Get pending intakes
    IntakeDAO dao = new IntakeDAO();
    List<Intake> list = dao.getPendingIntakes(userId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Water Intake To-Do List</title>

    <!-- ★★★ YOUR UI STYLING IS BACK ★★★ -->
    <style>
        body {
            background: #dff4ff;
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 20px;
        }

        h1 {
            font-size: 32px;
            font-weight: bold;
        }

        h2 {
            margin-top: 30px;
            color: #0066cc;
            font-size: 26px;
        }

        table {
            width: 90%;
            background: white;
            border-collapse: collapse;
            margin-top: 15px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.15);
        }

        th {
            background: #0077c2;
            padding: 12px;
            color: white;
            text-transform: uppercase;
        }

        td {
            padding: 12px;
            text-align: center;
        }

        tr:nth-child(even) { background: #eef8ff; }

        a {
            font-size: 18px;
            margin-top: 15px;
            display: inline-block;
            text-decoration: none;
            color: #0047b3;
            font-weight: 600;
        }

        a:hover {
            color: #0077ff;
        }

        .btn-add {
            background: #008CBA;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            margin-top: 20px;
            display: inline-block;
        }

        .btn-add:hover {
            background: #006f9c;
        }
    </style>

</head>
<body>

<h1>Welcome, <%= user.getUsername() %>!</h1>

<h2>💧 Water Intake To-Do List</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Amount</th>
        <th>Time</th>
        <th>Date</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

<%
    for (Intake in : list) {
%>
    <tr>
        <td><%= in.getId() %></td>
        <td><%= in.getAmount() %> ml</td>
        <td><%= in.getTime() %></td>
        <td><%= in.getDate() %></td>
        <td><%= in.getStatus() %></td>
        <td><a href="tick?id=<%= in.getId() %>">✔ Done</a></td>
    </tr>
<%
    }
%>

</table>

<br><br>

<a class="btn-add" href="addIntake.jsp">+ Add New Intake</a><br>
<a href="dashboard.jsp">📊 Dashboard</a><br>
<a href="logout">Logout</a>

</body>
</html>
