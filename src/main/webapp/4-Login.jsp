<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Secure Login Portal</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

    <style>
        @keyframes slideInUp { from { opacity: 0; transform: translateY(50px); } to { opacity: 1; transform: translateY(0); } }
        @keyframes fadeIn { from { opacity: 0; } to { opacity: 1; } }
        @keyframes bounceIn { 0% { opacity: 0; transform: scale(0.3); } 50% { transform: scale(1.05); } 70% { transform: scale(0.9); } 100% { opacity: 1; transform: scale(1); } }
        @keyframes pulseGlow { 0% { box-shadow: 0 0 5px rgba(255, 223, 93, 0.5); } 50% { box-shadow: 0 0 20px rgba(255, 223, 93, 0.8); } 100% { box-shadow: 0 0 5px rgba(255, 223, 93, 0.5); } }
        @keyframes rotate3D { 0% { transform: rotateY(0deg) rotateX(0deg); } 50% { transform: rotateY(180deg) rotateX(180deg); } 100% { transform: rotateY(360deg) rotateX(360deg); } }
        @keyframes float3D { 0% { transform: translateY(0px) rotateZ(0deg); } 50% { transform: translateY(-20px) rotateZ(5deg); } 100% { transform: translateY(0px) rotateZ(0deg); } }

        .slide-in-up { animation: slideInUp 1s ease-out; }
        .fade-in { animation: fadeIn 2s ease-in; }
        .bounce-in { animation: bounceIn 1.5s ease-out; }
        .pulse-glow { animation: pulseGlow 2s infinite; }

        body {
    		background: linear-gradient(135deg, #05040f 0%, #0a0820 40%, #0d0b27 70%, #111022 100%);
    		font-family: 'Inter', sans-serif;
   			perspective: 1000px;
		}


        .login-container {
            backdrop-filter: blur(25px);
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.15);
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.3);
            position: relative;
            z-index: 10;
        }

        .eye-icon { cursor: pointer; transition: color 0.3s ease; }
        .eye-icon:hover { color: #ffd700; }

        input:focus, select:focus, button:focus { outline: none; box-shadow: 0 0 0 3px rgba(255, 223, 93, 0.5); }

        .bg-3d { position: absolute; inset: 0; overflow: hidden; z-index: 0; }
        .cube { width: 50px; height: 50px; background: rgba(255, 255, 255, 0.05); border: 1px solid rgba(255, 255, 255, 0.1); position: absolute; animation: rotate3D 10s infinite linear; transform-style: preserve-3d; }
        .cube:nth-child(1) { top: 10%; left: 20%; }
        .cube:nth-child(2) { top: 20%; right: 15%; }
        .cube:nth-child(3) { bottom: 15%; left: 30%; }
        .cube:nth-child(4) { bottom: 25%; right: 25%; }
        .cube:nth-child(5) { top: 50%; left: 5%; }
        .cube:nth-child(6) { top: 35%; right: 5%; }
        .sphere { width: 30px; height: 30px; background: rgba(255, 223, 93, 0.1); border-radius: 50%; position: absolute; animation: float3D 6s infinite ease-in-out alternate; }
        .sphere:nth-child(1) { top: 15%; left: 70%; }
        .sphere:nth-child(2) { top: 60%; right: 10%; }
        .sphere:nth-child(3) { bottom: 40%; left: 10%; }
    </style>
</head>
<body class="flex items-center justify-center min-h-screen text-white relative">
    <!-- 3D Background -->
    <div class="bg-3d bg-gradient-to-r from-purple-800 via-fuchsia-800 to-indigo-900">
        <div class="cube"></div><div class="cube"></div><div class="cube"></div>
        <div class="cube"></div><div class="cube"></div><div class="cube"></div>
        <div class="sphere"></div><div class="sphere"></div><div class="sphere"></div>
    </div>

    <div class="login-container rounded-2xl p-8 w-full max-w-md slide-in-up">
        <!-- Logo -->
        <div class="text-center mb-6 bounce-in">
            <i class="fas fa-shield-alt text-6xl text-yellow-400 mb-4"></i>
            <h1 class="text-3xl font-bold mb-2">Welcome Back</h1>
            <p class="text-gray-300">Secure Your Access Now</p>
        </div>

        <!-- 🔴 Error Message from Backend -->
        <c:if test="${not empty msg}">
            <div class="text-center mb-4 text-red-400 font-semibold">${msg}</div>
        </c:if>

        <!-- Login Form -->
        <form id="loginForm" class="space-y-6 fade-in" method="post" action="LoginCtrl">

            <!-- Role Selection -->
            <div>
                <label for="role" class="block text-sm font-medium text-gray-200 mb-2">Select Role</label>
                <select id="role" name="role"
                    class="w-full px-4 py-3 rounded-lg bg-gray-800 text-white border border-gray-600 focus:border-yellow-400"
                    required>
                    <option value="" disabled selected>Select your role</option>
                    <option value="Admin">Admin</option>
                    <option value="Manager">Manager</option>
                    <option value="HR">HR</option>
                    <option value="Accountant">Accountant</option>
                    <option value="Tenant">Tenant</option>
                    <option value="Staff">Staff</option>
                </select>
            </div>

            <!-- Email -->
            <div>
                <label for="email" class="block text-sm font-medium text-gray-200 mb-2">Email</label>
                <div class="relative">
                    <input type="text" id="email" name="email" placeholder="Enter your email" required
                           class="w-full px-4 py-3 rounded-lg bg-gray-800 text-white border border-gray-600 focus:border-yellow-400" />
                    <i class="fas fa-user absolute right-4 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
                </div>
            </div>

            <!-- Password -->
            <div>
                <label for="password" class="block text-sm font-medium text-gray-200 mb-2">Password</label>
                <div class="relative">
                    <input type="password" id="password" name="pwd" placeholder="Enter your password" required
                           class="w-full px-4 py-3 rounded-lg bg-gray-800 text-white border border-gray-600 focus:border-yellow-400 pr-12" />
                    <span id="eye" class="eye-icon fas fa-eye absolute right-4 top-1/2 transform -translate-y-1/2 text-gray-400"></span>
                </div>
            </div>

            <!-- Remember -->
            <div class="flex items-center justify-between">
                <label class="flex items-center text-sm">
                    <input type="checkbox" name="remember" class="mr-2" />
                    <span class="text-gray-300">Remember Me</span>
                </label>
                <a href="#" class="text-sm text-yellow-400 hover:text-yellow-300">Forgot Password?</a>
            </div>

            <!-- Submit -->
            <button type="submit" class="w-full py-3 bg-yellow-400 text-black font-semibold rounded-lg pulse-glow hover:scale-105 transition-all">
                <i class="fas fa-sign-in-alt mr-2"></i>Login Now
            </button>
        </form>

        <!-- Register -->
        <div class="mt-6 text-center text-gray-400">
            <p>New here? <a href="#" class="text-yellow-400 hover:text-yellow-300 font-medium">Create an Account</a></p>
        </div>
    </div>

    <!-- JavaScript -->
    <script>
        // Eye toggle
        const eyeIcon = document.getElementById('eye');
        const passwordField = document.getElementById('password');
        eyeIcon.addEventListener('click', function() {
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                this.classList.remove('fa-eye');
                this.classList.add('fa-eye-slash');
            } else {
                passwordField.type = 'password';
                this.classList.remove('fa-eye-slash');
                this.classList.add('fa-eye');
            }
        });

        // Button animation
        document.getElementById('loginForm').addEventListener('submit', function() {
            const button = this.querySelector('button[type="submit"]');
            button.innerHTML = '<i class="fas fa-spinner fa-spin mr-2"></i>Logging In...';
            button.disabled = true;
        });
    </script>
</body>
</html>
