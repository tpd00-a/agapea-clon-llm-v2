import { formatPrice } from "../utils/helpers.js";

export const Cart = {

  KEY: "agapea_cart",

  getAll() {
    try {
      return JSON.parse(localStorage.getItem(this.KEY)) || [];
    } catch {
      return [];
    }
  },

  save(items) {
    localStorage.setItem(this.KEY, JSON.stringify(items));
    this.updateHeaderBadge();
  },

  add(book, qty = 1) {

    const items = this.getAll();
    const idx = items.findIndex(i => i.id === book.id);

    if (idx > -1) {
      items[idx].qty = Math.min(items[idx].qty + qty, book.stock || 99);
    }
    else {

      items.push({
        id: book.id,
        title: book.title,
        author: book.author,
        price: book.price,
        cover: book.cover || "",
        stock: book.stock || 99,
        qty
      });

    }

    this.save(items);

  },

  remove(id) {
    this.save(this.getAll().filter(i => i.id !== id));
  },

  updateQty(id, qty) {

    const items = this.getAll();
    const item = items.find(i => i.id === id);

    if (!item) return;

    if (qty < 1) {
      this.remove(id);
      return;
    }

    item.qty = Math.min(qty, item.stock || 99);

    this.save(items);

  },

  clear() {
    localStorage.removeItem(this.KEY);
    this.updateHeaderBadge();
  },

  count() {
    return this.getAll().reduce((s, i) => s + i.qty, 0);
  },

  total() {
    return this.getAll().reduce((s, i) => s + i.price * i.qty, 0);
  },

  updateHeaderBadge() {

    const badge = document.getElementById("cart-badge");
    const totalEl = document.getElementById("cart-header-total");

    if (badge) badge.textContent = this.count();
    if (totalEl) totalEl.textContent = formatPrice(this.total());

  }

};

window.Cart = Cart;