<%@page import="java.sql.*"%>


<%
String sr=request.getParameter("num");
Connection con;
Statement stmt;
try

{
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_course_db","root","");
    stmt=con.createStatement();

    ResultSet rs=stmt.executeQuery("select * from  payment where payment_id='"+sr+"' ");
    while(rs.next())
    
    {
        %>
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
                /* Add this CSS for centering the form */
                body {
                    font-family: 'Poppins', sans-serif;
                    background-color: #f4f7fa;
                    margin: 0;
                    padding: 0;
                }
        
                h2 {
                    text-align: center;
                    margin-top: 30px;
                }
        
                /* Center the form container */
                .form-container {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                  
                }
        
                form {
                    background-color: #fff;
                    padding: 30px;
                    border-radius: 8px;
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    width: 500PX;
                    margin-top: 4%;
                    max-width: 500px;
                    background-color: #c6ced8;
                }
        
                label {
                    font-weight: bold;
                    margin-bottom: 5px;
                    display: block;
                }
        
                input[type="number"], input[type="text"], input[type="date"], textarea {
                    width: 100%;
                    padding: 10px;
                    margin-bottom: 15px;
                    border-radius: 4px;
                    border: 1px solid #ddd;
                    box-sizing: border-box;
                    background-color: wheat;
                }
        
                textarea {
                    resize: vertical;
                }
        
                input[type="submit"] {
                    background-color: #007bff;
                    color: white;
                    border: none;
                    padding: 12px 20px;
                    font-size: 16px;
                    cursor: pointer;
                    border-radius: 4px;
                    width: 100%;
                }
        
                input[type="submit"]:hover {
                    background-color: #911b8b;
                }
                .bg-primary
                {
                    background-color: white !important;
                    color: black;
                }
                .bg-secondary 
                {
background-color: orange !important;
                }
                .bg-secondary:hover
                {
                    background-color:rgb(11, 194, 194) !important ;
                }
                .text-white
                {
                    color: black !important ;
                }
            </style>
        </head>
        
        <body>
            <!-- Navbar Start -->
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
                                    <a href="../online courses/teacher home/index.html" class="nav-item nav-link active">Home</a>
                                    <a href="about.html" class="nav-item nav-link">About</a>
                                    <a href="course.html" class="nav-item nav-link">Courses</a>
                                    <a href="teacher.html" class="nav-item nav-link">Teachers</a>
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
            <!-- Navbar End -->
            <div class="form-container">
    
    <br>
    <br>
    <br>

    <div class="col-md-4"><center> <h1 class="h1 text-dark" style="margin-top: 8%;">View Payment Details</h1></center>
        <div class="contact-form border "> 
            <form action="update_payment_action.jsp" method="post">
                <div class="form-group">
                    <div class="mb-4 w-20">
                        <label for="exampleFormControlInput1" class="form-label text-dark ">Payment Id </label>
                        <input type="text" class="form-control bg-primary" name="t1" value="<%=rs.getString(1) %>" id="exampleFormControlInput1" placeholder="complaint_id ">
                      </div>
    <div class="mb-4 w-20">
        <label for="exampleFormControlInput1" class="form-label text-dark ">Student Name </label>
        <input type="text" class="form-control bg-primary" name="t2" value="<%=rs.getString(2) %>" id="exampleFormControlInput1" placeholder="complaint_id ">
      </div>
      <div class="mb-4 w-20">
        <label for="exampleFormControlInput1" class="form-label text-dark">Amout</label>
        <input type="text" class="form-control bg-primary" name="t3" value="<%=rs.getString(3) %>" id="exampleFormControlInput1" placeholder="description ">
      </div>
      <div class="mb-4 w-20">
        <label for="exampleFormControlInput1" class="form-label text-dark ">Payment Date</label>
        <input type="date" class="form-control bg-primary" name="t4" value="<%=rs.getString(4) %>" id="exampleFormControlInput1" placeholder="place  ">
      </div>
     
      <div class="mb-4 w-20">
        <label for="exampleFormControlInput1" class="form-label text-dark ">Payment Method  </label>
        <input type="text" class="form-control bg-primary" name="t5" value="<%=rs.getString(5) %>" id="exampleFormControlInput1" placeholder="date  ">
      </div>
     
      <div class="mb-4 w-20">
        <label for="exampleFormControlInput1" class="form-label text-dark ">Payment Status </label>
        <input type="text" class="form-control bg-primary" name="t6" value="<%=rs.getString(6) %>" id="exampleFormControlInput1" placeholder="name  ">
      </div>

     

      <br>
      <br>
      <button class="form-control bg-secondary text-white">submit</button>
    </div>
    </form></div>
    </div>
    </div></div>
    
  <!-- Footer Start -->
  <!-- Footer Start -->
  <div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-3 col-md-6">
                <h4 class="text-white mb-3">Quick Link</h4>
                <a class="btn btn-link" href="">About Us</a>
                <a class="btn btn-link" href="">Contact Us</a>
                <a class="btn btn-link" href="">Privacy Policy</a>
                <a class="btn btn-link" href="">Terms & Condition</a>
                
            </div>
            <div class="col-lg-3 col-md-6">
                <h4 class="text-white mb-3">Contact</h4>
                <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>Vidyanagar</p>
                <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+9876543210</p>
                <p class="mb-2"><i class="fa fa-envelope me-3"></i>admin@page.com</p>
                <div class="d-flex pt-2">
                    <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                    <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                    <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                    <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <h4 class="text-white mb-3">Gallery</h4>
                <div class="row g-2 pt-2">
                    <div class="col-4">
                        <img class="img-fluid bg-light p-1" src="img/course-1.jpg" alt="">
                    </div>
                    <div class="col-4">
                        <img class="img-fluid bg-light p-1" src="img/course-2.jpg" alt="">
                    </div>
                    <div class="col-4">
                        <img class="img-fluid bg-light p-1" src="img/course-3.jpg" alt="">
                    </div>
                    <div class="col-4">
                        <img class="img-fluid bg-light p-1" src="img/course-2.jpg" alt="">
                    </div>
                    <div class="col-4">
                        <img class="img-fluid bg-light p-1" src="img/course-3.jpg" alt="">
                    </div>
                    <div class="col-4">
                        <img class="img-fluid bg-light p-1" src="img/course-1.jpg" alt="">
                    </div>
                </div>
            </div>
            <!-- <div class="col-lg-3 col-md-6">
                <h4 class="text-white mb-3">Newsletter</h4>
                <p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
                <div class="position-relative mx-auto" style="max-width: 400px;">
                    <input class="form-control border-0 w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email">
                    <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                </div>
            </div> -->
        </div>
    </div>
    <!-- <div class="container">
        <div class="copyright">
            <div class="row">
                <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                    &copy; <a class="border-bottom" href="#">Your Site Name</a>, All Right Reserved.

                    <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                    <!-- Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a>
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <div class="footer-menu">
                        <a href="">Home</a>
                        <a href="">Cookies</a>
                        <a href="">Help</a>
                        <a href="">FQAs</a>
                    </div>
                </div>
            </div>
        </div>
    </div> --> 
</div>
<!-- Footer End -->


<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="lib/wow/wow.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/waypoints/waypoints.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>

</html>
<%
    }
}
catch(Exception e)
{
    out.println(e);
}
%>