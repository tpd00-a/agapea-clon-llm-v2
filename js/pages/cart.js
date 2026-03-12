// ---- PÁGINA DEL CARRITO ----
// Muestra los artículos del carrito y gestiona el checkout

import { Carrito } from '../modulos/carrito.js';
import { formatearPrecio } from '../utils/helpers.js';

let descuentoCupon = 0;

export function initPaginaCarrito() {
  renderizarCarrito();
}

function renderizarCarrito() {
  const articulos        = Carrito.obtenerTodos();
  const carritoVacio     = document.getElementById('carrito-vacio');
  const contenidoCarrito = document.getElementById('contenido-carrito');

  if (articulos.length === 0) {
    if (carritoVacio)     carritoVacio.style.display = 'flex';
    if (contenidoCarrito) contenidoCarrito.style.display = 'none';
    return;
  }

  if (carritoVacio)     carritoVacio.style.display = 'none';
  if (contenidoCarrito) contenidoCarrito.style.display = 'flex';

  const listaEl = document.getElementById('lista-articulos');
  if (listaEl) listaEl.innerHTML = articulos.map(articuloHTML).join('');

  actualizarResumen();

  const seccionCupon = document.getElementById('seccion-cupon');
  if (seccionCupon) seccionCupon.style.display = 'block';
}

function articuloHTML(articulo) {
  return `
    <div class="cart-item">
      <div class="cart-item-cover">
        <img src="${articulo.portada}" alt="${articulo.titulo}" onerror="this.src='img/sin-portada.jpg'">
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

window.eliminarDelCarrito = function (id) {
  Carrito.eliminar(id);
  renderizarCarrito();
};

window.cambiarCantidadCarrito = function (id, nuevaCantidad) {
  Carrito.cambiarCantidad(id, nuevaCantidad);
  renderizarCarrito();
};

window.aplicarCupon = function () {
  const codigo    = document.getElementById('input-cupon').value.trim().toUpperCase();
  const mensajeEl = document.getElementById('mensaje-cupon');
  const cupones   = { 'AGAPEA10': 0.10, 'LIBROS5': 0.05 };

  if (cupones[codigo]) {
    descuentoCupon = cupones[codigo];
    mensajeEl.innerHTML = '<span style="color:green">Cupón ' + codigo + ' aplicado (' + (descuentoCupon * 100) + '% dto.)</span>';
    actualizarResumen();
  } else {
    mensajeEl.innerHTML = '<span style="color:red">Cupón no válido.</span>';
  }
};

window.procederCheckout = function () {
  alert('¡Compra finalizada!\n\nGracias por tu compra. Recibirás un email de confirmación en breve.');
  Carrito.vaciar();
  descuentoCupon = 0;
  renderizarCarrito();
};
