<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Tenant</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #eef;
            margin: 0;
        }

        form {
            background: #fff;
            width: 500px;
            margin: 50px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px #aaa;
        }

        h3 {
            text-align: center;
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-top: 12px;
            font-weight: bold;
        }

        input, select, button {
            width: 90%;
            margin: 10px auto;
            padding: 10px;
            font-size: 15px;
            display: block;
        }

        button {
            background: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: .3s;
        }

        button:hover {
            background: #005ec4;
        }
    </style>
</head>

<body>

    <form action="TenantSignupCtrl" method="post" enctype="multipart/form-data">

        <h3>➕ Add Tenant Account</h3>

        <input type="hidden" name="role" value="Tenant">

        <!-- Full Name -->
        <label>👨‍💼 Full Name:</label>
        <input type="text" name="name" placeholder="Enter Tenant Name" required>

        <!-- Email -->
        <label>📧 Email:</label>
        <input type="email" name="email" placeholder="Enter Email Address" required>

        <!-- Password -->
        <label>🔑 Password:</label>
        <input type="password" name="pwd" placeholder="Enter Password" required>

        <!-- Contact No -->
        <label>📞 Contact No:</label>
        <input type="text" name="contact_no" placeholder="Enter Contact Number" required>

        <!-- Aadhaar -->
        <label>🆔 Aadhaar No:</label>
        <input type="text" name="aadhaar_no" placeholder="Enter Aadhaar Number" required>

        <!-- Photo -->
        <label>📸 Upload Photo:</label>
        <input type="file" name="photo" accept=".jpg,.jpeg,.png" required>

        <!-- Building -->
        <label>🏢 Building Name:</label>
        <select name="building_name" required>
            <option value="">-- Select Building --</option>
            <option value="Studio Block (1RK)">Studio Block (1RK)</option>
            <option value="Prime Block (1BHK)">Prime Block (1BHK)</option>
            <option value="Comfort Block (2BHK)">Comfort Block (2BHK)</option>
            <option value="Royal Block (3BHK)">Royal Block (3BHK)</option>
        </select>

        <!-- Flat No -->
        <label>🏠 Flat No:</label>
        <input type="number" name="flat_no" placeholder="Enter Flat No" required>

        <!-- Rent -->
        <label>💰 Monthly Rent:</label>
        <input type="number" step="0.01" name="rent" placeholder="Enter Rent Amount" required>

        <!-- Electricity Bill -->
        <label>⚡ Electricity Bill:</label>
        <input type="number" step="0.01" name="electricity_bill" placeholder="Enter Electricity Amount" required>

        <!-- Submit -->
        <button type="submit">🚀 Create Account</button>
    </form>

</body>
</html>
