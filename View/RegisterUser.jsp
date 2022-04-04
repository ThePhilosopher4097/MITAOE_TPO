<%@ page import="services.Recruiter" %>
<%@ page import="services.RecruiterDBC" %>
<%@ page import="services.Applicant" %>
<%@ page import="services.ApplicantDBC" %>

<%  try{

    String type = (String)session.getAttribute("user_type");

    int status = 0;

    if (type.equals("recruiter")) { %>

        <jsp:useBean id="r1" class="services.Recruiter"></jsp:useBean>
        <jsp:setProperty property="*" name="r1"/>
    <% 
        status = RecruiterDBC.saveRecruiter(r1);
    }
    else { 
        Applicant a1 = new Applicant();
        
        a1.setPRN((String)request.getParameter("prn"));
        a1.setName((String)request.getParameter("name"));
        a1.setAddress((String)request.getParameter("address"));
        a1.setBranch((String)request.getParameter("branch"));
        a1.setEmail((String)request.getParameter("email"));
        a1.setContact((String)request.getParameter("contact"));
        a1.setBatch((String)request.getParameter("batch"));
        a1.setPassword((String)request.getParameter("password"));
     
        status = ApplicantDBC.saveApplicant(a1);
        System.out.println("Status -->"+status+" Obj -->"+a1+" Value --->"+a1.getName());
    }

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