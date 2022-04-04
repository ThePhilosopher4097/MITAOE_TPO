
<%
    String view_url = "";
    String type = (String)session.getAttribute("user_type");

    if (type.equals("recruiter"))
        view_url = "ViewRecruiter.jsp";
    else
        view_url = "ViewApplicant.jsp";
%>

<div id="form_div">
    <form action="RegisterUser.jsp" method="post">
        <% if (type.equals("recruiter")) { 
        %>  
            <input type="hidden" name="account_type" value="recruiter">
            Company Name : <input type="text" name="company"><br><br>
            Job Location : <input type="text" name="location"><br><br>
            Person Incharge : <input type="text" name="incharge"><br><br>
            Company Email : <input type="text" name="email"><br><br>
            Co-ordinator Contact : <input type="text" name="contact"><br><br>
            Market Domain : <input type="text" name="domain"><br><br>
            Set Password : <input type="password" name="password"><br><br>
        <% 
            } 
            else { 
        %>  
            <input type="hidden" name="account_type" value="applicant">
            Student PRN : <input type="text" name="prn"><br><br>
            Applicant Name : <input type="text" name="name"><br><br>
            Residential Address : <input type="text" name="address"><br><br>
            Branch : <input type="text" name="branch"><br><br>
            Official Email : <input type="text" name="email"><br><br>
            Contact Number : <input type="text" name="contact"><br><br>
            Academic Batch : <input type="text" name="batch"><br><br>
            Set Password : <input type="password" name="password"><br><br>
        <% 
            } 
        %>
        <div id="submit_div">
            <input id="btn" style="background-color: #4CAF50;" type="Submit" name="submit" value='Add <%=type.equals("recruiter")?"Recruiter":"Applicant" %>'> &nbsp;&nbsp;&nbsp;&nbsp;
            <input id="btn" style="background-color: grey" type="reset" name="clear" value="Clear">
        </div>
        <br>
        <style>
            a {
                color:rgb(11, 50, 179);
                text-decoration: underline;
            }
            a:hover{
                font-size: large;
                color: black;
                background-color: white;
                border: solid black;
            }
        </style>
        <center><a href="<%=view_url %>">View All <%=type.equals("recruiter")?"Recruiters":"Applicants" %></a><a style="margin-left:40px;" href="../index.jsp#menu">Go Back</a></center>
    </form>
</div>