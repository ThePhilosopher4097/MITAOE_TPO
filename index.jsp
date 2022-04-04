<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<%@ page session="true" %>



<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/header.css">
  <link rel="stylesheet" href="css/divs.css">
	<link rel="stylesheet" href="css/function_1.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
  <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    
<style>
	body {
		margin: 0;
		padding: 0;
	}
	
	p {
		padding: 20px;
		font-size: 18px;
		text-align:center;
	}
    

</style>
</head>

<!-------------------------------------------- Navbar ------------------------------------------->

<% String User_logged_In = "" + session.getAttribute("Is_User_Logged_In"); 
   String LoggedUser = "" + session.getAttribute("LoggedUser"); 
   String Logged_User_Type = "" + session.getAttribute("UserType"); 
   boolean IS_USER_LOGGED = User_logged_In.equals("true")?true:false;
   System.out.print("\nUsers_logged_In:"  +User_logged_In+" LoggedUser:"+LoggedUser+" IS_USER_LOGGED:"+IS_USER_LOGGED);
%>

<div class="navbar" id="navbar">
	
	<a href="#"><div class="logo"></div></a>
	<div class="topnav" id="myTopnav">
    <%
      if (IS_USER_LOGGED!=true) { %>
		    <a href="#recruiter_login">Recruiter Login <i style='font-size:20px;margin-left:7px;' class='fas'>&#xf35a;</i> </a>
		    <a href="#applicant_login">Applicant Login <i style='font-size:20px;margin-left:7px;' class='fas'>&#xf35a;</i> </a>
    <% } else { %>
        <a href="#" id="username" style="color:#5cb860 ;margin-left: 2%; margin-right:4%; font-size:20px;text-shadow: 0 0 1px #e0c6c6, 0 0 1px #b8b8fa;"> Welcome &nbsp;&nbsp; <%=(LoggedUser.split(" ")[0]).toUpperCase() %> !</a>    
    <% } %>
    <a href="#team">View Available Jobs <i style='font-size:20px;margin-left:7px;' class='fas'>&#xf0b1;</i> </a>
    <a href="#team">About us <i style="font-size:20px;margin-left:7px;" class="fa">&#xf2b9;</i> </a>
    <a href="#menu">Go to Main Menu <i style="font-size:20px;margin-left:7px;" class="fa">&#xf015;</i> </a>
    <% if (User_logged_In.equals("true")) { %>
        <a href="View/Logout.jsp">Logout <i style='font-size:20px;margin-left:7px;' class='fa'>&#xf011;</i> </a>
    <% 
        } 
        
    %>
		<a href="javascript:void(0);" class="icon" onclick="myFunction()">
		<i class="fa fa-bars"></i>
		</a>
	  </div>

</div>

<hr>
<br>

<!--------------------------------------------------------------------------------------------------------------------------->
<center>
<div class="banner">
</div>
</center>
<!--------------------------------------------------------------------------------------------------------------------------->

<div id="menu">
    <center><br><br>
    <h2 style="font-family: 'Arial Black', sans-serif;font-size: 3em;letter-spacing: 1px; color:white;background-color: rgb(97, 92, 92);">Menu</h2>
    <br>
    <div id="container">
      <%  if (IS_USER_LOGGED!=true) { %>
        <div>
            <form action="#recruiter_login">
              <input type="submit" class="menu_buttons" value="Recruiter Login">
            </form><br>
            <form action="#applicant_login">
              <input type="submit" class="menu_buttons" value="Applicant Login">
            </form>
        </div>
        <div>
            <form action="View/AddUser.jsp" method="post">
                <input type="hidden" name="type" value="recruiter">
                <input class="menu_buttons" type="submit" value="Add Recruiter">
            </form><br>
            <form action="View/ViewRecruiter.jsp" method="post">
                <input class="menu_buttons" style="padding-left:52px;" type="submit" value="View Recruiters">
            </form>
        </div>
        <div>
            <form action="View/AddUser.jsp">
                <input type="hidden" name="type" value="applicant">
                <input class="menu_buttons" type="submit" value="Add Applicant">
            </form><br>
            <form action="View/ViewApplicant.jsp" method="post">
                <input class="menu_buttons" type="submit" value="View Applicant">
            </form>
        </div>
        <br>
        <% } else { 
                  if (Logged_User_Type.equals("recruiter")) {
        %>
                      <div style="margin-top:50px;margin-bottom:50px;">
                        <form action="View/AddUser.jsp" method="post">
                          <input class="menu_buttons" type="submit" value="View Active Jobs">
                        </form>
                      </div>
                      <div style="margin-top:50px;margin-bottom:50px;">
                        <form action="#post_jobs" method="post">
                          <input class="menu_buttons" type="submit" value="Post a new job">
                        </form>
                      </div>
                      <div style="margin-top:50px;margin-bottom:50px;">
                        <form action="#show_applicants" method="post">
                          <input class="menu_buttons" type="submit" value="Show Applicants">
                        </form>
                      </div>
          <%      } else {
          %>
                      <div style="margin-top:50px;margin-bottom:50px;">
                        <form action="View/AddUser.jsp" method="post">
                          <input class="menu_buttons" type="submit" value="View Recruiters">
                        </form>
                      </div>
                      <div style="margin-top:50px;margin-bottom:50px;">
                        <form action="#post_jobs" method="post">
                          <input class="menu_buttons" type="submit" value="Apply for a Job">
                        </form>
                      </div>
                      <div style="margin-top:50px;margin-bottom:50px;">
                        <form action="#show_applicants" method="post">
                          <input class="menu_buttons" type="submit" value="My Applied Jobs">
                        </form>
                      </div>
          <%
                  }
              }
          %>
    </div>
    </center>
  </div>

<!--------------------------------------------------------------------------------------------------------------------------->
<%
  if (IS_USER_LOGGED!=true) {
  %>
      <div class="w3-container w3-padding-64 w3-center" id="recruiter_login" style="background-color: #a4ccc8;">
          <center>
          <br><br>
          <h1 class="login-head">Recruiter Login</h1>
          <div class="function_1">
            <form action="View/Login.jsp" method="post">
              <input type="hidden" name="login_type" id="login_type" value="recruiter">
              <span class="lp">Email ID : </span><input class="login-input" type="text" placeholder="Enter Recruiter Email ID" id="recruiter_email" name="email">  <br>
              <span class="lp">Password : </span><input class="login-input" type="password" placeholder="Enter Password" id="recruiter_password" name="password">  
              <input class="login" type="submit" name="submit" id="submit" value="Login">
              <br>
            </form>
            <%
                String Recruiter_login_error = request.getParameter("Recruiter_login_status");
                String Recruiter_login_msg = request.getParameter("Recruiter_login_msg");
                if (Recruiter_login_msg==null)	{
                  Recruiter_login_msg = ""; Recruiter_login_error = "";
                }
            %>
          </div>
          <div class="shadow"></div>
          <center><h2 style="color: red;"><%=Recruiter_login_error%><br><%=Recruiter_login_msg%> </h2></center>
        </center>
      </div>

<!--------------------------------------------------------------------------------------------------------------------------->

      <div class="w3-container w3-padding-64 w3-center" id="applicant_login" style="background-color: #bfcaa2;">
        <center>
        <br><br>
        <h1 class="login-head">Applicant Login</h1>
        <div class="function_1">
          <form action="View/Login.jsp" method="post">
            <input type="hidden" name="login_type" id="login_type" value="applicant">
            <span class="lp">PRN Number : </span><input class="login-input" type="text" placeholder="Enter Student PRN" id="applicant_prn" name="prn">  <br>
            <span class="lp">Password : </span><input class="login-input" type="password" placeholder="Enter Password" id="applicant_password" name="password">  
            <input class="login" type="submit" name="submit" id="submit" value="Login">
            <br>
          </form>
          <%
              String Applicant_login_error = request.getParameter("Applicant_login_status");
              String Applicant_login_msg = request.getParameter("Applicant_login_msg");
              if (Applicant_login_msg==null)	{
                Applicant_login_msg = ""; Applicant_login_error = "";
              }
          %>
        </div>
        <div class="shadow"></div>
        <center><h2 style="color: red;"><%=Applicant_login_error%><br><%=Applicant_login_msg%> </h2></center>
      </center>
      </div>
  <% } %>
<!--------------------------------------------------------------------------------------------------------------------------->

<!-- Team Container -->
<center>
<div class="w3-container w3-padding-64 w3-center" id="team">
    <div style="background-color: rgba(225, 225, 205, .34); padding:1%; font-family: Garamond, serif; font-size:larger">
      <h2 style="font-family: Garamond, serif; font:bold;">OUR TEAM</h2>
      <h3>Meet the team - Our official guys !</h3>
    </div>
  
    <div class="w3-row" style="background-color: bisque;"><br>
      <%
        String image_path = "Media/Team/";
        String[] images = {"Head.jpg", "Developer.jpg", "Placed.png", "Mentor.jpg"};
        String[] people = {"Atharva Joshi", "Sameer Manik", "Abhijeet Gandhi", "Prof. Nilesh Bhandare"};
        String[] designations = {"TPO President", "Full-stack Developer", "ML Developer", "Instructor"};
        for (int i=0; i < images.length; i++) {
      %>
        <div class="w3-quarter">
          <img src="<%=image_path+images[i]%>" id="profilepic" alt="Boss" style="width:45%" class="w3-circle w3-hover-opacity">
          <h3><%=people[i]%></h3>
          <p><%=designations[i]%></p>
        </div>
      <%
        }
      %>
    </div>
  </div>
</center>

<!-- Jquery needed -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="js/scripts.js"></script>

<!-- Function used to shrink nav bar removing paddings and adding black background -->
<script>

	function myFunction() {
		var x = document.getElementById("myTopnav");
		if (x.className === "topnav") {
		  x.className += " responsive";
		} else {
		  x.className = "topnav";
		}
	  }

	$(window).scroll(function() {
		if ($(document).scrollTop() > 50) {
			$('.nav').addClass('affix');
			console.log("OK");
		} else {
			$('.nav').removeClass('affix');
		}
	});


	document.getElementById("btn").addEventListener("click", showMenu);
	function showMenu() {
	var menu = document.getElementById("menu");
	menu.classList.toggle("show");
	}

</script>
</html>