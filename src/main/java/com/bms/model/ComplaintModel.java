package com.bms.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bms.dto.Complaint;

public class ComplaintModel {

    public static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    public static final String URL = "jdbc:mysql://localhost:3306/";
    public static final String DB_NAME = "e_care";
    public static final String USERNAME = "root";
    public static final String PASSWORD = "root";

    public static Connection makeConnection() {
        try {
            Class.forName(DRIVER);
            return DriverManager.getConnection(URL + DB_NAME, USERNAME, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // ADD COMPLAINT
    public int addComplaint(Complaint cm) {
        int result = 0;
        try {
            Connection con = makeConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO complaints (tenant_id, tenant_name, category, description) VALUES (?, ?, ?, ?)"
            );

            ps.setInt(1, cm.getTenantId());
            ps.setString(2, cm.getTenantName());
            ps.setString(3, cm.getCategory());
            ps.setString(4, cm.getDescription());

            result = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    // UPDATE STATUS
    public int updateStatus(int c_id) {
        int result = 0;
        try {
            Connection con = makeConnection();
            PreparedStatement ps = con.prepareStatement(
                "UPDATE complaints SET status='Solved', updated_at=CURRENT_TIMESTAMP WHERE c_id=?"
            );

            ps.setInt(1, c_id);
            result = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    // GET ALL COMPLAINTS OF A TENANT
    public List<Complaint> getComplaintsByTenant(int tenantId) {
        List<Complaint> list = new ArrayList<>();

        try {
            Connection con = makeConnection();
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM complaints WHERE tenant_id=? ORDER BY created_at DESC"
            );

            ps.setInt(1, tenantId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Complaint c = new Complaint();

                c.setC_id(rs.getInt("c_id"));                   // FIXED
                c.setTenantId(rs.getInt("tenant_id"));
                c.setTenantName(rs.getString("tenant_name"));
                c.setCategory(rs.getString("category"));
                c.setDescription(rs.getString("description"));
                c.setStatus(rs.getString("status"));
                c.setCreated_at(rs.getString("created_at"));    // FIXED
                c.setUpdated_at(rs.getString("updated_at"));    // FIXED

                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public List<Complaint> getAllComplaints() 
    {
        List<Complaint> list = new ArrayList<>();
        
        try {
        	Connection con = makeConnection();
        	PreparedStatement ps = con.prepareStatement("select * from complaints order by created_at desc");
        	ResultSet rs = ps.executeQuery();
        	
        	while(rs.next()) {
        		Complaint c = new Complaint();
        		c.setC_id(rs.getInt("c_id"));
        		c.setTenantId(rs.getInt("tenant_id"));
        		c.setTenantName(rs.getString("tenant_name"));
        		c.setCategory(rs.getString("category"));
        		c.setDescription(rs.getString("description"));
        		c.setStatus(rs.getString("status"));
        		c.setCreated_at(rs.getString("created_at"));
        		c.setUpdated_at(rs.getString("updated_at"));
        		
        		list.add(c);
        	}
        }
        catch(Exception e)
        {
        	e.printStackTrace();
        }
       	return list;
   }
    
   public int getComplaintCount()
   {
	   int count=0;
	   
	   try {
		   Connection con = makeConnection();
		   PreparedStatement ps = con.prepareStatement("select count(*) from complaints");
		   ResultSet rs = ps.executeQuery();
		   
			   if(rs.next()) {
				   count=rs.getInt(1);
			   }
	   	   }
		   catch(Exception e)
		   {
			   e.printStackTrace();
		   }
		   return count;
	   }
}