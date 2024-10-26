<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Account Details - MyFinBank</title>
    <link rel="stylesheet" href="/css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e9ecef;
            color: #495057;
            margin: 0;
            padding: 0;
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

        nav .title {
            font-size: 24px;
            display: flex;
            align-items: center;
        }

        nav .title i {
            margin-right: 8px;
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
            background-color: #005bb5;
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

        p {
            font-size: 18px;
            margin: 10px 0;
        }

        .btn {
            display: block;
            width: 100%;
            padding: 12px;
            background-color: #00796b;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
            text-align: center;
        }

        .btn:hover {
            background-color: #005bb5;
        }

        footer {
            background-color: #00796b;
            padding: 10px;
            color: white;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        footer a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
        }

        footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>	
    <form:form id="custAcctForm" modelAttribute="account">  
        <nav>
            <div class="title">
                <i class="fas fa-university"></i> MyFinBank
            </div>
            <ul>
                <li><a href="/api/customer/dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                <li><a href="/api/customer/deposit"><i class="fas fa-plus"></i> Deposit</a></li>
                <li><a href="/api/customer/withdraw"><i class="fas fa-minus"></i> Withdraw</a></li>
            </ul>
        </nav>

        <div class="container">
            <h2>Your Account Details</h2>
            <p>Account Number: ${account.accountNumber}</p>
            <p>Balance: ${account.balance}</p>
            <button class="btn" onclick="window.location.href='/api/customer/dashboard'">Back to Dashboard</button>
        </div>
    </form:form>

    <footer>
        <a href="/api/customer/profile">Profile</a> |
        <a href="/api/customer/settings">Settings</a> |
        <a href="/api/customer/help">Help</a>
    </footer>
</body>
</html>
