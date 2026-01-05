<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bms.dto.Employee1" %>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies

    Employee1 emp = (Employee1) session.getAttribute("LOGGED_EMP");

    if (emp == null) {
        response.sendRedirect("4-Login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Accountant Dashboard - Home</title>

    <style>
        /* -------------------- Top Navbar -------------------- */
header {
  background-color: #800080;
  padding: 15px 25px;
  color: white;
  display: flex;
  justify-content: space-between;
  align-items: center;
  box-shadow: 0 3px 6px rgba(0,0,0,0.25);
}
header ul {
  display: flex;
  list-style: none;
  margin: 0;
}
header ul li {
  margin: 0 20px;
  font-size: 20px;
}
header a { color: white; text-decoration: none; font-weight: 500; }

        

	main{
width:100%;
height:70vh;
display:flex;
}
        /* Sidebar */
        /* -------------------- Sidebar -------------------- */
.sidebar {
  width: 240px;
  background: #1f2a44;
  color: white;
 /* min-height: 100vh;*/
  padding-top: 30px;
}
.sidebar h3 {
  padding-left: 25px;
  font-size: 28px;
  font-weight:700;
  margin-bottom: 25px;
}
.sidebar a {
  color: white;
  padding: 14px 25px;
  display: block;
  font-size: 20px;
  font-weight:600;
  text-decoration: none;
  transition: 0.25s;
}
.sidebar a:hover {
  background: #3b4970;
  border-left: 5px solid #ffffff;  /* white highlight */
  padding-left: 20px; /* adjust for border */
}

        .logout-btn {
            background: #fff;
            color: #000;
            border: none;
            padding: 10px 20px;
            margin: 20px;
            cursor: pointer;
            border-radius: 5px;
        }

        /* Main Content */
        .main-content {
            margin-left: 50px;
            padding: 40px;
        }

        .main-content h1 {
            font-size: 32px;
        }

        .subtitle {
            color: #555;
            margin-bottom: 30px;
        }

        /* Dashboard Cards */
        .card-container {
            display: flex;
            gap: 20px;
        }

        .card {
            background: #eef2ff;
            padding: 25px;
            border-radius: 12px;
            width: 220px;
            text-align: center;
            font-size: 18px;
            box-shadow: 0 0 8px rgba(0,0,0,0.1);
        }

        .card h3 {
            margin-bottom: 10px;
        }

        /* FOOTER */
footer{
    background:#111;  color:#bbb;  padding:40px 20px;  margin-top:30px;  animation: fadeFooter 1.5s ease;
}
@keyframes fadeFooter {
    from { opacity: 0; }
    to { opacity: 1; }
}
footer h2{
    color:white;  margin-bottom:10px;
}
footer a{
    color:#bbb;  text-decoration:none;  transition:0.3s;
}
footer a:hover{
    color:white;  transform:translateX(5px);
}
footer .div{
    margin:20px 80px;
}
footer ul{
    padding-left:0;
}
footer li{
    list-style:square;  margin:5px 0;
}

/* ---------------- Profile Sidebar ------------------ */
#profileSidebar {
    position: fixed;
    top: 0;
    right: -350px;
    width: 320px;
    height: 100%;
    background: #ffffff;
    box-shadow: -3px 0 10px rgba(0,0,0,0.25);
    transition: right 0.4s ease;
    padding: 25px;
    z-index: 9999;
}
    </style>

</head>
<body>

<!-- Top Navigation -->
<header>

    <div style="display:flex; align-items:center;">
        <img src="image/logo.png" width="50" height="50" style="border-radius:5px; margin-right:8px;">
        <h2 style ="margin: 0;">e-BuildingCare</h2>
    </div>

    <!-- Right Profile -->
        <img src="ShowPhoto"
             onclick="openProfile()"
             width="52" height="52"
             style="cursor:pointer; border-radius:50%; object-fit:cover; border:2px solid #fff;">
	
</header>
<main>
<!-- Sidebar -->
<div class="sidebar">
    <h3>Accountant Panel</h3>

    <a href="8-Accountant-Dashboard.jsp">Home</a>
    <a href="8-Accountant-rentRecords.jsp">Rent Records</a>
    <a href="8-Accountant-bills.jsp">Bills & Invoices</a>
    <a href="8-Accountant-financial.jsp">Financial Reports</a>
    <a href="8-Accountant-payments.jsp">Payments</a>
    <a href="8-Accountant-tenantDue.jsp">Tenant Dues</a>
</div>

<!-- Main Content -->
<div class="main-content">

    <h1>👋 Welcome, Accountant</h1>
    <p class="subtitle">Manage rents, payments, invoices, and financial reports — all in one place!</p>

    <!-- Dashboard Summary Cards -->
    <div class="card-container">

        <div class="card">
            <h3>Total Rent Collected</h3>
            <p>₹ 4,25,000</p>
        </div>

        <div class="card">
            <h3>Pending Dues</h3>
            <p>₹ 75,000</p>
        </div>

        <div class="card">
            <h3>Invoices Generated</h3>
            <p>145 This Month</p>
        </div>

        <div class="card">
            <h3>Late Payments</h3>
            <p>12 Cases</p>
        </div>

    </div>

 </div>
</main>

<!-- ================= PROFILE SIDEBAR ================= -->
<div id="profileSidebar">

    <h3 style="text-align:center;">Profile</h3>
    <hr>

    <div style="text-align:center;">
        <img src="ShowPhoto" width="110" height="110"
             style="border-radius:50%; object-fit:cover; border:3px solid #800080;">
    </div>

    <br>

    <p><b>Name		:</b> <%= emp.getName() %></p>
    <p><b>Email		:</b> <%= emp.getEmail() %></p>
    <p><b>Role		:</b> <%=emp.getRole() %></p>
    <p><b>Contact No:</b> <%= emp.getContact_no() %></p>
    <p><b>Aadhaar No:</b> <%= emp.getAadhaar_no() %></p>
    <p><b>Building	:</b> <%= emp.getBuilding() %></p>

    <br>
    <form action="LogoutCtrl" method="post">
        <button style="
            width:100%;
            padding:12px;
            background:#800080;
            color:white;
            border:none;
            border-radius:6px;
            font-size:16px;">Logout</button>
    </form>

    <button onclick="closeProfile()" style="
        width:100%;
        padding:12px;
        background:#ddd;
        border:none;
        border-radius:6px;
        margin-top:10px;">Close</button>

</div>

<script>
function openProfile() {
    document.getElementById("profileSidebar").style.right = "0";
}
function closeProfile() {
    document.getElementById("profileSidebar").style.right = "-350px";
}
</script>
<!-- Footer -->
<footer class="footer">
  <div style="display:flex; justify-content:space-around;">

    <div class="section">
      <h3>Quick Navigation</h3>
      <ul>
        <li><a href="1-Index.jsp">Home</a></li>
        <li><a href="2-About.jsp">About Us</a></li>
        <li><a href="3-Contact.jsp">Contact Us</a></li>
      </ul>
    </div>

    <div class="section">
      <h3>Contact Information</h3>
      <ul>
        <li>📍 Address: "SVVV University, Indore, MP"</li>
        <li>📧 Email: support@myproject.com</li>
        <li>☎ Phone: +91-9893877520</li>
      </ul>
    </div>

    <div class="section">
      <h3>Social Media</h3>
      <ul>
        <li><a href="https://facebook.com"><i class="fab fa-facebook "></i> Facebook</a></li>
		<li><a href="https://instagram.com"><i class="fab fa-instagram "></i> Instagram</a></li>
		<li><a href="https://github.com"><i class="fab fa-github "></i> GitHub</a></li>

      </ul>
    </div>

  </div>

  <h3 style="text-align:center;">e-BuildingCare © 2025 | All rights reserved.</h3>
</footer>

</body>
</html>
