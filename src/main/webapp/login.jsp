<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Water Intake Tracker</title>

    <!-- keep / merge with your existing CSS, this is just a light polish -->
    <style>
        body { font-family: Arial, sans-serif; background:#0f172a; color:#e5e7eb; margin:0;
               display:flex; justify-content:center; align-items:center; height:100vh; }
        .card { background:#020617; padding:32px 40px; border-radius:16px;
                box-shadow:0 20px 40px rgba(15,23,42,0.7); min-width:360px; }
        h1 { margin:0 0 24px; text-align:center; }
        label { display:block; margin-top:12px; font-size:14px; }
        input[type=text], input[type=password] {
            width:100%; padding:10px 12px; margin-top:6px; border-radius:8px;
            border:1px solid #1f2937; background:#020617; color:#e5e7eb;
        }
        button {
            margin-top:20px; width:100%; padding:10px; border:none; border-radius:9999px;
            background:#22c55e; color:#020617; font-weight:bold; cursor:pointer;
        }
        button:hover { background:#4ade80; }
        .links { margin-top:14px; text-align:center; font-size:14px; }
        a { color:#38bdf8; text-decoration:none; }
        a:hover { text-decoration:underline; }
        .error { margin-top:10px; color:#f97316; font-size:14px; text-align:center; }
        .msg   { margin-top:10px; color:#4ade80; font-size:14px; text-align:center; }
    </style>
</head>
<body>
<div class="card">
    <h1>Login</h1>

    <form action="login" method="post">
        <label>Username:
            <input type="text" name="username" required />
        </label>

        <label>Password:
            <input type="password" name="password" required />
        </label>

        <button type="submit">Login</button>
    </form>

    <div class="links">
        New user?
        <a href="register.jsp">Create an account</a>
    </div>

    <%
        String error = (String) request.getAttribute("error");
        String msg   = (String) request.getAttribute("msg");
        if (error != null) {
    %>
        <div class="error"><%= error %></div>
    <% } else if (msg != null) { %>
        <div class="msg"><%= msg %></div>
    <% } %>
</div>
</body>
</html>
