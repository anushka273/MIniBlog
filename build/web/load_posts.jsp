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
<div class="row">
    <%
        User uuu=(User)session.getAttribute("currentUser");
        Thread.sleep(1000);
       PostDao d=new PostDao(ConnectionProvider.getConnection()); 
       int cid=Integer.parseInt(request.getParameter("cid"));
       List<Post> posts=null;
       if(cid==0){
           posts=d.getAllPosts();
       }else{
           posts=d.getPostByCatId(cid);
       }
       if(posts.size()==0){
           out.println("<h3 class='display-3 text-center'>No Posts in this category</h3>");
           return;
       }
       for(Post p:posts){
    %> 
    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top" src="blog_pics/<%=p.getpPic()%>" alt="Card image cap">
            <div class="card-body">
                <b><%=p.getpTitle()%></b>
                <p><%=p.getpContent()%></p>

            </div>
            <div class="card-footer text-center primary-background">
                <% 
                           LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
                %>
             
                <a href="show_blog_page.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-light btn-sm">Read More</a>
                
            </div>
        </div>
    </div>

    <%
    }
    %>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script type="text/javascript" src = "js/myjs.js"></script>