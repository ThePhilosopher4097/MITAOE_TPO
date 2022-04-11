<%@ page import="services.Recruiter" %>
<%@ page import="services.RecruiterDBC" %>
<%@ page import="services.Job" %>
<%@ page import="services.JobDBC" %>

<%  try{

    int status = 0;

%>
        <jsp:useBean id="j1" class="services.Job"></jsp:useBean>
        <jsp:setProperty property="*" name="j1"/>
    <% 
        status = JobDBC.saveJob(j1);

        System.out.println("\nStatus = "+status);
        if (status>0){
            response.sendRedirect("Success.jsp");
        }else {
            response.sendRedirect("Error.jsp");
        }
        System.out.println("\nStatus = "+status+"\ntype = "+type);

    } catch(Exception e) {
        System.out.println("Exception: "+e);
    }
    %>