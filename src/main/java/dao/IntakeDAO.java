package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;
import model.Intake;

public class IntakeDAO {

    // INSERT NEW INTAKE
    public boolean addIntake(Intake in) {
        String sql = "INSERT INTO intake(amount, time, date, status, user_id) VALUES(?,?,?,?,?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, in.getAmount());
            ps.setString(2, in.getTime());
            ps.setString(3, in.getDate());
            ps.setString(4, in.getStatus());
            ps.setInt(5, in.getUserId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    // DELETE INTAKE
    public boolean deleteIntake(int id) {
        String sql = "DELETE FROM intake WHERE id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    // UPDATE STATUS (Tick)
    public boolean updateStatus(int id, String status) {
        String sql = "UPDATE intake SET status=? WHERE id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setInt(2, id);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    // PENDING LIST (To-Do Page)
    public List<Intake> getPendingIntakes(int userId) {
        List<Intake> list = new ArrayList<>();

        String sql = "SELECT * FROM intake WHERE status='pending' AND user_id=? ORDER BY id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapIntake(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    // COMPLETE LIST (Dashboard)
    public List<Intake> getRecords(int userId) {
        List<Intake> list = new ArrayList<>();

        String sql = "SELECT * FROM intake WHERE user_id=? ORDER BY id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(mapIntake(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    // ALL INTAKES (for view.jsp)
    public List<Intake> getAllIntakes() {
        List<Intake> list = new ArrayList<>();

        String sql = "SELECT * FROM intake ORDER BY id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(mapIntake(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }


    // MAP RESULTSET TO MODEL
    private Intake mapIntake(ResultSet rs) throws Exception {
        Intake in = new Intake();
        in.setId(rs.getInt("id"));
        in.setAmount(rs.getInt("amount"));
        in.setTime(rs.getString("time"));
        in.setDate(rs.getString("date"));
        in.setStatus(rs.getString("status"));
        in.setUserId(rs.getInt("user_id"));
        return in;
    }
}
