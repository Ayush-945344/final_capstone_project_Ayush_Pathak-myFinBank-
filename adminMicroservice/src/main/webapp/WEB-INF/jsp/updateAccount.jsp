<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Account - MyFinBank</title>
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
            background-color: #00695c; /* Slightly darker shade for hover */
        }

        h2 {
            text-align: center;
            color: #00796b; /* Principal theme color */
            margin-top: 30px;
        }

        form {
            width: 50%;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
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
            background-color: #00695c; /* Slightly darker shade for hover */
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-size: 16px;
            color: #00796b; /* Principal theme color */
            text-decoration: none;
        }

        footer {
            background-color: #00796b; /* Principal theme color */
            color: white;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <nav>
        <div>
            <h2 style="margin: 0;"><i class="fas fa-university"></i> MyFinBank</h2>
        </div>
        <ul>
            <li><a href="/api/admin/dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            <li><a href="/api/admin/customers"><i class="fas fa-users"></i> Manage Customers</a></li>
            <li><a href="/api/admin/accounts/allaccounts"><i class="fas fa-briefcase"></i> Manage Accounts</a></li>
            <li>
                <form action="/api/admin/logout" method="POST" style="display: inline;">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    <button type="submit" class="logout-button" style="background: none; border: none; color: white; cursor: pointer;">Logout</button>
                </form>
            </li>
        </ul>
    </nav>

    <h2>Update Account</h2>
    <form:form method="post" modelAttribute="accountDTO" action="/api/admin/accounts/update/${accountDTO.id}">
        <label for="accountNumber">Account Number:</label>
        <form:input path="accountNumber" id="accountNumber" required="true" /><br/>

        <label for="balance">Balance:</label>
        <form:input path="balance" id="balance" required="true" type="number" step="0.01"/><br/>

        <label for="customerId">Customer:</label>
        <form:select path="customer.id" id="customerId" required="true">
            <c:forEach var="customer" items="${customers}">
                <option value="${customer.id}" <c:if test="${customer.id == accountDTO.customer.id}">selected</c:if>>${customer.name}</option>
            </c:forEach>
        </form:select><br/>

        <input type="submit" value="Update Account" />
    </form:form>
    <a href="/api/admin/accounts/allaccounts" class="back-link">Back to Account List</a>

    <footer>
        <p>&copy; 2024 MyFinBank. All rights reserved.</p>
    </footer>
</body>
</html>
