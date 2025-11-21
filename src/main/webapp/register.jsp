<!DOCTYPE html>
<html>
<head>
    <title>Register – Water Tracker</title>
    <style>
        body { font-family: Arial; background:#e3f6ff; padding:40px; }
        .box {
            width:350px; margin:auto; padding:25px;
            background:white; border-radius:12px;
            box-shadow:0 3px 15px rgba(0,0,0,0.2);
        }
        input { width:100%; padding:10px; margin:10px 0; }
        button { width:100%; padding:12px; background:#0288d1; color:white;
                 border:none; border-radius:8px; font-size:16px; }
        button:hover { background:#015c91; }
        p.error { color:red; text-align:center; }
        a { text-decoration:none; color:#0288d1; }
    </style>
</head>

<body>

<div class="box">
    <h2 style="text-align:center;">Register</h2>

    <form action="register" method="post">

        <input type="text" name="username" placeholder="Create username" required>

        <input type="password" name="password" placeholder="Create password" required>

        <input type="password" name="confirm" placeholder="Confirm password" required>

        <p class="error">${error}</p>

        <button type="submit">Register</button>
    </form>

    <p style="text-align:center;">Already have an account? <a href="login.jsp">Login</a></p>
</div>

</body>
</html>
