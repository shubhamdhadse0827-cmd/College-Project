<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.bms.dto.Tenant" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tenants by Building</title>

<!-- Swiper Slider CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

<style>
    body {
        font-family: Arial, sans-serif;
        background: #f2f4f7;
        padding: 20px;
    }
    
    .top-bar {
        width: 95%;
        margin: auto;
        text-align: right;
        margin-bottom: 20px;
    }
    
    .dash-btn {
        background: #007bff;
        padding: 10px 18px;
        color: white;
        text-decoration: none;
        border-radius: 8px;
        font-weight: bold;
        box-shadow: 0px 3px 8px rgba(0,0,0,0.2);
    }
    
    h1 {
        text-align: center;
        margin-bottom: 25px;
        color: #333;
    }
    
    h2 {
        text-align: center;
        margin-bottom: 25px;
        color: #333;
    }
    
    h3 {
        margin-top: 25px;
        text-align: center;
    }
    table {
        width: 85%;
        margin: auto;
        border-collapse: collapse;
        background: white;
        box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
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

    /* Swiper styling */
    .swiper {
        width: 90%;
        margin: 40px auto;
        padding-bottom: 50px;
    }
    .swiper-slide {
        background: white;
        border-radius: 12px;
        padding: 20px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }
</style>

</head>
<body>
<div class="top-bar">
    <a href="5-Admin-Dashboard.jsp" class="dash-btn">⬅ Go to Dashboard</a>
</div>

<h1>Tenants According to Building</h1>

<%
ArrayList<Tenant> list = (ArrayList<Tenant>) request.getAttribute("LIST");

/* Group: Building → Flat Type → Tenants */
Map<String, Map<String, List<Tenant>>> buildingMap = new LinkedHashMap<>();

if(list != null){
    for(Tenant t : list){

        String full = t.getBuilding();   // Example: "Comfort Block (2BHK)"

        String building = full;
        String flatType = "Unknown";

        // Extract building name & flat type
        if(full.contains("(") && full.contains(")")){
            building = full.substring(0, full.indexOf("(")).trim();
            flatType = full.substring(full.indexOf("(")+1, full.indexOf(")")).trim();
        }

        buildingMap.putIfAbsent(building, new LinkedHashMap<>());
        buildingMap.get(building).putIfAbsent(flatType, new ArrayList<>());
        buildingMap.get(building).get(flatType).add(t);
    }
}
%>

<!-- Swiper Slider -->
<div class="swiper mySwiper">
    <div class="swiper-wrapper">

        <%
        if(buildingMap.isEmpty()){
        %>
            <div class="swiper-slide">
                <h3 style="color:red;">No Tenants Found</h3>
            </div>
        <% 
        } else {
            for(Map.Entry<String, Map<String, List<Tenant>>> bEntry : buildingMap.entrySet()) {
                String building = bEntry.getKey();
                Map<String, List<Tenant>> flatMap = bEntry.getValue();
        %>

        <div class="swiper-slide">

            <h2><%= building %></h2>

            <% for(Map.Entry<String, List<Tenant>> fEntry : flatMap.entrySet()) {
                
                String flatType = fEntry.getKey();
                List<Tenant> tenants = fEntry.getValue();
            %>

            <h3><%= flatType %></h3>

            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Contact</th>
                    <th>Flat No</th>
                    <th>Photo</th>
                    <th>Rent</th>
                    <th>Created At</th>
                </tr>

                <% for(Tenant t : tenants) { %>
                <tr>
                    <td>TEN00<%= t.getE_id() %></td>
                    <td><%= t.getName() %></td>
                    <td><%= t.getEmail() %></td>
                    <td><%= t.getContact_no() %></td>
                    <td><%= t.getFlat_no() %></td>

                    <td>
                        <%
                        byte[] img = t.getPhoto();
                        if(img != null){
                            String base64 = Base64.getEncoder().encodeToString(img);
                        %>
                            <img src="data:image/jpeg;base64,<%= base64 %>" class="photo"/>
                        <% } else { %>
                            No Photo
                        <% } %>
                    </td>

                    <td><%= t.getRent() %></td>
                    <td><%= t.getCreated_at() %></td>
                </tr>
                <% } %>
            </table>

            <% } %>

        </div>

        <% 
            } // for loop
        } // else
        %>

    </div>

    <!-- Slider arrows -->
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>

    <!-- Slider dots -->
    <div class="swiper-pagination"></div>
</div>

<!-- Swiper JS -->
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
