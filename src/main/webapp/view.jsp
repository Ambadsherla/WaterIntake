<%@ page import="dao.IntakeDAO" %>
<%@ page import="model.Intake" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.IntakeDAO, model.Intake, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>

<style>
    body {
        margin: 0;
        padding: 30px;
        background: #dff5ff;
        font-family: "Segoe UI", sans-serif;
    }

    .box {
        width: 90%;
        margin: auto;
        padding: 20px;
        background: rgba(255,255,255,0.92);
        border-radius: 20px;
        position: relative;
        overflow: hidden;
        box-shadow: 0 8px 25px rgba(0,0,0,0.25);
    }

    /* ====== TABLE FANS (same as index.jsp) ====== */
    .fan-wrapper {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        width: 140px;
        height: 200px;
        z-index: 20;
    }
    .fan-left  { left:  -160px; }
    .fan-right { right: -160px; transform: translateY(-50%) scaleX(-1); }

    .fan-body {
        position: relative;
        width: 110px;
        height: 110px;
        margin: 0 auto;
        border-radius: 50%;
        border: 4px solid #555;
        background: radial-gradient(circle at 30% 30%, #ffffff, #d0d0d0 40%, #b0b0b0);
        box-shadow: 0 0 8px rgba(0,0,0,0.4);
        overflow: hidden;
    }
    .fan-body::before,
    .fan-body::after {
        content: "";
        position: absolute;
        inset: 12px;
        border-radius: 50%;
        border: 2px solid rgba(80,80,80,0.4);
    }
    .fan-body::after {
        inset: 22px;
        border-style: dotted;
        border-width: 2px;
    }

    .fan-blades {
        position: absolute;
        top: 50%;
        left: 50%;
        width: 70px;
        height: 70px;
        transform-origin: center;
        animation: spin 0.45s linear infinite;
    }

    .fan-blade {
        position: absolute;
        width: 18px;
        height: 38px;
        background: linear-gradient(to bottom, #5ec3ff, #0277bd);
        border-radius: 18px;
        top: -36px;
        left: 26px;
        box-shadow: 0 0 4px rgba(0,0,0,0.3);
        opacity: 0.9;
    }
    .fan-blade:nth-child(2) { transform: rotate(120deg); }
    .fan-blade:nth-child(3) { transform: rotate(240deg); }

    .fan-center {
        position: absolute;
        top: 50%;
        left: 50%;
        width: 18px;
        height: 18px;
        transform: translate(-50%, -50%);
        border-radius: 50%;
        background: radial-gradient(circle, #ffffff, #cccccc);
        box-shadow: 0 0 4px rgba(0,0,0,0.4);
        z-index: 5;
    }

    @keyframes spin {
        from { transform: translate(-50%, -50%) rotate(0deg); }
        to   { transform: translate(-50%, -50%) rotate(360deg); }
    }

    .fan-stand {
        width: 14px;
        height: 50px;
        margin: 0 auto;
        margin-top: 6px;
        background: linear-gradient(#666,#444);
        border-radius: 8px;
        box-shadow: 0 0 4px rgba(0,0,0,0.4);
    }

    .fan-base {
        width: 80px;
        height: 18px;
        margin: 0 auto;
        margin-top: 4px;
        border-radius: 50px;
        background: linear-gradient(#777,#444);
        box-shadow: 0 4px 6px rgba(0,0,0,0.5);
    }

    .fan-air {
        position: absolute;
        top: 45px;
        width: 160px;
        height: 50px;
        opacity: 0.6;
        background:
            radial-gradient(circle at 0 50%, rgba(0,150,255,0.25), transparent 60%);
        filter: blur(1px);
        animation: airFlow 1.1s linear infinite;
    }
    .fan-left .fan-air  { left: 115px; }
    .fan-right .fan-air { right: 115px; transform: scaleX(-1); }

    @keyframes airFlow {
        0%   { transform: translateX(0); }
        100% { transform: translateX(35px); }
    }

    /* ====== RAIN LAYERS ====== */
    .rain-layer {
        position: absolute;
        inset: 0;
        pointer-events: none;
        overflow: hidden;
        z-index: 1;
    }

    .rain-back::before {
        content: "";
        position: absolute;
        width: 2px; height: 18px; top: -150px;
        background: white; opacity: 0.18;
        box-shadow:
            10px 10px white, 80px 40px white, 140px 90px white,
            200px 20px white, 260px 60px white, 320px 120px white,
            380px 30px white, 420px 70px white;
        animation: rainBack 2s linear infinite;
    }

    .rain-mid::before {
        content: "";
        position: absolute;
        width: 3px; height: 30px; top: -140px;
        background: white; opacity: 0.32;
        box-shadow:
            20px 50px white, 100px 10px white, 160px 80px white,
            220px 120px white, 280px 40px white, 350px 100px white,
            400px 20px white, 450px 140px white;
        animation: rainMid 1.4s linear infinite;
    }

    .rain-front::before {
        content: "";
        position: absolute;
        width: 3px; height: 45px; top: -160px;
        background: white; opacity: 0.55;
        filter: blur(0.2px);
        box-shadow:
            35px 30px white, 90px 120px white, 150px 60px white,
            210px 150px white, 270px 30px white, 330px 100px white,
            370px 20px white, 420px 140px white;
        animation: rainFront 1s linear infinite;
    }

    .rain-fog {
        position: absolute;
        top: 0;
        width: 100%;
        height: 60px;
        background: linear-gradient(rgba(255,255,255,0.4), transparent);
        filter: blur(10px);
        z-index: 3;
    }

    .shine {
        position: absolute;
        top: 0;
        left: -50%;
        width: 200%;
        height: 100%;
        background: linear-gradient(
            120deg,
            transparent,
            rgba(255,255,255,0.12),
            transparent
        );
        animation: shineMove 5s linear infinite;
        z-index: 3;
    }

    @keyframes shineMove { 0% {transform:translateX(-50%);} 100% {transform:translateX(50%);} }

    @keyframes rainBack  { 0% {transform:translateY(0);} 100% {transform:translateY(220px);} }
    @keyframes rainMid   { 0% {transform:translateY(0);} 100% {transform:translateY(250px);} }
    @keyframes rainFront { 0% {transform:translateY(0);} 100% {transform:translateY(310px);} }

    /* CONTENT */
    .content { position:relative; z-index:10; }
    h2 {
        text-align:center;
        color:#0277bd;
        font-size:30px;
        margin-bottom:20px;
    }

    table {
        width:100%;
        border-collapse:collapse;
        background:rgba(255,255,255,0.85);
        border-radius:10px;
        overflow:hidden;
    }

    th {
        background:#0288d1;
        padding:15px;
        color:white;
        text-transform:uppercase;
    }

    td {
        padding:15px;
        text-align:center;
        border-bottom:1px solid #ddd;
    }

    .add {
        display:block;
        margin:20px auto;
        width:200px;
        background:#0288d1;
        padding:12px;
        text-align:center;
        border-radius:10px;
        color:white;
        text-decoration:none;
        font-size:18px;
    }
</style>
</head>

<body>

<div class="box">

    <!-- FANS -->
    <div class="fan-wrapper fan-left">
        <div class="fan-body">
            <div class="fan-blades">
                <div class="fan-blade"></div>
                <div class="fan-blade"></div>
                <div class="fan-blade"></div>
            </div>
            <div class="fan-center"></div>
        </div>
        <div class="fan-stand"></div>
        <div class="fan-base"></div>
        <div class="fan-air"></div>
    </div>

    <div class="fan-wrapper fan-right">
        <div class="fan-body">
            <div class="fan-blades">
                <div class="fan-blade"></div>
                <div class="fan-blade"></div>
                <div class="fan-blade"></div>
            </div>
            <div class="fan-center"></div>
        </div>
        <div class="fan-stand"></div>
        <div class="fan-base"></div>
        <div class="fan-air"></div>
    </div>

    <!-- RAIN EFFECT -->
    <div class="rain-layer rain-back"></div>
    <div class="rain-layer rain-mid"></div>
    <div class="rain-layer rain-front"></div>
    <div class="rain-fog"></div>
    <div class="shine"></div>

    <!-- DASHBOARD CONTENT -->
    <div class="content">

<h2>💧 Water Intake Records</h2>

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
    <td><%= i.getAmount() %></td>
    <td><%= i.getTime() %></td>
    <td><%= i.getDate() %></td>
<td>
    <% if(i.getStatus().equalsIgnoreCase("pending")) { %>
        <a href="tick?id=<%=i.getId()%>" style="color:#0277bd; font-weight:bold;">
            ✓ Mark as Done
        </a>
    <% } else { %>
        <span style="color:green; font-weight:bold;">✓ Done</span>
    <% } %>
</td>

<td>
    <a href="delete?id=<%=i.getId()%>" style="color:red; font-weight:bold;">
        Delete
    </a>
</td>
</tr>
<% } %>

</table>

<a class="add" href="index.jsp">➕ Add New Intake</a>


    </div>
</div>

</body>
</html>
