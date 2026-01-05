<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>e-BuildingCare : The Building Management System</title>
<link rel="icon" type="image/png" href="image/logo.png">
<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<style>
*{
    margin:0; padding:0; box-sizing:border-box; font-family:'Poppins', sans-serif;
}
:root{
    --primary:#6a0dad; --light:#ffffff;  --dark:#111; --gray:#777;
}
/* Smooth Page Load Animation */
body {
    animation: fadePage 1s ease;
}
@keyframes fadePage {
    from { opacity: 0; }
    to { opacity: 1; }
}
/* HEADER */
header{
    background:var(--primary); padding:15px 40px; color:var(--light); box-shadow:0 2px 10px rgba(0,0,0,0.1);  position:sticky; top:0; z-index:50; animation: slideDown 0.8s ease-out;
}
@keyframes slideDown {
    from { transform: translateY(-80px); }
    to { transform: translateY(0); }
}
nav{
    display:flex;  justify-content:space-between;  align-items:center;
}
nav ul{
    display:flex; gap:40px;
}
nav li{
    list-style:none; font-size:24px; font-weight: 600;
}
nav a{
    color:white;  text-decoration:none;  transition:0.3s; font-weight: 600;
}
nav a:hover{
    color:#ffd700;  transform:scale(1.1);
}
/* BUTTON ANIMATION */
#signUp{
    background:white;  color:var(--primary);  padding:8px 20px;  border:none;  border-radius:8px;  font-weight:600;  cursor:pointer;  transition:0.4s ease;
}
#signUp:hover{
    background:#ffd700;  transform:scale(1.08);
}
/* HERO SECTION */
.hero{
    position:relative; width:100%; height:450px;  background:url('image/background.png') center/cover no-repeat;  border-radius:12px;  margin:20px 0 30px 0;  overflow:hidden;  animation: fadeHero 1.5s ease-out;
}
@keyframes fadeHero {
    from { opacity: 0; transform: scale(1.07); }
    to { opacity: 1; transform: scale(1); }
}
.hero::after{
    content:"";  position:absolute;  top:0;  left:0;  right:0;  bottom:0;  background:rgba(0,0,0,0.45);
}
.hero-text{
    position:absolute;  top:50%;  left:50%;  transform:translate(-50%, -50%);  color:white;  text-align:center;  z-index:10;  animation: fadeUp 1.2s ease-out;
}
@keyframes fadeUp {
    from { opacity:0; transform:translate(-50%, -40%); }
    to { opacity:1; transform:translate(-50%, -50%); }
}
.hero-text h1{
    font-size:42px;
    font-weight:700;
    margin-bottom:10px;
}
.hero-text p{
    font-size:20px;
}
/* FILTER BOX */
.filter-box{
    background:var(--primary);  color:white;  padding:40px 30px;  border-radius:12px;  margin-bottom:40px;  text-align:center;  box-shadow:0 3px 8px rgba(0,0,0,0.2);    animation: popUp 1.1s ease-out;
}
@keyframes popUp {
    from { opacity:0; transform:scale(0.8); }
    to { opacity:1; transform:scale(1); }
}
.filter-box select{
    width:300px;   height:50px;   font-size:18px;   border-radius:10px;   border:none;   padding:10px;  margin-top:15px;  color:var(--primary);  transition:0.3s;
}
.filter-box select:hover {
    transform:scale(1.05);
}
.filter-box button{  
    margin-left:10px; padding:12px 25px; font-size:18px; color:var(--primary); background:white; border:none;  border-radius:10px;  cursor:pointer;  font-weight:600;  transition:0.4s ease;
}
.filter-box button:hover{
    background:#ffd700;  transform:scale(1.1);
}
/* ROOM SECTION */
.rooms{
    background:white;  padding:30px;  margin-bottom:40px;  border-radius:12px;  box-shadow:0 3px 10px rgba(0,0,0,0.1);  transition:0.4s ease-out;  opacity:0;   transform:translateY(50px);   animation: roomFade 1s forwards;
}
@keyframes roomFade {
    to {
        opacity:1;
        transform:translateY(0);
    }
}
.rooms:hover{
    transform:translateY(-6px);  box-shadow:0 6px 18px rgba(0,0,0,0.25);
}
.rooms h1{
    text-align:center;  margin-bottom:20px;  font-size:30px;  font-weight:600;
}
.rooms img{
    width:350px;  height:220px;  border-radius:12px;  transition:0.4s;  object-fit:cover;  animation: zoomIn 0.8s ease-out;
}
.rooms img:hover{
    transform:scale(1.08);
}
@keyframes zoomIn {
    from { opacity:0; transform:scale(0.8); }
    to { opacity:1; transform:scale(1); }
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
<header>
	<nav>
		<div>
			<img alt="Logo" src="image/logo.png" width="50px" style="vertical-align:middle;">
			<h1 style="display:inline; margin-left:10px;">e-BuildingCare</h1>
		</div>
		<ul class="d-flex gap-5 list-unstyled m-0 fs-4">
			<li><a href="1-Index.jsp">Home</a></li>
			<li><a href="2-About.jsp">About Us</a></li>
			<li><a href="3-Contact.jsp">Contact Us</a></li>
		</ul>
		<button id="signUp" onclick="window.location.href='4-Login.jsp' ">Sign In</button>
	</nav>
</header>
<main>
<!-- HERO SECTION -->
<div class="hero">
	<div class="hero-text">
		<h1>Find Your Perfect Home</h1>
		<p>Rooms | Flats | Affordable | Comfortable | Safe</p>
	</div>
</div>
<!-- FILTER -->
<div class="filter-box">
	<h1>Find Your Next Stay</h1>
	<p>Search low prices on fully furnished and non-furnished rooms.</p>
	<select id="roomFilter">
		<option value="">-- Select Room Type --</option>
		<option value="rk1">1 RK</option>
		<option value="bhk1">1 BHK</option>
		<option value="bhk2">2 BHK</option>
		<option value="bhk3">3 BHK</option>
	</select>
	<button onclick="filterRooms()">Search</button>
</div>
<!-- ROOM CATEGORIES -->
<div class="rooms" data-room="rk1">
	<h1>1 RK</h1>
	<div style="display:flex; justify-content:center; gap:20px; flex-wrap:wrap;">
		<img src="image/1bhk1.webp">
		<img src="image/1bhk2.webp">
		<img src="image/1bhk3.jpeg">
	</div>
</div>
<div class="rooms" data-room="bhk1">
	<h1>1 BHK</h1>
	<div style="display:flex; justify-content:center; gap:20px; flex-wrap:wrap;">
		<img src="image/1bhk1.webp">
		<img src="image/1bhk2.webp">
		<img src="image/1bhk3.jpeg">
	</div>
</div>
<div class="rooms" data-room="bhk2">
	<h1>2 BHK</h1>
	<div style="display:flex; justify-content:center; gap:20px; flex-wrap:wrap;">
		<img src="image/2bhk1.webp">
		<img src="image/2bhk2.webp">
		<img src="image/2bhk3.webp">
	</div>
</div>
<div class="rooms" data-room="bhk3">
	<h1>3 BHK</h1>
	<div style="display:flex; justify-content:center; gap:20px; flex-wrap:wrap;">
		<img src="image/3bhk1.webp">
		<img src="image/3bhk2.jpeg">
		<img src="image/3bhk3.jpeg">
	</div>
</div>
</main>
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
<script>
function filterRooms() {
  let filterValue = document.getElementById("roomFilter").value;
  let rooms = document.querySelectorAll(".rooms");

  rooms.forEach(room => {
    room.style.display = (filterValue === "" || room.dataset.room === filterValue)
      ? "block"
      : "none";
  });
}
</script>
</body>
</html>