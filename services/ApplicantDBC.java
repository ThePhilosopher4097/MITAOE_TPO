package services;

import java.sql.*;
import java.util.*;

public class ApplicantDBC {
    
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

    public static int saveApplicant(Applicant A) {
        int status = 0;
        try{
            Connection con = getConnection();
            String query = "insert into applicant(prn,name,address,branch,email,contact,batch,password) values (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, A.getPRN());
            ps.setString(2, A.getName());
            ps.setString(3, A.getAddress());
            ps.setString(4, A.getBranch());
            ps.setString(5, A.getEmail());
            ps.setString(6, A.getContact());
            ps.setString(7, A.getBatch());
            ps.setString(8, A.getPassword());
            status = ps.executeUpdate();
            System.out.println("Save Status ------->"+status);
            return 1;
        }catch(Exception e){
            System.out.println(e);
            System.out.println("Exception in saveApplicant()");
        }
        return status;
    }

    public static int updateApplicant(Applicant A) {
        int status = 0;
        try{
            Connection con = getConnection();
            String query = "update Applicant set prn=?, name=?, address=?, branch=?, email=?, contact=?, batch=?, password=? where id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, A.getPRN());
            ps.setString(2, A.getName());
            ps.setString(3, A.getAddress());
            ps.setString(4, A.getBranch());
            ps.setString(5, A.getEmail());
            ps.setString(6, A.getContact());
            ps.setString(7, A.getBatch());
            ps.setString(8, A.getPassword());
            ps.setInt(9, A.getId());
            System.out.println("\nUpdated User PRN = "+A.getPRN());
            status = ps.executeUpdate();
            System.out.println("Update Status ------->"+status);
            return 1;
        }catch(Exception e){
            System.out.println(e);
            System.out.println("Exception in updateApplicant()");
        }
        return status;
    }

    public static int deleteApplicant(Applicant A) {
        int status = 0;
        try{
            Connection con = getConnection();
            String query = "delete from applicant where prn=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, A.getPRN());
            System.out.println("\nDeleted User PRN = "+A.getPRN());
            System.out.println("Deleted User Name = "+A.getName());
            status = ps.executeUpdate();
            System.out.println("Delete Status ------->"+status);
            return 1;
        }catch(Exception e){
            System.out.println(e);
            System.out.println("Exception in deleteApplicant()");
        }
        return status;
    }

    public static List<Applicant> getAllRecords() {
        
        List<Applicant> list = new ArrayList<Applicant>();
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from applicant");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Applicant A = new Applicant();
                A.setId(rs.getInt("id"));
                A.setPRN(rs.getString("prn"));
                A.setName(rs.getString("name"));
                A.setAddress(rs.getString("address"));
                A.setBranch(rs.getString("branch"));
                A.setEmail(rs.getString("email"));
                A.setContact(rs.getString("contact"));
                A.setBatch(rs.getString("batch"));
                A.setPassword(rs.getString("password"));
                list.add(A);
            }
        }catch(Exception e){
            System.out.println(e);
            System.out.println("Exception in getAllRecords()");
        }
        return list;
    }

    public static Applicant getRecordByPRN(String prn) {
        
        Applicant A = null;
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from Applicant where prn=?");
            ps.setString(1, prn);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                A = new Applicant();
                A.setId(rs.getInt("id"));
                A.setPRN(rs.getString("prn"));
                A.setName(rs.getString("name"));
                A.setAddress(rs.getString("address"));
                A.setBranch(rs.getString("branch"));
                A.setEmail(rs.getString("email"));
                A.setContact(rs.getString("contact"));
                A.setBatch(rs.getString("batch"));
                A.setPassword(rs.getString("password"));
            }
        }catch(Exception e){
            System.out.println(e);
            System.out.println("Exception in getRecordByPRN() !");
        }
        return A;
    }

}
