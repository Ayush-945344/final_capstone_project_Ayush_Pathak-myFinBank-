<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.myfinbank.admin.dto.AccountDTO" %>
<%@ page import="com.myfinbank.admin.dto.CustomerAccountDTO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Account List - MyFinBank</title>
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
            color: #00796b;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #00796b;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .action-button {
            background-color: #00796b;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .action-button:hover {
            background-color: #005b4d;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-size: 16px;
            color: #00796b;
            text-decoration: none;
            transition: color 0.3s;
        }

        .back-link:hover {
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
            <h2 style="margin: 0;">MyFinBank</h2>
        </div>
        <ul>
            <li><a href="/api/admin/dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            <li><a href="/api/admin/customers"><i class="fas fa-users"></i> Manage Customers</a></li>
            <li><a href="/api/admin/loans"><i class="fas fa-money-bill"></i> Manage Loans</a></li>
            <li>
                <form action="/api/admin/logout" method="POST" style="display: inline;">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    <button type="submit" class="logout-button">Logout</button>
                </form>
            </li>
        </ul>
    </nav>

    <h1>Accounts for Customers:</h1>
    <table>
        <thead>
            <tr>
                <th>Account ID</th>
                <th>Account Number</th>
                <th>Balance</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<AccountDTO> accounts = (List<AccountDTO>) request.getAttribute("accounts");
                if (accounts != null) {
                    for (AccountDTO account : accounts) {
            %>
            <tr>
                <td><%= account.getId() %></td>
                <td><%= account.getAccountNumber() %></td>
                <td><%= account.getBalance() %></td>
                <td>
                    <form action="/api/admin/accounts/update<%= account.getId() %>" method="put" style="display:inline;">
                        <input type="submit" value="Update" class="action-button" />
                    </form>
                    <form action="/api/admin/accounts/<%= account.getId() %>" method="post" style="display:inline;">
                        <input type="submit" value="Delete" class="action-button" />
                    </form>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
    <a href="/api/admin/customers" class="back-link">Back to Customer List</a>

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
