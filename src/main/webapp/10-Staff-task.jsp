<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Staff Dashboard - Tasks</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f4f4;
        }

        /* Top Navbar */
        .top-nav {
            background: #8b008b;
            color: white;
            padding: 15px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .top-nav .links a {
            margin-right: 40px;
            color: white;
            text-decoration: none;
            font-size: 25px;
        }

        

	main{
width:100%;
height:70vh;
display:flex;
}
        /* Sidebar */
        .sidebar {
            width: 230px;
            background: #0d1b2a;
            padding-top: 50px;
            color: white;
        }

        .sidebar h2 {
            margin-left: 20px;
            margin-bottom: 30px;
        }

        .sidebar a {
            display: block;
            padding: 12px 20px;
            color: white;
            text-decoration: none;
            margin-bottom: 5px;
            font-size: 16px;
        }

        .sidebar a:hover {
            background: #1b263b;
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
        	width:90%;
            padding: 40px;
        }
        .tab {
            background: white;
            padding: 25px;
            border-radius: 8px;
            margin-bottom:2rem;
            box-shadow: 0px 0px 10px #d0d0d0;
        }

        .main-content h1 {
            margin-top: 0;
            color: #1e3d59;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        table, td, th {
            border: 1px solid #999;
        }

        th {
            background: #1e3d59;
            color: white;
            padding: 10px;
        }

        td {
            padding: 10px;
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

<!-- Top Navigation -->
<div class="top-nav">
    <div style="display:flex; align-items:center;">
        <img src="image/logo.png" width="50" height="50" style="border-radius:5px; margin-right:8px;">
        <h2>e-BuildingCare</h2>
    </div>

    <div>
			<img src="image/profile.webp" style="border-radius:100%;width:50px;">
		</div>
</div>
<main>
<!-- Sidebar -->
<div class="sidebar">
    <h2>Staff Dashboard</h2>

    <a href="10-Staff-Dashboard.jsp">🏠 Home</a>
    <a href="10-Staff-task.jsp">🛠 Tasks</a>
    <a href="10-Staff-notice.jsp">🔔 Notices</a>

    <button class="logout-btn">Logout</button>
</div>

<!-- Main Content -->
<div class="main-content">
    <div class="tab" style="display:block;">
            <h1>Welcome, Staff Member</h1>
            <p>This is your dashboard. You can view assigned tasks, check latest notices, and update your profile.</p>
        </div>

        <!-- TASKS TAB -->
        <div class="tab">
            <h1>Assigned Tasks</h1>
            <table>
                <tr>
                    <th>Task ID</th>
                    <th>Description</th>
                    <th>Deadline</th>
                    <th>Status</th>
                </tr>

                <tr>
                    <td>101</td>
                    <td>Clean Block A, Floor 2</td>
                    <td>2025-02-17</td>
                    <td>Pending</td>
                </tr>

                <tr>
                    <td>102</td>
                    <td>Electricity check in Block C</td>
                    <td>2025-02-18</td>
                    <td>In Progress</td>
                </tr>

                <tr>
                    <td>103</td>
                    <td>Plumbing repair Room 204</td>
                    <td>2025-02-20</td>
                    <td>Completed</td>
                </tr>
            </table>
        </div>
 </div>
</main>
<!-- Footer -->
<footer class="footer">
  <div style="display:flex; justify-content:space-around;">

    <div class="section">
      <h3>Quick Navigation</h3>
      <ul>
        <li><a href="ManagerDashboard.jsp">Home</a></li>
        <li><a href="about.jsp">About Us</a></li>
        <li><a href="contact.jsp">Contact Us</a></li>
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
        <li><a href="#"><i class="fab fa-facebook"></i> Facebook</a></li>
        <li><a href="#"><i class="fab fa-instagram"></i> Instagram</a></li>
        <li><a href="#"><i class="fab fa-github"></i> GitHub</a></li>
      </ul>
    </div>

  </div>
<div>
  <h3 style="text-align:center;">e-BuildingCare © 2025 | All rights reserved.</h3>
  </div>
  </footer>

</body>
</html>
