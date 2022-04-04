<%@ page import="java.util.*" %>
<%@ page import="services.Recruiter" %>
<%@ page import="services.RecruiterDBC" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Recruiter</title>
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
    
    </style>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
</head>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body border="1">
    <center>
        <br><hr>
            <img src="../Media/Icons/recruiter.jpg" height="5%" width="5%"/>
            <h2>Our Recruiters</h2>
        <hr>
        <a href="../index.jsp#menu">Back to Home</a><br><hr>
        <%
            session.setAttribute("user_type", "recruiter");
            session.setAttribute("bg_url", "../Media/Icons/recruiter.png");

            List<Recruiter> list = RecruiterDBC.getAllRecords();
            request.setAttribute("list", list);
        %>

        <table>
            <tr >
                <th>Company</th>
                <th>Office Location</th>
                <th>Incharge</th>
                <th>Company Email</th>
                <th>Co-ordinator Contact</th>
                <th>Market Domain</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${list}" var="R">
                <tr>
                    <td>${R.getCompany()}</td>
                    <td style="text-align: left;">${R.getLocation()}</td>
                    <td>${R.getIncharge()}</td>
                    <td>${R.getEmail()}</td>
                    <td>${R.getContact()}</td>
                    <td>${R.getDomain()}</td>
                    <td><a href="EditForm.jsp?id=${R.getId()}&type=recruiter"><i style='font-size:24px' class='fas'>&#xf044;</i></a>
                    <a href="DeleteUser.jsp?id=${R.getId()}&type=recruiter"><i class='fas fa-trash' style='font-size:24px;color:red'></i></a></td>
                </tr>
            </c:forEach>
        </table>

    </center>
</body>
</html>