import { UserModule } from "../modulos/user.js";

export function initLoginPage() {

  const form = document.getElementById("register-form");

  if (!form) return;

  form.addEventListener("submit", e => {

    e.preventDefault();

    const data = {

      name: document.getElementById("reg-name").value.trim(),
      surname: document.getElementById("reg-surname").value.trim(),
      email: document.getElementById("reg-email").value.trim(),
      password: document.getElementById("reg-password").value

    };

    const result = UserModule.register(data);

    if (result.ok) {

      alert("Cuenta creada");

      form.reset();

    }
    else {

      alert(result.msg);

    }

  });

}