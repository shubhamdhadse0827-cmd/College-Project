<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>CEO Dash-board - eBuildingCare</title>
<link rel="icon" type="image/png" href="image/about.jpg">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

/* ================= ROOT COLORS ================= */
:root {
    --primary: #800080;
    --text-light: white;
    --text-dark: #333;
    --sidebar-bg: #1f2a44;
    --sidebar-hover: #3b4970;
    --card-bg: #ffffff;
}

/* ================= HEADER / TOPBAR ================= */
header {
    background-color: var(--primary);
    padding: 15px 25px;
    color: var(--text-light);
    display: flex;
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

nav {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

nav ul {
    display: flex;
    align-items: center;
}

nav li {
    list-style: none;
    font-size: 18px;
    margin-left: 35px;
}

nav a {
    color: white;
    text-decoration: none;
    transition: 0.3s;
}

nav a:hover {
    opacity: 0.7;
}

/* ================= MAIN LAYOUT ================= */
main {
    width: 100%;
    padding: 10px 20px;
    margin-left: 240px; /* because of sidebar */
}

/* ================= SIDEBAR ================= */
.sidebar {
    position: fixed;
    left: 0;
    top: 70px;
    bottom: 0;
    width: 240px;
    background: var(--sidebar-bg);
    color: var(--text-light);
    padding-top: 30px;
    overflow-y: auto;
    box-shadow: 2px 0 6px rgba(0,0,0,0.15);
}

.sidebar h3 {
    padding-left: 25px;
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 25px;
}

.sidebar a {
    color: white;
    padding: 14px 25px;
    display: block;
    font-size: 17px;
    font-weight: 500;
    text-decoration: none;
    transition: 0.2s;
}

.sidebar a:hover {
    background: var(--sidebar-hover);
    padding-left: 30px;
}

/* Logout Button */
.logout-btn {
    background: #ffffff;
    color: #444;
    border: none;
    padding: 10px 16px;
    border-radius: 6px;
    margin: 20px 25px;
    width: 80%;
    font-size: 15px;
    font-weight: bold;
    cursor: pointer;
}

.logout-btn:hover {
    background: #ddd;
}

/* ================= WELCOME CARD ================= */
.welcome {
    background: #eef3ff;
    padding: 35px;
    border-radius: 12px;
    font-size: 20px;
    margin-bottom: 25px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.08);
}

/* ================= STAT CARDS ================= */
.card {
    background: var(--card-bg);
    border-radius: 10px;
    box-shadow: 0 3px 8px rgba(0,0,0,0.12);
    text-align: center;
}

.card h6 {
    color: #555;
}

/* ================= MANAGER / HR CONTAINER ================= */
.manager-box, .hr-box {
    padding: 2rem;
    width: 50%;
    border: 1px solid #dcdcdc;
    border-radius: 10px;
    background: white;
    box-shadow: 0 3px 6px rgba(0,0,0,0.05);
}

/* ================= PROFILE SIDEBAR ================= */
#profileSidebar {
    position: fixed;
    top: 0;
    right: -350px;
    width: 320px;
    height: 100%;
    background: white;
    box-shadow: -3px 0 10px rgba(0,0,0,0.25);
    transition: right 0.4s ease;
    padding: 25px;
    z-index: 9999;
}

#profileSidebar button {
    cursor: pointer;
}

/* ================= FOOTER ================= */
footer {
    background: #111;
    color: #bbb;
    padding: 40px 20px;
    margin-top: 50px;
}

footer h2 {
    color: white;
}

footer a {
    color: #bbb;
    text-decoration: none;
    transition: 0.3s;
}

footer a:hover {
    color: white;
    padding-left: 5px;
}

footer ul {
    padding: 0;
}

footer li {
    list-style: none;
    margin: 8px 0;
}
</style>
</head>

<body>

<header>
	<nav>
		<div>
			<img alt="Logo" src="image/logo.png" width="50px" height="50px" style="margin-right:5px;">
			<h2 style="display:inline;">e-BuildingCare</h2>
		</div>

		<ul style="display:flex;">
			<li><a href="5-Admin-Dashboard.jsp">Home</a></li>
			<li><a href="TenantData">Tenant Data</a></li>
			<li><a href="EmployeeDetails">Worker Data</a></li>
			<li><a href="5-CeoT1.jsp">Profit/Expenses</a></li>
		</ul>

        <!-- Profile Image -->
        <img src="ShowPhoto"
             onclick="openProfile()"
             width="52" height="52"
             style="cursor:pointer; border-radius:50%; object-fit:cover; border:2px solid #fff;"> 
	</nav>
</header>


<main style="display:flex;">


    <!-- ==================== SIDEBAR ==================== -->
<div class="sidebar">

    <h3>Admin Panel</h3>

    <a href="5-Admin-Dashboard.jsp"><i class="fa-solid fa-house"></i> Home</a>
    <a href="TenantData"><i class="fa-solid fa-users"></i> Tenant Data</a>
    <a href="EmployeeData"><i class="fa-solid fa-user-gear"></i> Worker Data</a>
    <a href="5-Admin-Maintenance.jsp"><i class="fa-solid fa-screwdriver-wrench"></i> Maintenance</a>
</div>


    <!-- MAIN CONTENT -->
    <div style="width:100%;">

      <!-- Welcome -->
      <div class="welcome text-center">
        <h2>Welcome, CEO – Mr. Rajesh Mehta</h2>
        <p>Date: <strong>15 November 2025</strong> | Role: <strong>Chief Executive Officer</strong></p>
      </div>

      <!-- Stats Cards -->
      <div class="row text-center mb-4">
        <div class="col-md-2 col-6 mb-3"><div class="card p-3"><h6>Total Buildings</h6><h3>12</h3></div></div>
        <div class="col-md-2 col-6 mb-3"><div class="card p-3"><h6>Active Tenants</h6><h3>320</h3></div></div>
        <div class="col-md-2 col-6 mb-3"><div class="card p-3"><h6>Staff Members</h6><h3>45</h3></div></div>
        <div class="col-md-2 col-6 mb-3"><div class="card p-3"><h6>Monthly Revenue</h6><h3>₹4.2L</h3></div></div>
        <div class="col-md-2 col-6 mb-3"><div class="card p-3"><h6>Monthly Expense</h6><h3>₹2.9L</h3></div></div>
        <div class="col-md-2 col-6 mb-3"><div class="card p-3"><h6>Complaints</h6><h3>15</h3></div></div>
      </div>

      <!-- Manager & HR -->
      <div style="display:flex;">
        <div style="padding:2rem; width:50%; margin-right:1.5rem; border:1px solid #d6c8c8; border-radius:10px;">
            <h2>Create Managers Accounts</h2>
            <a href="11-AddManager.jsp" class="btn btn-primary mt-2">Add New Manager</a>
        </div>

        <div style="padding:2rem; width:50%; border:1px solid #d6c8c8; border-radius:10px;">
            <h2>Create HRs Accounts</h2>
            <a href="12-AddHR.jsp" class="btn btn-primary mt-2">Add New HR</a>
        </div>
      </div>

      <!-- Alerts & Summary -->
      <div class="row mt-4">
        <div class="col-md-6">
          <div class="card p-3">
            <h5>Recent Alerts</h5>
            <ul class="list-group">
              <li class="list-group-item">⚠️ AC issue reported in Tower A</li>
              <li class="list-group-item">🧹 Cleaning delay in Building 3</li>
              <li class="list-group-item">💡 Power maintenance scheduled for 10th Nov</li>
              <li class="list-group-item">📈 Occupancy increased by 8% this month</li>
            </ul>
          </div>
        </div>

        <div class="col-md-6">
          <div class="card p-3">
            <h5>Building Performance Summary</h5>
            <table class="table table-sm table-striped">
              <thead>
                <tr>
                  <th>Building</th>
                  <th>Occupancy</th>
                  <th>Revenue</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tbody>
                <tr><td>Tower A</td><td>95%</td><td>85,000</td><td><span class="badge bg-success">Stable</span></td></tr>
                <tr><td>Tower B</td><td>88%</td><td>72,000</td><td><span class="badge bg-warning">Moderate</span></td></tr>
                <tr><td>Tower C</td><td>98%</td><td>91,000</td><td><span class="badge bg-success">Excellent</span></td></tr>
                <tr><td>Tower D</td><td>75%</td><td>60,000</td><td><span class="badge bg-danger">Low</span></td></tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

    </div>
</div>  
</div>
</main>


<!-- PROFILE SIDEBAR -->
<div id="profileSidebar">
    <h3 style="text-align:center;">Profile</h3>
    <hr>

    <div style="text-align:center;">
        <img src="<%= request.getContextPath() %>/ShowPhoto" 
             width="110" height="110"
             style="border-radius:50%; object-fit:cover; border:3px solid #800080;">
    </div>

    <br>

    <p><b>Name:</b> <%= emp.getName() %></p>
    <p><b>Email:</b> <%= emp.getEmail() %></p>
    <p><b>Role:</b> <%= emp.getRole() %></p>
    <p><b>Contact No:</b> <%= emp.getContact_no() %></p>
    <p><b>Aadhaar No:</b> <%= emp.getAadhaar_no() %></p>
    <p><b>Building:</b> <%= emp.getBuilding() %></p>

    <br>
    <form action="LogoutCtrl" method="post">
        <button style="
            width:100%; padding:12px; background:#800080; 
            color:white; border:none; border-radius:6px;
            font-size:16px;">
            Logout
        </button>
    </form>

    <button onclick="closeProfile()" style="
        width:100%; padding:12px; background:#ddd;
        border:none; border-radius:6px; margin-top:10px;">
        Close
    </button>
</div>


<!-- PROFILE TOGGLE -->
<script>
function openProfile() {
    document.getElementById("profileSidebar").style.right = "0";
}
function closeProfile() {
    document.getElementById("profileSidebar").style.right = "-350px";
}
</script>

<!-- ==================== FOOTER ==================== -->
<!-- FOOTER -->
<footer>
	<div style="display:flex; justify-content:space-around; flex-wrap:wrap;">
		<div class="div">
			<h2>Quick Navigation</h2>
			<ul>
				<li><a href="1-Index.jsp">Home</a></li>
				<li><a href="2-About.jsp">About</a></li>
				<li><a href="3-Contact.jsp">Contact</a></li>
			</ul>
		</div>
		<div class="div">
			<h2>Contact</h2>
			<ul>
				<li>📍 SVVV University, Indore</li>
				<li>📧 support@myproject.com</li>
				<li>☎ +91 9893877520</li>
			</ul>
		</div>
		<div class="div">
			<h2>Social</h2>
			<ul>
		<li><a href="https://facebook.com"><i class="fab fa-facebook "></i> Facebook</a></li>
		<li><a href="https://instagram.com"><i class="fab fa-instagram "></i> Instagram</a></li>
		<li><a href="https://github.com"><i class="fab fa-github "></i> GitHub</a></li>
	</ul>
		</div>
	</div>
	<h2 style="text-align:center; margin-top:20px;">e-BuildingCare © 2025 | All Rights Reserved</h2>
</footer>
</body>
</html>
