package com.app;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/components/user")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String regName = request.getParameter("regName");
        String regEmail = request.getParameter("regEmail");
        String regContact = request.getParameter("regContact");
        String regRole = request.getParameter("regRole");
        String password = request.getParameter("password");

        System.out.println("Form received: " + regName + ", " + regEmail);

        boolean success = RegisterDB.saveUser(regName, regEmail, regContact, regRole, password);

        if (success) {
            request.getRequestDispatcher("/Register/register_success.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/Register/register_error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().write("GET request received. RegisterServlet is deployed.");
    }
}
