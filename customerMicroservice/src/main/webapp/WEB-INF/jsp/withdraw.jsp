<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Withdraw - MyFinBank</title>
    <link rel="stylesheet" href="/css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e9ecef; /* Light background */
            color: #495057;
            margin: 0;
            padding: 0;
        }

        nav {
            background-color: #00796b; /* Principal theme color */
            color: white;
            padding: 15px 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        nav ul {
            list-style: none;
            padding: 0;
            display: flex;
            justify-content: space-between;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        nav ul li a:hover {
            background-color: #005f51; /* Darker shade for hover effect */
        }

        .container {
            width: 400px; /* Set width for the container */
            margin: auto;
            padding: 30px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            margin-top: 50px; /* Space from the top */
        }

        h2 {
            text-align: center;
            color: #00796b; /* Principal theme color */
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
        }

        input[type="text"], input[type="number"] {
            width: 100%; /* Full width for inputs */
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus, input[type="number"]:focus {
            border-color: #00796b; /* Focus effect with theme color */
            outline: none;
        }

        .btn {
            width: 100%;
            padding: 12px;
            background-color: #0066cc; /* Button color */
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #005bb5; /* Button hover effect */
        }

        .link {
            text-align: center;
            margin-top: 15px;
        }

        .link a {
            color: #00796b; /* Principal theme color for link */
        }
    </style>
</head>
<body>
    <nav>
        <ul>
            <li><a href="/api/customer/dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            <li><a href="/api/customer/account/details"><i class="fas fa-wallet"></i> Account Details</a></li>
        </ul>
    </nav>
    <div class="container">
        <h2>Withdraw Funds</h2>
        <form action="/api/customer/withdraw" method="post">
            <label for="accountId">Account ID:</label>
            <input type="text" id="accountId" name="accountId" required> <!-- Added required attribute -->
            <label for="amount">Amount:</label>
            <input type="number" id="amount" name="amount" required>
            <button type="submit" class="btn">Withdraw</button>
        </form>
        <p class="link">Back to <a href="/api/customer/dashboard">Dashboard</a></p>
    </div>
</body>
</html>
