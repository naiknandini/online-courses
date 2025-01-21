<%@ page import="java.sql.*" %>
<%
 
    String studentId = request.getParameter("t1");
    String studentName = request.getParameter("t2");
    String courseName = request.getParameter("t3");
    String duration = request.getParameter("t4");
    String startDate = request.getParameter("t5");
    String endDate = request.getParameter("t6");

   Connection con;
   Statement stmt;
   try {
   
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_course_db","root","");
    stmt=con.createStatement();

    int k=stmt.executeUpdate("insert into certificates(student_id,student_name,course_name,duration,start_date,end_date) values('"+studentId+"','"+studentName+"','"+courseName+"','"+duration+"','"+startDate+"','"+endDate+"')");
    %>
    <script>
        alert("certification added successfully");
        document.location="add_certificate.html";
    </script>
    <%
   }
   catch(Exception e)
   {
    out.println(e);
   }
   %>