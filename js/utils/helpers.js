export function formatPrice(n) {
  return n.toFixed(2).replace('.', ',') + ' €';
}

export function renderStars(rating) {
  let html = '';

  for (let i = 1; i <= 5; i++) {
    if (i <= Math.floor(rating))
      html += '<i class="fa-solid fa-star"></i>';
    else if (i - rating < 1)
      html += '<i class="fa-solid fa-star-half-stroke"></i>';
    else
      html += '<i class="fa-regular fa-star"></i>';
  }

  return html;
}

export function initGlobal() {

  if (window.Cart) Cart.updateHeaderBadge();
  if (window.UserModule) UserModule.updateHeader();

}