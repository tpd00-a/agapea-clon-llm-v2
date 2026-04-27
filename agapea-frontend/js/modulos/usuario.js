// ---- MÓDULO DE USUARIO ----
// Gestiona el login, registro y la sesión del usuario usando la API

import { apiFetch } from '../services/api.js';

export const Usuario = {

  // Devuelve el usuario que tiene la sesión activa (o null si no hay)
  obtener() {
    try {
      return JSON.parse(localStorage.getItem('agapea_usuario'));
    } catch {
      return null;
    }
  },

  // Inicia sesión a través de la API
  async login(email, password) {
    try {
      const response = await apiFetch('/auth/login', {
        method: 'POST',
        body: JSON.stringify({ email, password })
      });

      // El backend devuelve { data: { customer: {...}, token: "..." } }
      const datos = response.data;

      if (datos && datos.token) {
        localStorage.setItem('agapea_token', datos.token);
        localStorage.setItem('agapea_usuario', JSON.stringify(datos.customer || datos.user));
        return { ok: true };
      }

      return { ok: false, msg: 'Respuesta inesperada del servidor.' };

    } catch (error) {
      return { ok: false, msg: error.message || 'Credenciales incorrectas o error de servidor.' };
    }
  },

  // Cierra sesión (elimina token y datos del usuario del navegador)
  logout() {
    localStorage.removeItem('agapea_token');
    localStorage.removeItem('agapea_usuario');
  },

  // Registra un nuevo cliente a través de la API
  async registrar(datos) {
    try {
      const payload = {
        nif: 'NIF' + Math.floor(Math.random() * 10000),
        first_name: datos.nombre,
        last_name: datos.apellidos,
        email: datos.email,
        password: datos.password,
        newsletter: datos.newsletter || false
      };

      const response = await apiFetch('/auth/register', {
        method: 'POST',
        body: JSON.stringify(payload)
      });

      const d = response.data;

      if (d && d.token) {
        localStorage.setItem('agapea_token', d.token);
        localStorage.setItem('agapea_usuario', JSON.stringify(d.customer || d.user));
        return { ok: true };
      }

      return { ok: false, msg: 'No se generó el token tras el registro.' };

    } catch (error) {
      return { ok: false, msg: error.message || 'Error en el registro.' };
    }
  },

  // Actualiza el texto y menú del usuario en la cabecera
  actualizarCabecera() {
    const spanInfo = document.getElementById('nombre-usuario');
    if (!spanInfo) return;

    const linkLogin = spanInfo.closest('a');
    if (!linkLogin) return;

    const usuario = this.obtener();

    if (usuario) {
      // Usuario logueado: mostramos su nombre con un menú desplegable
      linkLogin.removeAttribute('href');
      linkLogin.style.cursor = 'pointer';
      linkLogin.classList.add('user-dropdown-container');

      // Nombre del usuario
      const nombre = usuario.first_name || usuario.nombre;

      // Generamos el HTML del desplegable
      spanInfo.innerHTML = nombre + ' <i class="fa-solid fa-chevron-down" style="font-size:0.7em; margin-left:4px;"></i>'
        + '<div class="user-dropdown-menu">'
        +   '<a href="login.html" style="color:var(--text-color);">Mi cuenta</a>'
        +   '<a href="#" id="btn-logout-dropdown" style="color:var(--text-color);">Cerrar sesión</a>'
        + '</div>';

      // Añadir evento de logout al enlace (en vez de onclick inline)
      const btnLogout = document.getElementById('btn-logout-dropdown');
      if (btnLogout) {
        btnLogout.addEventListener('click', (e) => {
          e.preventDefault();
          this.logout();
          window.location.reload();
        });
      }

    } else {
      // Sin sesión: mostramos enlace al login
      linkLogin.setAttribute('href', 'login.html');
      linkLogin.classList.remove('user-dropdown-container');
      spanInfo.textContent = 'Login';
    }
  }

};

// Lo ponemos en window para poder usarlo desde el HTML
window.Usuario = Usuario;
