<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.text.DateFormatSymbols" %>
<%@ page import="services.Recruiter" %>
<%@ page import="services.RecruiterDBC" %>
<%@ page import="services.Applicant" %>
<%@ page import="services.ApplicantDBC" %>

<%
    String type = request.getParameter("type");
    session.setAttribute("user_type", type);

    String background = "";
    if (type.equals("recruiter"))
        background = "../Media/Icons/recruiter.jpg";
    else
        background = "../Media/Icons/applicant.jpg";

    session.setAttribute("bg_url", background);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%=type.equals("recruiter")?"Recruiter Form":"Fill Applicant Form"%></title>
    <style>
        body{
            background-repeat: no-repeat;
            background-size: 37%;
            background-position:right 10% top <%=type.equals("recruiter")?"100%":"60%" %>;
        }
        #form_div{
            margin-left: 7%;
            margin-top: 20px;
            width: 40%;
            border: 3px solid rgb(173, 187, 233);
            padding: 20px;
            text-align: justify;
            background: #b9e7e3;
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
        input[type=text], input[type=password] {
            margin-left: 20px;
            width: 300px;
            height: 25px;
        }
        #btn{
            font-size: 16px;
            border: 1px solid black;
            border-radius: 5px;
            color: white;
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
            color: black;
            box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
        }

    </style>
</head>

<body background="<%=background %>">
    <center>
    <br><hr>
        <h2><%=type.equals("recruiter")?"Recruiter Details":"Fill Applicant Details"%></h2>
    <hr>
    </center>
    
    <jsp:include page="UserForm.jsp"/> 
    

</body>
</html>
