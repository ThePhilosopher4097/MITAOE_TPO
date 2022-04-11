<%@ page import="services.Job" %>
<%@ page import="services.JobDBC" %>

<%  try{

    int status = 0;
    String forwhat = request.getParameter("ForWhat");


%>
        
    <% 
        Job j1 = new Job();
        System.out.println("\n The Job title ---> = "+(String)request.getParameter("jobtitle"));
        j1.setCompany((String)request.getParameter("company"));
        j1.setLocation((String)request.getParameter("location"));
        j1.setIncharge((String)request.getParameter("incharge"));
        j1.setEmail((String)request.getParameter("email"));
        j1.setContact((String)request.getParameter("contact"));
        j1.setJobTitle((String)request.getParameter("jobtitle"));
        j1.setJobDescription((String)request.getParameter("jobdescription"));
        j1.setRenumeration((String)request.getParameter("renumeration"));
        j1.setJobPostedDate((String)request.getParameter("jobposteddate"));

        status = JobDBC.saveJob(j1);

        System.out.println("\nStatus = "+status);
        if (status>0){
            response.sendRedirect("Success.jsp?ForWhat=postjob");
        }else {
            response.sendRedirect("Error.jsp");
        }

    } catch(Exception e) {
        System.out.println("Exception n AddJob.jsp : "+e);
    }
    %>