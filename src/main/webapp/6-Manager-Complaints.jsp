<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="com.bms.dto.Complaint" %>
<%@ page import ="com.bms.model.ComplaintModel" %>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%
    ComplaintModel model = new ComplaintModel();
    List<Complaint> list = model.getAllComplaints();
%>

<!DOCTYPE html>
<html>
<head>
<title>All Complaints</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: #f5f7fa;
        margin: 0;
        padding: 20px;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background: white;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        border-radius: 8px;
        overflow: hidden;
    }

    th {
        background: #34495e;
        color: white;
        padding: 12px;
        text-align: left;
    }

    td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
    }

    tr:hover {
        background: #f0f0f0;
    }

    .status-pending {
        background: #f39c12;
        color: white;
        padding: 4px 8px;
        border-radius: 5px;
        font-size: 14px;
    }

    .status-solved {
        background: #27ae60;
        color: white;
        padding: 4px 8px;
        border-radius: 5px;
        font-size: 14px;
    }

    button {
        background: #2980b9;
        color: white;
        border: none;
        padding: 6px 12px;
        border-radius: 6px;
        cursor: pointer;
    }

    button:hover {
        background: #1f6391;
    }

    .container {
        max-width: 1200px;
        margin: auto;
    }
</style>

</head>
<body>

<div class="container">
    <h2>All Complaints</h2>

    <table>
        <tr>
            <th>Complaint ID</th>
            <th>Tenant ID</th>
            <th>Tenant Name
            <th>Category</th>
            <th>Description</th>
            <th>Status  </th>
            <th>Created At</th>
            <th>Updated At</th>
            <th>Action  </th>
        </tr>

        <%
        for (Complaint c : list) {
        %>
        <tr>
            <td>CMP00<%= c.getC_id() %></td>
            <td>TN00<%= c.getTenantId() %></td>
            <td><%= c.getTenantName() %></td>
            <td><%= c.getCategory() %></td>
            <td><%= c.getDescription() %></td>
            <td>
                <% if(c.getStatus().equals("Pending")) { %>
                    <span class="status-pending">Pending</span>
                <% } else { %>
                    <span class="status-solved">Solved</span>
                <% } %>
            </td>

            <td><%= c.getCreated_at() %></td>
            <td><%= c.getUpdated_at()%></td>

            <td>
                <% if(c.getStatus().equals("Pending")) { %>
                <form action="UpdateComplaint" method="post" onsubmit="return confirmSolve()">
                    <input type="hidden" name="c_id" value="<%= c.getC_id()%>">

                    <button type="submit">Mark Solved</button>
                </form>
                <% } else { %>
                    ✔ Solved
                <% } %>
            </td>
        </tr>
        <% } %>
    </table>
</div>

<script>
function confirmSolve() {
    return confirm("Are you sure you want to mark this complaint as Solved?");
}
</script>

</body>
</html>
