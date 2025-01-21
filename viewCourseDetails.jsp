<%
    String courseName = request.getParameter("course_name");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_course_db", "root", "");
        String query = "SELECT * FROM courses WHERE course_name = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, courseName);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
%>
            <h2>Course Details</h2>
            <p><strong>Course Name:</strong> <%= rs.getString("course_name") %></p>
            <p><strong>Description:</strong> <%= rs.getString("course_description") %></p>
<%
        } else {
%>
            <p>No course found with the name "<%= courseName %>".</p>
<%
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
