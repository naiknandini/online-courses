<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Add Video</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

<%
    String s1 = request.getParameter("course_id");
    String s2 = request.getParameter("assignment_id");
   String s3=request.getParameter("video_title");
   String s4=request.getParameter("video_url");
   String s5=request.getParameter("description");

    Connection con;
    Statement stmt;

    try
    {

    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_course_db","root","");
    stmt=con.createStatement();
    int k=stmt.executeUpdate("insert into videos(course_id,assignment_id,video_title,video_url,description) values('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"')");
           
    %>
           
          <script>
            alert("vedio added successfully");
            document.location="add_vedio.html";
          </script>
          <%
        }
        catch(Exception e)
        {
            out.println(e);
        }
        %>