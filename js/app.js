// ---- PUNTO DE ENTRADA PRINCIPAL ----
// Este archivo detecta en qué página estamos y lanza su función de inicio

import { initPaginaInicio }  from './pages/index.js';
import { initPaginaLibro }   from './pages/book.js';
import { initPaginaCarrito } from './pages/cart.js';
import { initPaginaLogin }   from './pages/login.js';
import { Carrito }  from './modulos/carrito.js';
import { Usuario }  from './modulos/usuario.js';

document.addEventListener('DOMContentLoaded', () => {

  // Actualizar la cabecera (carrito + nombre de usuario) al cargar cada página
  Carrito.actualizarCabecera();
  Usuario.actualizarCabecera();

  // Detectar qué página es y ejecutar su código
  const pagina = location.pathname.split('/').pop() || 'index.html';

  if (pagina === 'index.html' || pagina === '') {
    initPaginaInicio();
  }
  if (pagina === 'book.html') {
    initPaginaLibro();
  }
  if (pagina === 'cart.html') {
    initPaginaCarrito();
  }
  if (pagina === 'login.html') {
    initPaginaLogin();
  }

});

// Búsqueda desde la barra de la cabecera
// Si estamos en el catálogo, rellena el filtro directamente
// Si estamos en otra página, va al catálogo
window.buscarDesdeCabecera = function () {
  const texto = document.getElementById('input-busqueda')?.value.trim();
  if (!texto) return;

  const pagina = location.pathname.split('/').pop() || 'index.html';

  if (pagina === 'index.html' || pagina === '') {
    const filtro = document.getElementById('filtro-texto');
    if (filtro) {
      filtro.value = texto;
      filtro.dispatchEvent(new Event('input'));
    }
  } else {
    window.location.href = 'index.html';
  }
};
