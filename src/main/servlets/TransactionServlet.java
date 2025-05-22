package servlets;

import models.Transaction;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.*;

public class TransactionServlet extends HttpServlet {
    private String getFilePath(ServletContext context) {
        return context.getRealPath("/WEB-INF/transactions.txt");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            String transactionId = request.getParameter("transactionId");
            String carId = request.getParameter("carId");
            String buyerUsername = request.getParameter("buyerUsername");
            String date = request.getParameter("date");
            String status = request.getParameter("status") != null ? request.getParameter("status") : "pending";

            if (transactionId == null || transactionId.trim().isEmpty() ||
                    carId == null || carId.trim().isEmpty() ||
                    buyerUsername == null || buyerUsername.trim().isEmpty() ||
                    date == null || date.trim().isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required parameters");
                return;
            }


            Transaction t = new Transaction(transactionId, carId, buyerUsername, date, status);


            File file = new File(getFilePath(getServletContext()));
            file.getParentFile().mkdirs();


            synchronized (this) {
                try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, true))) {
                    writer.write(String.join(",", transactionId, carId, buyerUsername, date, status));
                    writer.newLine();
                }
            }

            response.sendRedirect("TransactionHistory.jsp");
        } catch (IOException e) {
            log("Error writing transaction", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to save transaction");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Transaction> transactions = new ArrayList<>();
        File file = new File(getFilePath(getServletContext()));


        if (file.exists()) {
            try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    String[] parts = line.split(",", -1);
                    if (parts.length == 5) {
                        transactions.add(new Transaction(parts[0], parts[1], parts[2], parts[3], parts[4]));
                    }
                }
            } catch (IOException e) {
                log("Error reading transactions", e);
                request.setAttribute("error", "Failed to load transaction history");
            }
        } else {

            request.setAttribute("error", "No transactions found");
        }

        request.setAttribute("transactions", transactions);
        RequestDispatcher dispatcher = request.getRequestDispatcher("TransactionHistory.jsp");
        dispatcher.forward(request, response);
    }
}