<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="services.Recruiter" %>
<%@ page import="services.RecruiterDBC" %>
<%@ page import="services.Recruiter" %>
<%@ page import="services.RecruiterDBC" %>
<%@ page import="services.Applicant" %>
<%@ page import="services.ApplicantDBC" %>

<%
    String type = request.getParameter("type");
    String prn = request.getParameter("id");
    int status = 0;
    if (type.equals("recruiter")) { 
    
%>

    <jsp:useBean id="r1" class="services.Recruiter"></jsp:useBean>
    <jsp:setProperty property="*" name="r1"/>

<%
    status = RecruiterDBC.deleteRecruiter(r1);
}
else { 
    
    Applicant a1 = ApplicantDBC.getRecordByPRN(prn);
    status = ApplicantDBC.deleteApplicant(a1);
}

if (status>0){
    if (type.equals("recruiter")){
        session.setAttribute("user_type", "recruiter");
        session.setAttribute("bg_url", "../Media/Icons/recruiter.jpg");
        response.sendRedirect("ViewRecruiter.jsp");
    }
    else {
        session.setAttribute("user_type", "applicant");
        session.setAttribute("bg_url", "../Media/Icons/applicant.jpg");
        response.sendRedirect("ViewApplicant.jsp");
    }
}else {
    response.sendRedirect("Error.jsp");
}

%>
