<%@page import="com.bms.dto.Tenant" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body { font-family: Arial; background: #eef; }
form {
  background: white; width: 500px; margin: 50px auto;
  padding: 20px; border-radius: 10px; box-shadow: 0 0 10px #aaa;
}
input, select, button {
  width: 90%; margin: 10px auto; padding: 10px;
}
button { background: #007bff; color: white; border: none; border-radius: 5px; }
label{
display:block;
}
</style>
</head>
<body>
<%
	Tenant tn = (Tenant) request.getAttribute("tn");
	%>
<form action="UpdateTenant" method="post" enctype="multipart/form-data">

  <h3>➕ Update Tenant Account</h3>
  <input type="hidden" name="id" value="<%=tn.getE_id()%>">
    
  <label>👨‍💼 Full Name:</label>
  <input type="text" name="name" placeholder="Tenant Name" value="<%=tn.getName()%>">

  <label>📧 Email:</label>
  <input type="email" name="email" placeholder="Email Address" value="<%=tn.getEmail()%>">

  <label>📞 Contact No:</label>
  <input type="text" name="contact_no" placeholder="Contact Number" value="<%=tn.getContact_no()%>">

  <label>🆔 Flat No:</label>
  <input type="text" name="flat_no" placeholder="Flat No" value="<%=tn.getFlat_no()%>">

  <label>🆔 Building Name:</label>
  <input type="text" name="building_name" placeholder="Building Name" value="<%=tn.getBuilding()%>">
   
  <div class="form-group row">
        	<label for="photo">Photo</label>
        	<img src="TenantPhoto?id=<%=tn.getE_id()%>" alt="Image Not Found" height =80 width =60>
        </div> 
	
  <label>📸 Upload Photo:</label>
  <input type="file" name="photo" accept=".jpg,.jpeg,.png" >

  <button type="submit">🚀 Update Account</button>

</form>
</body>
</html>