<%@ page import="java.util.*" %>
<%@ page import="services.Job" %>
<%@ page import="services.JobDBC" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Applicant</title>
    <style>
        body {
            background-repeat: no-repeat;
            background-size: 40%;
            background-position: 700px 110px;
        }
        table {
            /*padding: 10px;*/
            font-family: Arial, Helvetica, sans-serif;
            width:1200px;
            border: 1px solid #ddd;
        }
        th {
            padding-top: 12px;
            padding-left: 10px;
            text-align: left;
            padding-bottom: 12px;
            background-color: #5971e3;
            color: white;
        }
        td { padding: 8px; }

        tr:nth-child(even){background-color: #f2f2f2;}
        tr:hover {background-color: #ddd;}

        .grid-container {
            display: grid;
            grid-template-columns: auto auto auto;
            background-color: #2196F3;
            padding: 10px;
            margin : 20px 30px 30px 30px;
          }
          .grid-item {
            background-color: rgba(255, 255, 255, 0.9);
            border: 1px solid rgba(0, 0, 0, 0.8);
            padding: 20px;
            font-size: 18px;
            text-align: center;
            transition: transform .1s;
          }
          .grid-item:hover {
            box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
            border-radius: 5%;
            border: 2px solid;
            background-color:#5fe7d1;
            transform: scale(1.1); 
          }
    
    </style>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
</head>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body border="1">
    <center>
        <br><hr>
            <img src="../Media/Icons/job2.png" height="5%" width="5%"/>
            <h2>Posted Jobs (Accepting Applications)</h2>
            <h3>(Candidates may send their resumes to the corresponding email IDs)</h3>
        <hr>
        <a href="../index.jsp#menu">Back to Home</a><br><hr>
        <%
            session.setAttribute("user_type", "job");
            session.setAttribute("bg_url", "../Media/Icons/job.jpg");
            
            List<Job> list = JobDBC.getAllRecords();
            request.setAttribute("list", list);
        %>

        <div class="grid-container">
            <c:forEach items="${list}" var="J">
                <div class="grid-item">
                    <h2>${J.getCompany()}</h2>
                    <h3>${J.getJobTitle()}</h3><br>
                    <p>
                        Location : ${J.getLocation()} <br>
                        Recruitment Incharge : ${J.getIncharge()} <br>
                        Correspondence Email : ${J.getEmail()} <br>
                        Contact : ${J.getContact()} <br>
                        Job Description : ${J.getJobDescription()} <br>
                        Renumeration / CTC: ${J.getRenumeration()} <br>
                        Job Posted on : ${J.getJobPostedDate()} <br>
                    </p>
                </div>
            </c:forEach>
        </div>
        
        

    </center>
</body>
</html>