<%@page import="java.sql.*"%>
<%
String s1,s2,s3;
s1=request.getParameter("t1");
s2=request.getParameter("t2");
s3=request.getParameter("t3");

Connection con;
Statement stmt;
try 
{
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_course_db","root","");
    stmt=con.createStatement();

    int k=stmt.executeUpdate("insert into submissions(student_id,assignment_name,file_path) values('"+s1+"','"+s2+"','"+s3+"')");
    %>
    <script>
        alert("assignment submited successfully");
        document.location="submit_assignment.html";
    </script>
    <%

}
catch(Exception e)
{
    out.println(e);
}


%>