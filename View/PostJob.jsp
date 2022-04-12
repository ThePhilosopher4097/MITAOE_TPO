<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.text.*" %>
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
    <title>Job Posting</title>
    <style>
        body{
            background-repeat: no-repeat;
            background-size: 37%;
            background-position:right 10% top 60%;
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
            font-size: large;
            font-family: Montserrat sans-serif;
            margin-left: 20px;
            padding-left: 10px;
            width: 300px;
            height: 25px;
            border-radius: 10px;
            border:2px solid;
        }
        textarea {
            font-size: larger;
            font-family: Montserrat sans-serif;
            margin-left: 20px;
            padding: 10px 10px 10px 10px;
            border-radius: 10px;
            border:2px solid;
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
    String RecruiterEmail = request.getParameter("RecruiterEmail");
    String from = request.getParameter("from");
    Recruiter R = RecruiterDBC.getRecordByEmail(RecruiterEmail);
    System.out.println("\nRecruiter -----> "+R.getCompany()+"  "+R.getId());
    Date date = Calendar.getInstance().getTime();  
    DateFormat dateFormat = new SimpleDateFormat("dd MMMM yyyy");  
    String today = dateFormat.format(date);  
%>

<body background="../Media/Icons/job.jpg">

    <center>
        <br><hr>
            <h2>Fill the Job Description</h2>
        <hr>
    </center>

    <div id="form_div">
        <form action="AddJob.jsp" method="post">

            <input type="hidden" name="ForWhat" value="postjob"/>
            <input type="hidden" name="company" value="<%=R.getCompany() %>"/>
            Job Location : <input type="text" name="location"><br><br>
            Job Incharge : <input type="text" name="incharge"><br><br>
            Co-ordinator Email ID : <input type="text" name="email"><br><br>
            Co-ordinator Contact : <input type="text" name="contact"><br><br>
            Job Title : <input type="text" name="jobtitle"><br><br>
            Job Description : <textarea rows="4" cols="40" name="jobdescription"></textarea><br><br>
            Renumeration : <input type="text" name="renumeration"><br><br>
            <input type="hidden" name="jobposteddate" value="<%=today %>"/>
           
            <div id="submit_div">
                <input id="btn" style="background-color: #4CAF50;" type='Submit' name="submit" value="Post the Job"> &nbsp;&nbsp;&nbsp;&nbsp;
                <a href='<%=(from==null)?"javascript:history.back()":"/AJ5/#menu" %>'><input id="btn" type="button" style="background-color: grey" name="clear" value="Go back"></a>
            </div>
            <br>
        </form>
    </div>


</body>
</html>
