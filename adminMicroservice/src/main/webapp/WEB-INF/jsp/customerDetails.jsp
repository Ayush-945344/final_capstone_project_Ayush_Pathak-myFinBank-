<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.myfinbank.admin.dto.CustomerAccountDTO" %>
<%@ page import="com.myfinbank.admin.dto.AccountDTO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Detail - MyFinBank</title>
    <link rel="stylesheet" href="/css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Your principal theme styles here */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e9ecef;
            color: #343a40;
            margin: 0;
            padding: 0;
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

        nav h2, nav img {
            margin: 0;
            display: inline;
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
            background-color: #006056;
        }

        .logout-button {
            background: none;
            border: none;
            color: white;
            cursor: pointer;
            font-size: 16px;
        }

        h1, h2 {
            text-align: center;
            color: #00796b;
            margin: 20px 0;
        }

        .customer-info, table {
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        th {
            background-color: #00796b;
            color: white;
        }

        .action-button, .center-button a {
            background-color: #00796b;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
        }

        .back-link {
            text-align: center;
            color: #00796b;
            margin-top: 20px;
        }

        .footer {
            background-color: #00796b;
            padding: 10px 0;
            color: white;
            text-align: center;
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <nav>
        <div>
            <img src="/images/bank_icon.png" alt="Bank Icon" style="width: 30px; vertical-align: middle;">
            <h2 style="display: inline;"> MyFinBank</h2>
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

    <h1>Customer Detail</h1>
    <%
        CustomerAccountDTO customer = (CustomerAccountDTO) request.getAttribute("customer");
        if (customer != null) {
    %>
    <div class="customer-info">
        <p><strong>ID:</strong> <%= customer.getCustomerId() %></p>
        <p><strong>Username:</strong> <%= customer.getUsername() %></p>
        <p><strong>Email:</strong> <%= customer.getEmail() %></p>
        <p><strong>Status:</strong> <%= customer.isActive() ? "Active" : "Inactive" %></p>
    </div>

    <h2>Accounts</h2>
    <table>
        <thead>
            <tr>
                <th>Account Number</th>
                <th>Balance</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<AccountDTO> accounts = customer.getAccounts();
                if (accounts != null) {
                    for (AccountDTO account : accounts) {
            %>
            <tr>
                <td><%= account.getAccountNumber() %></td>
                <td><%= account.getBalance() %></td>
                <td>
                    <a href="/admin/accounts/<%= account.getId() %>/edit" class="action-button">Update</a>
                    <form action="/admin/accounts/<%= account.getId() %>" method="post" style="display: inline;">
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

    <div class="center-button">
        <a href="/api/admin/customers/<%= customer.getCustomerId() %>/accounts/create" class="action-button">Create New Account</a>
    </div>

    <a href="/api/admin/customers" class="back-link">Back to Customer List</a>
    <%
        }
    %>

    <footer class="footer">
        <p>&copy; 2024 MyFinBank. All rights reserved.</p>
    </footer>
</body>
</html>
