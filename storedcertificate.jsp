<%@ page import="java.sql.*,java.io.*" %>
<%
    String studentName = request.getParameter("student-name");
    String courseName = request.getParameter("course-name");
    String completionDate = request.getParameter("completion-date");
    String issuedBy = request.getParameter("issued-by");

    String folderPath = application.getRealPath("/downloads/");
    String fileName = studentName.replaceAll(" ", "_") + "_certificate.txt";
    String filePath = folderPath + File.separator + fileName;

    File folder = new File(folderPath);
    if (!folder.exists()) folder.mkdir();

    File file = new File(filePath);
    FileWriter writer = new FileWriter(file);
    writer.write("Certificate of Completion\n");
    writer.write("Awarded to: " + studentName + "\n");
    writer.write("Course: " + courseName + "\n");
    writer.write("Date: " + completionDate + "\n");
    writer.write("Issued By: " + issuedBy + "\n");
    writer.close();

    // Save record to database
    try {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database", "root", "password");
        String query = "INSERT INTO certificates (student_name, course_name, file_path, issued_by, issued_date) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, studentName);
        pstmt.setString(2, courseName);
        pstmt.setString(3, filePath);
        pstmt.setString(4, issuedBy);
        pstmt.setString(5, completionDate);
        pstmt.executeUpdate();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    out.println("<h2>Certificate Generated and Saved Successfully!</h2>");
    out.println("<a href='generateCertificate.jsp'>Go Back</a>");
%>
