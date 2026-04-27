// ---- PÁGINA DE FICHA DE LIBRO ----
// Carga y muestra los datos de un libro según el ?id= de la URL
// También carga libros relacionados y reseñas desde la API

import { cargarUnLibro } from '../services/libros.js';
import { apiFetch } from '../services/api.js';
import { formatearPrecio, procesarImagen } from '../utils/helpers.js';
import { Carrito }   from '../modulos/carrito.js';
import { Favoritos } from '../modulos/favoritos.js';

// El libro que se está mostrando actualmente
let libroActual = null;

// Puntuación seleccionada en el formulario de reseñas (por defecto 5)
let puntuacionResena = 5;

/**
 * Función de inicio de la página de ficha de libro.
 * Lee el ?id= de la URL y carga toda la información.
 */
export async function initPaginaLibro() {

  // Leer el parámetro "id" de la URL (ej: book.html?id=3)
  const params = new URLSearchParams(location.search);
  const id = parseInt(params.get('id'));

  // Si no hay id válido, mostrar error
  if (!id || isNaN(id)) {
    document.getElementById('ficha-libro').innerHTML = '<p>Identificador de libro inválido.</p>';
    document.getElementById('ficha-libro').style.display = 'block';
    return;
  }

  // Cargar los datos del libro desde la API
  libroActual = await cargarUnLibro(id);

  if (!libroActual) {
    document.getElementById('ficha-libro').innerHTML = '<p>Libro no encontrado en el servidor.</p>';
    document.getElementById('ficha-libro').style.display = 'block';
    return;
  }

  // Pintar la ficha del libro
  renderizarFicha(libroActual);

  // Cargar libros relacionados
  try {
    const response = await apiFetch(`/books/${id}/related`);
    if (response.data && response.data.length > 0) {
      renderizarRelacionados(response.data);
    }
  } catch (e) {
    console.warn('No se pudieron cargar los libros relacionados', e);
  }

  // Cargar reseñas
  try {
    const resReviews = await apiFetch(`/books/${id}/reviews`);
    if (resReviews && resReviews.data) {
      renderizarResenas(resReviews.data);
    }
  } catch (e) {
    console.warn('No se pudieron cargar las reseñas', e);
  }

  // Preparar el formulario de reseña (o aviso de login)
  renderizarFormularioResena();
}

// Rellena la ficha del libro con todos sus datos
function renderizarFicha(libro) {

  document.getElementById('ficha-libro').style.display = 'flex';
  document.title = libro.title + ' - Librería Agapea';

  // Extraer nombres de las relaciones (categoría, editorial, autor)
  const catName = libro.category ? libro.category.name : 'Sin Categoría';
  const pubName = libro.publisher ? libro.publisher.name : 'Editorial Desconocida';
  const authorName = libro.author ? libro.author.name : 'Autor Desconocido';

  // Breadcrumb
  document.getElementById('breadcrumb-categoria').textContent = catName;
  document.getElementById('breadcrumb-titulo').textContent = libro.title;

  // Portada
  const portada = document.getElementById('portada-libro');
  portada.src = libro.cover_image ? procesarImagen(libro.cover_image) : 'img/sin-portada.jpg';
  portada.alt = libro.title;
  portada.onerror = () => { portada.src = 'img/sin-portada.jpg'; };

  // Badges (descuento, novedad, bestseller)
  let htmlBadges = '';
  if (libro.discount > 0)    htmlBadges += `<span class="badge-discount">-${libro.discount}%</span> `;
  if (libro.is_new)          htmlBadges += `<span class="badge-new">NOVEDAD</span> `;
  if (libro.is_bestseller)   htmlBadges += `<span class="badge-best">BEST SELLER</span>`;
  document.getElementById('badges-libro').innerHTML = htmlBadges;

  // Botón de favoritos
  const esFav = Favoritos.esFavorito(libro.id);
  document.getElementById('icono-favorito').className = 'fa-' + (esFav ? 'solid' : 'regular') + ' fa-heart';
  document.getElementById('texto-favorito').textContent = esFav ? 'En favoritos' : 'Añadir a favoritos';
  if (esFav) document.getElementById('btn-favorito').classList.add('active');

  // Título y autor
  document.getElementById('titulo-libro').textContent = libro.title;
  document.getElementById('autor-libro').textContent = authorName;

  // Precio y descuento
  document.getElementById('precio-libro').textContent = formatearPrecio(libro.price);
  if (libro.discount > 0) {
    document.getElementById('precio-original').textContent = formatearPrecio(libro.original_price);
    document.getElementById('badge-descuento').textContent = '-' + libro.discount + '%';
  }

  // Stock
  const infoStock = document.getElementById('info-stock');
  if (libro.stock > 5) {
    infoStock.innerHTML = '<span class="stock-ok"><i class="fa-solid fa-check"></i> Disponible</span>';
  } else if (libro.stock > 0) {
    infoStock.innerHTML = '<span class="stock-low"><i class="fa-solid fa-triangle-exclamation"></i> Últimas ' + libro.stock + ' unidades</span>';
  } else {
    infoStock.innerHTML = '<span class="stock-out"><i class="fa-solid fa-xmark"></i> Sin stock</span>';
    document.getElementById('btn-anadir-carrito').disabled = true;
  }

  // Descripción
  document.getElementById('texto-descripcion').textContent = libro.description || 'Sin descripción disponible';

  // Tabla de detalles
  document.getElementById('tabla-detalles').innerHTML = `
    <tr><th>ISBN</th><td>${libro.isbn}</td></tr>
    <tr><th>Editorial</th><td>${pubName}</td></tr>
    <tr><th>Año</th><td>${libro.year || 'N/A'}</td></tr>
    <tr><th>Páginas</th><td>${libro.pages || 'N/A'}</td></tr>
    <tr><th>Idioma</th><td>${libro.language || 'N/A'}</td></tr>
    <tr><th>Categoría</th><td>${catName}</td></tr>
    <tr><th>Género</th><td>${libro.genre || 'N/A'}</td></tr>
  `;
}

// Pinta las tarjetas de libros relacionados
function renderizarRelacionados(libros) {
  document.getElementById('seccion-relacionados').style.display = 'block';
  document.getElementById('contenedor-relacionados').innerHTML = libros.map(l => {
    const autorNombre = l.author ? l.author.name : '';
    return `
    <div class="bookcase-item">
      <a href="book.html?id=${l.id}" class="book-link">
        <figure>
          <img src="${l.cover_image ? procesarImagen(l.cover_image) : 'img/sin-portada.jpg'}" alt="${l.title}" onerror="this.src='img/sin-portada.jpg'">
        </figure>
      </a>
      <div class="book-info">
        <div class="book-title">${l.title}</div>
        <div class="book-author">${autorNombre}</div>
        <div class="book-price-wrap"><span class="book-price">${formatearPrecio(l.price)}</span></div>
      </div>
      <div class="book-actions">
        <button class="botpeq" onclick="anadirRelacionado(${l.id})">Añadir</button>
      </div>
    </div>
  `}).join('');
}

/* ---- RESEÑAS ---- */

// Pinta la lista de reseñas existentes
function renderizarResenas(reviews) {
  const container = document.getElementById('lista-resenas');

  if (!reviews || reviews.length === 0) {
    container.innerHTML = '<p style="color:#666;">Todavía no hay opiniones sobre este libro. ¡Sé el primero!</p>';
    return;
  }

  container.innerHTML = reviews.map(r => {
    // Nombre del autor de la reseña
    const name = r.customer ? (r.customer.first_name + ' ' + (r.customer.last_name || '')) : 'Usuario anónimo';

    // Generar las estrellas de valoración
    let starsHtml = '';
    for (let i = 1; i <= 5; i++) {
      const color = i <= r.rating ? '#f39c12' : '#ccc';
      starsHtml += `<i class="fa-solid fa-star" style="color:${color};"></i>`;
    }

    return `
    <div style="border-bottom:1px solid #eee; padding-bottom:15px; margin-bottom:15px;">
      <div style="display:flex; justify-content:space-between; margin-bottom:5px;">
        <strong>${name.trim()}</strong>
        <span>${starsHtml}</span>
      </div>
      <p style="margin:0; font-size:12px; color:#555;">${r.comment}</p>
    </div>`;
  }).join('');
}

// Prepara el formulario de nueva reseña (o un aviso si no hay sesión)
function renderizarFormularioResena() {
  const token = localStorage.getItem('agapea_token');
  const container = document.getElementById('caja-nueva-resena');

  // Si no hay sesión, mostrar aviso
  if (!token) {
    container.innerHTML = '<p style="margin:0;">Debes <a href="login.html" style="color:#00679f;font-weight:bold;">iniciar sesión</a> para dejar tu opinión.</p>';
    return;
  }

  // Generar las 5 estrellas del selector
  let estrellasHtml = '';
  for (let i = 1; i <= 5; i++) {
    estrellasHtml += `<i class="fa-solid fa-star star-btn" data-val="${i}" style="cursor:pointer; color:#f39c12; font-size:18px;"></i>`;
  }

  // Formulario de reseña
  container.innerHTML = `
    <h4 style="margin-top:0; font-size:14px; margin-bottom:10px;">Añadir nueva opinión</h4>
    
    <div style="margin-bottom:15px;" id="star-selector">
      ${estrellasHtml}
    </div>

    <textarea id="texto-resena" rows="3" style="width:100%; border:1px solid #ccc; border-radius:4px; padding:8px; box-sizing:border-box; margin-bottom:10px;" placeholder="¿Qué te ha parecido el libro?"></textarea>
    
    <button class="btn-auth-submit" style="width:auto; padding:8px 16px; font-size:12px; display:inline-block;" onclick="enviarResena()">Enviar opinión</button>
    <span id="msg-resena" style="margin-left:10px; font-size:12px;"></span>
  `;

  // Eventos de las estrellas: al hacer clic cambia la puntuación
  const botonesEstrella = document.querySelectorAll('#star-selector .star-btn');
  botonesEstrella.forEach(btn => {
    btn.addEventListener('click', function () {
      puntuacionResena = parseInt(this.getAttribute('data-val'));

      // Colorear las estrellas según la puntuación seleccionada
      botonesEstrella.forEach(b => {
        const valor = parseInt(b.getAttribute('data-val'));
        b.style.color = valor <= puntuacionResena ? '#f39c12' : '#ccc';
      });
    });
  });
}

// ---- FUNCIONES GLOBALES (para los onclick del HTML) ----

// Cambia entre las pestañas (Descripción / Detalles)
window.cambiarPestana = function (boton, idPanel) {
  document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
  document.querySelectorAll('.tab-panel').forEach(p => p.classList.remove('active'));
  boton.classList.add('active');
  document.getElementById(idPanel).classList.add('active');
};

// Incrementa o decrementa la cantidad
window.cambiarCantidad = function (delta) {
  const input = document.getElementById('input-cantidad');
  const nueva = parseInt(input.value) + delta;
  if (nueva >= 1 && nueva <= 99) input.value = nueva;
};

// Añade el libro actual al carrito
window.anadirAlCarrito = function () {
  if (!libroActual) return;
  const cantidad = parseInt(document.getElementById('input-cantidad').value) || 1;
  Carrito.anadir(libroActual, cantidad);
  alert('"' + libroActual.title + '" añadido al carrito.');
};

// Alterna favorito desde la ficha
window.alternarFavoritoFicha = function () {
  if (!libroActual) return;
  const esFav = Favoritos.alternar(libroActual.id);
  document.getElementById('icono-favorito').className = 'fa-' + (esFav ? 'solid' : 'regular') + ' fa-heart';
  document.getElementById('texto-favorito').textContent = esFav ? 'En favoritos' : 'Añadir a favoritos';
  document.getElementById('btn-favorito').classList.toggle('active', esFav);
};

// Añade un libro relacionado al carrito (pide sus datos al servidor primero)
window.anadirRelacionado = async function (id) {
  try {
    const respuesta = await apiFetch('/books/' + id);
    if (respuesta && respuesta.data) {
      Carrito.anadir(respuesta.data);
    }
  } catch (e) {
    console.warn('Error al añadir libro relacionado al carrito');
  }
};

// Envía una nueva reseña a la API
window.enviarResena = async function () {
  const msgArea = document.getElementById('msg-resena');
  const texto = document.getElementById('texto-resena').value.trim();

  if (!texto) {
    msgArea.textContent = 'El texto no puede estar vacío.';
    msgArea.style.color = 'red';
    return;
  }

  msgArea.textContent = 'Enviando...';
  msgArea.style.color = '#555';

  try {
    await apiFetch('/reviews', {
      method: 'POST',
      body: JSON.stringify({
        book_id: libroActual.id,
        rating: puntuacionResena,
        comment: texto
      })
    });

    msgArea.textContent = '¡Opinión publicada!';
    msgArea.style.color = 'green';
    document.getElementById('texto-resena').value = '';

    // Recargar las reseñas para que aparezca la nueva
    const allRes = await apiFetch(`/books/${libroActual.id}/reviews`);
    if (allRes && allRes.data) {
      renderizarResenas(allRes.data);
    }

  } catch (e) {
    msgArea.style.color = 'red';
    if (e.message.includes('Unauthorized')) {
      msgArea.textContent = 'Tu sesión ha caducado.';
    } else {
      msgArea.textContent = 'Error: ' + e.message;
    }
  }
};
