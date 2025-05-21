package com.carapp.servlet;

import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import com.carapp.chatbot.ChatbotService;

// Servlet mapped to /chatbot URL
@WebServlet("/chatbot")
public class ChatbotServlet extends HttpServlet {

    private ChatbotService chatbotService;
    private Gson gson;

    @Override
    public void init() throws ServletException {
        chatbotService = new ChatbotService();
        gson = new Gson();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String message = request.getParameter("message");
        String reply = chatbotService.getReply(message);

        Map<String, String> jsonResponse = new HashMap<>();
        jsonResponse.put("reply", reply);

        String json = gson.toJson(jsonResponse);

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();
    }
}
