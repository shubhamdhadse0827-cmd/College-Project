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

<!-- BOOTSTRAP + ICONS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
*{ margin:0; padding:0; }

:root{
--color1:purple;
--color2:white;
--color3:black;
--color4:gray;
}

/* HEADER */
header{
background-color:var(--color1);
padding:15px;
color:var(--color2);
border-bottom-left-radius:5px;
border-bottom-right-radius:5px;
}

nav{
display:flex;
justify-content:space-between;
align-items:center;
}

li{
list-style:none;
font-size:25px;
margin-left:35px;
}

.pointer{ cursor:pointer; }

ul a{
color:var(--color2);
text-decoration:none;
}

main{
width:100%;
padding:10px 10%;
}

/* --------------------------- */
/* PREMIUM SIDEBAR (RIGHT SIDE) */
/* --------------------------- */
#profileSidebar {
  width: 320px;
  height: 100vh;
  background: #ffffff;
  position: fixed;
  right: -350px;
  top: 0;
  padding: 25px;
  transition: 0.4s;
  box-shadow: -4px 0 12px rgba(0,0,0,0.15);
  z-index: 999;
}

#profileSidebar h3 {
    text-align:center;
    margin-bottom:10px;
}

/* FOOTER */
footer{
    background:#111;  
    color:#bbb;  
    padding:40px 20px;  
    margin-top:30px;  
    animation: fadeFooter 1.5s ease;
}

@keyframes fadeFooter {
    from { opacity: 0; }
    to { opacity: 1; }
}

footer h2{
    color:white;  
    margin-bottom:10px;
}

footer a{
    color:#bbb;  
    text-decoration:none;  
    transition:0.3s;
}
footer a:hover{
    color:white;  
    transform:translateX(5px);
}

footer .div{
    margin:20px 80px;
}

footer ul{ padding-left:0; }
footer li{ list-style:square;  margin:5px 0; }

/* PAGE UI */
h3 {
    font-weight: 600;
    color: #007bff;
    font-size:45px;
}

.table th {
  background-color: #007bff;
  color: white;
}

.card {
  border-radius: 12px;
  box-shadow: 0 4px 8px rgba(0,0,0,0.08);
}

</style>
</head>

<body>

<!-- HEADER -->
<header>
	<nav>
		<div>
			<img alt="Logo" src="image/logo.png" width="50" height="50" style="margin-right:5px;">
			<h2 style="display:inline;">e-BuildingCare</h2>
		</div>

		<div>
			<ul style="display:flex;">
				<li><a href="5-Admin-Dashboard.jsp">Home</a></li>
				<li><a href="5-CeoT3.jsp">Tenant Data</a></li>
				<li><a href="EmployeeDetails">Worker Data</a></li>
				<li><a href="5-CeoT1.jsp">Profit/Expenses</a></li>
			</ul>
		</div>

		<div>
			<img src="ShowPhoto" onclick="openProfile()" 
			     style="border-radius:50%; width:52px; height:52px; cursor:pointer; border:2px solid #fff; object-fit:cover;">
		</div>
	</nav>
</header>

<!-- MAIN CONTENT -->
<main class="p-4">

  <div class="text-center mt-4" style="margin-bottom:2rem;">
    <h3>Tenant Data Management</h3>
    <p class="text-muted" style="font-size:20px;">View and manage details of all tenants in your buildings.</p>
  </div>

  <!-- SEARCH -->
  <div class="input-group mb-3">
    <input type="text" id="searchInput" class="form-control" placeholder="Search Tenant by Name, Room, or Building...">
    <button class="btn btn-primary" onclick="searchTenant()">Search</button>
  </div>

  <!-- TABLE -->
  <div class="card p-3">
    <table class="table table-hover align-middle" id="tenantTable">
      <thead>
        <tr>
          <th>#</th>
          <th>Name</th>
          <th>Room No.</th>
          <th>Building</th>
          <th>Contact</th>
          <th>Rent (₹)</th>
          <th>Status</th>
          <th>Action</th>
        </tr>
      </thead>

      <tbody>
        <!-- SAMPLE DATA (Replace with dynamic if needed) -->
        <tr>
          <td>1</td>
          <td>Sourabh Koli</td>
          <td>202</td>
          <td>Tower A</td>
          <td>9876543210</td>
          <td>₹7,000</td>
          <td><span class="badge bg-success">Paid</span></td>
          <td>
            <button class="btn btn-sm btn-info"><i class="fas fa-eye"></i></button>
            <button class="btn btn-sm btn-warning"><i class="fas fa-edit"></i></button>
            <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
          </td>
        </tr>

        <tr>
          <td>2</td>
          <td>Riya Mehta</td>
          <td>305</td>
          <td>Tower B</td>
          <td>9865321074</td>
          <td>₹8,500</td>
          <td><span class="badge bg-danger">Pending</span></td>
          <td>
            <button class="btn btn-sm btn-info"><i class="fas fa-eye"></i></button>
            <button class="btn btn-sm btn-warning"><i class="fas fa-edit"></i></button>
            <button class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
          </td>
        </tr>

      </tbody>
    </table>
  </div>

</main>

<!-- SIDEBAR -->
<div id="profileSidebar">
    <h3>Profile</h3>
    <hr>

<% if(emp == null) { %>

    <h4 style="color:red;">Session expired!</h4>
    <p>Please <a href="1-Index.jsp">login again</a>.</p>

<% } else { %>

    <div style="text-align:center;">
        <img src="ShowPhoto" width="110" height="110"
             style="border-radius:50%; object-fit:cover; border:3px solid purple;">
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
        <button style="width:100%; padding:12px; background:purple; 
        color:white; border:none; border-radius:6px;">Logout</button>
    </form>

<% } %>

    <button onclick="closeProfile()" style="width:100%; padding:12px; background:#ddd; border:none; border-radius:6px; margin-top:10px;">Close</button>
</div>

<!-- FOOTER -->
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
<li>📍 Address: “SVVV University, Indore, MP”</li>
<li>📧 Email: support@myproject.com</li>
<li>☎ Phone: +91-9893877520</li>
</ul>
</div>

<div class="div">
<h2>Social Media</h2>
<ul>
<li><a href="#"><i class="fab fa-facebook"></i> Facebook</a></li>
<li><a href="#"><i class="fab fa-instagram"></i> Instagram</a></li>
<li><a href="#"><i class="fab fa-github"></i> GitHub</a></li>
</ul>
</div>
</div>

<h2 style="text-align:center;">e-BuildingCare © 2025 | All rights are reserved.</h2>
</footer>

<!-- SEARCH + SIDEBAR SCRIPT -->
<script>
function openProfile() {
  document.getElementById("profileSidebar").style.right = "0";
}

function closeProfile() {
  document.getElementById("profileSidebar").style.right = "-350px";
}

function searchTenant() {
  let input = document.getElementById("searchInput").value.toLowerCase();
  let rows = document.querySelectorAll("#tenantTable tbody tr");

  rows.forEach(row => {
    let text = row.innerText.toLowerCase();
    row.style.display = text.includes(input) ? "" : "none";
  });
}
</script>

</body>
</html>
