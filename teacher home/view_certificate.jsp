<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.Certificate" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Certificates</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        form {
            display: flex;
            flex-direction: column;
            margin-bottom: 20px;
        }
        label {
            margin-top: 10px;
            font-weight: bold;
        }
        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px;
            margin-top: 20px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: #fff;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .download-btn {
            background-color: #28a745;
            color: #fff;
            padding: 6px 12px;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .download-btn:hover {
            background-color: #218838;
        }
        .error {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>View Certificates</h1>
        <form action="view_certificate.jsp" method="post" onsubmit="return validateForm()">
            <label for="studentName">Student Name:</label>
            <input type="text" id="studentName" name="studentName" required>
            <input type="submit" value="View Certificates">
        </form>
        <div id="error" class="error"></div>
        
        <% 
        List<Certificate> certificates = (List<Certificate>)request.getAttribute("certificates");
        if (certificates != null && !certificates.isEmpty()) {
        %>
            <table>
                <tr>
                    <th>Course Name</th>
                    <th>Completion Date</th>
                    <th>Teacher Name</th>
                    <th>Action</th>
                </tr>
                <% for (Certificate cert : certificates) { %>
                    <tr>
                        <td><%= cert.getCourseName() %></td>
                        <td><%= cert.getCompletionDate() %></td>
                        <td><%= cert.getTeacherName() %></td>
                        <td>
                            <a href="DownloadCertificateServlet?id=<%= cert.getId() %>" class="download-btn">Download</a>
                        </td>
                    </tr>
                <% } %>
            </table>
        <% } else if (request.getAttribute("studentName") != null) { %>
            <p>No certificates found for <%= request.getAttribute("studentName") %>.</p>
        <% } %>
    </div>

    <script>
        function validateForm() {
            var studentName = document.getElementById('studentName').value;
            var error = document.getElementById('error');

            if (studentName.trim() === '') {
                error.textContent = 'Student name is required.';
                return false;
            }

            error.textContent = '';
            return true;
        }
    </script>
</body>
</html>
