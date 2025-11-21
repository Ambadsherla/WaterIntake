<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.IntakeDAO, model.Intake, java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <title>Water Intake Checklist</title>

    <style>
        body {
            font-family: Arial;
            background:#e1f5fe;
            padding:20px;
        }
        h2 { color:#0277bd; }
        table {
            width:80%;
            background:white;
            border-radius:10px;
            border-collapse: collapse;
        }
        th, td {
            padding:15px;
            text-align:center;
            border-bottom:1px solid #ccc;
        }
        th {
            background:#0288d1;
            color:white;
        }
        .done {
            color: green;
            font-weight:bold;
        }
        .pending {
            color: red;
            font-weight:bold;
        }
        .tick-btn {
            background:#00c853;
            color:white;
            padding:6px 12px;
            border-radius:6px;
            text-decoration:none;
        }
        .tick-btn:hover {
            background:#009624;
        }
    </style>

</head>
<body>

<h2>💧 Water Intake To-Do List</h2>

<%
    IntakeDAO dao = new IntakeDAO();
    List<Intake> list = dao.getAllIntakes();
%>

<table>
    <tr>
        <th>ID</th>
        <th>Amount</th>
        <th>Time</th>
        <th>Date</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

    <% for (Intake i : list) { %>
        <tr>
            <td><%= i.getId() %></td>
            <td><%= i.getAmount() %> ml</td>
            <td><%= i.getTime() %></td>
            <td><%= i.getDate() %></td>

            <td class="<%= i.getStatus().equals("done") ? "done" : "pending" %>">
                <%= i.getStatus().equals("done") ? "✔ Done" : "Pending" %>
            </td>

            <td>
                <% if(i.getStatus().equals("pending")) { %>
                    <a class="tick-btn" href="tick?id=<%=i.getId()%>">Mark as Done ✔</a>
                <% } else { %>
                    —
                <% } %>
            </td>
        </tr>
    <% } %>

</table>

<br>
<a href="addIntake.jsp" style="font-size:18px;">
    ➕ Add New Intake
</a>


</body>
</html>
