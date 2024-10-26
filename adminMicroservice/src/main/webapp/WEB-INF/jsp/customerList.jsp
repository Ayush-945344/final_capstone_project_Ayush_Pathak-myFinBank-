<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.myfinbank.admin.dto.CustomerAccountDTO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer List - MyFinBank</title>
    <link rel="stylesheet" href="/css/styles.css">
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
            background-color: #004d40;
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
            color: #00796b;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
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
            background-color: #004d40;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-size: 16px;
            color: #00796b;
            text-decoration: none;
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

    <h1>Customer List</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<CustomerAccountDTO> customers = (List<CustomerAccountDTO>) request.getAttribute("customers");
                if (customers != null) {
                    for (CustomerAccountDTO customer : customers) {
            %>
            <tr>
                <td><%= customer.getCustomerId() %></td>
                <td><%= customer.getUsername() %></td>
                <td><%= customer.getEmail() %></td>
                <td><%= customer.isActive() ? "Active" : "Inactive" %></td>
                <td>
                    <form action="/api/admin/customers/activate/<%= customer.getCustomerId() %>" method="post" style="display:inline;">
                        <input type="submit" value="Activate" class="action-button" />
                    </form>
                    <form action="/api/admin/customers/deactivate/<%= customer.getCustomerId() %>" method="post" style="display:inline;">
                        <input type="submit" value="Deactivate" class="action-button" />
                    </form>
                    <a href="/api/admin/customers/<%= customer.getCustomerId() %>" class="action-button">View Details</a>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
    <a href="/api/admin/dashboard" class="back-link">Back to Dashboard</a>

    <footer class="footer">
        <p>&copy; 2024 MyFinBank. All rights reserved.</p>
    </footer>
</body>
</html>
