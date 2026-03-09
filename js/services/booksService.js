export async function loadBooks() {

  try {

    const r = await fetch("data/books.json");

    if (!r.ok) throw new Error("Error cargando datos");

    return await r.json();

  }
  catch (e) {

    console.error(e);
    return [];

  }

}