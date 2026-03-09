import { Cart } from "../modulos/cart.js";
import { formatPrice } from "../utils/helpers.js";

export function initCartPage() {
  renderCartPage();
}

function renderCartPage() {

  const items = Cart.getAll();

  const list = document.getElementById("cart-items-list");

  if (!list) return;

  // carrito vacío
  if (!items.length) {
    list.innerHTML = `
      <div style="padding:40px;text-align:center;color:#777">
        <h3>Tu carrito está vacío</h3>
        <p>Añade algunos libros desde el catálogo.</p>
        <a href="index.html">Ir al catálogo</a>
      </div>
    `;
    return;
  }

  // render productos
  list.innerHTML = items.map(itemHTML).join("");

}

function itemHTML(item) {

  return `
  <div class="cart-item" style="display:flex;align-items:center;gap:20px;padding:15px;border-bottom:1px solid #ddd">

    <img src="${item.cover}" width="60">

    <div style="flex:1">
      <div style="font-weight:600">${item.title}</div>
      <div style="color:#666">${item.author || ""}</div>
    </div>

    <div>
      ${formatPrice(item.price)}
    </div>

    <div>
      x${item.qty}
    </div>

    <div style="font-weight:600">
      ${formatPrice(item.price * item.qty)}
    </div>

    <button onclick="cartRemove(${item.id})" style="cursor:pointer">
      ❌
    </button>

  </div>
  `;
}

window.cartRemove = function(id) {

  Cart.remove(id);

  renderCartPage();

};