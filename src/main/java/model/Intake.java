package model;

public class Intake {

    private int id;
    private int amount;
    private String time;
    private String date;
    private String status;
    private int userId;

    public Intake() {}

    public Intake(int amount, String time, String date, int userId) {
        this.amount = amount;
        this.time = time;
        this.date = date;
        this.userId = userId;
        this.status = "pending";
    }

    // ============================
    // 👉 ADDED CONSTRUCTORS BELOW
    // ============================

    // Full constructor (used by DAO mapping)
    public Intake(int id, int amount, String time, String date, String status, int userId) {
        this.id = id;
        this.amount = amount;
        this.time = time;
        this.date = date;
        this.status = status;
        this.userId = userId;
    }

    // Constructor used when status is provided manually
    public Intake(int amount, String time, String date, String status, int userId) {
        this.amount = amount;
        this.time = time;
        this.date = date;
        this.status = status;
        this.userId = userId;
    }

    // Constructor without userId (fallback)
    public Intake(int amount, String time, String date) {
        this.amount = amount;
        this.time = time;
        this.date = date;
        this.status = "pending";
    }

    // ============================


    // getters & setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getAmount() { return amount; }
    public void setAmount(int amount) { this.amount = amount; }

    public String getTime() { return time; }
    public void setTime(String time) { this.time = time; }

    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
}
