package com.example.feedback;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Iterator;

@WebServlet("/DeleteFeedbackServlet")
public class DeleteFeedbackServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        HttpSession session = request.getSession();
        List<Feedback> feedbackList = (List<Feedback>) session.getAttribute("feedbackList");

        if (feedbackList != null) {
            Iterator<Feedback> iterator = feedbackList.iterator();
            while (iterator.hasNext()) {
                Feedback fb = iterator.next();
                if (fb.getId() == id) {
                    iterator.remove();
                    break;
                }
            }
        }

        // Update session attribute
        session.setAttribute("feedbackList", feedbackList);

        // Redirect back to list page
        response.sendRedirect("listFeedback.jsp");
    }
}
