package com.example.feedback;

public class Feedback {
    private int id;
    private int rating;
    private String couldDoBetter;
    private String timestamp;

    public Feedback() {}

    public Feedback(int rating, String couldDoBetter) {
        this.rating = rating;
        this.couldDoBetter = couldDoBetter;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }

    public String getCouldDoBetter() { return couldDoBetter; }
    public void setCouldDoBetter(String couldDoBetter) { this.couldDoBetter = couldDoBetter; }

    public String getTimestamp() { return timestamp; }
    public void setTimestamp(String timestamp) { this.timestamp = timestamp; }
}
