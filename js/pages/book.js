import { loadBooks } from "../services/booksService.js";
import { renderStars, formatPrice } from "../utils/helpers.js";
import { Cart } from "../modulos/cart.js";
import { Favorites } from "../modulos/favorites.js";

let currentBook = null;

export async function initBookPage() {

  const params = new URLSearchParams(location.search);
  const id = parseInt(params.get("id"));

  const books = await loadBooks();

  currentBook = books.find(b => b.id === id);

  if (!currentBook) return;

  renderBook(currentBook);

}

function renderBook(b) {

  document.getElementById("ficha-title").textContent = b.title;
  document.getElementById("ficha-author").textContent = b.author;
  document.getElementById("ficha-price").textContent = formatPrice(b.price);
  document.getElementById("ficha-stars").innerHTML = renderStars(b.rating || 0);

  const img = document.getElementById("ficha-cover");

  if (img) img.src = b.cover;

}

window.addToCartFromFicha = function() {

  if (!currentBook) return;

  const qty = parseInt(document.getElementById("qty-input")?.value) || 1;

  Cart.add(currentBook, qty);

}

window.toggleFavFromFicha = function() {

  if (!currentBook) return;

  Favorites.toggle(currentBook.id);

}