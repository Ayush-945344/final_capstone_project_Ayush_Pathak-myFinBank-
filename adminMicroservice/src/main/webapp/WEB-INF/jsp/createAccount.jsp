<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.myfinbank.admin.dto.CustomerAccountDTO" %>
<%@ page import="com.myfinbank.admin.dto.AccountDTO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Account - MyFinBank</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            color: #495057;
            margin: 0;
            padding: 0;
        }

        nav {
            background-color: #00796b; /* Principal theme color */
            color: white;
            padding: 15px 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
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
            color: white; /* White text color for the heading */
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
            background-color: #004d99; /* Slightly darker shade for hover */
        }

        h1 {
            text-align: center;
            margin-top: 30px;
            color: #00796b; /* Principal theme color */
        }

        .form-container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        label {
            display: block;
            margin: 10px 0 5px;
            color: #495057;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #00796b; /* Principal theme color */
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #004d99; /* Slightly darker shade for hover */
        }

        .back-link {
            display: inline-block;
            margin-top: 15px;
            color: #00796b; /* Principal theme color for links */
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s;
        }

        .back-link:hover {
            color: #004d99;
        }
    </style>
</head>
<body>
    <nav>
        <div class="logo">
            <i class="fas fa-university"></i>
            <h2>MyFinBank Admin</h2>
        </div>
        <ul>
            <li><a href="/api/admin/dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            <li><a href="/api/admin/customers"><i class="fas fa-users"></i> Manage Customers</a></li>
            <li><a href="/api/admin/accounts"><i class="fas fa-money-bill-wave"></i> Manage Accounts</a></li>
        </ul>
    </nav>

    <div class="form-container">
        <h1>Create Account for Customer ID: <%= request.getAttribute("customerId") %></h1>

        <form action="/api/admin/customers/<%= request.getAttribute("customerId") %>/accounts" method="post">
            <label for="accountNumber">Account Number:</label>
            <input type="text" id="accountNumber" name="accountNumber" required>

            <label for="balance">Initial Balance:</label>
            <input type="number" id="balance" name="balance" step="0.01" required>

            <input type="submit" value="Create Account">
        </form>
        
        <a href="/api/admin/customers" class="back-link"><i class="fas fa-arrow-left"></i> Back to Customer List</a>
    </div>
</body>
</html>
