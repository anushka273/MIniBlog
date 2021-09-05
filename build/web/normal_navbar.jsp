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

<%--
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="#"><span class="fa fa-asterisk"></span>My TechBlog</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#"><span class="fa fa-bell-o"></span>LearnCode <span class="sr-only">(current)</span></a>
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
                <a class="nav-link" href="#" data-toggle="modal" data-target="#login-modal">Login</a>



            </li>

            <li class="nav-item">
                <a class="nav-link" href="register_page.jsp"><span class="	fa fa-user"></span>Sign Up</a>
            </li>

        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-lightf my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>
--%>

<!--Login Modal-->
<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                        <button type="submit" class="btn primary-background text-white">Submit</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<!--Modal ends-->
