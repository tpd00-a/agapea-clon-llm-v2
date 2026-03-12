// ---- SERVICIO DE LIBROS ----
// Se encarga de pedir los datos del JSON con fetch

export async function cargarLibros() {
  try {
    const respuesta = await fetch('data/libros.json');
    if (!respuesta.ok) throw new Error('No se pudo cargar el archivo de libros');
    return await respuesta.json();
  } catch (error) {
    console.error(error);
    return [];
  }
}
