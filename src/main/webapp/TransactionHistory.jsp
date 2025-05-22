<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, models.Transaction" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction History</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 min-h-screen flex items-center justify-center">
<div class="max-w-4xl w-full mx-auto mt-10 p-8 bg-white rounded-lg shadow-lg">
    <h2 class="text-3xl font-bold text-center text-blue-700 mb-6">Transaction History</h2>

    <% List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions"); %>
    <% if (transactions == null || transactions.isEmpty()) { %>
    <p class="text-center text-gray-600">No transactions found.</p>
    <% } else { %>
    <div class="overflow-x-auto">
        <table class="min-w-full bg-white border border-gray-200">
            <thead>
            <tr class="bg-blue-600 text-white">
                <th class="py-3 px-4 text-left">ID</th>
                <th class="py-3 px-4 text-left">Car ID</th>
                <th class="py-3 px-4 text-left">Buyer</th>
                <th class="py-3 px-4 text-left">Date</th>
                <th class="py-3 px-4 text-left">Status</th>
            </tr>
            </thead>
            <tbody>
            <% for (Transaction t : transactions) { %>
            <tr class="border-b hover:bg-gray-50">
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