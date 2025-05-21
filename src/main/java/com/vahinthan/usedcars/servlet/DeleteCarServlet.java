package com.vahinthan.usedcars.servlet;

import com.vahinthan.usedcars.dao.CarDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class DeleteCarServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String id = req.getParameter("id");
        CarDAO.deleteCar(id);
        resp.sendRedirect("list");
    }
}
