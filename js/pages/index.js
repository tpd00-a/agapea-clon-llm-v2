import { loadBooks } from "../services/booksService.js";
import { renderStars, formatPrice } from "../utils/helpers.js";
import { Cart } from "../modulos/cart.js";
import { Favorites } from "../modulos/favorites.js";

let allBooks = [];
let filteredBooks = [];

export async function initIndexPage() {

  const books = await loadBooks();

  allBooks = books;
  filteredBooks = [...books];

  renderBooks(filteredBooks);

}

function renderBooks(books) {

  const container = document.getElementById("games-container");

  if (!container) return;

  container.innerHTML = books.map(bookCardHTML).join("");

}

function bookCardHTML(b) {

  const isFav = Favorites.has(b.id);

  return `
  <div class="bookcase-item">

    <a href="book.html?id=${b.id}" class="book-link">

      <figure>
        <img src="${b.cover || ""}" alt="${b.title}">
      </figure>

      <div class="book-info">

        <div class="book-title">${b.title}</div>

        <div class="book-author">${b.author}</div>

        <div class="book-stars">
          ${renderStars(b.rating || 0)}
        </div>

        <div class="book-price-wrap">
          <span class="book-price">${formatPrice(b.price)}</span>
        </div>

      </div>

    </a>

    <div class="book-actions">

      <button onclick="addFromCard(${b.id})">
        Añadir
      </button>

      <button onclick="toggleFavCard(${b.id}, this)">
        <i class="fa-${isFav ? "solid" : "regular"} fa-heart"></i>
      </button>

    </div>

  </div>
  `;
}

window.addFromCard = function(id) {

  const book = allBooks.find(b => b.id === id);

  if (book) Cart.add(book);

}

window.toggleFavCard = function(id, btn) {

  const fav = Favorites.toggle(id);

  const icon = btn.querySelector("i");

  icon.className = `fa-${fav ? "solid" : "regular"} fa-heart`;

}