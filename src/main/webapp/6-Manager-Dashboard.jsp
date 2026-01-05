<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bms.dto.Employee1" %>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies

    Employee1 emp = (Employee1) session.getAttribute("LOGGED_EMP");
    String building = (String) session.getAttribute("building_name");

    if (emp == null) {
        response.sendRedirect("4-Login.jsp");
        return;
    }
%>
<%@ page import="com.bms.model.ComplaintModel" %>
<%
	ComplaintModel model = new ComplaintModel();
	int totalComplaints = model.getComplaintCount();
%>
<%@ page import="com.bms.model.EmployeeModel" %>

<%
    EmployeeModel empModel = new EmployeeModel();
    int totalStaff = empModel.getStaffCountByBuilding(emp.getBuilding());
%>
<%@ page import="com.bms.model.TenantModel" %>

<%
    TenantModel tm = new TenantModel();
    int totalTenant = tm.getTenantCountByBuilding(emp.getBuilding());
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manager Dashboard - Home</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

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

/* -------------------- Sidebar -------------------- */
.sidebar {
  width: 240px;
  background: #1f2a44;
  color: white;
  min-height: 100vh;
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
  background: white;
  color: #444;
  border: none;
  padding: 10px 16px;
  border-radius: 6px;
  margin: 20px 25px;
  width: 80%;
  font-size: 16px;
}

/* -------------------- Content -------------------- */
.content {
  flex-grow: 1;
  padding: 30px;
  background: #f2f2f7;
}

.welcome-box {
  background: #eef3ff;
  padding: 35px;
  border-radius: 12px;
  font-size: 20px;
  box-shadow: 0 4px 10px rgba(0,0,0,0.08);
}

.dashboard-cards {
  display: flex;
  gap: 25px;
  margin-top: 35px;
  flex-wrap: wrap;
}

.card-box {
  width: 260px;
  height: 160px;
  background: white;
  border-radius: 14px;
  box-shadow: 0 3px 8px rgba(0,0,0,0.1);
  padding: 25px;
  text-align: center;
}
.card-box h3 {
  font-size: 22px;
  color: #800080;
  margin-bottom: 10px;
}
.card-box p {
  font-size: 18px;
  color: #444;
}

.button {
  display: block;
  font-size: 20px;
  padding: 12px;
  padding-left: 25px;
  text-decoration: none;
  background: #1f2a44;
  color: white;
  border-radius: 10px;
  width: 270px;
  height: 50px;
}

/* -------------------- Footer -------------------- */
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

<!-- ==================== TOP NAV ==================== -->
<header>
    <div style="display:flex; align-items:center;">
        <img src="image/logo.png" width="50" height="50" style="border-radius:5px; margin-right:10px;">
        <h2 style="margin:0;">e-BuildingCare</h2>
    </div>

    <!-- Right Profile -->
        <img src="ShowPhoto"
             onclick="openProfile()"
             width="52" height="52"
             style="cursor:pointer; border-radius:50%; object-fit:cover; border:2px solid #fff;">
    
</header>

<main style="display:flex;">

<!-- ==================== SIDEBAR ==================== -->
<div class="sidebar">

    <h3>Manager Panel</h3>

    <a href="6-Manager-Dashboard.jsp">Home</a>
    <a href="EmployeeByBuildingCtrl">Staff Data</a>
    <a href="TenantDetailsCtrl">Tenant Data</a>
    <a href="6-Manager-Complaints.jsp">Complaints</a>
    <a href="6-Manager-maintenance.jsp">Maintenance</a>
    <a href="6-Manager-Reports.jsp">Reports</a>

</div>

<!-- ==================== MAIN CONTENT ==================== -->
<div class="content">

    <div class="welcome-box">
        <h2>👋 Welcome, Manager</h2>
        <p>Monitor staff performance, assign tasks, manage tenants and review maintenance — all in one dashboard!</p>
    </div>

    <!-- Dashboard Cards -->
    <div class="dashboard-cards">
        <div class="card-box">
	        	<h3>Total Staff</h3>
	        	<p style="font-size:24px;
	        	font-weight:bold;
	        	color:#d10000;"><%=totalStaff %></p>
	    </div>
	    
	    <div class="card-box">
	        	<h3>Total Tenants</h3>
	        	<p style="font-size:24px;
	        	font-weight:bold;
	        	color:#d10000;"><%=totalTenant %></p>
	    </div>
	    
        <div class="card-box"><h3>Maintenance Status</h3><p>4 Unresolved</p></div>
        <div class="card-box"><h3>Monthly Reports</h3><p>Available</p></div>
        
	    <div class="card-box">
	        	<h3>Total Complaints</h3>
	        	<p style="font-size:24px;
	        	font-weight:bold;
	        	color:#d10000;"><%=totalComplaints %></p>
	    </div>
      </a>
    </div>

    <div style="
        padding:2rem; 
        background:white; 
        margin:2rem 0; 
        width:100%;
        border-radius:12px;
        box-shadow:0 4px 10px rgba(0,0,0,0.1);">
      
        <h2 style="margin-bottom:1rem;">Create Tenants Account</h2>
        <a href="6-Manager-AddTenant.jsp" class="button">Add New Tenant</a>
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
