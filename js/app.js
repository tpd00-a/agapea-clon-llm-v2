import { initIndexPage } from "./pages/index.js";
import { initBookPage } from "./pages/book.js";
import { initCartPage } from "./pages/cart.js";
import { initLoginPage } from "./pages/login.js";
import { Cart } from "./modulos/cart.js";

document.addEventListener("DOMContentLoaded", () => {

  // ACTUALIZA ICONO DEL CARRITO
  Cart.updateHeaderBadge();

  const page = location.pathname.split("/").pop() || "index.html";

  if (page === "index.html" || page === "") {
    initIndexPage();
  }

  if (page === "book.html") {
    initBookPage();
  }

  if (page === "cart.html") {
    initCartPage();
  }

  if (page === "login.html") {
    initLoginPage();
  }

});