<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Videos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        a {
            color: blue;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>

<h2>Video Links</h2>

<table>
    <thead>
        <tr>
            <th>Course ID</th>
            <th>Assignment ID</th>
            <th>Video Title</th>
            <th>Video URL</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <%
            // Database connection details
            String dbURL = "jdbc:mysql://localhost:3306/online_course_db";
            String dbUser = "root";
            String dbPassword = "";

            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                // Load the JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish the connection
                conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                // Query to fetch video details
                String sql = "SELECT video_id, course_id, assignment_id, video_title, video_url, description FROM videos";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);

                // Display the video links
                while (rs.next()) {
                    String videoId = rs.getString("video_id");
                    String courseId = rs.getString("course_id");
                    String assignmentId = rs.getString("assignment_id");
                    String videoTitle = rs.getString("video_title");
                    String videoUrl = rs.getString("video_url");
                    String description = rs.getString("description");

                    // Check if video URL is null or empty
                    if (videoUrl == null || videoUrl.trim().isEmpty()) {
                        videoUrl = "No URL available";
                    }

        %>
                    <tr>
                        <td><%= courseId %></td>
                        <td><%= assignmentId %></td>
                        <td><%= videoTitle %></td>
                        <td>
                            <% if (!videoUrl.equals("No URL available")) { %>
                                <a href="<%= videoUrl %>" target="_blank"><%= videoUrl %></a>
                            <% } else { %>
                                <%= videoUrl %>
                            <% } %>
                        </td>
                        <td><%= description %></td>
                    </tr>
        <%
                }
            } catch (Exception e) {
                out.println("<tr><td colspan='5' class='error'>Error: " + e.getMessage() + "</td></tr>");
            } finally {
                // Close the resources
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException se) {
                    out.println("<tr><td colspan='5' class='error'>Error closing resources: " + se.getMessage() + "</td></tr>");
                }
            }
        %>
    </tbody>
</table>

</body>
</html>
