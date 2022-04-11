<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<%

    String type = (String)session.getAttribute("user_type");
    String userid = request.getParameter("userid");
    String background = (String)session.getAttribute("bg_url");
    String forwhat = request.getParameter("ForWhat");
    String recruiter_email = "" + session.getAttribute("UserID"); 

%>
<html>
    <head>
        <title>Success : Record Saved</title>
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
            input[type=text] {
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
            <c:if test="${Forwhat eq 'postjob'}">
                <p style="color:green; font-weight: bold; font-size:20px;">Job Posted Successfully !</p>
            </c:if>
            <c:if test="${Forwhat ne 'postjob'}">
                <p style="color:green; font-weight: bold; font-size:20px;"><%=userid==null?"User Registered":"Record Updated"%> Successfully !</p>
                <hr>
                    <h2><%=type.equals("recruiter")?"Recruiter Details":"Applicant Details"%></h2>
                <hr>
            </c:if>
        </center>
        
        <c:set var = "Type" scope = "session" value = "<%=type %>"/>
        <c:set var = "Userid" scope = "session" value = "<%=userid %>"/>
        <c:set var = "RecruiterEmail" scope = "session" value = "<%=recruiter_email %>"/>
        <c:set var = "Forwhat" scope = "session" value = "<%=forwhat %>"/>

        <c:if test="${Forwhat eq 'register'}">
            <jsp:include page="UserForm.jsp"/> 
        </c:if>
        <c:if test="${Forwhat eq 'update'}">
            <jsp:include page="EditForm.jsp">
                <jsp:param name="id" value="${Userid}"/>
                <jsp:param name="type" value="${Type}"/>
                <jsp:param name="from" value="success"/>
            </jsp:include>
        </c:if>
        <c:if test="${Forwhat eq 'postjob'}">
            <jsp:include page="PostJob.jsp?from=Success"> 
                <jsp:param name="RecruiterEmail" value="${RecruiterEmail}"/>
            </jsp:include>
        </c:if>
    
    </body>
</html>
