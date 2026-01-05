<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Complaint Submitted</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: #eef3ff;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 450px;
        margin: 120px auto;
        background: white;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        text-align: center;
    }
    h2 {
        color: #2d5cff;
        margin-bottom: 12px;
    }
    p {
        font-size: 16px;
        color: #333;
    }
    .check {
        font-size: 60px;
        color: green;
    }
    .btn {
        margin-top: 20px;
        display: inline-block;
        padding: 10px 20px;
        font-size: 15px;
        background: #2d5cff;
        color: white;
        border-radius: 6px;
        text-decoration: none;
    }
    .btn:hover {
        background: #1b45d3;
    }
    .timer {
        margin-top: 10px;
        color: #666;
        font-size: 14px;
    }
</style>

<script>
    let sec = 4;
    function startTimer() {
        let timer = setInterval(() => {
            document.getElementById("count").innerText = sec;
            sec--;
            if (sec < 0) {
                clearInterval(timer);
                window.location.href = "9-Tenant-Dashboard.jsp"; // redirect
            }
        }, 1000);
    }
</script>

</head>
<body onload="startTimer()">

<div class="container">
    <div class="check">✔</div>
    <h2>Complaint Submitted Successfully</h2>
    <p>Your complaint has been registered. Our team will review it soon.</p>

    <a class="btn" href="9-Tenant-Dashboard.jsp">Go to Dashboard</a>

    <div class="timer">
        Redirecting in <span id="count">5</span> seconds...
    </div>
</div>

</body>
</html>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>