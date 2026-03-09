import { Cart } from "../modulos/cart.js";
import { formatPrice } from "../utils/helpers.js";

export function initCartPage() {

  renderCartPage();

}

function renderCartPage() {

  const items = Cart.getAll();

  const list = document.getElementById("cart-items-list");

  if (!list) return;

  if (!items.length) {

    list.innerHTML = "<p>Carrito vacío</p>";

    return;

  }

  list.innerHTML = items.map(itemHTML).join("");

}

function itemHTML(item) {

  return `
  <div class="cart-item">

    <img src="${item.cover}" width="60">

    <div>
      <div>${item.title}</div>
      <div>${formatPrice(item.price)}</div>
    </div>

    <div>
      x${item.qty}
    </div>

    <div>
      ${formatPrice(item.price * item.qty)}
    </div>

    <button onclick="cartRemove(${item.id})">
      X
    </button>

  </div>
  `;
}

window.cartRemove = function(id) {

  Cart.remove(id);

  renderCartPage();

}