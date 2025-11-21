<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Water Intake</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to bottom right, #dff7ff, #bde0fe);
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 420px;
            margin: 70px auto;
            padding: 30px;
            background: white;
            border-radius: 18px;
            box-shadow: 0 10px 35px rgba(0,0,0,0.15);
            animation: fadeIn 0.5s ease;
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(10px);}
            to {opacity: 1; transform: translateY(0);}
        }

        h2 {
            text-align: center;
            color: #0b63ce;
            font-weight: 600;
            margin-bottom: 25px;
            font-size: 28px;
        }

        label {
            font-weight: 500;
            color: #003566;
            font-size: 15px;
        }

        input {
            width: 100%;
            padding: 12px;
            margin-top: 6px;
            margin-bottom: 18px;
            border: 1px solid #a6c4e1;
            border-radius: 10px;
            font-size: 15px;
            outline: none;
            transition: 0.2s;
        }

        input:focus {
            border-color: #0077ff;
            box-shadow: 0 0 5px rgba(0,119,255,0.5);
        }

        .btn {
            width: 100%;
            padding: 12px;
            font-size: 17px;
            font-weight: 600;
            background: #00b258;
            color: white;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            transition: 0.2s;
        }

        .btn:hover {
            background: #00994a;
        }

        a.back {
            display: inline-block;
            margin-top: 18px;
            color: #00509d;
            font-size: 15px;
            text-decoration: none;
        }

        a.back:hover {
            text-decoration: underline;
        }

    </style>
</head>

<body>

<div class="container">
    <h2>💧 Add Water Intake</h2>

    <form action="add" method="post">

        <label>Amount (ml):</label>
        <input type="number" name="amount" required>

        <label>Time:</label>
        <input type="time" name="time" required>

        <label>Date:</label>
        <input type="date" name="date" required>

        <button class="btn" type="submit">Save</button>

    </form>

    <a href="index.jsp" class="back">← Back</a>
</div>

</body>
</html>
