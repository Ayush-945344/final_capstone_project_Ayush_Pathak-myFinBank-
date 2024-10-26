<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - MyFinBank</title>
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

        .logout-button {
            background: none;
            border: none;
            color: white;
            cursor: pointer;
            font-size: 16px;
        }

        h1 {
            text-align: center;
            margin-top: 30px;
            color: #005b4d;
        }

        .action-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
            max-width: 1200px;
            margin: auto;
        }

        .action-list a {
            background-color: #00796b;
            color: white;
            width: 280px;
            padding: 20px;
            border-radius: 8px;
            text-decoration: none;
            text-align: center;
            transition: background-color 0.3s, transform 0.3s;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            font-size: 16px;
            height: 180px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .action-list a:hover {
            background-color: #005b4d;
            transform: translateY(-3px);
        }

        .action-list i {
            font-size: 24px;
            margin-bottom: 10px;
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

        @media (max-width: 600px) {
            .action-list a {
                width: 90%;
            }
            nav ul {
                flex-direction: column;
                align-items: center;
            }
            nav ul li {
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>
    <nav>
        <div class="logo">
            <i class="fas fa-university"></i> <!-- Bank icon -->
            <h2 style="margin: 0;">MyFinBank</h2>
        </div>
        <ul>
            <li><a href="/api/admin/dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            <li><a href="/api/admin/customers"><i class="fas fa-users"></i> Manage Customers</a></li>
            <li>
                <form action="/api/admin/logout" method="POST" style="display: inline;">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    <button type="submit" class="logout-button">Logout</button>
                </form>
            </li>
        </ul>
    </nav>

    <h1>Welcome to the Admin Dashboard</h1>
    <div class="action-list">
        <a href="/api/admin/customers"><i class="fas fa-users"></i> View Customers</a>
        <a href="/api/admin/accounts"><i class="fas fa-list"></i> View Accounts</a>
        <a href="/api/admin/loans"><i class="fas fa-money-bill"></i> View Loans</a>
        <a href="/api/admin/notifications"><i class="fas fa-bell"></i> Notifications</a>
        <a href="/api/admin/support"><i class="fas fa-headset"></i> Customer Support</a>
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
