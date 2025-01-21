let otpgenarator = () => {
  let otp = "";
  for (let i = 0; i < 4; i++) {
    otp += Math.floor(Math.random() * 10);


  }

  return Number(otp);
}

console.log(`your otp is ${otpgenarator()}`)

function emailsend() {
  document.getElementById('n3').disabled = true;
  document.getElementById('n3').value = 'WAIT';
  var otp = otpgenarator();
  var obj = {
    email_id: document.getElementById("n2").value,
    messege: `your otp is ${otp}`
  }

  emailjs.send("service_np45xem", "template_vuahw0q", obj).then(
    message => {
        alert("OTP SENT"),
        localStorage.setItem("otp", otp);
        window.location.assign("otpVerfiya.html");
        document.getElementById('n3').disabled = false;
        document.getElementById('n3').value = 'SUBMIT';
    }
  );
}

// let submit=document.querySelector('#n3')
// submit.addEventListener('click',email)