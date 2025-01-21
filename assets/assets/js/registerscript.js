document.addEventListener("DOMContentLoaded", function() {
    var form = document.getElementById("registrationForm");
    form.addEventListener("submit", function(event) {
        var password = document.getElementById("password").value;
        var confirm_password = document.getElementById("confirm_password").value;

        if (password !== confirm_password) {
            alert("Passwords do not match");
            event.preventDefault();
           
  
        }
        location.href='MFA/login.html'
    });
});
