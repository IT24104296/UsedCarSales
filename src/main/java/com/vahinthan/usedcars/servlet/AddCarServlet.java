package com.vahinthan.usedcars.servlet;

import com.vahinthan.usedcars.model.Car;
import com.vahinthan.usedcars.dao.CarDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.UUID;

public class AddCarServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String id = UUID.randomUUID().toString();
        String brand = req.getParameter("brand");
        String model = req.getParameter("model");
        int year = Integer.parseInt(req.getParameter("year"));
        double price = Double.parseDouble(req.getParameter("price"));

        Car car = new Car(id, brand, model, year, price);
        CarDAO.addCar(car);
        resp.sendRedirect("list");
    }
}
