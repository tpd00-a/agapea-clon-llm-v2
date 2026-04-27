// ---- MÓDULO DEL CARRITO ----
// Gestiona los artículos del carrito usando localStorage
// Si el usuario tiene sesión, sincroniza con el servidor (api-agapea)

import { formatearPrecio, procesarImagen } from '../utils/helpers.js';
import { apiFetch } from '../services/api.js';

export const Carrito = {

  // Devuelve el array de artículos guardado en localStorage
  obtenerTodos() {
    try {
      return JSON.parse(localStorage.getItem('agapea_carrito')) || [];
    } catch {
      return [];
    }
  },

  // Guarda el array en localStorage, actualiza la cabecera y sincroniza con la API
  guardar(articulos) {
    localStorage.setItem('agapea_carrito', JSON.stringify(articulos));
    this.actualizarCabecera();
    this.sincronizarConAPI(articulos);
  },

  // Envía el carrito al servidor para que quede guardado en la cuenta del usuario
  async sincronizarConAPI(articulos) {
    const token = localStorage.getItem('agapea_token');
    if (!token) return; // Solo sincronizamos si hay sesión activa

    try {
      await apiFetch('/cart/sync', {
        method: 'POST',
        body: JSON.stringify({ items: articulos })
      });
    } catch (e) {
      // Si falla (ej. servidor caído), no pasa nada, el carrito sigue en localStorage
    }
  },

  // Añade un libro al carrito (si ya existe, aumenta la cantidad)
  anadir(libro, cantidad = 1) {
    const articulos = this.obtenerTodos();
    const indice = articulos.findIndex(a => a.id === libro.id);

    if (indice > -1) {
      // Ya existe: sumamos cantidad sin pasarnos del stock
      articulos[indice].cantidad = Math.min(
        articulos[indice].cantidad + cantidad,
        libro.stock || 99
      );
    } else {
      // Nuevo artículo: preparamos la imagen de portada
      let portada = 'img/sin-portada.jpg';
      if (libro.cover_image) {
        portada = procesarImagen(libro.cover_image);
      } else if (libro.portada) {
        portada = procesarImagen(libro.portada);
      }

      // Lo añadimos al array
      articulos.push({
        id: libro.id,
        titulo: libro.title || libro.titulo,
        autor: libro.author ? libro.author.name : (libro.autor || ''),
        precio: libro.price || libro.precio,
        portada: portada,
        stock: libro.stock || 99,
        cantidad: cantidad
      });
    }

    this.guardar(articulos);
  },

  // Elimina un artículo por su id
  eliminar(id) {
    const sinEste = this.obtenerTodos().filter(a => a.id !== id);
    this.guardar(sinEste);
  },

  // Cambia la cantidad de un artículo (si llega a 0, lo elimina)
  cambiarCantidad(id, nuevaCantidad) {
    const articulos = this.obtenerTodos();
    const articulo = articulos.find(a => a.id === id);
    if (!articulo) return;

    if (nuevaCantidad < 1) {
      this.eliminar(id);
      return;
    }

    articulo.cantidad = Math.min(nuevaCantidad, articulo.stock || 99);
    this.guardar(articulos);
  },

  // Vacía el carrito por completo
  vaciar() {
    localStorage.removeItem('agapea_carrito');
    this.actualizarCabecera();
    this.sincronizarConAPI([]);
  },

  // Devuelve el total de artículos (suma de cantidades)
  contarArticulos() {
    return this.obtenerTodos().reduce((total, a) => total + a.cantidad, 0);
  },

  // Devuelve el precio total del carrito
  calcularTotal() {
    return this.obtenerTodos().reduce((total, a) => total + a.precio * a.cantidad, 0);
  },

  // Actualiza el badge (bolita roja) y el precio en la cabecera
  actualizarCabecera() {
    const badge = document.getElementById('badge-carrito');
    const totalEl = document.getElementById('total-cabecera');
    if (badge) badge.textContent = this.contarArticulos();
    if (totalEl) totalEl.textContent = formatearPrecio(this.calcularTotal());
  }

};

// Lo ponemos en window para poder usarlo desde los onclick del HTML
window.Carrito = Carrito;
