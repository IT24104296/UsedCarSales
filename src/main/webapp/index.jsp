<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction Management</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center px-4">
<div class="max-w-2xl w-full bg-white p-8 rounded-lg shadow-2xl">
    <h1 class="text-3xl font-bold text-center text-blue-700 mb-6">Transaction Management</h1>
    <div class="space-y-4">
        <a href="PurchaseCar.jsp"
           class="block w-full text-center bg-blue-500 hover:bg-blue-600 text-white font-semibold py-3 px-4 rounded-lg transition duration-200">
            Purchase a Car
        </a>
        <a href="TransactionStatus.jsp"
           class="block w-full text-center bg-yellow-500 hover:bg-yellow-600 text-white font-semibold py-3 px-4 rounded-lg transition duration-200">
            View Transaction Status
        </a>
        <a href="TransactionServlet"
           class="block w-full text-center bg-green-500 hover:bg-green-600 text-white font-semibold py-3 px-4 rounded-lg transition duration-200">
            View Transaction History
        </a>
    </div>
</div>
</body>
</html>
