<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Manager</title>
<style>
body { font-family: Arial; background: #eef; }
form {
  background: white; width: 500px; margin: 50px auto;
  padding: 20px; border-radius: 10px; box-shadow: 0 0 10px #aaa;
}
input, button {
  width: 90%; margin: 10px auto; padding: 10px;
}
button { background: #007bff; color: white; border: none; border-radius: 5px; }
label{
display:block;
}
</style>
</head>
<body>
<form action="ManagerSignupCtrl" method="post" enctype="multipart/form-data">
  <h3>➕ Add Manager Account</h3>
  
  <input type="hidden" name="role" value="Manager">

  <label>👨‍💼 Full Name:</label>
  <input type="text" name="name" placeholder="Enter Manager Name" required>

  <label>📧 Email:</label>
  <input type="email" name="email" placeholder="Enter Email Address" required>

  <label>🔑 Password:</label>
  <input type="password" name="pwd" placeholder="Enter Password" required>
  
  <label>🏢 Building Name:</label>
        <select name="building_name" required>
            <option value="">-- Select Building --</option>
            <option value="Studio Block (1RK)">Studio Block (1RK)</option>
            <option value="Prime Block (1BHK)">Prime Block (1BHK)</option>
            <option value="Comfort Block (2BHK)">Comfort Block (2BHK)</option>
            <option value="Royal Block (3BHK)">Royal Block (3BHK)</option>
        </select>
        
  <label>📞 Contact No:</label>
  <input type="text" name="contact_no" placeholder="Enter Contact Number" required>

  <label>🆔 Aadhaar No:</label>
  <input type="text" name="aadhaar_no" placeholder="Enter Aadhaar Number" required>

  <label>📸 Upload Photo:</label>
  <input type="file" name="photo" accept=".jpg,.jpeg,.png" required>

  <button type="submit">🚀 Create Account</button>
</form>


</body>
</html>
