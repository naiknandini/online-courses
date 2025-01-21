<%@ page import="java.sql.*, java.text.SimpleDateFormat, java.util.Date" %>

<html>
<head>
    <title>Add Payment</title>
    <!-- SweetAlert CSS and JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<%
    String s1 = request.getParameter("username");
    String s2 = request.getParameter("amount");
    String s3 = request.getParameter("payment_date");
    String s4 = request.getParameter("payment_method");
    String s5 = request.getParameter("payment_status");

    try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_course_db", "root", "");
         PreparedStatement pstmt = con.prepareStatement("INSERT INTO payment(username, amount, payment_date, payment_method, payment_status) VALUES (?, ?, ?, ?, ?)")) {

        Class.forName("com.mysql.cj.jdbc.Driver");

        // Format payment_date if necessary
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formattedDate = s3 != null ? s3 : sdf.format(new Date());

        // Set parameters
        pstmt.setString(1, s1);
        pstmt.setString(2, s2);
        pstmt.setString(3, formattedDate);
        pstmt.setString(4, s4);
        pstmt.setString(5, s5);

        // Execute the query
        int result = pstmt.executeUpdate();

        if (result > 0) {
%>
            <script>
                Swal.fire({
                    title: 'Success!',
                    text: 'Payment added successfully.',
                    icon: 'success',
                    confirmButtonText: 'OK'
                }).then(function() {
                    window.location.href = "add_payment.html";
                });
            </script>
<%
        } else {
%>
            <script>
                Swal.fire({
                    title: 'Error!',
                    text: 'There was an issue with adding the payment.',
                    icon: 'error',
                    confirmButtonText: 'OK'
                });
            </script>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
%>
        <script>
            Swal.fire({
                title: 'Error!',
                text: 'Something went wrong. Please try again later.',
                icon: 'error',
                confirmButtonText: 'OK'
            });
        </script>
<%
    }
%>
</body>
</html>
