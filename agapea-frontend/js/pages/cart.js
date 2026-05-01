// ---- PÁGINA DEL CARRITO ----
// Muestra los artículos del carrito y gestiona el checkout con la API

import { Carrito } from '../modulos/carrito.js';
import { apiFetch } from '../services/api.js';
import { formatearPrecio, procesarImagen } from '../utils/helpers.js';
import { showAlert, showSuccess, showError } from '../utils/alerts.js';

// Descuento del cupón (0 = sin cupón, 0.10 = 10%, etc.)
let descuentoCupon = 0;

/**
 * Función de inicio de la página del carrito.
 */
export function initPaginaCarrito() {
  renderizarCarrito();
}

// Pinta el carrito completo: artículos + resumen
function renderizarCarrito() {
  const articulos        = Carrito.obtenerTodos();
  const carritoVacio     = document.getElementById('carrito-vacio');
  const contenidoCarrito = document.getElementById('contenido-carrito');

  // Si está vacío, mostrar el mensaje y ocultar el contenido
  if (articulos.length === 0) {
    if (carritoVacio)     carritoVacio.style.display = 'flex';
    if (contenidoCarrito) contenidoCarrito.style.display = 'none';
    return;
  }

  // Si hay artículos, ocultar el mensaje vacío y mostrar el contenido
  if (carritoVacio)     carritoVacio.style.display = 'none';
  if (contenidoCarrito) contenidoCarrito.style.display = 'flex';

  // Generar el HTML de cada artículo
  const listaEl = document.getElementById('lista-articulos');
  if (listaEl) listaEl.innerHTML = articulos.map(articuloHTML).join('');

  // Actualizar el resumen de precios
  actualizarResumen();

  // Mostrar la sección del cupón
  const seccionCupon = document.getElementById('seccion-cupon');
  if (seccionCupon) seccionCupon.style.display = 'block';
}

// Genera el HTML de un artículo del carrito
function articuloHTML(articulo) {
  return `
    <div class="cart-item">
      <div class="cart-item-cover">
        <img src="${articulo.portada ? procesarImagen(articulo.portada) : 'img/sin-portada.jpg'}" alt="${articulo.titulo}" onerror="this.src='img/sin-portada.jpg'">
      </div>
      <div class="cart-item-info">
        <a href="book.html?id=${articulo.id}" class="cart-item-title">${articulo.titulo}</a>
        <div class="cart-item-author">${articulo.autor}</div>
        <div class="cart-item-unit-price">${formatearPrecio(articulo.precio)} / ud.</div>
        <div class="cart-item-qty">
          <div class="qty-control">
            <button class="qty-btn" onclick="cambiarCantidadCarrito(${articulo.id}, ${articulo.cantidad - 1})">−</button>
            <input type="number" value="${articulo.cantidad}" min="1" max="${articulo.stock}" readonly>
            <button class="qty-btn" onclick="cambiarCantidadCarrito(${articulo.id}, ${articulo.cantidad + 1})">+</button>
          </div>
        </div>
      </div>
      <div class="cart-item-price">${formatearPrecio(articulo.precio * articulo.cantidad)}</div>
      <button class="cart-item-remove" onclick="eliminarDelCarrito(${articulo.id})">
        <i class="fa-solid fa-xmark"></i>
      </button>
    </div>
  `;
}

// Calcula y muestra el resumen de precios (subtotal, envío, total)
function actualizarResumen() {
  const subtotal = Carrito.calcularTotal();
  const envio    = subtotal >= 19 ? 0 : 3.99;
  const total    = (subtotal + envio) * (1 - descuentoCupon);

  const cantidadEl = document.getElementById('cantidad-articulos');
  const subtotalEl = document.getElementById('subtotal-resumen');
  const envioEl    = document.getElementById('envio-resumen');
  const totalEl    = document.getElementById('total-resumen');

  if (cantidadEl) cantidadEl.textContent = Carrito.contarArticulos();
  if (subtotalEl) subtotalEl.textContent = formatearPrecio(subtotal);
  if (envioEl)    envioEl.textContent    = envio === 0 ? 'GRATIS' : formatearPrecio(envio);
  if (totalEl)    totalEl.textContent    = formatearPrecio(total);
}

// ---- FUNCIONES GLOBALES (para los onclick del HTML) ----

// Elimina un artículo del carrito
window.eliminarDelCarrito = function (id) {
  Carrito.eliminar(id);
  renderizarCarrito();
};

// Cambia la cantidad de un artículo
window.cambiarCantidadCarrito = function (id, nuevaCantidad) {
  Carrito.cambiarCantidad(id, nuevaCantidad);
  renderizarCarrito();
};

// Aplica un cupón de descuento
window.aplicarCupon = function () {
  const codigo    = document.getElementById('input-cupon').value.trim().toUpperCase();
  const mensajeEl = document.getElementById('mensaje-cupon');

  // Cupones válidos (código → porcentaje de descuento)
  const cupones = { 'AGAPEA10': 0.10, 'LIBROS5': 0.05 };

  if (cupones[codigo]) {
    descuentoCupon = cupones[codigo];
    mensajeEl.innerHTML = '<span style="color:green">Cupón ' + codigo + ' aplicado (' + (descuentoCupon * 100) + '% dto.)</span>';
    actualizarResumen();
  } else {
    mensajeEl.innerHTML = '<span style="color:red">Cupón no válido.</span>';
  }
};

// Finaliza la compra enviando el pedido a la API
window.procederCheckout = async function () {
  // Comprobar que el usuario ha iniciado sesión
  const token = localStorage.getItem('agapea_token');
  if (!token) {
    await showAlert('Debes iniciar sesión para finalizar la compra.');
    window.location.href = 'login.html';
    return;
  }

  // Deshabilitar el botón mientras se procesa
  const btn = document.querySelector('.btn-checkout');
  if (btn) {
    btn.disabled = true;
    btn.textContent = 'Procesando...';
  }

  // Preparar los datos del pedido
  const articulos = Carrito.obtenerTodos();
  const inputCupon = document.getElementById('input-cupon');
  const codigo = inputCupon ? inputCupon.value.trim().toUpperCase() : '';

  try {
    const res = await apiFetch('/checkout', {
      method: 'POST',
      body: JSON.stringify({
        items: articulos,
        coupon_code: codigo
      })
    });

    await showSuccess('¡Compra finalizada!\n\nID Pedido: #' + res.order.id + '\nTotal pagado: ' + res.order.total + '€');
    Carrito.vaciar();
    descuentoCupon = 0;
    renderizarCarrito();

  } catch (e) {
    await showError('Error procesando pedido:\n' + e.message);
  } finally {
    // Rehabilitar el botón
    if (btn) {
      btn.disabled = false;
      btn.textContent = 'Finalizar compra';
    }
  }
};
