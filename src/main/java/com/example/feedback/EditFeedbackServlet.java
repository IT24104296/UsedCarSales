package com.example.feedback;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/EditFeedbackServlet")
public class EditFeedbackServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        HttpSession session = request.getSession();
        List<Feedback> feedbackList = (List<Feedback>) session.getAttribute("feedbackList");

        Feedback editFeedback = null;
        if (feedbackList != null) {
            for (Feedback fb : feedbackList) {
                if (fb.getId() == id) {
                    editFeedback = fb;
                    break;
                }
            }
        }

        if (editFeedback != null) {
            request.setAttribute("feedback", editFeedback);
            // Forward to edit page with feedback object to prefill form
            request.getRequestDispatcher("editfeedback.jsp").forward(request, response);
        } else {
            // Feedback not found, redirect back to list
            response.sendRedirect("listFeedback.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int rating = Integer.parseInt(request.getParameter("rating"));
        String couldDoBetter = request.getParameter("couldDoBetter");

        HttpSession session = request.getSession();
        List<Feedback> feedbackList = (List<Feedback>) session.getAttribute("feedbackList");

        if (feedbackList != null) {
            for (Feedback fb : feedbackList) {
                if (fb.getId() == id) {
                    fb.setRating(rating);
                    fb.setCouldDoBetter(couldDoBetter);
                    fb.setTimestamp(new java.util.Date());
                    break;
                }
            }
        }

        session.setAttribute("feedbackList", feedbackList);

        // After update, redirect to list page
        response.sendRedirect("listFeedback.jsp");
    }
}
