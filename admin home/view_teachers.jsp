<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>eLEARNING </title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
    <style>
        /* General Page Styling */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
    color: #333;
}

h1 {
    text-align: center;
    margin-top: 20px;
    color: #444;
}

/* Table Styling */
table {
    width: 80%;
    margin: 20px auto;
    border-collapse: collapse;
    background-color: #fff;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

table thead {
    background-color: #007bff;
    color: #fff;
}

table th, table td {
    padding: 10px;
    text-align: left;
    border: 1px solid #ddd;
}

table th {
    font-weight: bold;
}

table tr:hover {
    background-color: #f1f1f1;
}

/* Action Links Styling */
a {
    text-decoration: none;
    color: #007bff;
    font-weight: bold;
    transition: color 0.3s;
}

a:hover {
    color: #0056b3;
}

a:visited {
    color: #551a8b;
}

/* Confirmation Prompt */
table td a[onclick] {
    color: red;
}

table td a[onclick]:hover {
    color: #cc0000;
}

/* Responsive Design */
@media (max-width: 768px) {
    table {
        width: 95%;
    }

    table th, table td {
        font-size: 14px;
    }

    h1 {
        font-size: 20px;
    }
}

    </style>
</head>
<body>
      <!-- Navbar Start -->
      <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
        <a href="index.html" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            <h2 class="m-0 text-primary"><i class="fa fa-book me-3"></i>eLEARNING</h2>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="index.html" class="nav-item nav-link active">Home</a>
                <a href="about.html" class="nav-item nav-link">About</a>
                
              
                <a href="contact.html" class="nav-item nav-link">Contact</a>
            </div>
       </div>
    </nav>
    <h1>Teacher Details</h1>
    <table border="1">
        <thead>
            <tr>
                <th>Teacher ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Password</th>
                <th>Department</th>
                <th>Designation</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection con = null;
                Statement stmt = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_course_db", "root", "");
                    stmt = con.createStatement();
                    String query = "SELECT * FROM teachers";
                    rs = stmt.executeQuery(query);
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("teacher_id") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("password") %></td>
                <td><%= rs.getString("department") %></td>
                <td><%= rs.getString("designation") %></td>
                <td>
                    <a href="update_teacher.jsp?num=<%=rs.getString(1)%>">Update</a> 
                    <a href="delete_teacher.jsp?num=<%=rs.getString(1) %>" > Delete</a>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (con != null) con.close();
                }
            %>
        </tbody>
    </table>
</body>
</html>
