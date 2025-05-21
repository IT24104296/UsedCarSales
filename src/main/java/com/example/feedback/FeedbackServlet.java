package com.example.feedback;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

@WebServlet(name = "FeedbackServlet", urlPatterns = {"/listFeedback", "/deleteFeedback"})
public class FeedbackServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form data
        int rating = Integer.parseInt(request.getParameter("rating"));
        String couldDoBetter = request.getParameter("couldDoBetter");

        // Create feedback object
        Feedback feedback = new Feedback();
        feedback.setRating(rating);
        feedback.setCouldDoBetter(couldDoBetter);
        feedback.setTimestamp(new Date().toString());

        // Store feedback in session
        HttpSession session = request.getSession();
        List<Feedback> feedbackList = (List<Feedback>) session.getAttribute("feedbackList");
        if (feedbackList == null) {
            feedbackList = new ArrayList<>();
        }
        feedbackList.add(feedback);
        session.setAttribute("feedbackList", feedbackList);

        // Redirect to list page with status
        response.sendRedirect("listFeedback?status=success");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getServletPath();

        if ("/listFeedback".equals(path)) {
            HttpSession session = request.getSession();
            List<Feedback> feedbackList = (List<Feedback>) session.getAttribute("feedbackList");
            if (feedbackList == null) {
                feedbackList = new ArrayList<>();
            }
            request.setAttribute("feedbackList", feedbackList);
            request.getRequestDispatcher("listFeedback.jsp").forward(request, response);

        } else if ("/deleteFeedback".equals(path)) {
            int index = Integer.parseInt(request.getParameter("id")); // using index instead of DB ID
            HttpSession session = request.getSession();
            List<Feedback> feedbackList = (List<Feedback>) session.getAttribute("feedbackList");

            if (feedbackList != null && index >= 0 && index < feedbackList.size()) {
                feedbackList.remove(index);
                session.setAttribute("feedbackList", feedbackList);
                response.sendRedirect("listFeedback?status=deleted");
            } else {
                response.sendRedirect("listFeedback?status=error");
            }
        }
    }
}
