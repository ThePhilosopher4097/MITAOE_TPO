<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="services.Recruiter" %>
<%@ page import="services.RecruiterDBC" %>
<%@ page import="services.Applicant" %>
<%@ page import="services.ApplicantDBC" %>

<%
    String type = request.getParameter("type");
    int status = 0;
    if (type.equals("Recruiter")) { 
    
%>

        <jsp:useBean id="r1" class="services.Recruiter"></jsp:useBean>
        <jsp:setProperty property="*" name="r1"/>

<%

        status = RecruiterDBC.updateRecruiter(r1);
    }
    else { 
        Applicant a1 = new Applicant();
        a1.setId(Integer.parseInt(request.getParameter("id")));
        a1.setPRN((String)request.getParameter("prn"));
        a1.setName((String)request.getParameter("name"));
        a1.setAddress((String)request.getParameter("address"));
        a1.setBranch((String)request.getParameter("branch"));
        a1.setEmail((String)request.getParameter("email"));
        a1.setContact((String)request.getParameter("contact"));
        a1.setBatch((String)request.getParameter("batch"));
        a1.setPassword((String)request.getParameter("password"));
    
        status = ApplicantDBC.updateApplicant(a1);
        System.out.println("Update Status -->"+status+"  Applicant Name --->"+a1.getName());
    }

    
    if (status>0){
        if (type.equals("Recruiter")){
            session.setAttribute("user_type", "recruiter");
            session.setAttribute("bg_url", "../Media/Icons/recruiter.jpg");
            response.sendRedirect("Success.jsp");
        }
        else {
            session.setAttribute("user_type", "applicant");
            session.setAttribute("bg_url", "../Media/Icons/applicant.jpg");
            response.sendRedirect("Success.jsp");
        }
    }else {
        response.sendRedirect("Error.jsp");
    }
    
%>