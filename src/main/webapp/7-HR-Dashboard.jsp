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
<title>HR Dash-board - eBuildingCare</title>
<link rel="icon" type="image/png" href="image/about.jpg">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>

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

nav{
display:flex;
justify-content:space-between;
}

li{
list-style:none;
font-size:25px;
margin-left:35px;
}

#signUp{
background-color:var(--color2); 
color:var(--color1);
border-radius:10px;
width:90px;
height:30px;
margin-top:10px;
padding-bottom:5px;
}

.pointer{
cursor:pointer;
}

ul a{
color:var(--color2);
text-decoration:none;
}

main{
width:100%;
height:80vh;
display:flex;
}

.about{
margin:40px 0px;
padding:30px;
background-color:var(--color1);
color:var(--color2);
border:5px solid var(--color1);
border-radius:20px;
text-align:justify;
}

.about p{
font-size:x-large;
margin-top:1rem;
margin-bottom:2rem;
}

.about li{
list-style:decimal;
margin-left:0;
font-size:22px;
}

.container{
display:flex;
border:2px solid var(--color1);
justify-content:space-between;
padding:3rem;
margin-bottom:2rem;
border-radius:20px;
}

a.button {
  display: inline-block; padding: 10px 20px;
  background: #007bff; color: white; border-radius: 5px;
  text-decoration: none;
}
.profile{
width:320px;
background-color:var(--color1);
color:var(--color2);
padding:1rem;
border-radius:15px;
text-align:center;
}

.profile img{
border-radius:100%;
margin:15px 0px;
}

.profile p{
margin-bottom:2rem;
}

.links{
display:flex;
justify-content:center;
gap:50px;
}

.links a{
font-size:xx-large;
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

.div{
margin:20px 0px 40px 100px;
}

.div a{
color:var(--color4);
}
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

.content {
  margin-left: 230px;
  padding: 20px;
}

.div ul{
padding-left:0px;
}
.div li{
list-style-type:disc;
}

   .welcome {
      background: linear-gradient(135deg, #007bff, #00c6ff);
      color: white;
      border-radius: 15px;
      padding: 25px;
      margin-bottom: 30px;
    }
    .card {
      border-radius: 12px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.08);
    }
    h4, h5 { font-weight: 600; }
    
.dashboard {
  text-align: center;
  padding:3rem 6rem;
}
.cards {
  display: flex;
  justify-content: center;
  gap: 20px;
  flex-wrap: wrap;
  margin-top: 40px;
}
.card {
  background: #eef3ff;
  padding: 25px;
  border-radius: 12px;
  width: 220px;
  box-shadow: 0 4px 8px rgba(0,0,0,0.1);
  transition: transform 0.2s;
}
.card:hover {
  transform: scale(1.05);
}
.card h3 {
  color: #263859;
  margin-bottom: 10px;
}
.card p {
  font-size: 18px;
  color: #333;
}

</style>
</head>
<body>
<header>
	
		<div>
			<img alt="Logo" src="image/logo.png" width="50px" height="50px" style="margin-right:5px;">
			<h2 style="display:inline;">e-BuildingCare</h2>
		</div>
		
		
		<!-- Right Profile -->
		
        <img src="ShowPhoto"
             onclick="openProfile()"
             width="52" height="52"
             style="cursor:pointer; border-radius:50%; object-fit:cover; border:2px solid #fff;">
             
	
</header>
<main>
<div class="sidebar">
  <h2>HR Dashboard</h2>
  <a href="7-HR-Dashboard.jsp" target="contentFrame">Home</a>
  <a href="ManagerEmployeeDetails" target="contentFrame">Employee Data</a>
  <a href="7-HR-leaveRequests.jsp" target="contentFrame">Leave Requests</a>
  <a href="7-HR-Attendance.jsp" target="contentFrame">Attendance</a>
  <a href="7-HR-MonthlyAttendance.jsp" target="contentFrame">Month Attendance Report</a>
  
</div>
<div class="dashboard">
  <h1>👋 Welcome, HR Manager</h1>
  <p>Manage your employees, attendance, payroll, and reports — all in one place!</p>

  <div class="cards">
    <div class="card">
      <h3>Total Employees</h3>
      <p>120</p>
    </div>
    <div class="card">
      <h3>New Joiners</h3>
      <p>5 This Month</p>
    </div>
    <div class="card">
      <h3>Leave Requests</h3>
      <p>8 Pending</p>
    </div>
    <div class="card">
      <h3>Payroll Status</h3>
      <p>Running</p>
    </div>
  </div>
  <div style="padding:2rem; margin:3rem 1.5rem 2rem 0; background:#eef3ff; border:1px solid #d6c8c8; border-radius:10px;">
  	<h2 style="margin-bottom:1rem;">Create Employees Account</h2>
  	<a href="7-HR-AddEmployee.jsp" class="button">Add New Employee</a>
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

<footer>
<div style="display:flex;">
<div class="div">
<h2>Quick Navigation</h2>
<ul>
<li><a href="1-Index.jsp">Home</a></li>
<li><a href="2-About.jsp">About us</a></li>
<li><a href="3-Contact.jsp">Contact us</a></li>
</ul>
</div>
<div class="div">
<h2>Contact Information</h2>
<ul>
<li>📍 Address: “SVVV University, Indroe, MP”</li>
<li>📧 Email: support@myproject.com</li>
<li>☎ Phone: +91-9893877520</li>
</ul>
</div>
<div class="div">
<h2>Social Media</h2>
<ul>
<li><a href="https://facebook.com"><i class="fab fa-facebook "></i> Facebook</a></li>
<li><a href="https://instagram.com"><i class="fab fa-instagram "></i> Instagram</a></li>
<li><a href="https://github.com"><i class="fab fa-github "></i> GitHub</a></li>
</ul>
</div>
</div>
<div>
<h2 style="text-align:center;">e-BuildingCare © 2025 | All rights are reserved.</h2>
</div>
</footer>
</body>
</html>