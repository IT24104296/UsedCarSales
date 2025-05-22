package models;

public class Transaction {
    private String transactionId;
    private String carId;
    private String buyerUsername;
    private String date;
    private String status;

    public Transaction(String transactionId, String carId, String buyerUsername, String date, String status) {
        this.transactionId = transactionId;
        this.carId = carId;
        this.buyerUsername = buyerUsername;
        this.date = date;
        this.status = status;
    }


    public String getTransactionId() { return transactionId; }
    public void setTransactionId(String transactionId) { this.transactionId = transactionId; }

    public String getCarId() { return carId; }
    public void setCarId(String carId) { this.carId = carId; }

    public String getBuyerUsername() { return buyerUsername; }
    public void setBuyerUsername(String buyerUsername) { this.buyerUsername = buyerUsername; }

    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
