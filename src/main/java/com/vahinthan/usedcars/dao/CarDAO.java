package com.vahinthan.usedcars.dao;

import com.vahinthan.usedcars.model.Car;
import java.util.*;
import java.io.FileWriter;
import java.io.BufferedWriter;
import java.io.IOException;


public class CarDAO {
    private static final List<Car> carList = new ArrayList<>();
    private static final String FILE_PATH = "/servlet/used_cars.txt";

    private Object used_cars;

    public static void addCar(Car car) {
        carList.add(car);
    }

    public static List<Car> getAllCars() {
        return carList;
    }

    public static void deleteCar(String id) {
        carList.removeIf(car -> car.getId().equals(id));
    }

    public Car getCarById(String id) {
        for (Car car : getAllCars()) {
            if (car.getId().equals(id)) {
                return car;
            }
        }
        return null;
    }
    public void updateCar(Car updatedCar) {
        List<Car> cars = getAllCars();
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Car car : cars) {
                Car toWrite = car.getId().equals(updatedCar.getId()) ? updatedCar : car;
                bw.write(toWrite.getId() + "," +
                        toWrite.getBrand() + "," +
                        toWrite.getModel() + "," +
                        toWrite.getYear() + "," +
                        toWrite.getPrice());
                bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
