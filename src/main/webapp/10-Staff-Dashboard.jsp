<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Staff Dashboard - Home</title>

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
            display:flex;
        }
        .mainDiv{
        width:50%;
        margin:0 1rem;
        }

        .box {
            background: white;
            padding: 20px;
            border-radius: 6px;
            box-shadow: 0px 2px 6px rgba(0,0,0,0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        table, th, td {
            border: 1px solid #bfbfbf;
        }

        th, td {
            padding: 10px;
        }

        th {
            background: #0d1b2a;
            color:white;
        }
        
        .profile{
        padding: 2rem;
    padding-left: 8rem;
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

        <a href="10-Staff-Dashboard.jsp">Home</a>
        <a href="10-Staff-task.jsp">Tasks</a>
        <a href="10-Staff-notice.jsp">Notices</a>

    <button class="logout-btn">Logout</button>
</div>

<!-- Main Content -->
<div class="main-content">
    <div class="mainDiv">
  <h2>My Profile</h2>

            <table>
                <tr>
                <th>Field</th><th>Details</th></tr>
                <tr><td>Name</td><td>Rahul Sharma</td></tr>
                <tr><td>Staff Id</td><td>STF-009</td></tr>
                <tr><td>Contact</td><td>9876543210</td></tr>
                <tr><td>Email</td><td>john@example.com</td></tr>
                <tr><td>Role</td><td>rahul.staff@example.com</td></tr>
            </table>
            </div>
            <div class="profile">
            <img alt="My image" src="image/profile.webp" width="290px">
            <h2 style="text-align:center;">Rahul Sharma</h2>
          </div>        
 </div>
</main>
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
