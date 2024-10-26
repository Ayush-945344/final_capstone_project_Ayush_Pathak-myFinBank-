<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Account Detail - MyFinBank</title>
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

        h1 {
            text-align: center;
            margin-top: 30px;
            color: #005b4d;
        }

        .account-detail {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: 20px auto;
            padding: 20px;
            text-align: center;
        }

        .account-detail p {
            font-size: 18px;
            color: #333;
            margin: 10px 0;
        }

        .back-link {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 15px;
            background-color: #00796b;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .back-link:hover {
            background-color: #005b4d;
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
            <h2 style="margin: 0;">MyFinBank</h2>
        </div>
        <ul>
            <li><a href="/api/admin/dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            <li><a href="/api/admin/accounts"><i class="fas fa-list"></i> Accounts</a></li>
        </ul>
    </nav>

    <h1>Account Detail</h1>
    <div class="account-detail">
        <p><strong>Account ID:</strong> ${account.id}</p>
        <p><strong>Account Number:</strong> ${account.accountNumber}</p>
        <p><strong>Balance:</strong> ${account.balance}</p>
    </div>
    <a href="/api/admin/accounts" class="back-link">Back to Account List</a>

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
