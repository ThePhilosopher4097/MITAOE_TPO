package services;

import java.sql.*;
import java.util.*;

public class JobDBC {
    
    public static Connection getConnection() {
        try{
            Connection con = null;
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mit","root","root");
            return con;
        }catch(Exception e){
            System.out.println(e);
            return null;
        }
    }

    public static int saveJob(Job J) {
        int status = 0;
        try{
            Connection con = getConnection();
            System.out.println("\nJob Title ----> "+J.getJobTitle());
            String query = "insert into job (company,location,incharge,email,contact,jobtitle,jobdescription,renumeration,jobposteddate) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, J.getCompany());
            ps.setString(2, J.getLocation());
            ps.setString(3, J.getIncharge());
            ps.setString(4, J.getEmail());
            ps.setString(5, J.getContact());
            ps.setString(6, J.getJobTitle());
            ps.setString(7, J.getJobDescription());
            ps.setString(8, J.getRenumeration());
            ps.setString(9, J.getJobPostedDate());
            status = ps.executeUpdate();
            System.out.println("Save Status ------->"+status);
            return 1;
        }catch(Exception e){
            System.out.println(e);
            System.out.println("Exception in saveJob()");
        }
        return status;
    }

    public static int updateJob(Job J) {
        int status = 0;
        try{
            Connection con = getConnection();
            String query = "update job set company=?, location=?, incharge=?, email=?, contact=?, jobtitle=?, jobdescription=?, renumeration=?, jobposteddate=? where id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, J.getCompany());
            ps.setString(2, J.getLocation());
            ps.setString(3, J.getIncharge());
            ps.setString(4, J.getEmail());
            ps.setString(5, J.getContact());
            ps.setString(6, J.getJobTitle());
            ps.setString(7, J.getJobDescription());
            ps.setString(8, J.getRenumeration());
            ps.setString(9, J.getJobPostedDate());
            ps.setInt(10, J.getId());
            System.out.println("\nUpdated User Id = "+J.getId());
            System.out.println("Updated User Name = "+J.getCompany());
            status = ps.executeUpdate();
            System.out.println("Update Status ------->"+status);
            return 1;
        }catch(Exception e){
            System.out.println(e);
            System.out.println("Exception in updateJob()");
        }
        return status;
    }

    public static int deleteJob(Job J) {
        int status = 0;
        try{
            Connection con = getConnection();
            String query = "delete from job where id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, J.getId());
            System.out.println("\nDeleted Job for Company ----> "+J.getCompany());
            System.out.println("Deleted Job ID = "+J.getId());
            status = ps.executeUpdate();
            System.out.println("Delete Status ------->"+status);
            return 1;
        }catch(Exception e){
            System.out.println(e);
            System.out.println("Exception in deleteJob()");
        }
        return status;
    }

    public static List<Job> getAllRecords() {
        
        List<Job> list = new ArrayList<Job>();
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from job");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Job J = new Job();
                J.setId(rs.getInt("id"));
                J.setCompany(rs.getString("company"));
                J.setLocation(rs.getString("location"));
                J.setIncharge(rs.getString("incharge"));
                J.setEmail(rs.getString("email"));
                J.setContact(rs.getString("contact"));
                J.setJobTitle(rs.getString("jobtitle"));
                J.setJobDescription(rs.getString("jobdescription"));
                J.setRenumeration(rs.getString("renumeration"));
                J.setJobPostedDate(rs.getString("jobposteddate"));
                list.add(J);
            }
        }catch(Exception e){
            System.out.println(e);
            System.out.println("Exception in getAllRecords()");
        }
        return list;
    }

    public static Job getRecordById(int id) {
        
        Job J = null;
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from job where id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                J = new Job();
                J.setId(rs.getInt("id"));
                J.setCompany(rs.getString("company"));
                J.setLocation(rs.getString("location"));
                J.setIncharge(rs.getString("incharge"));
                J.setEmail(rs.getString("email"));
                J.setContact(rs.getString("contact"));
                J.setJobTitle(rs.getString("jobtitle"));
                J.setJobDescription(rs.getString("jobdescription"));
                J.setRenumeration(rs.getString("renumeration"));
                J.setJobPostedDate(rs.getString("jobposteddate"));
            }
        }catch(Exception e){
            System.out.println(e);
            System.out.println("Exception in getRecordById() !");
        }
        return J;
    }

    public static Job getRecordByCompany(String Company) {
        
        Job J = null;
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from job where company=?");
            ps.setString(1, Company);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                J = new Job();
                J.setId(rs.getInt("id"));
                J.setCompany(rs.getString("company"));
                J.setLocation(rs.getString("location"));
                J.setIncharge(rs.getString("incharge"));
                J.setEmail(rs.getString("email"));
                J.setContact(rs.getString("contact"));
                J.setJobTitle(rs.getString("jobtitle"));
                J.setJobDescription(rs.getString("jobdescription"));
                J.setRenumeration(rs.getString("renumeration"));
                J.setJobPostedDate(rs.getString("jobposteddate"));
            }
        }catch(Exception e){
            System.out.println(e);
            System.out.println("Exception in getRecordByCompany() !");
        }
        return J;
    }

}
