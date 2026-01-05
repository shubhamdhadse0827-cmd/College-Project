<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.time.*" %>
<%@ page import="com.bms.dto.Employee" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Building Monthly Attendance</title>
<style>
    body{font-family:Arial; background:#f4f7fb; margin:0; padding:20px;}
    .container{width:95%; max-width:1200px; margin:0 auto;}
    .card{background:#fff; padding:18px; border-radius:8px; box-shadow:0 4px 12px rgba(0,0,0,0.06); margin-bottom:18px;}
    .filter{display:flex; gap:10px; align-items:center; flex-wrap:wrap; margin-bottom:18px;}
    .filter select, .filter input{padding:8px; border-radius:6px; border:1px solid #ccc;}
    .btn{background:#2B65EC;color:#fff;padding:9px 14px;border-radius:6px;border:none; cursor:pointer;}
    .emp-block{margin-top:12px;}
    .emp-header{display:flex; justify-content:space-between; align-items:center; padding:10px; border-radius:6px; background:#f7f9ff; margin-bottom:8px;}
    .calendar{display:grid; grid-template-columns:repeat(7,1fr); gap:8px;}
    .day-header{background:#2B65EC; color:#fff; padding:8px; text-align:center; border-radius:6px; font-weight:bold;}
    .box{background:#fff; min-height:70px; border-radius:6px; border:1px solid #e0e6f3; padding:6px; position:relative; font-size:13px;}
    .date-label{position:absolute; left:8px; top:6px; font-weight:bold;}
    .present{background:#e6f9e6; border:1px solid #8fd88f;}
    .absent{background:#ffecec; border:1px solid #ff9b9b;}
    .sunday{background:#f5f5f7; color:#666;}
    .today{outline:3px solid #2B65EC;}
    .summary{margin-top:8px; font-size:14px;}
</style>
</head>
<body>
<div class="container">
	<div style="display:flex; justify-content:flex-end; margin-bottom:15px;">
    <a href="7-HR-Dashboard.jsp" class="btn-dashboard">Go to Dashboard</a>
</div>

<style>
.btn-dashboard{
    background:#2B65EC;
    color:white;
    padding:10px 18px;
    border-radius:6px;
    text-decoration:none;
    font-weight:bold;
    transition:0.3s;
}
.btn-dashboard:hover{
    background:#1c4ec9;
}
</style>
	
    <div class="card">
        <h2>Monthly Attendance — Building: <%= session.getAttribute("building_name") %></h2>

        <!-- Filter form: posts to AttendanceMonthCtrl -->
        <form class="filter" action="AttendanceMonthCtrl" method="post">
            <label>Month:
                <select name="month" required>
                    <% for(int m=1;m<=12;m++){ %>
                        <option value="<%=m%>" <%= (m==LocalDate.now().getMonthValue()?"selected":"") %>>
                            <%= new java.text.DateFormatSymbols().getMonths()[m-1] %>
                        </option>
                    <% } %>
                </select>
            </label>

            <label>Year:
                <input type="number" name="year" value="<%= LocalDate.now().getYear() %>" required style="width:120px;">
            </label>

            <button type="submit" class="btn">View</button>
        </form>
    </div>

    <!-- If controller forwarded results, these attributes will exist -->
    <%
        List<Employee> empList = (List<Employee>) request.getAttribute("empList");
        Integer month = (Integer) request.getAttribute("month");
        Integer year = (Integer) request.getAttribute("year");
        Integer totalDays = (Integer) request.getAttribute("totalDays");
        Map<Integer, Map<Integer,String>> attendanceMap =
            (Map<Integer, Map<Integer,String>>) request.getAttribute("attendanceMap");

        if(empList != null && month != null && year != null) {
            // prepare week headers
            String[] week = {"Sun","Mon","Tue","Wed","Thu","Fri","Sat"};
            // compute start day for month
            java.util.Calendar cal = java.util.Calendar.getInstance();
            cal.set(year, month-1, 1);
            int startDay = cal.get(Calendar.DAY_OF_WEEK); // 1=Sun..7=Sat
    %>

    <% for(Employee emp : empList) { 
        Map<Integer,String> empAtt = attendanceMap.get(emp.getE_id());
        if(empAtt == null) empAtt = new HashMap<>();
    %>
    <div class="card emp-block">
        <div class="emp-header">
            <div>
                <strong><%= emp.getName() %></strong> &nbsp; <small>(<%= emp.getRole() %>)</small><br>
                <small>Employee ID: <%= emp.getE_id() %> | Building: <%= emp.getBuilding() %></small>
            </div>
            <div class="summary">
                <%
                    int presentCount = 0;
                    int absentCount = 0;
                    for (int d=1; d<=totalDays; d++) {
                        String s = empAtt.get(d);
                        if ("Present".equalsIgnoreCase(s) || "P".equalsIgnoreCase(s)) presentCount++;
                        else if ("Absent".equalsIgnoreCase(s) || "A".equalsIgnoreCase(s)) absentCount++;
                    }
                %>
                <span><strong>P:</strong> <%= presentCount %></span> &nbsp; 
                <span><strong>A:</strong> <%= absentCount %></span> &nbsp;
                <span><strong>%</strong>: <%= totalDays>0 ? String.format("%.1f", (presentCount*100.0/totalDays)) : "0.0" %></span>
            </div>
        </div>

        <!-- Calendar grid headers -->
        <div class="calendar">
            <% for(String w : week) { %>
                <div class="day-header"><%= w %></div>
            <% } %>

            <% 
                // empty boxes for days before the 1st
                for (int i=1; i<startDay; i++) { %>
                    <div></div>
            <% } 

                // render each day
                for (int day=1; day<=totalDays; day++) {
                    cal.set(year, month-1, day);
                    int weekday = cal.get(Calendar.DAY_OF_WEEK);
                    String status = empAtt.get(day); // may be "Present"/"Absent" or null
                    String cls = "";
                    if (weekday == Calendar.SUNDAY) cls = "sunday";
                    if ("Present".equalsIgnoreCase(status) || "P".equalsIgnoreCase(status)) cls = "present";
                    if ("Absent".equalsIgnoreCase(status) || "A".equalsIgnoreCase(status)) cls = "absent";

                    // today check
                    java.time.LocalDate today = java.time.LocalDate.now();
                    boolean isToday = (today.getYear() == year && today.getMonthValue() == month && today.getDayOfMonth() == day);
            %>

                <div class="box <%= cls %> <%= isToday ? "today" : "" %>">
                    <div class="date-label"><%= day %></div>
                    <div style="position:absolute; right:6px; bottom:6px; font-size:12px;">
                        <%= status != null ? status : "" %>
                    </div>
                </div>

            <% } %>

            <% // No need to fill trailing empty boxes (optional) %>
        </div>
    </div>

    <% } // end for each employee %>

    <% } else { %>
        <div class="card">
            <p style="text-align:center; color:#555;">Select month and year and click **View** to see attendance.</p>
        </div>
    <% } %>

</div>
</body>
</html>
