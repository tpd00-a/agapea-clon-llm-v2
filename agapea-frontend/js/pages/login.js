// ---- PÁGINA DE LOGIN Y REGISTRO ----
// Gestiona las pestañas de inicio de sesión y creación de cuenta

import { Usuario } from '../modulos/usuario.js';
import { Carrito } from '../modulos/carrito.js';
import { apiFetch } from '../services/api.js';

/**
 * Función de inicio de la página de login/registro.
 */
export function initPaginaLogin() {

  // Si ya hay sesión activa, redirigir al inicio
  if (localStorage.getItem('agapea_token')) {
    window.location.href = 'index.html';
    return;
  }

  // ---- EVENTOS DE PESTAÑAS ----
  document.getElementById('tab-acceder').addEventListener('click', () => cambiarPestana('login'));
  document.getElementById('tab-registro').addEventListener('click', () => cambiarPestana('registro'));

  // ---- FORMULARIO DE REGISTRO ----
  const formularioRegistro = document.getElementById('formulario-registro');
  if (formularioRegistro) {
    formularioRegistro.addEventListener('submit', async function (e) {
      e.preventDefault();
      if (validarFormularioRegistro()) {
        const btn = this.querySelector('button[type="submit"]');
        if (btn) btn.disabled = true;
        await registrarUsuario();
        if (btn) btn.disabled = false;
      }
    });
  }

  // ---- BOTÓN DE INICIAR SESIÓN ----
  const btnLogin = document.getElementById('btn-iniciar-sesion');
  if (btnLogin) {
    btnLogin.addEventListener('click', async function (e) {
      e.preventDefault();

      // Leer los campos del formulario
      const email = document.getElementById('email-login').value.trim();
      const password = document.getElementById('password-login').value;

      if (!email || !password) {
        alert('Debe completar correo y contraseña');
        return;
      }

      // Deshabilitar botón mientras se procesa
      this.disabled = true;
      this.textContent = 'Iniciando...';

      // Intentar iniciar sesión
      const res = await Usuario.login(email, password);

      // Rehabilitar botón
      this.disabled = false;
      this.textContent = 'Acceder';

      if (res.ok) {
        // Intentar cargar el carrito guardado en el servidor
        try {
          const respuestaCarrito = await apiFetch('/cart');
          if (respuestaCarrito.data && respuestaCarrito.data.length > 0) {
            // Guardar el carrito del servidor en localStorage
            localStorage.setItem('agapea_carrito', JSON.stringify(respuestaCarrito.data));
            Carrito.actualizarCabecera();
          }
        } catch (e) {
          // Si falla, no pasa nada, se usa el carrito local
        }

        // Redirigir al inicio
        window.location.href = 'index.html';
      } else {
        alert(res.msg);
      }
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
function validarFormularioRegistro() {
  let valido = true;

  // Limpiar errores anteriores
  document.querySelectorAll('.field-error').forEach(el => el.textContent = '');
  document.querySelectorAll('.input-error').forEach(el => el.classList.remove('input-error'));
  document.getElementById('error-formulario').style.display = 'none';

  // Leer los valores
  const nombre    = document.getElementById('nombre-registro').value.trim();
  const apellidos = document.getElementById('apellidos-registro').value.trim();
  const email     = document.getElementById('email-registro').value.trim();
  const password  = document.getElementById('password-registro').value;
  const password2 = document.getElementById('password2-registro').value;
  const terminos  = document.getElementById('terminos-registro').checked;

  // Validar nombre
  if (nombre.length < 2) {
    marcarError('nombre-registro', 'error-nombre', 'El nombre debe tener al menos 2 caracteres.');
    valido = false;
  }

  // Validar apellidos
  if (apellidos.length < 2) {
    marcarError('apellidos-registro', 'error-apellidos', 'Los apellidos son obligatorios.');
    valido = false;
  }

  // Validar email
  const regexEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (!regexEmail.test(email)) {
    marcarError('email-registro', 'error-email', 'Introduce un email válido.');
    valido = false;
  }

  // Validar contraseña
  if (password.length < 6) {
    marcarError('password-registro', 'error-password', 'La contraseña debe tener mínimo 6 caracteres.');
    valido = false;
  }

  // Validar que las contraseñas coincidan
  if (password !== password2) {
    marcarError('password2-registro', 'error-password2', 'Las contraseñas no coinciden.');
    valido = false;
  }

  // Validar términos
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

// Registra al usuario y redirige al inicio si tiene éxito
async function registrarUsuario() {
  const datos = {
    nombre:     document.getElementById('nombre-registro').value.trim(),
    apellidos:  document.getElementById('apellidos-registro').value.trim(),
    email:      document.getElementById('email-registro').value.trim(),
    password:   document.getElementById('password-registro').value,
    newsletter: document.getElementById('newsletter-registro').checked
  };

  const resultado = await Usuario.registrar(datos);

  if (resultado.ok) {
    window.location.href = 'index.html';
  } else {
    const errorEl = document.getElementById('error-formulario');
    errorEl.textContent = resultado.msg;
    errorEl.style.display = 'block';
  }
}

// Exportamos para poder usarla desde el HTML si hace falta
window.cambiarPestanaAuth = cambiarPestana;
