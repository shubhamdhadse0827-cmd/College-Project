<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.bms.dto.Employee1" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employees By Building</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

<style>
    body {
        font-family: Arial, sans-serif;
        background: #f2f4f7;
        padding: 20px;
    }

    .top-btn {
        width: 150px;
        padding: 10px;
        background: #007bff;
        color: white;
        text-decoration: none;
        border-radius: 6px;
        float: right;
        margin-right: 50px;
        font-weight: bold;
        text-align: center;
    }

    h1 {
        text-align: center;
        margin-bottom: 25px;
        color: #333;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        margin-top: 10px;
        color: #333;
    }

    table {
        width: 85%;
        margin: auto;
        border-collapse: collapse;
        background: white;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        margin-bottom: 20px;
    }

    th, td {
        padding: 12px;
        text-align: center;
    }

    th {
        background: #007bff;
        color: white;
    }

    tr:nth-child(even) {
        background: #f9f9f9;
    }

    tr:hover {
        background: #eaf3ff;
        cursor: pointer;
    }

    .photo {
        width: 60px;
        height: 60px;
        border-radius: 50%;
    }

    .swiper {
        width: 90%;
        margin: 40px auto;
        padding-bottom: 50px;
    }

    .swiper-slide {
        background: white;
        border-radius: 15px;
        padding: 20px;
        box-shadow: 0 3px 10px rgba(0,0,0,0.13);
    }
</style>
</head>
<body>

<a href="5-Admin-Dashboard.jsp" class="top-btn">Go To Dashboard</a>

<h1>Employees According to Building</h1>

<%
ArrayList<Employee1> list = (ArrayList<Employee1>) request.getAttribute("LIST");

// Building wise grouping
Map<String, List<Employee1>> buildingMap = new LinkedHashMap<>();

if(list != null){
    for(Employee1 e : list){

        // ADMIN ko hide agar grouping se bhi hata na ho to
        if("admin".equalsIgnoreCase(e.getRole())) continue;

        String building = e.getBuilding() == null ? "No Building" : e.getBuilding();
        buildingMap.putIfAbsent(building, new ArrayList<>());
        buildingMap.get(building).add(e);
    }
}
%>

<div class="swiper mySwiper">
    <div class="swiper-wrapper">

        <%
        boolean anySlide = false;

        if(!buildingMap.isEmpty()){
            for(Map.Entry<String,List<Employee1>> entry : buildingMap.entrySet()) {

                List<Employee1> employees = entry.getValue();

                // Agar is building me koi employee hi nahi (admin skip ke baad)
                if(employees.isEmpty()) continue;

                anySlide = true;

                String building = entry.getKey();
        %>

        <div class="swiper-slide">

            <h2><%= building %></h2>

            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Contact</th>
                    <th>Role</th>
                    <th>Photo</th>
                    <th>Created At</th>
                </tr>

                <% 
                for(Employee1 e : employees) { 
                %>

                <tr>
                    <td>EM00<%= e.getE_id() %></td>
                    <td><%= e.getName() %></td>
                    <td><%= e.getEmail() %></td>
                    <td><%= e.getContact_no() %></td>
                    <td><%= e.getRole() %></td>

                    <td>
                    <%
                        byte[] img = e.getPhoto();
                        if(img != null){
                            String base64 = Base64.getEncoder().encodeToString(img);
                    %>
                        <img src="data:image/jpeg;base64,<%= base64 %>" class="photo">
                    <% } else { %>
                        No Photo
                    <% } %>
                    </td>

                    <td><%= e.getCreated_at() %></td>
                </tr>

                <% } %>

            </table>

        </div>

        <% 
            }
        }

        if(!anySlide){
        %>

        <div class="swiper-slide">
            <h2 style="color:red;">No Employees Found</h2>
        </div>

        <% } %>

    </div>

    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
    <div class="swiper-pagination"></div>
</div>

<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<script>
var swiper = new Swiper(".mySwiper", {
    loop: false,
    pagination: {
        el: ".swiper-pagination",
        clickable: true,
    },
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
    },
});
</script>

</body>
</html>
