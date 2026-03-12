// ---- PÁGINA DE LOGIN Y REGISTRO ----
// Gestiona las pestañas de inicio de sesión y creación de cuenta

import { Usuario } from '../modulos/usuario.js';

export function initPaginaLogin() {

  // ---- EVENTOS DE PESTAÑAS ----
  document.getElementById('tab-acceder').addEventListener('click', () => cambiarPestana('login'));
  document.getElementById('tab-registro').addEventListener('click', () => cambiarPestana('registro'));

  // ---- FORMULARIO DE REGISTRO ----
  const formulario = document.getElementById('formulario-registro');
  if (formulario) {
    formulario.addEventListener('submit', function (e) {
      e.preventDefault();
      if (validarFormulario()) {
        registrarUsuario();
      }
    });
  }

  // ---- BOTÓN DE INICIAR SESIÓN ----
  // Está visible pero no realiza ninguna acción
  const btnLogin = document.getElementById('btn-iniciar-sesion');
  if (btnLogin) {
    btnLogin.addEventListener('click', function (e) {
      e.preventDefault();
    });
  }
}

// Muestra un panel y oculta el otro
function cambiarPestana(tab) {
  const panelLogin    = document.getElementById('panel-login');
  const panelRegistro = document.getElementById('panel-registro');
  const tabAcceder    = document.getElementById('tab-acceder');
  const tabRegistro   = document.getElementById('tab-registro');

  if (tab === 'login') {
    panelLogin.style.display    = 'block';
    panelRegistro.style.display = 'none';
    tabAcceder.classList.add('active');
    tabRegistro.classList.remove('active');
  } else {
    panelLogin.style.display    = 'none';
    panelRegistro.style.display = 'block';
    tabAcceder.classList.remove('active');
    tabRegistro.classList.add('active');
  }
}

// Valida todos los campos del formulario de registro
// Devuelve true si todo está correcto, false si hay algún error
function validarFormulario() {
  let valido = true;

  // Limpiar errores anteriores
  document.querySelectorAll('.field-error').forEach(el => el.textContent = '');
  document.querySelectorAll('.input-error').forEach(el => el.classList.remove('input-error'));
  document.getElementById('error-formulario').style.display = 'none';

  const nombre    = document.getElementById('nombre-registro').value.trim();
  const apellidos = document.getElementById('apellidos-registro').value.trim();
  const email     = document.getElementById('email-registro').value.trim();
  const password  = document.getElementById('password-registro').value;
  const password2 = document.getElementById('password2-registro').value;
  const terminos  = document.getElementById('terminos-registro').checked;

  if (nombre.length < 2) {
    marcarError('nombre-registro', 'error-nombre', 'El nombre debe tener al menos 2 caracteres.');
    valido = false;
  }

  if (apellidos.length < 2) {
    marcarError('apellidos-registro', 'error-apellidos', 'Los apellidos son obligatorios.');
    valido = false;
  }

  // Expresión regular básica para validar el formato del email
  const regexEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (!regexEmail.test(email)) {
    marcarError('email-registro', 'error-email', 'Introduce un email válido.');
    valido = false;
  }

  if (password.length < 6) {
    marcarError('password-registro', 'error-password', 'La contraseña debe tener mínimo 6 caracteres.');
    valido = false;
  }

  if (password !== password2) {
    marcarError('password2-registro', 'error-password2', 'Las contraseñas no coinciden.');
    valido = false;
  }

  if (!terminos) {
    document.getElementById('error-terminos').textContent = 'Debes aceptar los términos y condiciones.';
    valido = false;
  }

  return valido;
}

// Pone el borde rojo y el mensaje de error en un campo
function marcarError(idCampo, idError, mensaje) {
  document.getElementById(idCampo).classList.add('input-error');
  document.getElementById(idError).textContent = mensaje;
}

// Guarda el usuario y muestra el alert de confirmación
function registrarUsuario() {
  const datos = {
    nombre:     document.getElementById('nombre-registro').value.trim(),
    apellidos:  document.getElementById('apellidos-registro').value.trim(),
    email:      document.getElementById('email-registro').value.trim(),
    password:   document.getElementById('password-registro').value,
    newsletter: document.getElementById('newsletter-registro').checked
  };

  const resultado = Usuario.registrar(datos);

  if (resultado.ok) {
    alert('¡Cuenta creada correctamente!\nYa puedes acceder a la tienda.');
    document.getElementById('formulario-registro').reset();
  } else {
    const errorEl = document.getElementById('error-formulario');
    errorEl.textContent = resultado.msg;
    errorEl.style.display = 'block';
  }
}

// La exportamos por si hace falta llamarla desde el HTML
window.cambiarPestanaAuth = cambiarPestana;
