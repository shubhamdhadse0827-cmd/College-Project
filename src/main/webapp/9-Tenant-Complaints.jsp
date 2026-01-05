<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bms.dto.Tenant" %>
<%@ page import ="com.bms.dto.Complaint" %>
<%@ page import ="com.bms.model.ComplaintModel" %>
<%@ page import="java.util.List, java.util.ArrayList" %>


<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    Tenant tn = (Tenant) session.getAttribute("LOGGED_TENANT");

    if (tn == null) {
        response.sendRedirect("4-Login.jsp");
        return;
    }

    // FIXED → No argument constructor
    ComplaintModel model = new ComplaintModel();
    List<Complaint> list = model.getComplaintsByTenant(tn.getE_id());
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tenant Dashboard - Home</title>

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
        .main-content h2 {
            color: #2c3e50;
            margin-bottom: 10px;
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
    <h2>Submit New Complaint</h2>

    <div class="box">

        <!-- ➤ FORM START -->
        <form action="AddComplaints" method="post">

            <input type="hidden" name="tenant_id" value="<%= tn.getE_id()%>">
            <input type="hidden" name="tenant_name" value="<%=tn.getName()%>">

            <label>Issue Category:</label><br>
            <select name="category" style="width: 100%; padding: 10px; margin-top: 5px; margin-bottom: 15px;">
                <option value="Water Issue">Water Issue</option>
                <option value="Electricity Issue">Electricity Issue</option>
                <option value="Cleaning">Cleaning</option>
                <option value="Security Issue">Security Issue</option>
            </select>

            <label>Description:</label><br>
            <textarea name="description" rows="4"
                      style="width: 100%; padding: 10px; margin-top: 5px; margin-bottom: 15px;"></textarea>

            <button type="submit"
                    style="padding: 12px 25px; background:#8b008b; color:white; border:none; border-radius:6px;">
                Submit Complaint
            </button>
        </form>
        <!-- ➤ FORM END -->

    </div>

    <br><br>

    <h2>My Complaints / Requests</h2>

    <div class="box">
        <table>
            <tr>
                <th>Complaint ID</th>
                <th>Issue</th>
                <th>Status</th>
                <th>Date</th>
            </tr>

            <% 
            if (list.size() == 0) { 
            %>
                <tr>
                    <td colspan="4" style="text-align:center; padding:20px;">No complaints submitted yet.</td>
                </tr>
            <%
            } else { 
                for (Complaint c : list) {
            %>
                <tr>
                    <td>CMP00<%= c.getC_id() %></td>
                    <td><%= c.getCategory() %></td>
                    <td><%= c.getStatus() %></td>
                    <td><%= c.getCreated_at() %></td>
                </tr>
            <% 
                } 
            }
            %>
            </table>
  
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

  <h3 style="text-align:center;">e-BuildingCare © 2025 | All rights reserved.</h3>
</footer>

</body>
</html>
