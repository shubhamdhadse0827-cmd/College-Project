package com.bms.model;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bms.dto.Tenant;

public class TenantModel {
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

	    public ArrayList<Tenant> getAllTenants() {
	        ArrayList<Tenant> al = new ArrayList<>();
	        Connection con = null;

	        try {
	            con = makeConnection();
	            PreparedStatement ps = con.prepareStatement(
	                "SELECT id, name, email, role, contact_no, photo, building_name, flat_no FROM tenants"
	            );

	            ResultSet rs = ps.executeQuery();

	            while (rs.next()) {

	                Tenant tn = new Tenant(
	                    rs.getInt("id"),
	                    rs.getString("name"),
	                    rs.getString("email"),
	                    rs.getString("role"),
	                    rs.getString("contact_no"),
	                    rs.getBytes("photo"),
	                    rs.getString("building_name"),
	                    rs.getInt("flat_no")
	                );

	                al.add(tn);
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

	        return al;
	    }
	
	    
	    public ArrayList<Tenant> getTenantsByBuilding(String buildingType) {
		    ArrayList<Tenant> list = new ArrayList<>();

		    try {
		        Connection con = makeConnection();

		        PreparedStatement ps = con.prepareStatement(
		            "SELECT * FROM tenants WHERE building_name = ?"
		        );

		        ps.setString(1, buildingType);
		        ResultSet rs = ps.executeQuery();

		        while (rs.next()) {

		            Tenant tn = new Tenant();

		            tn.setE_id(rs.getInt("id"));
		            tn.setName(rs.getString("name"));
		            tn.setEmail(rs.getString("email"));
		            tn.setContact_no(rs.getString("contact_no"));
		            tn.setBuilding(rs.getString("building_name"));
		            tn.setPhoto(rs.getBytes("photo"));
		            tn.setFlat_no(rs.getInt("Flat_no"));
		            tn.setCreated_at(rs.getTimestamp("created_at"));
		            list.add(tn);
		        }

		        con.close();

		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return list;
		}

	    public int getTenantCountByBuilding(String buildingType) {
		    int count = 0;

		    try {
		        Connection con = makeConnection();

		        PreparedStatement ps = con.prepareStatement(
		            "SELECT COUNT(*) FROM tenants WHERE building_name = ?"
		        );
		        ps.setString(1, buildingType);

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

		public int deleteTenant(int id) {
			int i=0;
			Connection con = null;
			
			try {
				con = makeConnection();
				PreparedStatement ps = con.prepareStatement("delete from tenants where id=?");
				ps.setInt(1, id);
				i = ps.executeUpdate();
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
			return i;
		}

		public Tenant getATenant(int id) {
			Tenant tn = null;
			Connection con = null;
			
			try {
				con = makeConnection();
				PreparedStatement ps = con.prepareStatement("select * from tenants where id=?");
				ps.setInt(1, id);
				ResultSet rs = ps.executeQuery();
				
				if(rs.next()) {
					tn = new Tenant(rs.getString("name"),
							rs.getString("email"),
							rs.getString("contact_no"),
							rs.getString("aadhaar_no"),
							rs.getInt("flat_no"),
							rs.getString("building_name")
							);
					tn.setE_id(id);
				}
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
			return tn;
		}

		public int updateTenant(Tenant te, InputStream im) {
		    int i = 0;

		    try {
		        Connection con = makeConnection();
		        PreparedStatement ps;

		        // CASE 1: User uploaded NEW PHOTO
		        if (im != null) {
		            ps = con.prepareStatement(
		                "UPDATE tenants SET " +
		                "name=?, email=?, contact_no=?, aadhaar_no=?, flat_no=?, building_name=?, " +
		                "photo=?, updated_at = NOW() " +       // <-- updated_at added
		                "WHERE id=?"
		            );

		            ps.setString(1, te.getName());
		            ps.setString(2, te.getEmail());
		            ps.setString(3, te.getContact_no());
		            ps.setString(4, te.getAadhaar_no());
		            ps.setInt(5, te.getFlat_no());
		            ps.setString(6, te.getBuilding());        // <-- building_name FIXED
		            ps.setBlob(7, im);
		            ps.setInt(8, te.getE_id());
		        }

		        // CASE 2: User did NOT upload photo → keep old photo
		        else {
		            ps = con.prepareStatement(
		                "UPDATE tenants SET " +
		                "name=?, email=?, contact_no=?, aadhaar_no=?, flat_no=?, building_name=?, " +
		                "updated_at = NOW() " +                // <-- updated_at added
		                "WHERE id=?"
		            );

		            ps.setString(1, te.getName());
		            ps.setString(2, te.getEmail());
		            ps.setString(3, te.getContact_no());
		            ps.setString(4, te.getAadhaar_no());
		            ps.setInt(5, te.getFlat_no());
		            ps.setString(6, te.getBuilding());
		            ps.setInt(7, te.getE_id());
		        }

		        i = ps.executeUpdate();

		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return i;
		}


		public byte[] getphoto(String id) {
			byte[] photo = null;
			Connection con = null;
			
			try {
				con = makeConnection();
				PreparedStatement ps = con.prepareStatement("select * from tenants where id=?");
				ps.setString(1, id);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()) {
					photo = rs.getBytes("photo");
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return photo;
		}
		
		public boolean checkUserPassword(String email, String password) {
		    boolean isValid = false;

		    // defensive
		    if(email == null || password == null) return false;

		    // trim inputs to avoid whitespace mismatches
		    email = email.trim();
		    password = password.trim();

		    String sql = "SELECT pwd FROM tenants WHERE email = ?";

		    try (Connection con = makeConnection();
		         PreparedStatement ps = con.prepareStatement(sql)) {

		        ps.setString(1, email);
		        try (ResultSet rs = ps.executeQuery()) {
		            if (rs.next()) {
		                String dbPass = rs.getString("pwd");
		                if (dbPass != null) dbPass = dbPass.trim();

		                // debug log (remove or comment out in production)
		                System.out.println("DEBUG: checkUserPassword -> email=" + email + ", givenPwd=" + password + ", dbPwd=" + dbPass);

		                if (password.equals(dbPass)) {
		                    isValid = true;
		                }
		            } else {
		                System.out.println("DEBUG: checkUserPassword -> no user found for email=" + email);
		            }
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return isValid;
		}

}   
	    