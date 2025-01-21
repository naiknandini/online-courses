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
   int k=stmt.executeUpdate("update payment set username='"+s2+"',amount='"+s3+"',payment_date='"+s4+"',payment_method='"+s5+"',payment_status='"+s6+"' where payment_id='"+s1+"'" );
    %>
    <script>
        alert("one record updated successfully");
        document.location="ViewPayment.jsp"; 

    </script>
    <%

}
catch(Exception e)
{
    out.println(e);
}
%>