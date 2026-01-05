<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.bms.dto.Tenant" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tenants in Your Building</title>

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
    .photo {
        width: 60px;
        height: 60px;
        border-radius: 50%;
    }
</style>

</head>
<body>

<h2>Tenants in Your Building</h2>

<table border="1">
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Contact</th>
    <th>Flat No</th>
    <th>Building</th>
    <th>Photo</th>
    <th>Created At</th>
    <th>Updation</th>
    <th>Deletion</th>
</tr>

<%
ArrayList<Tenant> list = (ArrayList<Tenant>) request.getAttribute("LIST");

if(list != null && !list.isEmpty()) {
    for(Tenant t : list) {
%>

<tr>
    <td>TEN00<%= t.getE_id() %></td>
    <td><%= t.getName() %></td>
    <td><%= t.getEmail() %></td>
    <td><%= t.getContact_no() %></td>
    <td><%= t.getFlat_no() %></td>
    <td><%= t.getBuilding() %></td>
    <td>
        <%
            byte[] img = t.getPhoto();
            if(img != null && img.length > 0){
                String base64 = Base64.getEncoder().encodeToString(img);
        %>
            <img src="data:image/jpeg;base64,<%= base64 %>" class="photo">
        <%
            } else {
        %>
            No Photo
        <%
            }
        %>
    </td>
    <td><%=t.getCreated_at() %></td>
    <td>
                        <a href="UpdateTenant?id=<%=t.getE_id()%>" 
                           class="btn btn-sm btn-outline-info">
                           Edit
                        </a>
                        </td>
    <td>
    	<a href="DeleteTenant?id=<%=t.getE_id() %>" class="btn btn-sm btn-outline-danger" 
                           onclick="return confirm('Are You Sure To Delete Record?')">
                           Delete
                        </a>
                        </td>
                        
</tr>

<%
    }
} else {
%>

<tr>
    <td colspan="8" style="color:red; font-weight:bold;">No Tenants Found in Your Building</td>
</tr>

<%
}
%>

</table>

</body>
</html>
