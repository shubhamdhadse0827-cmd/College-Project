package com.bms.model;

import java.sql.*;
import com.bms.dto.Employee1;
import com.bms.dto.Tenant;

public class ProfileModel {

    public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    public static final String URL = "jdbc:mysql://localhost:3306/";
    public static final String DB_NAME = "e_care";
    public static final String USERNAME = "root";
    public static final String PASSWORD = "root";

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

    // ⭐⭐ FIXED METHOD ⭐⭐
    public Employee1 getEmployeeById(int id) {

        Employee1 emp = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = makeConnection();

            String sql = "SELECT id, name, email, role, contact_no, aadhaar_no,building_name, photo FROM users WHERE id=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            rs = ps.executeQuery();

            if (rs.next()) {
                emp = new Employee1(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("role"),
                    rs.getString("contact_no"),
                    rs.getString("aadhaar_no"),
                    rs.getString("building_name"),
                    rs.getBytes("photo")
                );
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }

        return emp;
    }

    public Tenant getTenantById(int id) {
        Tenant tn = null;

        try {
            Connection con = makeConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM tenants WHERE id = ?"
            );
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                tn = new Tenant();

                tn.setE_id(rs.getInt("id"));
                tn.setRole(rs.getString("role"));
                tn.setName(rs.getString("name"));
                tn.setEmail(rs.getString("email"));
                tn.setPwd(rs.getString("pwd"));
                tn.setContact_no(rs.getString("contact_no"));
                tn.setAadhaar_no(rs.getString("aadhaar_no"));

                tn.setPhoto(rs.getBytes("photo"));
                tn.setBuilding(rs.getString("building_name"));
                tn.setFlat_no(rs.getInt("flat_no"));
                tn.setRent(rs.getDouble("rent"));
                tn.setEb(rs.getDouble("electricity_bill"));
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return tn;
    }
}
