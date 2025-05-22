<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, models.Transaction" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction Status</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('https://images.unsplash.com/photo-1603380376209-558dfdd9aa1d?auto=format&fit=crop&w=1950&q=80');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }
        .bg-overlay {
            background-color: rgba(255, 255, 255, 0.95);
        }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center px-4">

<div class="max-w-5xl w-full bg-overlay rounded-2xl shadow-xl p-10 backdrop-blur-md">
    <h1 class="text-3xl font-extrabold text-blue-800 text-center mb-8">📋 Transaction Status</h1>

    <% List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions"); %>
    <% if (transactions == null || transactions.isEmpty()) { %>
    <p class="text-center text-gray-700 font-medium">No transactions available.</p>
    <% } else { %>
    <div class="overflow-x-auto rounded-lg">
        <table class="min-w-full bg-white border border-gray-300 shadow-md rounded">
            <thead class="bg-blue-600 text-white text-sm">
            <tr>
                <th class="py-3 px-4 text-left">Transaction ID</th>
                <th class="py-3 px-4 text-left">Car ID</th>
                <th class="py-3 px-4 text-left">Buyer Username</th>
                <th class="py-3 px-4 text-left">Date</th>
                <th class="py-3 px-4 text-left">Status</th>
            </tr>
            </thead>
            <tbody class="text-sm text-gray-700">
            <% for (Transaction t : transactions) { %>
            <tr class="border-b hover:bg-blue-50 transition">
                <td class="py-3 px-4"><%= t.getTransactionId() %></td>
                <td class="py-3 px-4"><%= t.getCarId() %></td>
                <td class="py-3 px-4"><%= t.getBuyerUsername() %></td>
                <td class="py-3 px-4"><%= t.getDate() %></td>
                <td class="py-3 px-4"><%= t.getStatus() %></td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
    <% } %>
</div>

</body>
</html>
