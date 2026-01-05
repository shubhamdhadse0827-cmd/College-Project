<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String amount = request.getParameter("amount");
%>

<!DOCTYPE html>
<html>
<head>
<title>Payment Success</title>
<style>
body{ font-family:Arial; text-align:center; background:#eef8ee; padding-top:80px; }
.box{
    width:420px; margin:auto; background:white; padding:35px;
    border-radius:12px; box-shadow:0 4px 12px rgba(0,0,0,0.15);
}
.tick{
    font-size:70px; color:green; font-weight:bold;
}
</style>
</head>
<body>

<div class="box">
    <div class="tick">✔</div>
    <h2>Payment Successful</h2>
    <p>You have paid: <b>₹ <%= amount %></b></p>

    <a href="9-Tenant-Dashboard.jsp">
        <button style="padding:12px 30px; background:#5c2d91; color:white; border:none; border-radius:6px; margin-top:20px; cursor:pointer;">
            Go to Dashboard
        </button>
    </a>
</div>
</body>
</html>
