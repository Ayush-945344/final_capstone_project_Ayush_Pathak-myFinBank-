<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Register - MyFinBank</title>
    <link rel="stylesheet" href="/css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        nav {
            background-color: #00796b;
            color: white;
            padding: 15px 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        nav .logo {
            display: flex;
            align-items: center;
        }

        nav .logo i {
            font-size: 30px;
            margin-right: 10px;
            color: white;
        }

        nav h2 {
            margin: 0;
            color: white;
        }

        nav ul {
            list-style: none;
            padding: 0;
            display: flex;
        }

        nav ul li {
            margin-right: 20px;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        nav ul li a:hover {
            background-color: #005b4d;
        }

        .container {
            width: 400px;
            margin: auto;
            padding: 30px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }

        h2 {
            text-align: center;
            color: #00796b;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
        }

        input[type="text"], input[type="password"], input[type="email"] {
            width: 93%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus, input[type="password"]:focus, input[type="email"]:focus {
            border-color: #00796b;
            outline: none;
        }

        .btn {
            width: 100%;
            padding: 12px;
            background-color: #00796b;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #005b4d;
        }

        .error {
            color: red;
            text-align: center;
            margin: 10px 0;
        }

        .link {
            text-align: center;
            margin-top: 15px;
        }

        .link a {
            color: #00796b;
            text-decoration: none;
            transition: color 0.3s;
        }

        .link a:hover {
            color: #005b4d;
        }

        footer {
            background-color: #00796b;
            color: white;
            text-align: center;
            padding: 20px 0;
            margin-top: auto;
        }

        footer ul {
            list-style: none;
            padding: 0;
            display: flex;
            justify-content: center;
        }

        footer ul li {
            margin: 0 15px;
        }

        footer ul li a {
            color: white;
            text-decoration: none;
            transition: color 0.3s;
        }

        footer ul li a:hover {
            color: #005b4d;
        }
    </style>
</head>
<body>
    <nav>
        <div class="logo">
            <i class="fas fa-university"></i>
            <h2>MyFinBank</h2>
        </div>
        <ul>
            <li><a href="/api/admin/login"><i class="fas fa-sign-in-alt"></i> Admin Login</a></li>
        </ul>
    </nav>
    <div class="container">
        <h2>Create Admin Account</h2>
        <form action="/api/admin/register" method="post">
            <label for="username">Username:</label>
            <input type="text" name="username" required>
            <label for="email">Email:</label>
            <input type="email" name="email" required>
            <label for="password">Password:</label>
            <input type="password" name="password" required>
            <button type="submit" class="btn">Register</button>
        </form>
        <p class="link">Already have an account? <a href="/api/admin/login">Login here</a></p>
    </div>

    <footer>
        <ul>
            <li><a href="#">About Us</a></li>
            <li><a href="#">Contact Us</a></li>
            <li><a href="#">Privacy Policy</a></li>
            <li><a href="#">Terms of Service</a></li>
        </ul>
        <p>&copy; 2024 MyFinBank. All rights reserved.</p>
    </footer>
</body>
</html>
