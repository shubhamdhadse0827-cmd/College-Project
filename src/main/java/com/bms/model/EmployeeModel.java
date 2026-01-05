package com.bms.model;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bms.dto.Employee;
import com.bms.dto.Employee1;

public class EmployeeModel {
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
    
    public ArrayList<Employee> getAllEmployees() {
        ArrayList<Employee> al = new ArrayList<Employee>();
        Connection con = null;

        try {
            con = makeConnection();
            PreparedStatement ps = con.prepareStatement("SELECT id, name, email, role, contact_no, aadhaar_no FROM users");
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                Employee ee = new Employee(
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("role"), 
                    rs.getString("contact_no"),
                    rs.getString("aadhaar_no")
                      // building column NOT in DB
                );
                ee.setE_id(rs.getInt("id"));
                al.add(ee);
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return al;
    }

	public int deleteEmployee(int id) {
		int i=0;
		Connection con = null;
		
		try {
			con = makeConnection();
			PreparedStatement ps = con.prepareStatement("delete from users where id=?");
			ps.setInt(1, id);
			i=ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	public Employee getAEmployee(int id) {
		Employee em = null;
		Connection con = null;
	
		try {
			con =makeConnection();
			PreparedStatement ps = con.prepareStatement("select * from users where id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				em = new Employee(rs.getString("name"),
						rs.getString("email"),
						rs.getString("role"),
						rs.getString("contact_no"),
						rs.getString("aadhaar_no"));
				em.setE_id(id);				
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}	
		return em;
	}

	public byte[] getPhoto(String id) {
		byte[] photo = null;
		Connection con = null;
		
		try {
			con = makeConnection();
			PreparedStatement ps = con.prepareStatement("select * from users where id=?");
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				photo = rs.getBytes("photo");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return photo;
	}

	public int updateEmployee(Employee ee, InputStream im) {
        int i = 0;

        try {
            Connection con = makeConnection();
            PreparedStatement ps;

            if (im != null) {
                // new photo uploaded
                ps = con.prepareStatement(
                    "UPDATE users SET name=?, email=?, contact_no=?, aadhaar_no=?, photo=? WHERE id=?"
                );
                ps.setString(1, ee.getName());
                ps.setString(2, ee.getEmail());
                ps.setString(3, ee.getContact_no());
                ps.setString(4, ee.getAadhaar_no());
                ps.setBlob(5, im);
                ps.setInt(6, ee.getE_id());

            } else {
                // keep old photo → do NOT update photo column
                ps = con.prepareStatement(
                    "UPDATE users SET name=?, email=?, contact_no=?, aadhaar_no=? WHERE id=?"
                );
                ps.setString(1, ee.getName());
                ps.setString(2, ee.getEmail());
                ps.setString(3, ee.getContact_no());
                ps.setString(4, ee.getAadhaar_no());
                ps.setInt(5, ee.getE_id());
            }

            i = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return i;
    }

	public ArrayList<Employee1> getEmployeesByBuilding(String buildingName) {
	    ArrayList<Employee1> list = new ArrayList<>();

	    try {
	        Connection con = AdminModel.makeConnection();

	        PreparedStatement ps = con.prepareStatement(
	            "SELECT * FROM users WHERE building_name = ? AND role IN ('hr','accountant','staff')"
	        );

	        ps.setString(1, buildingName);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {

	            Employee1 emp = new Employee1();

	            emp.setE_id(rs.getInt("id"));
	            emp.setName(rs.getString("name"));
	            emp.setEmail(rs.getString("email"));
	            emp.setContact_no(rs.getString("contact_no"));
	            emp.setRole(rs.getString("role"));
	            emp.setBuilding(rs.getString("building_name"));
	            emp.setPhoto(rs.getBytes("photo"));
	            emp.setCreated_at(rs.getTimestamp("created_at"));
	            list.add(emp);
	        }

	        con.close();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	
	public int getStaffCountByBuilding(String buildingName) {
	    int count = 0;

	    try {
	        Connection con = AdminModel.makeConnection();

	        PreparedStatement ps = con.prepareStatement(
	            "SELECT COUNT(*) FROM users WHERE building_name = ? AND role IN ('hr','accountant','staff')"
	        );
	        ps.setString(1, buildingName);

	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            count = rs.getInt(1);
	        }

	        con.close();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return count;
	}

}

