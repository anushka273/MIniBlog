<%-- 
    Document   : index
    Created on : 26-Jun-2021, 8:47:52 pm
    Author     : ayush
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.tech.blog.entities.User" %>
<%@page import="com.tech.blog.entities.Message" %>
<%@page import="com.tech.blog.entities.Category" %>
<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="com.tech.blog.dao.LikeDao" %>
<%@page import="com.tech.blog.dao.UserDao" %>
<%@page import="com.tech.blog.entities.Post" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <link href="css/fontawesome.css" rel="stylesheet" type="text/css"/>
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/owl.css" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>

        </style>
    </head>
    <body>

        <header class="">
            <nav class="navbar navbar-expand-lg">
                <div class="container">
                    <a class="navbar-brand" href="index.jsp"><h2>Mini <em>Blog</em></h2></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="index.jsp">Home
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li> 



                       
                            <li class="nav-item">
                                <a class="nav-link" href="#">About Us</a>

                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contact.jsp">Contact Us</a>

                            </li>


                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="modal" data-target="#login-modal">Login</a>



                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="register_page.jsp">Sign Up</a>
                            </li>

                        </ul>
                    </div>
                </div>


            </nav>
        </header>

        <%
                           Message m=(Message)session.getAttribute("msg");
                           if(m!=null){
                                 
                             
        %>
        <div class="alert alert-success" role="alert">
            <%=m.getContent()%>
        </div>
        <% 
            session.removeAttribute("msg");
            }
        %>

        <!-- Start Slider -->
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>

            </ol>
            <div class="carousel-inner">

                <div class="carousel-item active" style="height: 80vh; margin-top: 80px; position: relative;">
                    <img class="d-block w-100 " src="image/Blog4.jpg" style="height: 100vh;" alt="First slide">
                    <div class="carousel-caption d-none d-md-block text-right" style="padding-bottom: 60px">
                        <h1 class="m-b-20">
                            <strong
                                >Welcome To <br />
                                Mini<b><font color="f33f3f">Blog</font></strong>
                        </h1>


                        <p class="text-white">The first step in blogging is not writing them but just reading them</p>
                    </div>
                </div>




                <div class="carousel-item" style="height: 80vh; margin-top: 80px; position: relative;">
                    <img class="d-block w-100" src="image/Blog5.jpg" style="height: 100vh; "alt="Third slide">
                    <div class="carousel-caption d-none d-md-block text-left" style="padding-bottom: 60px;">
                        <h1 class="m-b-20">
                            <strong
                                >Welcome To <br />
                                Mini<b><font color="f33f3f">Blog</font></strong>
                        </h1>


                        <p class="text-white">“Blogging is to writing what extreme sports are to athletics: more free-form, more accident-prone, less formal, more alive.<br> It is, in many ways, writing out loud.”<br><em>-Andrew Sullivan</em></p>
                    </div>
                </div>

            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <!-- End Slider -->
        <!--Login Modal-->
        <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="margin-top: 60px;">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">

                        <h5 class="modal-title " id="exampleModalLabel">Login Here</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #ffffff">
                            <span aria-hidden="true">&times;</span>
                        </button>

                    </div>
                    <div class="modal-body">
                        <form id="login-post-form" action="LoginServlet" method="post">


                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn primary-background2 text-white">Submit</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!--Modal ends-->

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


    </body>
</html>
