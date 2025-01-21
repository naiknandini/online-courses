<%@page import="java.sql.*"%>
<%@page contentType="text/html; charset=UTF-8"%>
<html>
<head>
    <title>Login</title>
    <!-- SweetAlert CSS and JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");

session.setAttribute("uname", username);
Connection con = null;
PreparedStatement stmt = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_course_db", "root", "");
    
    // Use PreparedStatement to avoid SQL injection
    String sql = "SELECT * FROM login WHERE username = ? AND password = ?";
    stmt = con.prepareStatement(sql);
    stmt.setString(1, username);
    stmt.setString(2, password);
    
    rs = stmt.executeQuery();

    if (rs.next()) {
        String role = rs.getString(3); // Assuming role is stored in the 3rd column

        if (role.equals("admin")) {
%>
            <script>
                Swal.fire({
                    title: 'Success!',
                    text: 'You have logged in as admin.',
                    icon: 'success',
                    confirmButtonText: 'OK'
                }).then(function() {
                    window.location.href = "./admin home/index.html"; // Redirect to admin home
                });
            </script>
<%
        } else if (role.equals("student")) {
%>
            <script>
                Swal.fire({
                    title: 'Success!',
                    text: 'You have logged in as student.',
                    icon: 'success',
                    confirmButtonText: 'OK'
                }).then(function() {
                    window.location.href = "./student home/index.html"; // Redirect to student home
                });
            </script>
<%
        } else if (role.equals("teacher")) {
%>
            <script>
                Swal.fire({
                    title: 'Success!',
                    text: 'You have logged in as staff.',
                    icon: 'success',
                    confirmButtonText: 'OK'
                }).then(function() {
                    window.location.href = "./teacher home/index.html"; // Redirect to staff home
                });
            </script>
<%
        }
    } else {
%>
        <script>
            Swal.fire({
                title: 'Error!',
                text: 'Incorrect username or password.',
                icon: 'error',
                confirmButtonText: 'Try Again'
            }).then(function() {
                document.location = "login.html"; // Redirect back to login page
            });
        </script>
<%
    }
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
    // You can also add an alert for general errors
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
} finally {
    try {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (con != null) con.close();
    } catch (SQLException e) {
        out.println("Error closing resources: " + e.getMessage());
    }
}
%>

</body>
</html>
