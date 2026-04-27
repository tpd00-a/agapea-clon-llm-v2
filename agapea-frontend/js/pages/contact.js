// ---- PÁGINA DE CONTACTO ----
// Gestiona el formulario de contacto y su validación

import { apiFetch } from '../services/api.js';
import { Usuario } from '../modulos/usuario.js';

/**
 * Función de inicio de la página de contacto.
 * Rellena los campos si el usuario tiene sesión y gestiona el envío.
 */
export function initPaginaContacto() {
  const form = document.getElementById('formulario-contacto');
  const inputNombre = document.getElementById('contact-nombre');
  const inputEmail = document.getElementById('contact-email');
  const selectAsunto = document.getElementById('contact-asunto');
  const inputMensaje = document.getElementById('contact-mensaje');

  // Si hay usuario logueado, rellenar nombre y email automáticamente
  const user = Usuario.obtener();
  if (user) {
    inputNombre.value = ((user.first_name || '') + ' ' + (user.last_name || '')).trim();
    inputEmail.value = user.email || '';
  }

  if (!form) return;

  // Gestionar el envío del formulario
  form.addEventListener('submit', async (e) => {
    e.preventDefault();

    // Validar los campos
    let valid = true;

    const errNombre = document.getElementById('error-contact-nombre');
    if (!inputNombre.value.trim()) {
      errNombre.textContent = 'El nombre es obligatorio.';
      valid = false;
    } else {
      errNombre.textContent = '';
    }

    const errEmail = document.getElementById('error-contact-email');
    if (!inputEmail.value.trim() || !inputEmail.value.includes('@')) {
      errEmail.textContent = 'El email no es válido.';
      valid = false;
    } else {
      errEmail.textContent = '';
    }

    const errAsunto = document.getElementById('error-contact-asunto');
    if (!selectAsunto.value) {
      errAsunto.textContent = 'Selecciona un asunto.';
      valid = false;
    } else {
      errAsunto.textContent = '';
    }

    const errMensaje = document.getElementById('error-contact-mensaje');
    if (!inputMensaje.value.trim()) {
      errMensaje.textContent = 'El mensaje no puede estar vacío.';
      valid = false;
    } else {
      errMensaje.textContent = '';
    }

    if (!valid) return;

    // Deshabilitar botón mientras se envía
    const btn = document.getElementById('btn-submit-contact');
    btn.disabled = true;
    btn.innerHTML = 'Enviando...';

    const generalErr = document.getElementById('error-contact-general');
    const generalSuccess = document.getElementById('success-contact-general');
    generalErr.style.display = 'none';
    generalSuccess.style.display = 'none';

    // Enviar el mensaje a la API
    try {
      await apiFetch('/contacts', {
        method: 'POST',
        body: JSON.stringify({
          name: inputNombre.value.trim(),
          email: inputEmail.value.trim(),
          subject: selectAsunto.value,
          message: inputMensaje.value.trim()
        })
      });

      generalSuccess.textContent = '¡Mensaje enviado con éxito! Te contactaremos pronto.';
      generalSuccess.style.display = 'block';
      form.reset();

    } catch (err) {
      generalErr.textContent = err.message || 'Error al enviar el mensaje.';
      generalErr.style.display = 'block';

    } finally {
      btn.disabled = false;
      btn.innerHTML = '<i class="fa-solid fa-paper-plane"></i> Enviar mensaje';
    }
  });
}
