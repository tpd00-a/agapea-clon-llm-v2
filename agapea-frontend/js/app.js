// ---- PUNTO DE ENTRADA PRINCIPAL ----
// Este archivo detecta en qué página estamos y lanza su función de inicio

import { initPaginaInicio, cargarDatos } from './pages/index.js';
import { initPaginaLibro }   from './pages/book.js';
import { initPaginaCarrito } from './pages/cart.js';
import { initPaginaLogin }   from './pages/login.js';
import { initPaginaContacto } from './pages/contact.js';
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
  if (pagina === 'contact.html') {
    initPaginaContacto();
  }

});

// Búsqueda desde la barra de la cabecera
// Si estamos en el catálogo, rellena el filtro y recarga los datos
// Si estamos en otra página, redirige al catálogo
window.buscarDesdeCabecera = function () {
  const inputBusqueda = document.getElementById('input-busqueda');
  const texto = inputBusqueda ? inputBusqueda.value.trim() : '';
  if (!texto) return;

  const pagina = location.pathname.split('/').pop() || 'index.html';

  if (pagina === 'index.html' || pagina === '') {
    // Estamos en el catálogo: ponemos el texto en el filtro y recargamos
    const filtro = document.getElementById('filtro-texto');
    if (filtro) {
      filtro.value = texto;
      cargarDatos(); // Llamamos directamente a la función exportada
    }
  } else {
    // Estamos en otra página: redirigimos al catálogo
    window.location.href = 'index.html';
  }
};
