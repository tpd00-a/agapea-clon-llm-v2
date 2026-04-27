// ---- SERVICIO DE LIBROS ----
// Funciones para pedir libros al backend (api-agapea)

import { apiFetch } from './api.js';

/**
 * Carga una lista de libros con filtros opcionales.
 * Devuelve un objeto con { data: [...], meta: {...} }
 */
export async function cargarLibros(filtros = {}) {
  try {
    // Construimos la URL con los filtros paso a paso
    let query = '?page=' + (filtros.page || 1) + '&per_page=' + (filtros.per_page || 8);

    if (filtros.search) query += '&search=' + filtros.search;
    if (filtros.category) query += '&category=' + filtros.category;
    if (filtros.sort) query += '&sort=' + filtros.sort;

    // Hacemos la petición al endpoint de libros
    const respuesta = await apiFetch('/books' + query);
    return respuesta;

  } catch (error) {
    console.error('Error al cargar libros:', error);
    // Si falla, devolvemos un objeto vacío para que no rompa la página
    return { data: [], meta: {} };
  }
}

/**
 * Carga un solo libro por su ID.
 * Devuelve el objeto del libro o null si no lo encuentra.
 */
export async function cargarUnLibro(id) {
  try {
    const respuesta = await apiFetch(`/books/${id}`);
    return respuesta.data;
  } catch (error) {
    console.error('Error al cargar el libro con id ' + id, error);
    return null;
  }
}
