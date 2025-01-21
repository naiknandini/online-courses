<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Assignments</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px 12px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<h2>Assignments List</h2>

<table>
    <thead>
        <tr>
            <th>Title</th>
            <th>Description</th>
            <th>Due Date</th>
        </tr>
    </thead>
    <tbody>
        <% 
            // Database connection parameters
            String dbURL = "jdbc:mysql://localhost:3306/online_course_db";
            String dbUser = "root";
            String dbPassword = "";

            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                // Load JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish connection
                conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                // Query to fetch all assignments
                String sql = "SELECT title, description, due_date FROM assignments";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);

                // Loop through the result set and display assignments
                while (rs.next()) {
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    Date dueDate = rs.getDate("due_date");
        %>
                    <tr>
                        <td><%= title %></td>
                        <td><%= description %></td>
                        <td><%= dueDate %></td>
                    </tr>
        <%
                }
            } catch (Exception e) {
                out.println("<tr><td colspan='3' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
            } finally {
                // Close resources
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException se) {
                    out.println("Error closing resources: " + se.getMessage());
                }
            }
        %>
    </tbody>
</table>

</body>
</html>
