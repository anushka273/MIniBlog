<%@page import="com.tech.blog.entities.User" %>
<%@page import="com.tech.blog.entities.Message" %>
<%@page import="com.tech.blog.entities.Category" %>
<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="com.tech.blog.entities.Post" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<%
User user=(User)session.getAttribute("currentUser");
if(user==null){
    response.sendRedirect("index.jsp");
}

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=user.getName()%> | Profile</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 88%, 70% 100%, 29% 88%, 0 95%, 0 0);
            }


        </style>
    </head>
    <body>
        <main>
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
                                    <a class="nav-link" href="#">About Us</a>

                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Contact Us</a>

                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal">Post Content</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><%=user.getName()%></a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="LogoutServlet">Logout</a>
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
            <div class="alert alert-danger" role="alert">
                <%=m.getContent()%>
            </div>
            <% 
                session.removeAttribute("msg");
                }
            %>
            <%-- Main body of Page --%>

            <div class="container ">
                <div class="row">
                    <div class="col-md-4" style="margin-top: 100px;" >
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0, this)" class=" c-link list-group-item list-group-item-action active">
                                All Posts
                            </a>
                            <% 
                                PostDao d=new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1=d.getAllCategories();
                                for(Category cc:list1){
                            %>
                            <a href="#" onclick="getPosts(<%= cc.getCid()%>, this)" class="c-link list-group-item list-group-item-action"><%=cc.getName()%></a>
                            <%
                                }    
                            %>



                        </div>
                    </div>
                    <div class="col-8" style="margin-top: 100px;" >
                        <!--posts-->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">Loading</h3>
                        </div>
                        <div class="container-fluid" id="post-container">

                        </div>

                    </div>

                </div>
            </div>
        </main>




        <%-- end of Main body of Page --%>




        <!--Profile modal--!>
        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="margin-top: 60px;">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel">Mini<font color="#f33f33" >Blog</font></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%=user.getProfile()%>">
                            <h5 class="modal-title" id="exampleModalLabel"><%=user.getName()%></h5>

                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID:</th>
                                            <td><%=user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email:</th>
                                            <td><%=user.getEmail()%></td>

                                        </tr>

                                        <tr>
                                            <th scope="row">Status:</th>
                                            <td><%=user.getAbout()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <%--profile edit--%>
                            <div id="profile-edit" style="display:none;">
                                <h3 class=mt-2">Please edit carefully</h3>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID:</td>
                                            <td><%=user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email:</td>
                                            <td><input type="email" class="form-control" name="user_email" value="<%=user.getEmail()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Name:</td>
                                            <td><input type="text" class="form-control" name="user_name" value="<%=user.getName()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Password:</td>
                                            <td><input type="password" class="form-control" name="user_password" value="<%=user.getPassword()%>"></td>
                                        </tr>
                                        <tr>
                                            <td>Status:</td>
                                            <td>
                                                <textarea class="form-control" name="user_about" rows="3"><%=user.getAbout()%>


                                                
                                                </textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>New Profile:</td>
                                            <td><input type="file" class="form-control" name="image" ></td>
                                        </tr>
                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn primary-background2 text-white">Save</button>
                                    </div>

                                </form>

                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn primary-background text-white">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--end of modal-->
        <!--add post modal-->


        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="margin-top: 60px;">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Post Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="AddPostServlet" method="post">
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Category---</option>
                                    <%
                                    PostDao postd=new PostDao(ConnectionProvider.getConnection());
                                    ArrayList<Category> list=postd.getAllCategories();
                                    for(Category c:list){
                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>
                                    <%
                                        
                                        }%>
                                </select>
                            </div>
                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post title" class="form-control"/>
                            </div>
                            <div class="form-group">
                                <textarea name="pContent" class="form-control" style="height: 200px;" placeholder="Enter your content"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" class="form-control" style="height: 200px;" placeholder="Enter your program(if any)"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select your pic</label>
                                <br>
                                <input name="pic" type="file" />
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn primary-background text-white">Post</button>

                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!--end post modal-->

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
                                $(document).ready(function () {
                                    let editStatus = false;
                                    $('#edit-profile-button').click(function () {
                                        if (editStatus === false)
                                        {
                                            $("#profile-details").hide();
                                            $("#profile-edit").show();
                                            editStatus = true;
                                            $(this).text("Back");
                                        } else
                                        {
                                            $("#profile-details").show();
                                            $("#profile-edit").hide();
                                            editStatus = false;
                                            $(this).text("Edit");
                                        }


                                    });
                                });
        </script>
        <!--now add post js-->
        <script>
            $(document).ready(function (e) {
                $("#add-post-form").on("submit", function (event) {
                    event.preventDefault();
                    console.log("you have clicked submit");
                    let form = new FormData(this);
                    //requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            if (data.trim() === 'Done') {
                                swal("Good job!", "Saved Successfully", "success");
                            } else {
                                swal("Error!", "Something went wrong..try again!", "error");
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Error!", "Something went wrong..try again!", "error");

                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
        <!--loading post using ajax-->


        <script>
            function getPosts(catId, temp) {
                $("#loader").show();
                $("#post-container").hide();
                $(".c-link").removeClass('active');
                $.ajax({
                    url: "load_posts.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $("#post-container").html(data);
                        $(temp).addClass('active');

                    }
                });
            }
            $(document).ready(function (e) {
                let allPostRef = $('.c-link')[0];
                getPosts(0, allPostRef);

            });
        </script>

    </body>
</html>
