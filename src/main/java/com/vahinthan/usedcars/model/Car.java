package com.vahinthan.usedcars.model;

import java.io.Serializable;

public class Car implements Serializable {
    private String id;
    private String brand;
    private String model;
    private int year;
    private double price;

    // Constructor
    public Car(String id, String brand, String model, int year, double price) {
        this.id = id;
        this.brand = brand;
        this.model = model;
        this.year = year;
        this.price = price;
    }

    // Getters
    public String getId() {
        return id;
    }

    public String getBrand() {
        return brand;
    }

    public String getModel() {
        return model;
    }

    public int getYear() {
        return year;
    }

    public double getPrice() {
        return price;
    }

    // Setters
    public void setId(String id) {
        this.id = id;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    // toString() – useful for debugging/logging
    @Override
    public String toString() {
        return id + "," + brand + "," + model + "," + year + "," + price;
    }
}
