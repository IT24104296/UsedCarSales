package com.vahinthan.usedcars.servlet;

import com.vahinthan.usedcars.dao.CarDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class CarListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("cars", CarDAO.getAllCars());
        RequestDispatcher dispatcher = req.getRequestDispatcher("listCars.jsp");
        dispatcher.forward(req, resp);
    }
}
