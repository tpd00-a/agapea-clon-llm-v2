// ---- SERVICIO DE CONEXIÓN CON LA API ----
// Función reutilizable para hacer peticiones al backend (api-agapea)

// URL base de la API Laravel
export const API_BASE = 'http://localhost:8000/api/v1';

/**
 * Hace una petición fetch a la API con autenticación automática.
 * Si el token ha expirado, redirige al login.
 */
export async function apiFetch(endpoint, options = {}) {

  // Recuperar el token del usuario (si hay sesión iniciada)
  const token = localStorage.getItem('agapea_token');

  // Cabeceras que se envían siempre
  const headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  // Si hay token, lo añadimos a la cabecera de autorización
  if (token) {
    headers['Authorization'] = `Bearer ${token}`;
  }

  // Montamos la configuración del fetch
  const config = {
    method: options.method || 'GET',
    headers: headers
  };

  // Si hay body (para POST, PUT...) lo añadimos
  if (options.body) {
    config.body = options.body;
  }

  try {
    const response = await fetch(`${API_BASE}${endpoint}`, config);

    // 401: Token expirado o no válido → cerrar sesión y redirigir
    if (response.status === 401) {
      localStorage.removeItem('agapea_token');
      localStorage.removeItem('agapea_usuario');
      window.location.href = 'login.html';
      throw new Error('Sesión expirada o no autorizada.');
    }

    // 204: No Content (respuesta vacía, ej. al borrar algo)
    if (response.status === 204) {
      return { ok: true };
    }

    // Convertir la respuesta a JSON
    const data = await response.json();

    // Si la respuesta no es exitosa, lanzar error con el mensaje del servidor
    if (!response.ok) {
      throw new Error(data.message || 'Error en la petición a la API');
    }

    return data;

  } catch (error) {
    console.error('Error de red o API:', error);
    throw error;
  }
}
