<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Purchase Car</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('https://images.unsplash.com/photo-1503376780353-7e6692767b70?auto=format&fit=crop&w=1950&q=80');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
        .bg-overlay {
            background-color: rgba(255, 255, 255, 0.9);
        }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center">
<div class="w-full max-w-lg bg-overlay rounded-xl shadow-xl p-8 backdrop-blur-md">
    <h2 class="text-3xl font-extrabold text-blue-700 text-center mb-6">🚗 Purchase a Car</h2>

    <%-- Display error message if present --%>
    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
    <div class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4 mb-6" role="alert">
        <p><%= error %></p>
    </div>
    <% } %>

    <form action="TransactionServlet" method="post" class="space-y-6">
        <div>
            <label for="transactionId" class="block text-sm font-semibold text-gray-700">Transaction ID</label>
            <input type="text" id="transactionId" name="transactionId" required
                   class="mt-1 w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400">
        </div>
        <div>
            <label for="buyerUsername" class="block text-sm font-semibold text-gray-700">Buyer Username</label>
            <input type="text" id="buyerUsername" name="buyerUsername" required
                   class="mt-1 w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400">
        </div>
        <div>
            <label for="carId" class="block text-sm font-semibold text-gray-700">Car ID</label>
            <input type="text" id="carId" name="carId" required
                   class="mt-1 w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400">
        </div>
        <div>
            <label for="date" class="block text-sm font-semibold text-gray-700">Date</label>
            <input type="date" id="date" name="date" required
                   class="mt-1 w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-400">
        </div>
        <button type="submit"
                class="w-full bg-blue-600 hover:bg-blue-700 text-white font-bold py-3 px-4 rounded-md transition duration-200">
            🚀 Confirm Purchase
        </button>
    </form>
</div>
</body>
</html>