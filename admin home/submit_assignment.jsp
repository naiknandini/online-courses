<%@page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.annotation.*, javax.servlet.http.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Submit Assignment</title>
</head>
<body>
<%
    String studentId = request.getParameter("student_id");
    String assignmentName = request.getParameter("assignment_name");

    try {
        Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
        
        if (filePart == null) {
            out.println("<h3>No file uploaded. Please choose a file.</h3>");
            return;
        }

        String fileName = filePart.getSubmittedFileName();
        if (fileName == null || fileName.trim().isEmpty()) {
            out.println("<h3>File name is empty. Please upload a valid file.</h3>");
            return;
        }

        // Upload directory path
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";

        // Create directory if it doesn't exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Save the file
        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);

        // Database connection
        Connection con = null;
        PreparedStatement ps = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_course_db", "root", "");

            String sql = "INSERT INTO submissions (student_id, assignment_name, file_path) VALUES (?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, studentId);
            ps.setString(2, assignmentName);
            ps.setString(3, fileName);

            int result = ps.executeUpdate();

            if (result > 0) {
                out.println("<h3>Assignment submitted successfully!</h3>");
            } else {
                out.println("<h3>Failed to submit the assignment. Please try again.</h3>");
            }
        } catch (Exception e) {
            out.println("<h3>Database error: " + e.getMessage() + "</h3>");
        } finally {
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
    } catch (Exception e) {
        out.println("<h3>Error occurred while uploading the file: " + e.getMessage() + "</h3>");
    }
%>
</body>
</html>
