<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Add Course</title>
    <!-- SweetAlert CSS and JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

<%
    String course_name = request.getParameter("course_name");
    String description = request.getParameter("description");
    String duration=request.getParameter("course_duration");
    String fees=request.getParameter("fees");
    String teacher_name = request.getParameter("teacher_name");

    Connection con;
    Statement stmt;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_course_db", "root", "");
        stmt = con.createStatement();

        // Insert course details into the 'courses' table
        String query = "INSERT INTO courses(course_name, description,duration,fees, teacher_name) VALUES('" + course_name + "', '" + description + "','"+duration+"','"+fees+"', '" + teacher_name + "')";
        int result = stmt.executeUpdate(query);

        // If the insertion was successful, show success message
        if (result > 0) {
%>
            <script>
                Swal.fire({
                    title: 'Success!',
                    text: 'Course added successfully.',
                    icon: 'success',
                    confirmButtonText: 'OK'
                }).then(function() {
                    window.location.href = "add_course.html"; // Redirect to teacher dashboard
                });
            </script>
<%
        } else {
%>
            <script>
                Swal.fire({
                    title: 'Error!',
                    text: 'There was an issue with adding the course.',
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
