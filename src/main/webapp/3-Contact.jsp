<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CEO Registration</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 70%;
            margin: 50px auto;
            background: #fff;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            animation: fadeIn 1s ease-in-out;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 28px;
            color: #333;
            letter-spacing: 1px;
        }

        /* Stepper */
        .stepper {
            display: flex;
            justify-content: space-between;
            position: relative;
            margin-bottom: 40px;
        }

        /* Progress Bar Line */
        .progress-line {
            position: absolute;
            top: 22px;
            left: 10%;
            width: 80%;
            height: 4px;
            background: #ddd;
            z-index: -1;
            border-radius: 5px;
            overflow: hidden;
        }

        .progress-fill {
            width: 0%;
            height: 100%;
            background: #4CAF50;
            transition: width 0.8s ease-in-out;
        }

        .step {
            text-align: center;
            position: relative;
            flex: 1;
        }

        .circle {
            width: 45px;
            height: 45px;
            line-height: 45px;
            border-radius: 50%;
            background: #ddd;
            margin: auto;
            font-weight: bold;
            color: #555;
            transition: 0.5s;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        .step.active .circle {
            background: #4CAF50;
            color: #fff;
            transform: scale(1.1);
        }

        .step p {
            margin-top: 10px;
            font-size: 14px;
            color: #555;
        }

        /* Forms */
        form {
            display: none;
            animation: slideIn 0.8s ease;
        }

        form.active {
            display: block;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 12px;
            color: #333;
        }

        input, textarea {
            width: 100%;
            padding: 12px;
            margin: 8px 0 15px 0;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        input:focus, textarea:focus {
            border-color: #4CAF50;
            box-shadow: 0 0 10px rgba(76,175,80,0.5);
            outline: none;
        }

        button {
            background: linear-gradient(135deg, #4CAF50, #2e7d32);
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 30px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
            margin-top: 15px;
        }

        button:hover {
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 6px 20px rgba(0,0,0,0.2);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateX(50px); }
            to { opacity: 1; transform: translateX(0); }
        }
    </style>

    <script>
        function showForm(stepId, formId) {
            // reset steps
            let steps = document.getElementsByClassName("step");
            for(let i=0; i<steps.length; i++){ steps[i].classList.remove("active"); }
            document.getElementById(stepId).classList.add("active");

            // reset forms
            let forms = document.getElementsByTagName("form");
            for(let i=0; i<forms.length; i++){ forms[i].classList.remove("active"); }
            document.getElementById(formId).classList.add("active");

            // progress bar fill
            let progress = document.querySelector(".progress-fill");
            if(stepId === "step1"){
                progress.style.width = "0%";
            } else if(stepId === "step2"){
                progress.style.width = "100%";
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h2>🚀 CEO Registration</h2>

    <!-- Stepper Navigation -->
    <div class="stepper">
        <div class="progress-line">
            <div class="progress-fill"></div>
        </div>

        <div class="step active" id="step1" onclick="showForm('step1','form1')">
            <div class="circle">1</div>
            <p>Document Verification</p>
        </div>
        <div class="step" id="step2" onclick="showForm('step2','form2')">
            <div class="circle">2</div>
            <p>CEO Details</p>
        </div>
    </div>

    <!-- Form 1 -->
    <form id="form1" class="active" action="DocumentVerificationServlet" method="post" enctype="multipart/form-data">
        <label>🏢 Multi Name:</label>
        <input type="text" name="multi_name" placeholder="Enter Multi Name" required>

        <label>📍 Address:</label>
        <textarea name="address" rows="3" placeholder="Enter Address" required></textarea>

        <label>📂 Upload Valid Proof:</label>
        <input type="file" name="proof" accept=".pdf,.jpg,.jpeg,.png" required>

        <button type="submit" onclick="showForm('step2','form2'); return false;">✅ Upload & Verify</button>
    </form>

    <!-- Form 2 -->
    <form id="form2" action="AdminSignupCtrl" method="post" enctype="multipart/form-data">
        <label>👨‍💼 Full Name:</label>
        <input type="text" name="name" placeholder="Enter Full Name" required>

        <label>📧 Email:</label>
        <input type="email" name="email" placeholder="Enter Email Address" required>

        <label>🔑 Password:</label>
        <input type="password" name="pwd" placeholder="Enter Password" required>

        <label>📞 Contact No:</label>
        <input type="text" name="contact_no" placeholder="Enter Contact Number" required>

        <label>🆔 Aadhaar No:</label>
        <input type="text" name="aadhaar_no" placeholder="Enter Aadhaar Number" required>

        <label>📸 Upload Photo:</label>
        <input type="file" name="photo" accept=".jpg,.jpeg,.png" required>

        <button type="submit">🚀 Create Account</button>
    </form>
</div>
</body>
</html>