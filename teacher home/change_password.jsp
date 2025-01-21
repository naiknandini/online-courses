<%@page import="java.sql.*"%>
<%
String email = request.getParameter("email");
String oldPassword = request.getParameter("oldpassword");
String newPassword = request.getParameter("newpassword");

Connection con = null;
PreparedStatement pstmt = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_course_db", "root", "");

    // Check if the old password matches for the given email
    String checkQuery = "SELECT * FROM register WHERE email = ? AND password = ?";
    pstmt = con.prepareStatement(checkQuery);
    pstmt.setString(1, email);
    pstmt.setString(2, oldPassword);
    ResultSet rs = pstmt.executeQuery();

    if (rs.next()) {
        // If old password matches, update the password
        String updateQuery = "UPDATE register SET password = ? WHERE email = ?";
        pstmt = con.prepareStatement(updateQuery);
        pstmt.setString(1, newPassword);
        pstmt.setString(2, email);

        int rowsUpdated = pstmt.executeUpdate();

        if (rowsUpdated > 0) {
            // Password updated successfully
            %>
            <script>
                alert("Password updated successfully.");
                document.location = "login.html"; // Redirect to login page
            </script>
            <%
        } else {
            // Password update failed
            %>
            <script>
                alert("Failed to update password. Please try again.");
                document.location = "change_password.html"; // Redirect to change password page
            </script>
            <%
        }
    } else {
        // Old password does not match
        %>
        <script>
            alert("Old password incorrect. Please try again.");
            document.location = "change_password.html"; // Redirect to change password page
        </script>
        <%
    }

} catch (Exception e) {
    out.println(e);
} finally {
    // Close resources
    if (pstmt != null) {
        try {
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    if (con != null) {
        try {
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
%>
