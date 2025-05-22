package com.vahinthan.usedcars.servlet;

import com.vahinthan.usedcars.dao.CarDAO;
import com.vahinthan.usedcars.model.Car;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/updateCar")
public class UpdateCarServlet extends HttpServlet {

    private final CarDAO carDAO = new CarDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");

        if (id != null) {
            Car car = carDAO.getCarById(id);
            if (car != null) {
                request.setAttribute("car", car);
                RequestDispatcher dispatcher = request.getRequestDispatcher("updateCar.jsp");
                dispatcher.forward(request, response);
                return;
            }
        }

        response.sendRedirect("list"); // fallback if ID not found
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        int year = Integer.parseInt(request.getParameter("year"));
        double price = Double.parseDouble(request.getParameter("price"));

        Car updatedCar = new Car(id, brand, model, year, price);
        carDAO.updateCar(updatedCar);

        response.sendRedirect("list");
    }
}
