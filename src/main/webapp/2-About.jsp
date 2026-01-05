<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us - e-BuildingCare</title>

<link rel="icon" type="image/png" href="image/about.jpg">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
:root{
    --primary:#6a0dad;
    --text-dark:#222;
    --text-light:#555;
    --bg:#f7f4fc;
}

/* Base */
body{
    background:var(--bg);
    font-family: 'Segoe UI', sans-serif;
    color:var(--text-dark);
}

/* Header */
header{
    background:var(--primary);
    padding:14px 40px;
    color:white;
}

nav{
    display:flex;  
    justify-content:space-between;  
    align-items:center;
}

nav ul{
    display:flex;
    gap:70px; /* spacing between Home / About / Contact */
}

nav li{
    list-style:none;
}

nav a{
    color:white;
    text-decoration:none;
    font-size:24px;
    font-weight:600;
    transition:0.3s;
}

nav a:hover{
    color:#ffd700;
}

/* About Section */
.about-box{
    background:white;
    padding:40px;
    border-radius:12px;
    margin-top:35px;
    border:1px solid #e4e4e4;
}

.about-box h2{
    color:var(--primary);
    font-weight:600;
    margin-top:25px;
}

/* Team Cards */
.team-section{
    margin-top:50px;
}

.profile{
    width:300px;
    padding:25px;
    background:white;
    border-radius:12px;
    border:1px solid #ddd;
    text-align:center;
    transition:0.3s;
}

.profile:hover{
    transform:translateY(-5px);
    box-shadow:0 8px 20px rgba(0,0,0,0.12);
}

.profile img{
    width:120px;
    height:120px;
    border-radius:50%;
    object-fit:cover;
}

/* Footer */
footer{
    background:#111;
    color:#bbb;
    padding:40px 25px;
    margin-top:40px;
}

footer h2{
    color:white;
    font-size:22px;
}

footer a{
    color:#bbb;
    text-decoration:none;
}

footer a:hover{
    color:white;
}

footer ul{
    list-style:square;
    padding-left:20px;
}
</style>
</head>

<body>

<!-- HEADER -->
<header>
    <nav>
        <div class="d-flex align-items-center">
            <img src="image/logo.png" width="50" height="50" class="me-2">
            <h2 class="m-0">e-BuildingCare</h2>
        </div>

        <ul class="m-0">
            <li><a href="1-Index.jsp">Home</a></li>
            <li><a href="2-About.jsp">About Us</a></li>
            <li><a href="3-Contact.jsp">Contact Us</a></li>
        </ul>
    </nav>
</header>

<!-- CONTENT -->
<main class="container">

<div class="about-box">

    <h2>Who We Are</h2>
    <p>
        e-BuildingCare is a modern Building & Apartment Management System designed to automate 
        daily building operations and improve communication between residents, staff, and administrators.
    </p>

    <h2>What We Do</h2>
    <p>
        Our platform handles tenant records, complaints, payments, utility bills, staff management, 
        building notices, and overall digital record-keeping—making building management simple and transparent.
    </p>

    <h2>Our Vision</h2>
    <p>
        To build a smart digital ecosystem that brings automation, transparency, and convenience to 
        residential and commercial buildings.
    </p>

    <h2>Our Mission</h2>
    <p>
        To provide a reliable platform that improves coordination, reduces manual work, 
        and enhances the living experience of residents.
    </p>

    <h2>Technologies We Use</h2>
    <p>JSP, Servlets, JDBC, MySQL, HTML, CSS, Bootstrap, JavaScript</p>

</div>

<!-- TEAM SECTION -->
<h2 class="mt-5 text-center" style="color:var(--primary);">Our Team</h2>

<div class="team-section d-flex justify-content-center flex-wrap gap-4">

    <div class="profile">
        <img src="image/profile.webp">
        <h5 class="mt-3 mb-1">Sourabh Koli</h5>
        <p class="text-muted m-0">Frontend Developer</p>
    </div>

    <div class="profile">
        <img src="image/profile.webp">
        <h5 class="mt-3 mb-1">Shubham Dhadse</h5>
        <p class="text-muted m-0">Backend Developer</p>
    </div>

    <div class="profile">
        <img src="image/profile.webp">
        <h5 class="mt-3 mb-1">Vishal Singh</h5>
        <p class="text-muted m-0">Database Designer</p>
    </div>

</div>

</main>

<!-- FOOTER -->
<footer>
    <div class="d-flex justify-content-around flex-wrap">

        <div>
            <h2>Quick Navigation</h2>
            <ul>
                <li><a href="1-Index.jsp">Home</a></li>
                <li><a href="2-About.jsp">About</a></li>
                <li><a href="3-Contact.jsp">Contact</a></li>
            </ul>
        </div>

        <div>
            <h2>Contact</h2>
            <ul>
                <li>📍 SVVV University, Indore</li>
                <li>📧 support@myproject.com</li>
                <li>☎ +91 9893877520</li>
            </ul>
        </div>

        <div>
            <h2>Social</h2>
            <ul>
                <li><a href="#"><i class="fab fa-facebook"></i> Facebook</a></li>
                <li><a href="#"><i class="fab fa-instagram"></i> Instagram</a></li>
                <li><a href="#"><i class="fab fa-github"></i> GitHub</a></li>
            </ul>
        </div>

    </div>

    <h2 class="text-center mt-4">e-BuildingCare © 2025 | All Rights Reserved</h2>
</footer>

</body>
</html>
