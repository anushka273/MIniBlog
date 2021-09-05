<%-- 
    Document   : register_page
    Created on : 28-Jun-2021, 11:01:07 pm
    Author     : ayush
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SignUp</title>
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <link href="css/fontawesome.css" rel="stylesheet" type="text/css"/>
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/owl.css" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>

        </style>
    </head>
    <body style="background-image: url('image/Blog4.jpg'); background-size: cover; background-position: center;">
        <header class="">
            <nav class="navbar navbar-expand-lg">
                <div class="container">
                    <a class="navbar-brand" href="index.jsp"><h2>Mini <em>Blog</em></h2></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
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

                            <li class="nav-item active">
                                <a class="nav-link" href="register_page.jsp">Sign Up</a>
                            </li>

                        </ul>
                    </div>
                </div>


            </nav>
        </header>
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

        <main class=" p-5" >
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card" style="margin-top: 60px;">
                        <div class="card-header text-center">
                            <span class="fa fa-user-circle fa-2x"></span>
                            <br>
                            Register Here
                        </div>
                        <div class="card-body">
                            <form id="reg-form" action="RegisterServlet" method="POST">
                                <div class="form-group">
                                    <label for="user_name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name">


                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>

                                <div class="form-group">
                                    <textarea name="about" class="form-control" id=""  rows="5" placeholder="Enter something about yourself"></textarea>
                                    <div class="form-check">
                                        <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
                                    </div>
                                    <br>
                                    <div class="container text-center" id="loader" style="display: none;">
                                        <span class="	fa fa-refresh fa-spin fa-3x"></span>
                                        <h4>Please Wait</h4>
                                    </div>

                                    <button id="submit-btn" type="submit" class="btn primary-background2 text-white">Submit</button>
                            </form>
                        </div>

                    </div>
                </div> 
            </div>
                

        </main>
        <!-- Start copyright  -->

        <footer>
            <div class="container" style="margin-bottom: 20px;">
                <div class="row">
                    <div class="col-md-12">
                        <div class="inner-content text-center">
                            <p><font color="#ffffff">All Right Reserved. &copy; 2021</font> <a href="index.jsp"><font color="#000000">Mini</font><font color="#f33f3f">Blog</font></a></p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- End copyright  -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>--%>
        <script>
            $(document).ready(function () {
                console.log("loaded....")
                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    $("#submit-btn").hide();
                    $("#loader").show();
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)
                            $("#submit-btn").show();
                            $("#loader").hide();
                            if (data.trim() == 'Done') {
                                swal("Registration Successfull..We are going redirect to index page")
                                        .then((value) => {
                                            window.location = "index.jsp"
                                        });
                            } else {
                                swal(data);
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR)
                            swal("Something Went Wrong..Try Again");
                            $("#submit-btn").show();
                            $("#loader").hide();

                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
    </body>
</html>
