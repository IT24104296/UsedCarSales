package com.vahinthan.usedcars.dao;

import com.vahinthan.usedcars.model.Car;
import java.io.*;
import java.util.*;
import java.nio.file.*;


public class CarDAO {
    private static final List<Car> carList = new ArrayList<>();
    private static final String FILE_PATH = "C:\\Users\\Vahinthan\\IdeaProjects\\OOPprojectlatest\\OOP1v\\data\\used_cars.txt"; // relative path

    static {
        loadCarsFromFile();
    }

    private static void loadCarsFromFile() {
        carList.clear();
        try (BufferedReader br = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 5) {
                    String id = parts[0];
                    String brand = parts[1];
                    String model = parts[2];
                    int year = Integer.parseInt(parts[3]);
                    double price = Double.parseDouble(parts[4]);
                    carList.add(new Car(id, brand, model, year, price));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void saveCarsToFile() {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Car car : carList) {
                bw.write(car.toString());
                bw.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void addCar(Car car) {
        carList.add(car);
        saveCarsToFile();
    }

    public static List<Car> getAllCars() {
        return carList;
    }

    public static void deleteCar(String id) {
        carList.removeIf(car -> car.getId().equals(id));
        saveCarsToFile();
    }

    public Car getCarById(String id) {
        for (Car car : carList) {
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

        // 💡 Reload the list from file so in-memory list stays updated
        loadCarsFromFile();
    }

}
