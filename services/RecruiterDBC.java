package services;

import java.sql.*;
import java.util.*;

public class RecruiterDBC {
    
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

    public static int saveRecruiter(Recruiter R) {
        int status = 0;
        try{
            Connection con = getConnection();
            String query = "insert into recruiter(company,location,incharge,email,contact,domain,password) values (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, R.getCompany());
            ps.setString(2, R.getLocation());
            ps.setString(3, R.getIncharge());
            ps.setString(4, R.getEmail());
            ps.setString(5, R.getContact());
            ps.setString(6, R.getDomain());
            ps.setString(7, R.getPassword());
            status = ps.executeUpdate();
            System.out.println("Save Status ------->"+status);
            return 1;
        }catch(Exception e){
            System.out.println(e);
            System.out.println("Exception in saveRecruiter()");
        }
        return status;
    }

    public static int updateRecruiter(Recruiter R) {
        int status = 0;
        try{
            Connection con = getConnection();
            String query = "update recruiter set company=?, location=?, incharge=?, email=?, contact=?, domain=?, password=? where id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, R.getCompany());
            ps.setString(2, R.getLocation());
            ps.setString(3, R.getIncharge());
            ps.setString(4, R.getEmail());
            ps.setString(5, R.getContact());
            ps.setString(6, R.getDomain());
            ps.setString(7, R.getPassword());
            ps.setString(7, R.getPassword());
            ps.setInt(8, R.getId());
            System.out.println("\nUpdated User Id = "+R.getId());
            System.out.println("Updated User Name = "+R.getCompany());
            status = ps.executeUpdate();
            System.out.println("Update Status ------->"+status);
            return 1;
        }catch(Exception e){
            System.out.println(e);
            System.out.println("Exception in updateRecruiter()");
        }
        return status;
    }

    public static int deleteRecruiter(Recruiter R) {
        int status = 0;
        try{
            Connection con = getConnection();
            String query = "delete from recruiter where id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, R.getId());
            System.out.println("\nDeleted User Name = "+R.getCompany());
            System.out.println("Deleted User ID = "+R.getId());
            status = ps.executeUpdate();
            System.out.println("Delete Status ------->"+status);
            return 1;
        }catch(Exception e){
            System.out.println(e);
            System.out.println("Exception in deleteRecruiter()");
        }
        return status;
    }

    public static List<Recruiter> getAllRecords() {
        
        List<Recruiter> list = new ArrayList<Recruiter>();
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from recruiter");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Recruiter R = new Recruiter();
                R.setId(rs.getInt("id"));
                R.setCompany(rs.getString("company"));
                R.setLocation(rs.getString("location"));
                R.setIncharge(rs.getString("incharge"));
                R.setEmail(rs.getString("email"));
                R.setContact(rs.getString("contact"));
                R.setDomain(rs.getString("domain"));
                R.setPassword(rs.getString("password"));
                list.add(R);
            }
        }catch(Exception e){
            System.out.println(e);
            System.out.println("Exception in getAllRecords()");
        }
        return list;
    }

    public static Recruiter getRecordById(int id) {
        
        Recruiter R = null;
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from recruiter where id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                R = new Recruiter();
                R.setId(rs.getInt("id"));
                R.setCompany(rs.getString("company"));
                R.setLocation(rs.getString("location"));
                R.setIncharge(rs.getString("incharge"));
                R.setEmail(rs.getString("email"));
                R.setContact(rs.getString("contact"));
                R.setDomain(rs.getString("domain"));
                R.setPassword(rs.getString("password"));
            }
        }catch(Exception e){
            System.out.println(e);
            System.out.println("Exception in getRecordById() !");
        }
        return R;
    }

    public static Recruiter getRecordByEmail(String Email) {
        
        Recruiter R = null;
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from recruiter where email=?");
            ps.setString(1, Email);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                R = new Recruiter();
                R.setId(rs.getInt("id"));
                R.setCompany(rs.getString("company"));
                R.setLocation(rs.getString("location"));
                R.setIncharge(rs.getString("incharge"));
                R.setEmail(rs.getString("email"));
                R.setContact(rs.getString("contact"));
                R.setDomain(rs.getString("domain"));
                R.setPassword(rs.getString("password"));
            }
        }catch(Exception e){
            System.out.println(e);
            System.out.println("Exception in getRecordByEmail() !");
        }
        return R;
    }

}
