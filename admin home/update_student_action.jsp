<%@page import="java.sql.*"%>
<%
String s1,s2,s3,s4,s5,s6;
s1=request.getParameter("t1");
s2=request.getParameter("t2");
s3=request.getParameter("t3");
s4=request.getParameter("t4");
s5=request.getParameter("t5");
s6=request.getParameter("t6");

Connection con;
Statement stmt;
try
{
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_course_db","root","");
    stmt=con.createStatement();
   int k=stmt.executeUpdate("update students set name='"+s2+"',email='"+s3+"',password='"+s4+"',course='"+s5+"',year='"+s6+"' where student_id='"+s1+"'" );
    %>
    <script>
        alert("one record updated successfully");
        document.location="view_students.jsp"; 

    </script>
    <%

}
catch(Exception e)
{
    out.println(e);
}
%>