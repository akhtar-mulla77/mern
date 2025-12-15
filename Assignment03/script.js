// ================= LOGIN =================
const loginForm = document.getElementById("loginForm");

if (loginForm) {
  loginForm.addEventListener("submit", function (e) {
    e.preventDefault();

    let email = document.getElementById("loginEmail");
    let password = document.getElementById("loginPassword");

    let valid = true;

    if (email.value.trim() === "" || !email.value.includes("@")) {
      email.classList.add("is-invalid");
      valid = false;
    } else {
      email.classList.remove("is-invalid");
      email.classList.add("is-valid");
    }

    if (password.value.trim() === "" || password.value.length < 6) {
      password.classList.add("is-invalid");
      valid = false;
    } else {
      password.classList.remove("is-invalid");
      password.classList.add("is-valid");
    }

    if (valid) {
      alert("Login Successful");
    }
  });
}

// ================= REGISTER =================
const registerForm = document.getElementById("registerForm");

if (registerForm) {
  registerForm.addEventListener("submit", function (e) {
    e.preventDefault();

    let name = document.getElementById("regName");
    let email = document.getElementById("regEmail");
    let password = document.getElementById("regPassword");
    let phone = document.getElementById("regPhone");

    let valid = true;

    if (name.value.trim() === "") {
      name.classList.add("is-invalid");
      valid = false;
    } else {
      name.classList.remove("is-invalid");
      name.classList.add("is-valid");
    }

    if (email.value.trim() === "" || !email.value.includes("@")) {
      email.classList.add("is-invalid");
      valid = false;
    } else {
      email.classList.remove("is-invalid");
      email.classList.add("is-valid");
    }

    if (password.value.trim() === "" || password.value.length < 6) {
      password.classList.add("is-invalid");
      valid = false;
    } else {
      password.classList.remove("is-invalid");
      password.classList.add("is-valid");
    }

    if (!/^\d{10}$/.test(phone.value)) {
      phone.classList.add("is-invalid");
      valid = false;
    } else {
      phone.classList.remove("is-invalid");
      phone.classList.add("is-valid");
    }

    if (valid) {
      alert("Registration Successful");
    }
  });
}
