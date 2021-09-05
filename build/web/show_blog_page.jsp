j<%@page import="com.tech.blog.entities.User" %>
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
<%
User user=(User)session.getAttribute("currentUser");
if(user==null){
    response.sendRedirect("login_page.jap");
}

%>
<%
    
int postId=Integer.parseInt(request.getParameter("post_id"));
PostDao d=new PostDao(ConnectionProvider.getConnection());
Post p=d.getPostByPostId(postId);

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=p.getpTitle()%></title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 88%, 70% 100%, 29% 88%, 0 95%, 0 0);
            }
            .post-title{
                font-weight: 100;
                font-size: 30px;
            }
            .post-content{
                font-weight: 100;
                font-size: 25px;
            }
            .post-user-info{
                font-size: 20px;
                font-weight: bold;
            }
            .row-user{
                border: 1px solid #e2e2e2;
                padding-top: 15px;
            }

        </style>
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v11.0" nonce="rivhgCbV"></script>
</head>
<body>
    <%--  <nav class="navbar navbar-expand-lg navbar-dark primary-background">
          <a class="navbar-brand" href="#"><span class="fa fa-asterisk"></span>My TechBlog</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
          </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="profile.jsp"><span class="fa fa-bell-o"></span>LearnCode <span class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="fa fa-check-square-o"></span> Categories
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Programming Language</a>
                        <a class="dropdown-item" href="#">Project Implementation</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Data Structures</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><span class="fa fa-address-card-o"></span>Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-asterisk"></span>Do Post</a>
                </li>



            </ul>
            <ul class="navbar-nav mr-right">
                <li class="nav-item">
                    <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="	fa fa-user-circle"></span><%=user.getName()%></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet"><span class="	fa fa-user"></span>Logout</a>
                </li>

            </ul>
        </div>
    </nav>--%>
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
                            <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-asterisk"></span>Do Post</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="	fa fa-user-circle"></span><%=user.getName()%></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="LogoutServlet"><span class="	fa fa-user"></span>Logout</a>
                        </li>







                    </ul>


                </div>
            </div>


        </nav>
    </header>
    <!-- main content of body-->
    <div class="container">
        <div class="row ">
            <div class="col-md-8 offset-md-2" style="margin-top: 100px;">
                <div class="card">
                    <div class="card-header primary-background text-white">
                        <h4 class="post-title"><%=p.getpTitle()%></h4>

                    </div>
                    <div class="card-body">
                        <img class="card-img-top my-2" src="blog_pics/<%= p.getpPic()%>" alt="No Photo">
                        <div class="row my-3 row-user">
                            <div class="col-md-12">
                                <% UserDao ud=new UserDao(ConnectionProvider.getConnection());
                                    
                                %>
                                <p class="post-user-info"><a href="#" style="color: #f33f3f"><%= ud.getUserByUserId(p.getUserId()).getName() %></a> has posted</p>
                            </div>
                        </div>
                        <p class="post-content"><%=p.getpContent()%></p>
                        <br>
                        <br>
                        <div class="post-code">
                            <pre><%=p.getpCode()%></pre>
                        </div>
                    </div>
                    <div class="card-footer primary-background text-white">
                        <% 
                        LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
                        %>
                        <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= user.getId()%>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ld.countLikeOnPost(p.getPid())%></span></a>

                        <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
                    </div>
                    <div class="card-footer">
                        <div class="fb-comments" data-href="http://localhost:9538/TechBlog/show_blog_page.jsp?post_id=<%=p.getPid()%>" data-width="" data-numposts="5"></div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- end of main content of body-->
    <!--Profile modal--!>
    <!-- Button trigger modal -->


    <!-- Modal -->
    <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header primary-background text-white text-center">
                    <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
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
                            <h3 class="mt-2">Please edit carefully</h3>
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
                                    <button type="submit" class="btn btn-outline-primary">Save</button>
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
    <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
    <script type="text/javascript" src = "js/myjs.js"></script>

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

</body>
</html>
