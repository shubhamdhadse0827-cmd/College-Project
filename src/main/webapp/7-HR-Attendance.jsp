<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.bms.dto.Employee" %>
<%@ page import="com.bms.model.HRModel" %>
<!DOCTYPE html>
<html>
<head>
<title>Attendance</title>

<!-- Simple CSS -->
<style>
    body {
        font-family: Arial, sans-serif;
        background: #f5f7fb;
        margin: 0;
        padding: 0;
    }

    .container {
        width: 80%;
        margin: 40px auto;
        background: #fff;
        padding: 25px;
        border-radius: 10px;
        box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    table th {
        background: #2B65EC;
        color: white;
        padding: 10px;
        text-align: center;
    }

    table td {
        padding: 10px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }

    tr:hover {
        background: #f0f4ff;
    }

    .btn {
        margin-top: 20px;
        padding: 10px 25px;
        background: #2B65EC;
        border: none;
        border-radius: 5px;
        color: white;
        cursor: pointer;
        font-size: 16px;
    }

    .btn:hover {
        background: #1A4BB8;
    }

</style>
</head>
<body>

<div class="container">
    <h2>Employee Attendance</h2>

    <%
        String building = (String) session.getAttribute("building_name");
        HRModel model = new HRModel();
        List<Employee> list = model.getUsersByBuilding(building);
    %>

    <form action="AttendanceCtrl" method="post">
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Building</th>
                <th>Role</th>
                <th>Present</th>
            </tr>

            <%
                for (Employee e : list) {
            %>
            <tr>
                <td><%= e.getE_id() %></td>
                <td><%= e.getName() %></td>
                <td><%= e.getBuilding() %></td>
                <td><%= e.getRole() %></td>
                <td><input type="checkbox" name="present" value="<%= e.getE_id() %>"></td>
            </tr>
            <%
                }
            %>
        </table>

        <center>
            <button type="submit" class="btn">Save Attendance</button>
        </center>
    </form>
</div>

</body>
</html>
