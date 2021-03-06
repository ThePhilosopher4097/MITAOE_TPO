<!--Session Tracking-->
<%@ page import="java.util.*" %>
<%@ page import="services.Recruiter" %>
<%@ page import="services.RecruiterDBC" %>
<%@ page import="services.Applicant" %>
<%@ page import="services.ApplicantDBC" %>

    <%
        String UserEmail = request.getParameter("email");
        String PRN = request.getParameter("prn");
        String Password = request.getParameter("password");
        String UserType = request.getParameter("login_type");
        String User = "";
        Recruiter R = null;
        Applicant A = null;

        if (UserType.equals("recruiter")){
            R = RecruiterDBC.getRecordByEmail(UserEmail);
            if (R!=null)
                User = R.getCompany();

            if (R!=null && ((String)R.getPassword()).equals(Password)){
                session.setAttribute("LoggedUser", User);
                session.setAttribute("UserType", UserType);
                session.setAttribute("UserID", UserEmail);
                session.setAttribute("VisitCount", 0);
                session.setAttribute("Is_User_Logged_In", "true");
                response.sendRedirect("/AJ5/index.jsp?UserEmail="+UserEmail+"&UserType="+UserType+"&User="+User);
            }
            else{
                session.setAttribute("VisitCount", 0);
                session.setAttribute("Is_User_Logged_In", "false");
                response.sendRedirect("/AJ5/index.jsp?Recruiter_login_status=Invalid Credentials !&Recruiter_login_msg=Access Denied#"+UserType+"_login");
            }
        }
        else {
            A = ApplicantDBC.getRecordByPRN(PRN);
            if (A!=null)
                User = A.getName();
            
            if (A!=null && ((String)A.getPassword()).equals(Password)){
                session.setAttribute("LoggedUser", User);
                session.setAttribute("UserType", UserType);
                session.setAttribute("UserID", PRN);
                session.setAttribute("VisitCount", 0);
                session.setAttribute("Is_User_Logged_In", "true");
                response.sendRedirect("/AJ5/index.jsp?UserPRN="+PRN+"&UserType="+UserType+"&User="+User);
            }
            else{
                session.setAttribute("VisitCount", 0);
                session.setAttribute("Is_User_Logged_In", "false");
                response.sendRedirect("/AJ5/index.jsp?Applicant_login_status=Invalid Credentials !&Applicant_login_msg=Access Denied#"+UserType+"_login");
            }
        }
    
        
    %>