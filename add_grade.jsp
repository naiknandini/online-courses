<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Grade Submission</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

<%
    String studentName = request.getParameter("student_name");
    String assignmentId = request.getParameter("assignment_id");
    String grade = request.getParameter("grade");

    Connection conn = null;
    PreparedStatement stmt = null;
    boolean success = false;  // Flag to check if insertion was successful

    try {
        // Establish database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_course_db", "root", "");

        // SQL to insert grade
        String sql = "INSERT INTO grades (student_name, assignment_id, grade) VALUES (?, ?, ?)";
        stmt = conn.prepareStatement(sql);

        // Set parameters
        stmt.setString(1,studentName);
        stmt.setInt(2, Integer.parseInt(assignmentId));
        stmt.setString(3, grade);

        // Execute the query
        int result = stmt.executeUpdate();

        // Check if the insertion was successful
        if (result > 0) {
            success = true;
        }
    } catch (Exception e) {
        e.printStackTrace();  // Log the error for debugging
        out.println("Error: " + e.getMessage());  // Display error message in case of exception
    } finally {
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<script>
    // Using SweetAlert to show messages after the grade submission
    <%
        if (success) {
    %>
    Swal.fire({
        title: 'Success!',
        text: 'Grade added successfully.',
        icon: 'success',
        confirmButtonText: 'OK'
    }).then(function() {
        window.location.href = "add_grade.html";  // Redirecting to dashboard on success
    });
    <%
        } else {
    %>
    Swal.fire({
        title: 'Error!',
        text: 'Failed to add grade. Please try again.',
        icon: 'error',
        confirmButtonText: 'OK'
    });
    <%
        }
    %>
</script>

</body>
</html>
