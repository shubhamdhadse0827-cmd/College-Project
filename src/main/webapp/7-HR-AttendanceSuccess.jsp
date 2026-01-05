<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Attendance Saved</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background: #f5f7fb;
    }

    .center-box {
        width: 50%;
        margin: 80px auto;
        padding: 40px;
        text-align: center;
        background: #fff;
        border-radius: 12px;
        box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
        animation: fadeIn 0.6s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .success-icon {
        font-size: 70px;
        color: #28a745;
        animation: pop 0.4s ease-in-out;
    }

    @keyframes pop {
        0% { transform: scale(0.5); }
        100% { transform: scale(1); }
    }

    h2 {
        color: #333;
        margin-top: 10px;
    }

    p {
        color: #666;
        font-size: 16px;
        margin-bottom: 25px;
    }

    .btn {
        text-decoration: none;
        background: #2B65EC;
        padding: 12px 25px;
        color: #fff;
        border-radius: 5px;
        font-size: 16px;
        transition: 0.3s;
    }

    .btn:hover {
        background: #1a4bb8;
    }
</style>

</head>
<body>

<div class="center-box">
    <div class="success-icon">✔</div>
    <h2>Attendance Saved Successfully!</h2>

    <p>Your attendance record has been saved for today.</p>

    <a href="7-HR-Attendance.jsp" class="btn">Go Back</a>
</div>

</body>
</html>
