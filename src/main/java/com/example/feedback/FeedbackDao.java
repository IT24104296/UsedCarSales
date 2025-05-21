package com.example.feedback;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDao {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/feedback_db";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "password";

    private static final String INSERT_SQL = "INSERT INTO feedback (rating, could_do_better) VALUES (?, ?)";
    private static final String SELECT_ALL_SQL = "SELECT * FROM feedback ORDER BY timestamp DESC";
    private static final String DELETE_SQL = "DELETE FROM feedback WHERE id = ?";

    public FeedbackDao() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }


        public boolean addFeedback(Feedback feedback) {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement statement = connection.prepareStatement(INSERT_SQL)) {

            statement.setInt(1, feedback.getRating());
            statement.setString(2, feedback.getCouldDoBetter());

            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Feedback> getAllFeedback() {
        List<Feedback> feedbackList = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(SELECT_ALL_SQL)) {

            while (resultSet.next()) {
                Feedback feedback = new Feedback();
                feedback.setId(resultSet.getInt("id"));
                feedback.setRating(resultSet.getInt("rating"));
                feedback.setCouldDoBetter(resultSet.getString("could_do_better"));
                feedback.setTimestamp(resultSet.getString("timestamp"));

                feedbackList.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return feedbackList;
    }

    public boolean deleteFeedback(int id) {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement statement = connection.prepareStatement(DELETE_SQL)) {

            statement.setInt(1, id);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
