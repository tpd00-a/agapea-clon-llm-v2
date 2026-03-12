// ---- PÁGINA PRINCIPAL (CATÁLOGO) ----
// Carga los libros, filtra, ordena y pagina los resultados

import { cargarLibros } from '../services/libros.js';
import { formatearPrecio } from '../utils/helpers.js';
import { Carrito }   from '../modulos/carrito.js';
import { Favoritos } from '../modulos/favoritos.js';

// Variables de esta página
let todosLosLibros = [];
let librosFiltrados = [];
const LIBROS_POR_PAGINA = 8;
let paginaActual = 1;

export async function initPaginaInicio() {

  const libros = await cargarLibros();
  todosLosLibros = libros;
  librosFiltrados = [...libros];

  renderizarLibros();
  renderizarPaginacion();

  // ---- EVENTOS DE FILTRADO ----

  // Filtra mientras el usuario escribe
  document.getElementById('filtro-texto').addEventListener('input', () => {
    paginaActual = 1;
    aplicarFiltros();
  });

  // Filtra al cambiar la categoría en el select
  document.getElementById('filtro-categoria').addEventListener('change', () => {
    paginaActual = 1;
    aplicarFiltros();
  });

  // Ordena al cambiar el select de orden
  document.getElementById('filtro-orden').addEventListener('change', () => {
    paginaActual = 1;
    aplicarFiltros();
  });

  // Filtrar al hacer clic en el sidebar de categorías
  const enlacesCategorias = document.querySelectorAll('#lista-categorias a');
  for (let enlace of enlacesCategorias) {
    enlace.addEventListener('click', function (e) {
      e.preventDefault();
      const cat = this.getAttribute('data-cat');

      document.getElementById('filtro-categoria').value = (cat === 'all') ? '' : cat;
      paginaActual = 1;
      aplicarFiltros();

      // Marcar como activo el enlace pulsado
      enlacesCategorias.forEach(a => a.parentElement.classList.remove('active'));
      this.parentElement.classList.add('active');
    });
  }
}

// Filtra y ordena los libros según los valores de los filtros
function aplicarFiltros() {
  const texto     = document.getElementById('filtro-texto').value.toLowerCase();
  const categoria = document.getElementById('filtro-categoria').value;
  const orden     = document.getElementById('filtro-orden').value;

  // Filtrar por texto (busca en título, autor, ISBN y etiquetas)
  librosFiltrados = todosLosLibros.filter(libro => {
    const coincideTexto = !texto ||
      libro.titulo.toLowerCase().includes(texto) ||
      libro.autor.toLowerCase().includes(texto) ||
      libro.isbn.includes(texto) ||
      (libro.etiquetas && libro.etiquetas.some(t => t.includes(texto)));

    const coincideCategoria = !categoria || libro.categoria === categoria;

    return coincideTexto && coincideCategoria;
  });

  // Ordenar según lo que se haya elegido
  if (orden === 'precio-asc') {
    librosFiltrados.sort((a, b) => a.precio - b.precio);
  } else if (orden === 'precio-desc') {
    librosFiltrados.sort((a, b) => b.precio - a.precio);
  } else if (orden === 'fecha') {
    librosFiltrados.sort((a, b) => b.año - a.año);
  } else if (orden === 'titulo') {
    librosFiltrados.sort((a, b) => a.titulo.localeCompare(b.titulo));
  }

  renderizarLibros();
  renderizarPaginacion();
}

// Muestra los libros de la página actual
function renderizarLibros() {
  const contenedor    = document.getElementById('contenedor-libros');
  const numResultados = document.getElementById('num-resultados');

  if (!contenedor) return;

  // Mostrar cuántos resultados hay
  if (numResultados) {
    numResultados.textContent = librosFiltrados.length + ' resultado' +
      (librosFiltrados.length !== 1 ? 's' : '') + ' encontrados';
  }

  // Sin resultados
  if (librosFiltrados.length === 0) {
    contenedor.style.display = 'block';
    contenedor.innerHTML = '<p style="padding:20px;color:#888">No se encontraron libros con estos filtros.</p>';
    return;
  }

  // Calcular qué libros van en esta página
  const inicio = (paginaActual - 1) * LIBROS_POR_PAGINA;
  const fin    = inicio + LIBROS_POR_PAGINA;
  const librosPagina = librosFiltrados.slice(inicio, fin);

  contenedor.style.display = 'grid';
  contenedor.innerHTML = librosPagina.map(tarjetaLibroHTML).join('');
}

// Genera el HTML de una tarjeta de libro
function tarjetaLibroHTML(libro) {
  const esFav = Favoritos.esFavorito(libro.id);
  const tieneDescuento = libro.descuento > 0;

  return `
    <div class="bookcase-item">
      <a href="book.html?id=${libro.id}" class="book-link">
        <figure>
          ${tieneDescuento ? `<span class="badge-discount">-${libro.descuento}%</span>` : ''}
          ${libro.novedad    ? `<span class="badge-new">NOVEDAD</span>` : ''}
          ${libro.masVendido ? `<span class="badge-best">BEST SELLER</span>` : ''}
          <img src="${libro.portada}" alt="${libro.titulo}" onerror="this.src='img/sin-portada.jpg'">
        </figure>
      </a>
      <div class="book-info">
        <div class="book-title">${libro.titulo}</div>
        <div class="book-author">${libro.autor}</div>
        <div class="book-price-wrap">
          <span class="book-price">${formatearPrecio(libro.precio)}</span>
          ${tieneDescuento ? `<span class="book-orig-price">${formatearPrecio(libro.precioOriginal)}</span>` : ''}
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

  const totalPaginas = Math.ceil(librosFiltrados.length / LIBROS_POR_PAGINA);

  if (totalPaginas <= 1) {
    contenedorPag.innerHTML = '';
    return;
  }

  let html = '';

  html += `<button onclick="irAPagina(${paginaActual - 1})" ${paginaActual === 1 ? 'disabled' : ''}>‹ Ant.</button>`;

  for (let i = 1; i <= totalPaginas; i++) {
    html += `<button onclick="irAPagina(${i})" class="${i === paginaActual ? 'active' : ''}">${i}</button>`;
  }

  html += `<button onclick="irAPagina(${paginaActual + 1})" ${paginaActual === totalPaginas ? 'disabled' : ''}>Sig. ›</button>`;

  contenedorPag.innerHTML = html;
}

// Cambia de página
window.irAPagina = function (n) {
  const totalPaginas = Math.ceil(librosFiltrados.length / LIBROS_POR_PAGINA);
  if (n < 1 || n > totalPaginas) return;
  paginaActual = n;
  renderizarLibros();
  renderizarPaginacion();
  window.scrollTo(0, 0);
};

// Añade un libro al carrito desde la tarjeta del catálogo
window.anadirDesdeCard = function (id) {
  const libro = todosLosLibros.find(b => b.id === id);
  if (libro) Carrito.anadir(libro);
};

// Alterna el favorito desde la tarjeta del catálogo
window.alternarFavCard = function (id, boton) {
  const esFav = Favoritos.alternar(id);
  const icono = boton.querySelector('i');
  icono.className = 'fa-' + (esFav ? 'solid' : 'regular') + ' fa-heart';
  boton.classList.toggle('active', esFav);
};
