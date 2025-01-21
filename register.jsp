<%@page import="java.sql.*"%>
<%@page contentType="text/html; charset=UTF-8"%>
<html>
<head>
    <title>Registration</title>
    <!-- SweetAlert CSS and JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

<%
String s1, s2, s3, s4, s5,s6;
s1 = request.getParameter("firstname");
s2 = request.getParameter("lastname");
s3 = request.getParameter("address");
s4 = request.getParameter("email");
s5 = request.getParameter("password");
s6=request.getParameter("role");

Connection con;
Statement stmt;

try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_course_db", "root", "");
    stmt = con.createStatement();

    int k = stmt.executeUpdate("INSERT INTO register(firstname, lastname, address, email, password,role) VALUES('" + s1 + "','" + s2 + "','" + s3 + "','" + s4 + "','" + s5 + "','"+s6+"')");
    int j = stmt.executeUpdate("INSERT INTO login VALUES('" + s4 + "','" + s5 + "','"+s6+"')");

    // If the insert was successful, show a SweetAlert for success
    if(k > 0 && j > 0) {
%>
        <script>
            Swal.fire({
                title: 'Success!',
                text: 'You have been registered successfully.',
                icon: 'success',
                confirmButtonText: 'OK'
            }).then(function() {
                window.location.href = "login.html"; // Redirect to login page after success
            });
        </script>
<%
    } else {
%>
        <script>
            Swal.fire({
                title: 'Error!',
                text: 'There was an issue with the registration.',
                icon: 'error',
                confirmButtonText: 'OK'
            });
        </script>
<%
    }
} catch (Exception e) {
%>
    <script>
        Swal.fire({
            title: 'Error!',
            text: '<%= e.getMessage() %>',
            icon: 'error',
            confirmButtonText: 'OK'
        });
    </script>
<%
}
%>

</body>
</html>
