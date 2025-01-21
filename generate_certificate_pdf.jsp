<%@ page language="java" contentType="application/pdf" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.itextpdf.text.*, com.itextpdf.text.pdf.*" %>
<%
    // Get the certificate ID from the request
    String certificateId = request.getParameter("certificate_id");
    
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish a connection to the database
        String url = "jdbc:mysql://localhost:3306/online_course_db"; // replace with your DB name
        String username = "root"; // replace with your DB username
        String password = ""; // replace with your DB password
        con = DriverManager.getConnection(url, username, password);

        // Query to retrieve certificate details for the specified certificate ID
        String sql = "SELECT student_name, course_name, duration, start_date, end_date " +
                     "FROM certificates WHERE certificate_id = ?";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(certificateId));
        rs = pstmt.executeQuery();

        // Check if any certificate was found
        if (rs.next()) {
            // Create a PDF document
            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            // Add content to the PDF
            document.add(new Paragraph("Certificate of Completion"));
            document.add(new Paragraph("This is to certify that"));
            document.add(new Paragraph(rs.getString("student_name")));
            document.add(new Paragraph("has completed the course:"));
            document.add(new Paragraph(rs.getString("course_name")));
            document.add(new Paragraph("Duration: " + rs.getString("duration")));
            document.add(new Paragraph("Start Date: " + rs.getString("start_date")));
            document.add(new Paragraph("End Date: " + rs.getString("end_date")));
            document.add(new Paragraph("Date of Issue: " + new java.util.Date()));

            // Close the document
            document.close();

            // Set response headers
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=certificate_" + certificateId + ".pdf");
        } else {
            out.println("No certificate found with the given ID.");
        }
    } catch (ClassNotFoundException | SQLException | DocumentException e) {
        out.println("Error: " + e.getMessage());
    } finally {
        // Close all database resources
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            out.println("Error closing resources: " + e.getMessage());
        }
    }
%>