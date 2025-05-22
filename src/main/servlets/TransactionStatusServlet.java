package servlets;

import models.Transaction;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.*;

public class TransactionStatusServlet extends HttpServlet {
    private final String FILE_PATH = "transactions.txt";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Transaction> transactions = new ArrayList<>();

        File file = new File(FILE_PATH);
        if (file.exists()) {
            BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH));
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 5) {
                    transactions.add(new Transaction(parts[0], parts[1], parts[2], parts[3], parts[4]));
                }
            }
            reader.close();
        }

        request.setAttribute("transactions", transactions);
        RequestDispatcher dispatcher = request.getRequestDispatcher("TransactionStatus.jsp");
        dispatcher.forward(request, response);
    }
}
