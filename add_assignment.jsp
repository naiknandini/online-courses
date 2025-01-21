    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="javax.servlet.*" %>
    <%@ page import="javax.servlet.http.*" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <%
        // Database connection parameters
        String dbURL = "jdbc:mysql://localhost:3306/online_course_db";
        String dbUser = "root";
        String dbPassword = "";

        // Retrieve form parameters

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String dueDate = request.getParameter("due_date");

        // Initialize response message
        String message = "";

        // Insert data into the assignments table
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // Insert query
            String sql = "INSERT INTO assignments ( title, description, due_date) VALUES ( ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
        
            pstmt.setString(1, title);
            pstmt.setString(2, description);
            pstmt.setDate(3, Date.valueOf(dueDate));

            // Execute update
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                %>
                <script>
                    alert("  message -Assignment added successfully!" )
                    document.location="add_assignments.html";
                </script>
                <%
            
            } else {
                message = "Failed to add assignment.";
            }
        } catch (Exception e) {
            e.printStackTrace();
            message = "Error: " + e.getMessage();
        } finally {
            // Close resources
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    %>

    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Add Assignment</title>
    </head>
    <body>
        <h2><%= message %></h2>
        <a href="index.html">Go back to Home</a>
    </body>
    </html>
