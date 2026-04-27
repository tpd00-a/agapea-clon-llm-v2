// ---- FUNCIONES AUXILIARES ----
// Estas funciones se usan en varias páginas para no repetir código

// Devuelve la ruta absoluta de las imágenes
export function procesarImagen(url) {
  if (!url) return 'img/sin-portada.jpg';
  if (url.startsWith('http://') || url.startsWith('https://')) return url;
  
  // Devolvemos la url tal cual. Si es local, el browser la resolverá contra el dominio actual.
  return url;
}

// Convierte un número decimal en formato precio: 12.5 → "12,50 €"
export function formatearPrecio(n) {
  if (n === null || n === undefined) return "0,00 €";
  const num = Number(n);
  if (isNaN(num)) return "0,00 €";
  return num.toFixed(2).replace('.', ',') + ' €';
}
