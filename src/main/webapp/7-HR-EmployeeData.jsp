<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HR Dash-board - eBuildingCare</title>
<link rel="icon" type="image/png" href="image/about.jpg">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
*{
margin:0;
padding:0;
}

:root{
--color1:purple;
--color2:white;
--color3:black;
--color4:gray;
}

header{
background-color:var(--color1);
padding:15px;
color:var(--color2);
}

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
height:70vh;
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
.controls {
      display: flex;
      justify-content: space-between;
      margin-bottom: 20px;
      flex-wrap: wrap;
      gap: 10px;}

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

footer{
width:100%;
background-color:var(--color3);
color:var(--color4);
padding:20px;
}

.div{
margin:20px 0px 40px 100px;
}

.div a{
color:var(--color4);
}
.sidebar {
  width: 230px;
  background: #263859;
  color: white;
  position: relative;
  top:0;
  left: 0;
  margin-top:0px;
  display: flex;
  flex-direction: column;
}
.sidebar h2 {
  padding: 20px 0;
  border-bottom: 1px solid #44506f;
}
.sidebar a {
  color: white;
  padding: 15px 20px;
  text-decoration: none;
  display: block;
}
input, select {
      padding: 8px 10px;
      border-radius: 6px;
      border: 1px solid #ccc;
      font-size: 14px;
    }
.sidebar a:hover {
  background: #44506f;
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
.main-content {
  margin-left: 2rem;
  padding: 30px;
  width:100%;
}

/* --- Table & Filters --- */
.filter-section {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}
input, select {
  padding: 8px 10px;
  border-radius: 6px;
  border: 1px solid #ccc;
  font-size: 14px;
}
table {
  width: 100%;
  border-collapse: collapse;
  background: white;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0,0,0,0.1);
}
th, td {
  padding: 12px;
  border-bottom: 1px solid #ddd;
  text-align: center;
}
th {
  background-color: #263859;
  color: white;
}
tr:hover {
  background-color: #f1f1f1;
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
		<div style="display:flex;">	
			<ul style="display:flex;">
			<li class="pointer"><a href="7-HR-Dashboard.jsp">Home</a><li>
			<li class="pointer"><a href="7-HR-reports.jsp">Report</a><li>
			<li class="pointer"><a href="7-HR-employeeData.jsp">Employee Data</a><li>
			</ul>
		</div>
		<div >
			<img src="image/profile.webp" style="border-radius:100%;width:50px;">
		</div> 
	</nav>
</header>
<main>
<div class="sidebar">
  <h2>HR Dashboard</h2>
  <a href="7-HR-Dashboard.jsp" target="contentFrame">🏠 Home</a>
  <a href="7-HR-employeeData.jsp" target="contentFrame">👥 Employee Data</a>
  <a href="7-HR-leaveRequests.jsp" target="contentFrame">🗓 Leave Requests</a>
  <a href="7-HR-payroll.jsp" target="contentFrame">💰 Payroll</a>
  <a href="7-HR-reports.jsp" target="contentFrame">📊 Reports</a>
  <form action="LogoutServlet" method="post" style="display:inline;">
    <button type="submit" 
            style="background-color:white; color:gray; border:none; margin-left:1.4rem; margin-top:1.4rem;padding:8px 14px; border-radius:6px; cursor:pointer;">
      Logout
    </button>
  </form>
</div>
 <div class="main-content">
    <h2>Employee Data</h2>

    <div class="container">
    <div class="filter-section">
<input type="text" id="searchInput" onkeyup="filterEmployees()" placeholder="Search employee...">
      <select id="filterSelect" onchange="filterEmployees()">
        <option value="All">All Departments</option>
        <option value="HR">HR</option>
        <option value="Finance">Finance</option>
        <option value="IT">IT</option>
        <option value="Maintenance">Maintenance</option>
        <option value="Security">Security</option>
      </select>
    </div>
    <table id="employeeTable">
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Department</th>
        <th>Position</th>
        <th>Contact</th>
      </tr>
      <tr>
        <td>EMP101</td>
        <td>Rahul Sharma</td>
        <td>IT</td>
        <td>Software Engineer</td>
        <td>rahul@company.com</td>
      </tr>
      <tr>
        <td>EMP102</td>
        <td>Priya Mehta</td>
        <td>HR</td>
        <td>HR Manager</td>
        <td>priya@company.com</td>
      </tr>
      <tr>
        <td>EMP103</td>
        <td>Vivek Patel</td>
        <td>Finance</td>
        <td>Accountant</td>
        <td>vivek@company.com</td>
      </tr>
      <tr>
        <td>EMP104</td>
        <td>Anjali Singh</td>
        <td>Maintenance</td>
        <td>Supervisor</td>
        <td>anjali@company.com</td>
      </tr>
      <tr>
        <td>EMP105</td>
        <td>Rohit Verma</td>
        <td>Security</td>
        <td>Security Officer</td>
        <td>rohit@company.com</td>
      </tr>
    </table>
  </div>
</div>
</main>
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
<script>
  function filterEmployees() {
    const input = document.getElementById("searchInput").value.toLowerCase();
    const select = document.getElementById("filterSelect").value.toLowerCase();
    const table = document.getElementById("employeeTable");
    const tr = table.getElementsByTagName("tr");

    for (let i = 1; i < tr.length; i++) { // skip header
      const td = tr[i].getElementsByTagName("td");
      let match = false;
      let selectMatch = false;

      // text search (any column)
      for (let j = 0; j < td.length; j++) {
        if (td[j] && td[j].innerText.toLowerCase().includes(input)) {
          match = true;
        }
      }

      // select filter (for example: department)
      if (select === "" || tr[i].innerText.toLowerCase().includes(select)) {
        selectMatch = true;
      }

      tr[i].style.display = (match && selectMatch) ? "" : "none";
    }
  }
</script>

</body>
</html>