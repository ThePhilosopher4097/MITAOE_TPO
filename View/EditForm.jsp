<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.text.DateFormatSymbols" %>
<%@ page import="java.util.*" %>
<%@ page import="services.Recruiter" %>
<%@ page import="services.RecruiterDBC" %>
<%@ page import="services.Applicant" %>
<%@ page import="services.ApplicantDBC" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recruiters Form</title>
    <style>
        body{
            background-repeat: no-repeat;
            background-size: 40%;
            background-position: 700px 110px;
        }
        #form_div{
            margin-left: 100px;
            margin-top: 20px;
            width: 40%;
            border: 3px solid green;
            padding: 20px;
            text-align: justify;

            background: #76EBC3;
            border-radius: 10px;
            border: 3px solid rgba( 255, 255, 255, 0.18 );
        }
        #form_div:hover{
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
            backdrop-filter: blur( 5.5px );
            -webkit-backdrop-filter: blur( 5.5px );
            border: 3px solid black;
        }
        #submit_div{
            margin-left: 10%;
            padding-left: 50px;
        }
        input[type=text] {
            margin-left: 20px;
            width: 300px;
            height: 25px;
        }
        #btn{
            font-size: 16px;
            border: 1px solid black;
            border-radius: 5px;
            color: black;
            padding: 16px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            transition-duration: 0.4s;
            cursor: pointer;
        }
        #btn:hover{
            background-color: white;
            
            color: white;
            box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
        }

    </style>
</head>
<%    
        String id = request.getParameter("id");
        String type = request.getParameter("type");
        String from = request.getParameter("from");
        String background = (String)session.getAttribute("bg_url");
        
%>

<body background="<%=background %>">

    <center>
        
            <% if ((request.getParameter("from"))==null) { %>
                <br><hr>
                <h2>Edit <%=type.equals("recruiter")?"Recruiter":"Applicant" %> Details</h2>
                <hr>
            <% } %>
    </center>

    <div id="form_div">
        <form action="EditUser.jsp" method="post">
            <%
                if (type.equals("recruiter")) {
                    Recruiter U = RecruiterDBC.getRecordById(Integer.parseInt(id));
                    System.out.println("\nUpdate for = "+U.getCompany());
            %>
                    <input type="hidden" name="type" value="Recruiter"/>
                    <input type="hidden" name="id" value="<%=U.getId() %>"/>
                    Company Name : <input type="text" name="company" value="<%=U.getCompany() %>"><br><br>
                    Job Location : <input type="text" name="location" value="<%=U.getLocation() %>"><br><br>
                    Person Incharge : <input type="text" name="incharge" value="<%= U.getIncharge() %>"><br><br>
                    Comapny Email : <input type="text" name="email" value="<%= U.getEmail() %>"><br><br>
                    Co-ordinator Contact : <input type="text" name="contact" value="<%= U.getContact() %>"><br><br>
                    Market/Product Domain : <input type="text" name="domain" value="<%= U.getDomain() %>"><br><br>
                    Set Password : <input type="text" name="password" value="<%= U.getPassword() %>"><br><br>
            <%
                }
                else {
                    Applicant U = ApplicantDBC.getRecordByPRN(id);
            %>
                    <input type="hidden" name="type" value="Applicant"/>
                    <input type="hidden" name="id" value="<%=U.getId() %>"/>
                    Student PRN : <input type="text" name="prn" value="<%=U.getPRN() %>"><br><br>
                    Applicant Name : <input type="text" name="name" value="<%=U.getName() %>"><br><br>
                    Residencial Address : <input type="text" name="address" value="<%=U.getAddress() %>"><br><br>
                    Branch : <input type="text" name="branch" value="<%=U.getBranch() %>"><br><br>
                    Registered Email : <input type="text" name="email" value="<%=U.getEmail() %>"><br><br>
                    Contact Number : <input type="text" name="contact" value="<%=U.getContact() %>"><br><br>
                    Academic Batch : <input type="text" name="batch" value="<%=U.getBatch() %>"><br><br>     
                    Account Password : <input type="text" name="password" value="<%=U.getPassword() %>"><br><br>     
            <%
                 } 
            %>
            <div id="submit_div">
                <input id="btn" style="background-color: #4CAF50;" type="Submit" name="submit" value="Add Changes"> &nbsp;&nbsp;&nbsp;&nbsp;
                <a href='<%=type.equals("recruiter")?"ViewRecruiter.jsp":"ViewApplicant.jsp" %>'><input id="btn" type="button" style="background-color: grey" name="clear" value='<%=from==null?"Cancel":"Go Back" %>'></a>
            </div>
            <br>
        </form>
    </div>


</body>
</html>
