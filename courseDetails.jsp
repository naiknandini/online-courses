<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>ECOURSES - Online Courses HTML Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="../online courses/teacher home/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../online courses/teacher home/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../online courses/teacher home/css/style.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        h2 {
            text-align: center;
            margin-top: 50px;
            color: #333;
        }
        .course-details {
            max-width: 800px;
            margin: 30px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .course-details p {
            font-size: 18px;
            line-height: 1.6;
            color: #333;
        }
        .course-details p strong {
            color: #4CAF50;
        }
        .error-message {
            color: red;
            text-align: center;
            font-size: 18px;
        }
        .back-button {
            display: block;
            width: 200px;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            margin: 30px auto;
            cursor: pointer;
        }
        .back-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row border-top px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="d-flex align-items-center justify-content-between bg-secondary w-100 text-decoration-none" data-toggle="collapse" href="#navbar-vertical" style="height: 67px; padding: 0 30px;">
                    <h5 class="text-primary m-0"><i class="fa fa-book-open mr-2"></i>Subjects</h5>
                    <i class="fa fa-angle-down text-primary"></i>
                </a>
                <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 9;">
                    <div class="navbar-nav w-100">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link" data-toggle="dropdown">Web Design <i class="fa fa-angle-down float-right mt-1"></i></a>
                            <div class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
                                <a href="" class="dropdown-item">HTML</a>
                                <a href="" class="dropdown-item">CSS</a>
                                <a href="" class="dropdown-item">jQuery</a>
                            </div>
                        </div>
                        <a href="" class="nav-item nav-link">Apps Design</a>
                        <a href="" class="nav-item nav-link">Marketing</a>
                        <a href="" class="nav-item nav-link">Research</a>
                        <a href="" class="nav-item nav-link">SEO</a>
                    </div>
                </nav>
            </div>
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                    <a href="" class="text-decoration-none d-block d-lg-none">
                        <h1 class="m-0"><span class="text-primary">E</span>COURSES</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav py-0">
                            <a href="../online courses/student home/index.html" class="nav-item nav-link active">Home</a>
                            <a href="about.html" class="nav-item nav-link">About</a>
                            <a href="course.html" class="nav-item nav-link">Courses</a>
            
                            <a href="contact.html" class="nav-item nav-link">Contact</a>
                        </div>
                        <div class="nav-item dropdown" style="margin-right: 5%;">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">---</a>
                            <div class="dropdown-menu rounded-0 m-0">
                                <a href="change_password.html" class="dropdown-item">Change Password</a>
                                <a href="logout.html" class="dropdown-item">Logout</a>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <h2>Course Details</h2>
    <div class="course-details">
        <%
            String courseId = request.getParameter("course_id");
            if (courseId != null) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_course_db", "root", "");
                    String query = "SELECT course_name, description, duration, fees, teacher_name FROM courses WHERE course_id = ?";
                    PreparedStatement stmt = con.prepareStatement(query);
                    stmt.setString(1, courseId);
                    ResultSet rs = stmt.executeQuery();

                    if (rs.next()) {
                        String courseName = rs.getString("course_name");
                        String description = rs.getString("description");
                        String duration = rs.getString("duration");
                        String fees = rs.getString("fees");
                        String teacherName = rs.getString("teacher_name");
        %>
                        <p><strong>Course Name:</strong> <%= courseName %></p>
                        <p><strong>Description:</strong> <%= description %></p>
                        <p><strong>Duration:</strong> <%= duration %></p>
                        <p><strong>Fees:</strong> <%= fees %></p>
                        <p><strong>Teacher Name:</strong> <%= teacherName %></p>
        <%
                    } else {
                        out.println("<p class='error-message'>No details found for the selected course.</p>");
                    }
                    rs.close();
                    stmt.close();
                    con.close();
                } catch (Exception e) {
                    out.println("<p class='error-message'>Error: " + e.getMessage() + "</p>");
                }
            } else {
                out.println("<p class='error-message'>No course selected.</p>");
            }
        %>
    </div>
    <a href="enroll.jsp" class="back-button">Back to Course List</a>
</body>
</html>
