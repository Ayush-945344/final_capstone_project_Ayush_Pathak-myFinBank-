<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Transactions - MyFinBank</title>
    <link rel="stylesheet" href="/css/styles.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e9ecef; /* Light background for readability */
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
            background-color: #005f51; /* Darker shade of theme color on hover */
        }

        .container {
            width: 600px;
            margin: auto;
            padding: 30px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }

        h2 {
            text-align: center;
            color: #00796b; /* Principal theme color */
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f8f9fa; /* Light background for table header */
        }

        .link {
            text-align: center;
        }

        .link a {
            color: #00796b; /* Principal theme color */
        }

        /* Styles for messages */
        .message {
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .message.success {
            color: green;
        }
        .message.error {
            color: red;
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
    <h2>View Transactions Form</h2>
    <form action="/api/customer/transactions/${accountId}" method="get">
        <label for="accountId">Account ID:</label>
        <input type="number" id="accountId" name="accountId" required />
        <button type="submit" class="btn">View Transactions</button>
    </form>

    <%
    if (request.getAttribute("message") != null) {
    %>
    <div class="message success">
        <%= request.getAttribute("message") %>
    </div>
    <%
    }
    %>
    <%
    if (request.getAttribute("error") != null) {
    %>
    <div class="message error">
        <%= request.getAttribute("error") %>
    </div>
    <%
    }
    %>
    <table>
        <thead>
            <tr>
                <th>Date</th>
                <th>Type</th>
                <th>Amount</th>
                <th>Balance After</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="transaction" items="${transactions}">
                <tr>
                    <td>${transaction.date}</td>
                    <td>${transaction.type}</td>
                    <td>${transaction.amount}</td>
                    <td>${transaction.balanceAfter}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <p class="link">
        Back to <a href="/api/customer/dashboard">Dashboard</a>
    </p>
</div>
</body>
</html>
