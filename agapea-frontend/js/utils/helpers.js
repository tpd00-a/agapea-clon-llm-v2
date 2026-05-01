// ---- FUNCIONES AUXILIARES ----
// Estas funciones se usan en varias páginas para no repetir código

// Devuelve la ruta absoluta de las imágenes
export function procesarImagen(url) {
  if (!url) return 'img/sin-portada.jpg';
  if (url.startsWith('http://') || url.startsWith('https://')) return url;

  // Normalizar separadores (soporta rutas Windows que usan backslashes)
  const normalized = url.replace(/\\\\/g, '/');

  // Si la ruta contiene la carpeta del frontend, extraer la parte relativa
  const fwPrefix = 'agapea-frontend/';
  const idxFw = normalized.indexOf(fwPrefix);
  if (idxFw !== -1) {
    const rel = normalized.slice(idxFw + fwPrefix.length);
    // si empieza por img/ devuelve tal cual
    if (rel.startsWith('img/')) return rel;
    return rel;
  }

  // Si contiene /img/ en cualquier parte, devolver desde img/
  const imgSegment = '/img/';
  const idxImgSeg = normalized.indexOf(imgSegment);
  if (idxImgSeg !== -1) return normalized.slice(idxImgSeg + 1);

  // Si contiene img/ sin slash delante
  const idxImg = normalized.indexOf('img/');
  if (idxImg === 0) return normalized;
  if (idxImg > 0) return normalized.slice(idxImg);

  // Fallback: devolver la url sin cambios
  return url;
}

// Convierte un número decimal en formato precio: 12.5 → "12,50 €"
export function formatearPrecio(n) {
  if (n === null || n === undefined) return "0,00 €";
  const num = Number(n);
  if (isNaN(num)) return "0,00 €";
  return num.toFixed(2).replace('.', ',') + ' €';
}
