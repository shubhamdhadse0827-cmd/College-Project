<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Base64" %>
<%@ page import="com.bms.dto.Employee1" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<title>Employees in Your Building</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: #f2f4f7;
        padding: 20px;
    }
    h2 {
        text-align: center;
        margin-bottom: 25px;
        color: #333;
    }
    table {
        width: 85%;
        margin: auto;
        border-collapse: collapse;
        background: white;
        box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
    }
    th, td {
        padding: 12px;
        text-align: center;
    }
    th {
        background: #007bff;
        color: white;
        font-size: 16px;
    }
    tr:nth-child(even) {
        background: #f9f9f9;
    }
    tr:hover {
        background: #eaf3ff;
        cursor: pointer;
    }
</style>

</head>
<body>

<h2>Employees in Your Building</h2>

<table border="1">
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Contact</th>
    <th>Role</th>
    <th>Building</th>
    <th>Photo</th>
    <th>Created At</th>
</tr>

<%
ArrayList<Employee1> list = (ArrayList<Employee1>) request.getAttribute("LIST");

if(list != null && !list.isEmpty()) {
    for(Employee1 e : list) {
%>

<tr>
    <td>EMP00<%= e.getE_id() %></td>
    <td><%= e.getName() %></td>
    <td><%= e.getEmail() %></td>
    <td><%= e.getContact_no() %></td>
    <td><%= e.getRole() %></td>
    <td><%= e.getBuilding() %></td>
    <td>
    <%
        byte[] imgData = e.getPhoto();
        if(imgData != null && imgData.length > 0) {
            String base64Image = Base64.getEncoder().encodeToString(imgData);
    %>
        <img src="data:image/jpeg;base64,<%= base64Image %>" style="width:60px; height:60px; border-radius:50%;">
    <%
        } else {
    %>
        Not Found Photo
    <%
        }
    %>
</td>
	<%
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy hh:mm a");
%>

<td>
    <%= e.getCreated_at() != null ? sdf.format(e.getCreated_at()) : "N/A" %>
</td>


</tr>

<%
    }
} else {
%>

<tr>
    <td colspan="6" style="color:red; font-weight:bold;">No Employees Found in Your Building</td>
</tr>

<%
}
%>

</table>

</body>
</html>
