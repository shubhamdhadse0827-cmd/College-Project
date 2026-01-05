<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bms.dto.Tenant" %>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
    response.setHeader("Pragma", "no-cache"); 
    response.setDateHeader("Expires", 0);

    Tenant tn = (Tenant) session.getAttribute("LOGGED_TENANT");

    if (tn == null) {
        response.sendRedirect("4-Login.jsp");
        return;
    }

    // ⭐ TOTAL AMOUNT CALCULATION ⭐
    double total = tn.getRent() + tn.getEb();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tenant Dashboard - Home</title>

    <style>
        body { margin:0; font-family:Arial; background:#f4f4f4; }

        .top-nav {
            background:#8b008b; color:white; padding:15px 40px;
            display:flex; justify-content:space-between; align-items:center;
        }

        main { width:100%; height:70vh; display:flex; }

        .sidebar {
            width:230px; background:#0d1b2a; padding-top:50px; color:white;
        }

        .sidebar a { display:block; padding:12px 20px; color:white; text-decoration:none; }
        .sidebar a:hover { background:#1b263b; }

        .main-content { width:90%; padding:40px; display:flex; }
        .mainDiv { width:50%; margin:0 1rem; }

        table { width:100%; border-collapse:collapse; margin-top:15px; }
        table, th, td { border:1px solid #bfbfbf; }
        th { background:#0d1b2a; color:white; padding:10px; }
        td { padding:10px; }

        .profile { padding:2rem; padding-left:8rem; }

        /* Profile Sidebar */
        #profileSidebar {
            position:fixed; top:0; right:-350px; width:320px; height:100%;
            background:white; box-shadow:-3px 0 10px rgba(0,0,0,0.25);
            transition:right .4s ease; padding:25px; z-index:9999;
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
<div class="top-nav">
    <div style="display:flex; align-items:center;">
        <img src="image/logo.png" width="50" height="50" style="border-radius:5px; margin-right:8px;">
        <h2>e-BuildingCare</h2>
    </div>

    <div>
        <img src="ShowTenantPhoto"
             onclick="openProfile()"
             width="52" height="52"
             style="cursor:pointer; border-radius:50%; object-fit:cover; border:2px solid #fff;">
    </div>
</div>

<main>

<!-- Sidebar -->
<div class="sidebar">
    <h2>Tenant Dashboard</h2>
    <a href="9-Tenant-Dashboard.jsp">🏠 Home</a>
    <a href="9-Tenant-Complaints.jsp">🛠 Complaints</a>
</div>

<!-- Main Content -->
<div class="main-content">

    <div class="mainDiv">
        <h2>My Profile</h2>

<table>
    <tr><th>Field</th><th>Details</th></tr>
    <tr><td>Name</td><td><%=tn.getName() %></td></tr>
    <tr><td>Email ID</td><td><%=tn.getEmail() %></td></tr>
    <tr><td>Contact No.</td><td><%=tn.getContact_no() %></td></tr>
    <tr><td>Building</td><td><%=tn.getBuilding() %></td></tr>
    <tr><td>Flat No.</td><td><%=tn.getFlat_no() %></td></tr>
    <tr><td>Stay Duration</td><td>1 Year</td></tr>
    <tr><td>Rent Amount</td><td>₹ <%=tn.getRent() %></td></tr>
    <tr><td>Electricity Bill</td><td>₹ <%=tn.getEb() %></td></tr>

    <!-- ⭐ FINAL TOTAL AMOUNT ⭐ -->
    <tr>
        <td><b>Total Amount</b></td>
        <td style="color:green; font-weight:bold;">₹ <%= total %></td>
    </tr>

    <!-- ⭐ PAY NOW BUTTON BELOW TOTAL ⭐ -->
    <tr>
        <td colspan="2" style="text-align:center; padding:15px;">
            <form action="9-Tenant-DummyPe.jsp" method="post">
                <input type="hidden" name="amount" value="<%= total %>">
                <button style="padding:12px 25px; background:#8b008b; color:white; border:none; border-radius:6px; cursor:pointer;">
                    Pay Now
                </button>
            </form>
        </td>
    </tr>
</table>

    </div>
    
    <div class="profile">
        <img alt="My image" src="ShowTenantPhoto" width="290px">
        <h2 style="text-align:center;"><%=tn.getName() %></h2>
    </div>

</div>
</main>

<!-- PROFILE SIDEBAR -->
<div id="profileSidebar">
    <h3 style="text-align:center;">Profile</h3>
    <hr>

    <div style="text-align:center;">
        <img src="<%= request.getContextPath() %>/ShowTenantPhoto" width="110" height="110"
             style="border-radius:50%; object-fit:cover; border:3px solid #800080;">
    </div>

    <br>
    <p><b>Name:</b> <%= tn.getName() %></p>
    <p><b>Email:</b> <%= tn.getEmail() %></p>
    <p><b>Role:</b> <%= tn.getRole() %></p>
    <p><b>Contact No:</b> <%= tn.getContact_no() %></p>
    <p><b>Aadhaar No:</b> <%= tn.getAadhaar_no() %></p>
    <p><b>Building:</b> <%= tn.getBuilding() %></p>
    <p><b>Flat No:</b> <%= tn.getFlat_no() %></p>

    <br>
    <form action="LogoutCtrl" method="post">
        <button style=" width:100%; padding:12px; background:#800080; color:white; border:none; border-radius:6px; ">
            Logout
        </button>
    </form>

    <button onclick="closeProfile()" style=" width:100%; padding:12px; background:#ddd; border:none; margin-top:10px;">
        Close
    </button>
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
