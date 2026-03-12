// ---- MÓDULO DE FAVORITOS ----
// Guarda la lista de libros favoritos del usuario en localStorage

export const Favoritos = {

  // Devuelve el array de IDs de libros favoritos
  obtenerTodos() {
    try {
      return JSON.parse(localStorage.getItem('agapea_favoritos')) || [];
    } catch {
      return [];
    }
  },

  // Comprueba si un libro está en favoritos
  esFavorito(id) {
    return this.obtenerTodos().includes(id);
  },

  // Si el libro está en favoritos lo elimina; si no, lo añade
  alternar(id) {
    let favoritos = this.obtenerTodos();

    if (favoritos.includes(id)) {
      favoritos = favoritos.filter(f => f !== id);
    } else {
      favoritos.push(id);
    }

    localStorage.setItem('agapea_favoritos', JSON.stringify(favoritos));

    // Devuelve true si ahora está en favoritos, false si se ha eliminado
    return favoritos.includes(id);
  }

};

window.Favoritos = Favoritos;
