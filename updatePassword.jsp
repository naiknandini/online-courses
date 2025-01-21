<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String newPassword = request.getParameter("newPassword");

    // Database connection
    Connection conn = null;
    PreparedStatement ps = null;

    try {
        // Database connection
        String dbUrl = "jdbc:mysql://localhost:3306/online_course_db";
        String dbUser = "root";
        String dbPassword = "";
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        // Update query
        String updateQuery = "UPDATE login SET password = ? WHERE username = ?";
        ps = conn.prepareStatement(updateQuery);
        ps.setString(1, newPassword);
        ps.setString(2, username);

        int rowsUpdated = ps.executeUpdate();
        
        if (rowsUpdated > 0) {
            out.println("Password updated successfully!");
        } else {
            out.println("Error: User not found.");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
