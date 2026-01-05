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
<title>Manager Dashboard - Home</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

/* -------------------- Top Navbar -------------------- */
header {
  background-color: #800080;
  padding: 15px;
  color: white;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
header ul {
  display: flex;
  list-style: none;
}
header ul li {
  margin: 0 20px;
  font-size: 25px;
}
header a { color: white; text-decoration: none; }

main{
width:100%;
height:140vh;
display:flex;
}

/* -------------------- Sidebar -------------------- */
.sidebar {
  width: 230px;
  background: #1f2a44;
  color: white;
  position: relative;
  padding-top: 50px;
}
.sidebar a {
  color: white;
  padding: 15px 20px;
  display: block;
  font-size: 18px;
  text-decoration: none;
}
.sidebar a:hover {
  background: #44506f;
}
.sidebar i { margin-right: 10px; }

.logout-btn {
  background: white;
  color: #444;
  border: none;
  padding: 8px 14px;
  border-radius: 6px;
  margin-left: 20px;
  margin-top: 20px;
}

/* -------------------- Main Content -------------------- */
.content {
  width:100%;
  padding: 30px;
}

 .content h3 {
            margin-bottom: 10px;
            color: #333;
        }

        .report-box {
            background: #fff;
            padding: 20px;
            border-radius: 6px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 12px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }

        th {
            background: #0a3558;
            color: #fff;
        }

        tr:nth-child(even){
            background: #f2f2f2;
        }

        .status-complete {
            color: #5cb85c;
            font-weight: bold;
        }
        .status-pending {
            color: #d9534f;
            font-weight: bold;
        }
        .status-progress {
            color: #f0ad4e;
            font-weight: bold;
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


</style>
</head>

<body>

<!-- ==================== TOP NAV ==================== -->
<header>
    <div style="display:flex; align-items:center;">
        <img src="image/logo.png" width="50" height="50" style="border-radius:5px; margin-right:8px;">
        <h2>e-BuildingCare</h2>
    </div>

    <!-- Profile Image -->
        <img src="ShowPhoto"
             onclick="openProfile()"
             width="52" height="52"
             style="cursor:pointer; border-radius:50%; object-fit:cover; border:2px solid #fff;">
</header>
<main>
<!-- ==================== SIDEBAR ==================== -->
<div class="sidebar">
    <h3 style="padding-left:20px;">Manager Dashboard</h3>

    <a href="6-Manager-Dashboard.jsp"><i class="fa-solid fa-house"></i> Home</a>
    <a href="ManagerEmployeeDetails"><i class="fa-solid fa-users"></i> Staff Data</a>
    <a href="6-Manager-taskRequests.jsp"><i class="fa-solid fa-list-check"></i> Task Requests</a>
    <a href="6-Manager-maintenance.jsp"><i class="fa-solid fa-screwdriver-wrench"></i> Maintenance</a>
    <a href="6-Manager-Reports.jsp"><i class="fa-solid fa-chart-simple"></i> Reports</a>

</div>

<!-- ==================== MAIN CONTENT ==================== -->
<div class="content">
 <!-- Attendance Report -->
    <div class="report-box">
        <h3>Attendance Report</h3>

        <table>
            <tr>
                <th>Employee ID</th>
                <th>Name</th>
                <th>Present Days</th>
                <th>Absent Days</th>
                <th>Month</th>
            </tr>

            <tr>
                <td>E101</td>
                <td>Rohan Sharma</td>
                <td>21</td>
                <td>1</td>
                <td>November</td>
            </tr>

            <tr>
                <td>E102</td>
                <td>Aditi Singh</td>
                <td>20</td>
                <td>2</td>
                <td>November</td>
            </tr>

            <tr>
                <td>E103</td>
                <td>Vikas Patel</td>
                <td>22</td>
                <td>0</td>
                <td>November</td>
            </tr>

            <tr>
                <td>E104</td>
                <td>Deepak Yadav</td>
                <td>19</td>
                <td>3</td>
                <td>November</td>
            </tr>
        </table>
    </div>

    <!-- Task Completion Report -->
    <div class="report-box">
        <h3>Task Completion Report</h3>

        <table>
            <tr>
                <th>Task ID</th>
                <th>Employee Name</th>
                <th>Task Title</th>
                <th>Submission Date</th>
                <th>Status</th>
            </tr>

            <tr>
                <td>T001</td>
                <td>Rohan Sharma</td>
                <td>Client Data Update</td>
                <td>05-Nov-2025</td>
                <td class="status-complete">Completed</td>
            </tr>

            <tr>
                <td>T002</td>
                <td>Aditi Singh</td>
                <td>Daily Report Filing</td>
                <td>05-Nov-2025</td>
                <td class="status-progress">In Progress</td>
            </tr>

            <tr>
                <td>T003</td>
                <td>Vikas Patel</td>
                <td>Inventory Check</td>
                <td>04-Nov-2025</td>
                <td class="status-complete">Completed</td>
            </tr>

            <tr>
                <td>T004</td>
                <td>Deepak Yadav</td>
                <td>System Maintenance</td>
                <td>-</td>
                <td class="status-pending">Pending</td>
            </tr>
        </table>
    </div>

    <!-- Maintenance Report -->
    <div class="report-box">
        <h3>Maintenance Report</h3>

        <table>
            <tr>
                <th>Request ID</th>
                <th>Issue Type</th>
                <th>Requested By</th>
                <th>Date</th>
                <th>Status</th>
            </tr>

            <tr>
                <td>M001</td>
                <td>Electrical</td>
                <td>Rohan Sharma</td>
                <td>03-Nov-2025</td>
                <td class="status-pending">Pending</td>
            </tr>

            <tr>
                <td>M002</td>
                <td>Cleaning</td>
                <td>Aditi Singh</td>
                <td>01-Nov-2025</td>
                <td class="status-complete">Completed</td>
            </tr>

            <tr>
                <td>M003</td>
                <td>Hardware</td>
                <td>Vikas Patel</td>
                <td>02-Nov-2025</td>
                <td class="status-progress">In Progress</td>
            </tr>

        </table>
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

<script>
<!-- PROFILE TOGGLE -->
function openProfile() {
    document.getElementById("profileSidebar").style.right = "0";
}
function closeProfile() {
    document.getElementById("profileSidebar").style.right = "-350px";
}
</script>

<!-- ==================== FOOTER ==================== -->
<footer>
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
