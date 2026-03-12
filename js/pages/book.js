// ---- PÁGINA DE FICHA DE LIBRO ----
// Carga y muestra los datos de un libro según el ?id= de la URL

import { cargarLibros } from '../services/libros.js';
import { formatearPrecio } from '../utils/helpers.js';
import { Carrito }   from '../modulos/carrito.js';
import { Favoritos } from '../modulos/favoritos.js';

let libroActual = null;

export async function initPaginaLibro() {

  // URLSearchParams es necesario aquí para saber qué libro cargar
  const params = new URLSearchParams(location.search);
  const id = parseInt(params.get('id'));

  const libros = await cargarLibros();
  libroActual = libros.find(l => l.id === id);

  if (!libroActual) {
    document.getElementById('ficha-libro').innerHTML = '<p>Libro no encontrado.</p>';
    document.getElementById('ficha-libro').style.display = 'block';
    return;
  }

  renderizarFicha(libroActual);

  const relacionados = libros.filter(l => l.categoria === libroActual.categoria && l.id !== libroActual.id).slice(0, 4);
  if (relacionados.length > 0) {
    renderizarRelacionados(relacionados);
  }
}

function renderizarFicha(libro) {

  document.getElementById('ficha-libro').style.display = 'flex';
  document.title = libro.titulo + ' - Librería Agapea';

  document.getElementById('breadcrumb-categoria').textContent = libro.categoria;
  document.getElementById('breadcrumb-titulo').textContent = libro.titulo;

  const portada = document.getElementById('portada-libro');
  portada.src = libro.portada;
  portada.alt = libro.titulo;
  portada.onerror = () => { portada.src = 'img/sin-portada.jpg'; };

  let htmlBadges = '';
  if (libro.descuento > 0) htmlBadges += `<span class="badge-discount">-${libro.descuento}%</span> `;
  if (libro.novedad)       htmlBadges += `<span class="badge-new">NOVEDAD</span> `;
  if (libro.masVendido)    htmlBadges += `<span class="badge-best">BEST SELLER</span>`;
  document.getElementById('badges-libro').innerHTML = htmlBadges;

  const esFav = Favoritos.esFavorito(libro.id);
  document.getElementById('icono-favorito').className = 'fa-' + (esFav ? 'solid' : 'regular') + ' fa-heart';
  document.getElementById('texto-favorito').textContent = esFav ? 'En favoritos' : 'Añadir a favoritos';
  if (esFav) document.getElementById('btn-favorito').classList.add('active');

  document.getElementById('titulo-libro').textContent = libro.titulo;
  document.getElementById('autor-libro').textContent = libro.autor;

  document.getElementById('precio-libro').textContent = formatearPrecio(libro.precio);
  if (libro.descuento > 0) {
    document.getElementById('precio-original').textContent = formatearPrecio(libro.precioOriginal);
    document.getElementById('badge-descuento').textContent = '-' + libro.descuento + '%';
  }

  const infoStock = document.getElementById('info-stock');
  if (libro.stock > 5) {
    infoStock.innerHTML = '<span class="stock-ok"><i class="fa-solid fa-check"></i> Disponible</span>';
  } else if (libro.stock > 0) {
    infoStock.innerHTML = '<span class="stock-low"><i class="fa-solid fa-triangle-exclamation"></i> Últimas ' + libro.stock + ' unidades</span>';
  } else {
    infoStock.innerHTML = '<span class="stock-out"><i class="fa-solid fa-xmark"></i> Sin stock</span>';
    document.getElementById('btn-anadir-carrito').disabled = true;
  }

  document.getElementById('texto-descripcion').textContent = libro.descripcion;

  document.getElementById('tabla-detalles').innerHTML = `
    <tr><th>ISBN</th><td>${libro.isbn}</td></tr>
    <tr><th>Editorial</th><td>${libro.editorial}</td></tr>
    <tr><th>Año</th><td>${libro.año}</td></tr>
    <tr><th>Páginas</th><td>${libro.paginas}</td></tr>
    <tr><th>Idioma</th><td>${libro.idioma}</td></tr>
    <tr><th>Categoría</th><td>${libro.categoria}</td></tr>
    <tr><th>Género</th><td>${libro.genero}</td></tr>
  `;
}

function renderizarRelacionados(libros) {
  document.getElementById('seccion-relacionados').style.display = 'block';
  document.getElementById('contenedor-relacionados').innerHTML = libros.map(l => `
    <div class="bookcase-item">
      <a href="book.html?id=${l.id}" class="book-link">
        <figure>
          <img src="${l.portada}" alt="${l.titulo}" onerror="this.src='img/sin-portada.jpg'">
        </figure>
      </a>
      <div class="book-info">
        <div class="book-title">${l.titulo}</div>
        <div class="book-author">${l.autor}</div>
        <div class="book-price-wrap"><span class="book-price">${formatearPrecio(l.precio)}</span></div>
      </div>
      <div class="book-actions">
        <button class="botpeq" onclick="anadirRelacionado(${l.id})">Añadir</button>
      </div>
    </div>
  `).join('');
}

// Cambia entre las pestañas (Descripción / Detalles)
window.cambiarPestana = function (boton, idPanel) {
  document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
  document.querySelectorAll('.tab-panel').forEach(p => p.classList.remove('active'));
  boton.classList.add('active');
  document.getElementById(idPanel).classList.add('active');
};

window.cambiarCantidad = function (delta) {
  const input = document.getElementById('input-cantidad');
  const nueva = parseInt(input.value) + delta;
  if (nueva >= 1 && nueva <= 99) input.value = nueva;
};

window.anadirAlCarrito = function () {
  if (!libroActual) return;
  const cantidad = parseInt(document.getElementById('input-cantidad').value) || 1;
  Carrito.anadir(libroActual, cantidad);
  alert('"' + libroActual.titulo + '" añadido al carrito.');
};

window.alternarFavoritoFicha = function () {
  if (!libroActual) return;
  const esFav = Favoritos.alternar(libroActual.id);
  document.getElementById('icono-favorito').className = 'fa-' + (esFav ? 'solid' : 'regular') + ' fa-heart';
  document.getElementById('texto-favorito').textContent = esFav ? 'En favoritos' : 'Añadir a favoritos';
  document.getElementById('btn-favorito').classList.toggle('active', esFav);
};

window.anadirRelacionado = async function (id) {
  const libros = await cargarLibros();
  const libro = libros.find(l => l.id === id);
  if (libro) Carrito.anadir(libro);
};
