// Wrapper para SweetAlert2 con fallback a window.alert/confirm
// Exporta funciones asíncronas que devuelven Promesas para facilitar su uso
function hasSwal() {
  return typeof Swal !== 'undefined' && typeof Swal.fire === 'function';
}

export function showAlert(message, title = '') {
  if (hasSwal()) {
    return Swal.fire({ title, text: message, icon: 'info' });
  }
  // Fallback sin Swal
  alert((title ? title + '\n\n' : '') + message);
  return Promise.resolve();
}

export function showSuccess(message, title = '') {
  if (hasSwal()) {
    return Swal.fire({ title, text: message, icon: 'success' });
  }
  alert(message);
  return Promise.resolve();
}

export function showError(message, title = '') {
  if (hasSwal()) {
    return Swal.fire({ title, text: message, icon: 'error' });
  }
  alert(message);
  return Promise.resolve();
}

export function showConfirm(message, title = 'Confirmar') {
  if (hasSwal()) {
    return Swal.fire({
      title,
      text: message,
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Aceptar',
      cancelButtonText: 'Cancelar'
    }).then(result => !!result.isConfirmed);
  }
  return Promise.resolve(confirm((title ? title + '\n\n' : '') + message));
}

export default {
  showAlert,
  showSuccess,
  showError,
  showConfirm
};
