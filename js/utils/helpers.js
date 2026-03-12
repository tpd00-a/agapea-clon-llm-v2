// ---- FUNCIONES AUXILIARES ----
// Estas funciones se usan en varias páginas para no repetir código

// Convierte un número decimal en formato precio: 12.5 → "12,50 €"
export function formatearPrecio(n) {
  return n.toFixed(2).replace('.', ',') + ' €';
}
