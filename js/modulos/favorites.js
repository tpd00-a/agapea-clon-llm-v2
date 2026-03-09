export const Favorites = {

  KEY: "agapea_favorites",

  getAll() {
    try {
      return JSON.parse(localStorage.getItem(this.KEY)) || [];
    } catch {
      return [];
    }
  },

  has(id) {
    return this.getAll().includes(id);
  },

  toggle(id) {

    let favs = this.getAll();

    favs = favs.includes(id)
      ? favs.filter(f => f !== id)
      : [...favs, id];

    localStorage.setItem(this.KEY, JSON.stringify(favs));

    return favs.includes(id);

  }

};

window.Favorites = Favorites;