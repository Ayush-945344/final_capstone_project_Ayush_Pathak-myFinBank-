<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.myfinbank.customer.model.Transaction"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Transactions - MyFinBank</title>
    <link rel="stylesheet" href="/css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5; /* Light background color */
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
            background-color: #005f51; /* Darker shade of theme color on hover */
        }

        .container {
            width: 600px; /* Adjusted width for better readability */
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin: 50px auto; /* Center the container */
        }

        h2 {
            color: #00796b; /* Principal theme color */
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #00796b; /* Theme color for table header */
            color: white;
        }

        td {
            background-color: #f9f9f9; /* Light background for table cells */
        }

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #00796b; /* Theme color for links */
            text-decoration: none;
            transition: color 0.3s;
        }

        a:hover {
            color: #005f51; /* Darker shade of theme color on hover */
        }

        .link {
            text-align: center;
            margin-top: 15px;
        }

        .link a {
            color: #00796b; /* Theme color for links */
        }
    </style>
</head>
<body>
    <nav>
        <ul>
            <li><a href="/api/customer/dashboard" aria-label="Dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            <li><a href="/api/customer/account/details" aria-label="Account Details"><i class="fas fa-wallet"></i> Account Details</a></li>
        </ul>
    </nav>
    <div class="container">
        <h2>Transaction History for Account ID: <%=request.getAttribute("accountId")%></h2>

        <table>
            <tr>
                <th>Transaction ID</th>
                <th>Amount</th>
                <th>Type</th>
                <th>Date</th>
            </tr>
            <%
            List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            if (transactions != null && !transactions.isEmpty()) {
                for (Transaction transaction : transactions) {
            %>
            <tr>
                <td><%=transaction.getTransactionId()%></td>
                <td><%=transaction.getAmount()%></td>
                <td><%=transaction.getType()%></td>
                <td><%=transaction.getDate().format(formatter) %></td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="4">No transactions found.</td>
            </tr>
            <%
            }
            %>
        </table>

        <a href="/api/customer/transactions">Back to Transaction Form</a>
        
        <p class="link">Back to <a href="/api/customer/dashboard">Dashboard</a></p>
    </div>
</body>
</html>
