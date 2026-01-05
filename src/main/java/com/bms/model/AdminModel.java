package com.bms.model;

import java.io.IOException;
import java.sql.*;
import javax.servlet.http.Part;
import java.util.ArrayList;

import com.bms.dto.Employee1;
import com.bms.dto.Tenant;

public class AdminModel {

    public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    public static final String URL = "jdbc:mysql://localhost:3306/";
    public static final String DB_NAME = "e_care";
    public static final String USERNAME = "root";
    public static final String PASSWORD = "root";

    // DATABASE CONNECTION
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

    // CHECK DUPLICATE EMAIL
    public boolean isEmailExists(String email) {
        boolean exists = false;
        try {
            Connection con = makeConnection();
            String sql = "SELECT id FROM users WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            exists = rs.next();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return exists;
    }

    // LOGIN METHOD
    public int checklogin(String role, String email, String pw) {

        int id = 0;
        PreparedStatement ps = null;

        try {
            Connection con = makeConnection();

            // EMPLOYEE ROLES
            if (role.equalsIgnoreCase("Admin") ||
                role.equalsIgnoreCase("Manager") ||
                role.equalsIgnoreCase("HR") ||
                role.equalsIgnoreCase("Accountant") ||
                role.equalsIgnoreCase("Staff")) {

                ps = con.prepareStatement(
                    "SELECT * FROM users WHERE LOWER(role)=LOWER(?) AND email=? AND password=?"
                );
                ps.setString(1, role);
                ps.setString(2, email);
                ps.setString(3, pw);
            }

            // TENANT LOGIN
            else if (role.equalsIgnoreCase("Tenant")) {
                ps = con.prepareStatement("SELECT * FROM tenants WHERE email=? AND pwd=?");
                ps.setString(1, email);
                ps.setString(2, pw);
            }

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                id = rs.getInt("id");  // return ID on success
            }

            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return id;
    }

    // ADMIN SIGNUP (CEO)
    public int signUp(String name, String email, String pwd, String contact_no, String aadhar_no, Part photo) {

        // EMAIL DUPLICATE CHECK
        if (isEmailExists(email)) {
            return -1; // email already exists
        }

        int i = 0;

        try {
            Connection con = makeConnection();

            // ONLY ONE CEO ALLOWED
            PreparedStatement psCheck = con.prepareStatement("SELECT COUNT(*) FROM users WHERE role='CEO'");
            ResultSet rs = psCheck.executeQuery();
            rs.next();

            if (rs.getInt(1) > 0) {
                con.close();
                return 2; // CEO already exists
            }

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users(name, email, password, contact_no, aadhaar_no, photo, role, is_superadmin, created_at) " +
                "VALUES (?, ?, ?, ?, ?, ?, 'Admin', TRUE, NOW())"
            );

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, pwd);
            ps.setString(4, contact_no);
            ps.setString(5, aadhar_no);

            ps.setBlob(6, photo.getInputStream());

            i = ps.executeUpdate();
            con.close();

        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }

        return i;
    }

    // MANAGER SIGNUP
    public int managerSignUp(String name, String email, String pwd, String contact_no,
                             String aadhaar_no, Part photo, String building_name) {

        if (isEmailExists(email)) return -1;

        int i = 0;

        try {
            Connection con = makeConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users(name, email, password, contact_no, aadhaar_no, photo, role, building_name, is_superadmin, created_at) " +
                "VALUES (?, ?, ?, ?, ?, ?, 'Manager', ?, FALSE, NOW())"
            );

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, pwd);
            ps.setString(4, contact_no);
            ps.setString(5, aadhaar_no);
            ps.setBlob(6, photo.getInputStream());
            ps.setString(7, building_name);

            i = ps.executeUpdate();
            con.close();

        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }

        return i;
    }

    // HR SIGNUP
    public int hrSignUp(String name, String email, String pwd, String contact_no,
                        String aadhaar_no, Part photo, String building_name) {

        if (isEmailExists(email)) return -1;

        int i = 0;

        try {
            Connection con = makeConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users(name, email, password, contact_no, aadhaar_no, photo, building_name, role, is_superadmin, created_at) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, 'HR', FALSE, NOW())"
            );

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, pwd);
            ps.setString(4, contact_no);
            ps.setString(5, aadhaar_no);
            ps.setBlob(6, photo.getInputStream());
            ps.setString(7, building_name);

            i = ps.executeUpdate();
            con.close();

        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }

        return i;
    }

    // EMPLOYEE SIGNUP (STAFF/ACCOUNTANT/etc.)
    public int employeeSignUp(String name, String email, String pwd, String contact_no,
                              String aadhaar_no, Part photo, String role, String building_name) {

        if (isEmailExists(email)) return -1;

        int i = 0;

        try {
            Connection con = makeConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users(name, email, password, contact_no, aadhaar_no, photo, role, is_superadmin, building_name, created_at) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, FALSE, ?, NOW())"
            );

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, pwd);
            ps.setString(4, contact_no);
            ps.setString(5, aadhaar_no);
            ps.setBlob(6, photo.getInputStream());
            ps.setString(7, role);
            ps.setString(8, building_name);

            i = ps.executeUpdate();
            con.close();

        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }

        return i;
    }

    // TENANT SIGNUP
    public int tenantSignUp(String name, String email, String pwd, String contact_no,
                            String aadhaar_no, Part photo, String building, int flat_no,
                            double rent, double electricity_bill) {

        if (isEmailExists(email)) return -1;

        int i = 0;

        try {
            Connection con = makeConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO tenants(name, email, pwd, contact_no, aadhaar_no, photo, role, building_name, flat_no, created_at, rent, electricity_bill) " +
                "VALUES (?, ?, ?, ?, ?, ?, 'Tenant', ?, ?, NOW(), ?, ?)"
            );

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, pwd);
            ps.setString(4, contact_no);
            ps.setString(5, aadhaar_no);
            ps.setBlob(6, photo.getInputStream());
            ps.setString(7, building);
            ps.setInt(8, flat_no);
            ps.setDouble(9, rent);
            ps.setDouble(10, electricity_bill);

            i = ps.executeUpdate();
            con.close();

        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }

        return i;
    }

	public ArrayList<Tenant> getAllTenants() {
		ArrayList<Tenant> al = new ArrayList<Tenant>();
		Connection con = null;
		
		try {
			con = makeConnection();
			PreparedStatement ps = con.prepareStatement("select * from tenants");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Tenant tn = new Tenant(rs.getString("name"),
						rs.getString("email"),
						rs.getString("contact_no"),
						rs.getString("aadhaar_no"),
						rs.getInt("flat_no"),
						rs.getString("building_name"));
				tn.setPhoto(rs.getBytes("photo"));
				tn.setRent(rs.getDouble("rent"));
				tn.setE_id(rs.getInt("id"));
				tn.setCreated_at(rs.getTimestamp("created_at"));
				al.add(tn);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return al;
	}

	public ArrayList<Employee1> getAllWorkers() {
		ArrayList<Employee1> al = new ArrayList<Employee1>();
		Connection con = null;
		
		try {
			con = makeConnection();
			PreparedStatement ps = con.prepareStatement("select * from users");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Employee1 em = new Employee1(
						rs.getInt("id"),
						rs.getString("name"),
						rs.getString("email"),
						rs.getString("role"),
						rs.getString("contact_no"),
						rs.getString("aadhaar_no"),
						rs.getString("Building_name"),
						rs.getBytes("photo"));
				em.setCreated_at(rs.getTimestamp("created_at"));
				al.add(em);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return al;
	}

}
