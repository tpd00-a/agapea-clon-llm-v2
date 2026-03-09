import { initGlobal } from "./utils/helpers.js";
import { initIndexPage } from "./pages/index.js";
import { initBookPage } from "./pages/book.js";
import { initCartPage } from "./pages/cart.js";
import { initLoginPage } from "./pages/login.js";

document.addEventListener("DOMContentLoaded", async () => {

  initGlobal();

  const page = location.pathname.split('/').pop() || 'index.html';

  if (page === "index.html" || page === "" || page === "/") {
    initIndexPage();
  }

  else if (page === "book.html") {
    initBookPage();
  }

  else if (page === "cart.html") {
    initCartPage();
  }

  else if (page === "login.html") {
    initLoginPage();
  }

});