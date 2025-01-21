<%@page import="java.sql.*"%>
<%
String s1,s2,s3,s4,s5;
s1=request.getParameter("t1");
s2=request.getParameter("t2");
s3=request.getParameter("t3");
s4=request.getParameter("t4");
s5=request.getParameter("t5");

Connection con;
Statement stmt;
try 
{
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_course_db","root","");
    stmt=con.createStatement();

    int k=stmt.executeUpdate("insert into students(name,email,password,course,year) values('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"')");

    int j=stmt.executeUpdate("insert into login(username,password,role) values('"+s2+"','"+s3+"','student')");
%>
<script>
alert("student added successfully");
document.location="add_student.html";
</script>
<%
}
catch(Exception e)
{
    out.println(e);
}
%>