package com.bms.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bms.dto.Employee;

public class HRModel {

    public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    public static final String URL = "jdbc:mysql://localhost:3306/";
    public static final String DB_NAME = "e_care";
    public static final String USERNAME = "root";
    public static final String PASSWORD = "root";

    // -------------------------------------------------------------
    // DATABASE CONNECTION
    // -------------------------------------------------------------
    public static Connection makeConnection() {
        Connection con = null;
        try {
            Class.forName(DRIVER);
            con = DriverManager.getConnection(URL + DB_NAME, USERNAME, PASSWORD);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return con;
    }

    // -------------------------------------------------------------
    // 1) Get ALL employees (Accountant, Staff, Employee)
    // -------------------------------------------------------------
    public List<Employee> getUsers() {
        List<Employee> list = new ArrayList<>();
        Connection con = null;

        try {
            con = makeConnection();
            PreparedStatement ps = con.prepareStatement(
                "SELECT id, name, building_name, role " +
                "FROM users WHERE role IN ('Accountant', 'Staff', 'Employee')"
            );

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Employee(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("building_name"),
                    rs.getString("role")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    // -------------------------------------------------------------
    // 2) Check if attendance already exists for date
    // -------------------------------------------------------------
    public boolean isAttendanceExists(int userId, LocalDate date) {
        try (Connection con = makeConnection();
             PreparedStatement ps = con.prepareStatement(
                "SELECT id FROM attendance WHERE user_id = ? AND att_date = ?"
             )) {

            ps.setInt(1, userId);
            ps.setDate(2, java.sql.Date.valueOf(date));

            ResultSet rs = ps.executeQuery();
            return rs.next();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    // -------------------------------------------------------------
    // 3) Save attendance
    // -------------------------------------------------------------
    public void saveAttendance(int userId, String building, String status, LocalDate date) {
        try (Connection con = makeConnection();
             PreparedStatement ps = con.prepareStatement(
                "INSERT INTO attendance (user_id, att_date, status, building_name) " +
                "VALUES (?, ?, ?, ?)"
             )) {

            ps.setInt(1, userId);
            ps.setDate(2, java.sql.Date.valueOf(date));
            ps.setString(3, status);
            ps.setString(4, building);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    // -------------------------------------------------------------
    // 4) Get employees of a specific building
    // -------------------------------------------------------------
    public List<Employee> getUsersByBuilding(String buildingName) {
        List<Employee> list = new ArrayList<>();

        try (Connection con = makeConnection();
             PreparedStatement ps = con.prepareStatement(
                "SELECT id, name, building_name, role " +
                "FROM users WHERE role IN ('Accountant', 'Staff', 'Employee') " +
                "AND building_name = ?"
             )) {

            ps.setString(1, buildingName);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Employee(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("building_name"),
                    rs.getString("role")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    // -------------------------------------------------------------
    // 5) Get monthly attendance (returns Day → Status map)
    // -------------------------------------------------------------
    public Map<Integer, String> getMonthlyAttendanceMap(int e_id, int month, int year) {
        Map<Integer, String> map = new HashMap<>();

        try (Connection con = makeConnection();
             PreparedStatement ps = con.prepareStatement(
                "SELECT DAY(att_date) AS day, status " +
                "FROM attendance " +
                "WHERE user_id = ? AND MONTH(att_date) = ? AND YEAR(att_date) = ? " +
                "ORDER BY att_date ASC"
             )) {

            ps.setInt(1, e_id);
            ps.setInt(2, month);
            ps.setInt(3, year);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                map.put(
                    rs.getInt("day"),
                    rs.getString("status")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return map;
    }

}
