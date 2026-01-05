<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String amount = request.getParameter("amount");
    if(amount == null) amount = "0";

    String err = request.getParameter("error");
%>

<!DOCTYPE html>
<html>
<head>
<title>PhonePe Payment</title>
<meta charset="UTF-8">

<style>
body{
    margin:0;
    font-family: 'Segoe UI', Arial;
    background:#f2f2f7;
}

/* HEADER */
.header{
    background:linear-gradient(135deg,#5c2d91,#7b16b5);
    color:white;
    padding:15px 25px;
    font-size:22px;
    display:flex;
    align-items:center;
    gap:12px;
}

.header img{
    width:40px;
    border-radius:8px;
}

/* MAIN CARD */
.card{
    width:400px;
    margin:40px auto;
    background:white;
    border-radius:16px;
    padding:25px;
    box-shadow:0 3px 15px rgba(0,0,0,0.2);
}

/* Merchant Line */
.merchant{
    display:flex;
    justify-content:space-between;
    padding-bottom:10px;
    border-bottom:1px solid #ddd;
}

.amtBox{
    text-align:center;
    margin:25px 0;
    font-size:28px;
    font-weight:bold;
    color:#5c2d91;
}

/* Bank Row */
.bankRow{
    margin-top:10px;
    padding:12px;
    background:#f9f9f9;
    border-radius:10px;
    display:flex;
    align-items:center;
    gap:15px;
    font-size:16px;
}

.bankRow img{
    width:45px;
}

input[type=password]{
    width:100%;
    padding:14px;
    font-size:18px;
    border:1px solid #ccc;
    border-radius:8px;
    margin-top:10px;
}

/* Pay Button */
.paybtn{
    width:100%;
    padding:15px;
    background:#5c2d91;
    color:white;
    border:none;
    font-size:20px;
    border-radius:10px;
    margin-top:20px;
    cursor:pointer;
}

.paybtn:hover{
    background:#4a2177;
}

/* Error Message */
.errorBox{
    background:#ffebee;
    padding:10px;
    color:#e53935;
    border-left:4px solid #e53935;
    margin-top:10px;
    border-radius:6px;
}

.input-box {
    width: 100%;
    height: 45px;
    border: 1px solid #ccc;
    border-radius: 6px;
    padding: 10px;
    font-size: 16px;
    box-sizing: border-box;   /* Important: width calculation perfect banata hai */
}


/* Loader */
#loaderScreen{
    display:none;
    position:fixed;
    top:0; left:0;
    width:100%; height:100%;
    background:rgba(0,0,0,0.65);
    backdrop-filter:blur(3px);
    /* display:flex;	*/
    justify-content:center;
    align-items:center;
    z-index:9999;
}

.loaderBox{text-align:center;}

.spinner{
    border:6px solid #ddd;
    border-top:6px solid #7b16b5;
    border-radius:50%;
    width:60px; height:60px;
    margin:auto;
    animation:spin 0.9s linear infinite;
}

@keyframes spin{
    100%{ transform:rotate(360deg); }
}
</style>

<script>
function startPayment(){
    document.getElementById("loaderScreen").style.display = "flex";

    setTimeout(()=>{
        document.getElementById("paymentForm").submit();
    },2000);
}
</script>

</head>
<body>

<!-- Loader -->
<div id="loaderScreen">
    <div class="loaderBox">
        <div class="spinner"></div>
        <p style="margin-top:15px; color:white; font-size:20px;">Processing Payment...</p>
    </div>
</div>

<!-- HEADER -->
<div class="header">
    <img src="image/Phonepe.png">
    <span>PhonePe</span>
</div>

<!-- CARD -->
<div class="card">

    <div class="merchant">
        <b>e-BuildingCare</b>
        <span style="font-size:14px;color:gray;">UPI ID: building@upi</span>
    </div>

    <div class="amtBox">₹ <%= amount %></div>

    <div class="bankRow">
        <img src="image/HDFC.png">
        <span>HDFC Bank •••• 9821<br><small>UPI • Verified</small></span>
    </div>

    <!-- ERROR MESSAGE -->
    <% if(err != null){ %>
        <div class="errorBox"><%= err %></div>
    <% } %>

    <!-- Payment Form -->
    <form id="paymentForm" action="PaymentCtrl" method="post">
        <input type="hidden" name="amount" value="<%= amount %>">

        <label><b>Enter Your Password</b></label>
        <input type="password" name="pwd" class="input-box" placeholder="Enter Password">


        <button type="button" class="paybtn" onclick="startPayment()">
            Pay ₹ <%= amount %>
        </button>
    </form>
</div>

</body>
</html>
