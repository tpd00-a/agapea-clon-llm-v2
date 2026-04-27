// ---- PÁGINA PRINCIPAL (CATÁLOGO) ----
// Carga los libros desde la API, filtra, ordena y pagina los resultados

import { cargarLibros } from '../services/libros.js';
import { formatearPrecio, procesarImagen } from '../utils/helpers.js';
import { Carrito }   from '../modulos/carrito.js';
import { Favoritos } from '../modulos/favoritos.js';

// Variables de estado de esta página
let librosFiltrados = [];
let paginaActual = 1;
let metaGlobal = { total: 0, page: 1, per_page: 8 };

/**
 * Función de inicio de la página del catálogo.
 * Se ejecuta cuando app.js detecta que estamos en index.html.
 */
export async function initPaginaInicio() {

  // Carga inicial de libros
  await cargarDatos();

  // ---- EVENTOS DE FILTRADO ----

  // Filtrar al escribir en el buscador (con un retardo de 400ms para no saturar)
  let timeoutFiltro;
  document.getElementById('filtro-texto').addEventListener('input', () => {
    clearTimeout(timeoutFiltro);
    timeoutFiltro = setTimeout(() => {
      paginaActual = 1;
      cargarDatos();
    }, 400);
  });

  // Filtrar al cambiar la categoría en el select
  document.getElementById('filtro-categoria').addEventListener('change', () => {
    paginaActual = 1;
    cargarDatos();
  });

  // Ordenar al cambiar el select de orden
  document.getElementById('filtro-orden').addEventListener('change', () => {
    paginaActual = 1;
    cargarDatos();
  });

  // Filtrar al hacer clic en el sidebar de categorías
  const enlacesCategorias = document.querySelectorAll('#lista-categorias a');
  for (let enlace of enlacesCategorias) {
    enlace.addEventListener('click', function (e) {
      e.preventDefault();
      const cat = this.getAttribute('data-cat');

      // Sincronizar el select con la categoría pulsada
      document.getElementById('filtro-categoria').value = (cat === 'all') ? '' : cat;
      paginaActual = 1;
      cargarDatos();

      // Marcar como activo el enlace pulsado
      enlacesCategorias.forEach(a => a.parentElement.classList.remove('active'));
      this.parentElement.classList.add('active');
    });
  }
}

/**
 * Llama a la API con los filtros actuales y repinta la interfaz.
 * Se exporta para que app.js pueda llamarla desde la búsqueda de la cabecera.
 */
export async function cargarDatos() {
  // Leer los valores de los filtros
  const texto     = document.getElementById('filtro-texto').value.trim();
  const categoria = document.getElementById('filtro-categoria').value;
  const orden     = document.getElementById('filtro-orden').value;

  // Preparar las opciones para la petición
  const opciones = {
    page: paginaActual,
    per_page: 8
  };

  if (texto) opciones.search = texto;
  if (categoria) opciones.category = categoria;

  // Traducir los valores del select HTML a los que espera la API
  if (orden === 'precio-asc') opciones.sort = 'price_asc';
  else if (orden === 'precio-desc') opciones.sort = 'price_desc';
  else if (orden === 'fecha') opciones.sort = 'newest';

  // Mostrar mensaje de carga
  const contenedor = document.getElementById('contenedor-libros');
  if (contenedor) contenedor.innerHTML = '<p>Cargando catálogo...</p>';

  // Hacer la petición a la API
  const response = await cargarLibros(opciones);
  librosFiltrados = response.data || [];
  metaGlobal = response.meta || { total: librosFiltrados.length, page: 1, per_page: 8 };

  // Actualizar la página actual si el servidor devuelve otra
  if (metaGlobal.page && metaGlobal.page !== paginaActual) {
    paginaActual = metaGlobal.page;
  }

  // Pintar los resultados
  renderizarLibros();
  renderizarPaginacion();
}

// Muestra las tarjetas de libros en el contenedor
function renderizarLibros() {
  const contenedor    = document.getElementById('contenedor-libros');
  const numResultados = document.getElementById('num-resultados');

  if (!contenedor) return;

  // Mostrar cuántos resultados hay
  if (numResultados && metaGlobal.total !== undefined) {
    numResultados.textContent = metaGlobal.total + ' resultado' +
      (metaGlobal.total !== 1 ? 's' : '') + ' encontrados';
  }

  // Sin resultados
  if (librosFiltrados.length === 0) {
    contenedor.style.display = 'block';
    contenedor.innerHTML = '<p style="padding:20px;color:#888">No se encontraron libros con estos filtros.</p>';
    return;
  }

  // Generar las tarjetas de cada libro
  contenedor.style.display = 'grid';
  contenedor.innerHTML = librosFiltrados.map(tarjetaLibroHTML).join('');
}

// Genera el HTML de una tarjeta de libro
function tarjetaLibroHTML(libro) {
  const esFav = Favoritos.esFavorito(libro.id);
  const tieneDescuento = libro.discount > 0;
  const autorName = libro.author ? libro.author.name : 'Autor desconocido';

  return `
    <div class="bookcase-item">
      <a href="book.html?id=${libro.id}" class="book-link">
        <figure>
          ${tieneDescuento ? `<span class="badge-discount">-${libro.discount}%</span>` : ''}
          ${libro.is_new    ? `<span class="badge-new">NOVEDAD</span>` : ''}
          ${libro.is_bestseller ? `<span class="badge-best">BEST SELLER</span>` : ''}
          <img src="${libro.cover_image ? procesarImagen(libro.cover_image) : 'img/sin-portada.jpg'}" alt="${libro.title}" onerror="this.src='img/sin-portada.jpg'">
        </figure>
      </a>
      <div class="book-info">
        <div class="book-title">${libro.title}</div>
        <div class="book-author">${autorName}</div>
        <div class="book-price-wrap">
          <span class="book-price">${formatearPrecio(libro.price)}</span>
          ${tieneDescuento ? `<span class="book-orig-price">${formatearPrecio(libro.original_price)}</span>` : ''}
        </div>
      </div>
      <div class="book-actions">
        <button class="botpeq" onclick="anadirDesdeCard(${libro.id})">
          <i class="fa-solid fa-cart-plus"></i> Añadir
        </button>
        <button class="btn-fav-card ${esFav ? 'active' : ''}" onclick="alternarFavCard(${libro.id}, this)">
          <i class="fa-${esFav ? 'solid' : 'regular'} fa-heart"></i>
        </button>
      </div>
    </div>
  `;
}

// Genera los botones de paginación
function renderizarPaginacion() {
  const contenedorPag = document.getElementById('paginacion');
  if (!contenedorPag) return;

  const totalPaginas = Math.ceil((metaGlobal.total || 0) / (metaGlobal.per_page || 8));

  if (totalPaginas <= 1) {
    contenedorPag.innerHTML = '';
    return;
  }

  let html = '';

  // Botón "Anterior"
  html += `<button onclick="irAPagina(${paginaActual - 1})" ${paginaActual === 1 ? 'disabled' : ''}>‹ Ant.</button>`;

  // Botones de cada página
  for (let i = 1; i <= totalPaginas; i++) {
    html += `<button onclick="irAPagina(${i})" class="${i === paginaActual ? 'active' : ''}">${i}</button>`;
  }

  // Botón "Siguiente"
  html += `<button onclick="irAPagina(${paginaActual + 1})" ${paginaActual === totalPaginas ? 'disabled' : ''}>Sig. ›</button>`;

  contenedorPag.innerHTML = html;
}

// ---- FUNCIONES GLOBALES (para los onclick del HTML) ----

// Cambia de página
window.irAPagina = function (n) {
  const totalPaginas = Math.ceil((metaGlobal.total || 0) / (metaGlobal.per_page || 8));
  if (n < 1 || n > totalPaginas) return;
  paginaActual = n;
  cargarDatos();
  window.scrollTo(0, 0);
};

// Añade un libro al carrito desde la tarjeta del catálogo
window.anadirDesdeCard = function (id) {
  const libro = librosFiltrados.find(b => b.id === id);
  if (libro) Carrito.anadir(libro);
};

// Alterna el favorito desde la tarjeta del catálogo
window.alternarFavCard = function (id, boton) {
  const esFav = Favoritos.alternar(id);
  const icono = boton.querySelector('i');
  icono.className = 'fa-' + (esFav ? 'solid' : 'regular') + ' fa-heart';
  boton.classList.toggle('active', esFav);
};
