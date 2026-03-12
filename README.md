# Clon de Agapea.com — Librería Online

Proyecto del módulo de **Lenguaje de Marcas** que consiste en una aplicación web inspirada en [agapea.com](https://www.agapea.com), una de las librerías online más conocidas de España.

---

## Descripción

La aplicación simula la parte pública de una librería online donde los usuarios pueden:

- Explorar un catálogo de libros con filtros y paginación
- Ver la ficha completa de cada libro
- Añadir libros al carrito y gestionar las cantidades
- Guardar libros en favoritos
- Registrar una cuenta de usuario

Todos los datos se gestionan con `fetch` y un archivo JSON local que actúa de API propia. El estado de carrito, favoritos y usuarios se guarda en `localStorage`.

---

## Estructura de archivos

```
/
├── index.html          → Página principal (catálogo)
├── book.html           → Ficha de libro
├── cart.html           → Carrito de compra
├── login.html          → Login y registro
│
├── css/
│   ├── base.css        → Reset, variables, tipografía y botones
│   ├── layout.css      → Cabecera, sidebar, footer y responsive
│   ├── catalogo.css    → Hero, filtros, grid de libros y paginación
│   └── paginas.css     → Ficha de libro, carrito y login
│
├── js/
│   ├── app.js          → Punto de entrada, detecta la página activa
│   ├── pages/
│   │   ├── index.js    → Lógica del catálogo
│   │   ├── book.js     → Lógica de la ficha de libro
│   │   ├── cart.js     → Lógica del carrito
│   │   └── login.js    → Lógica del login y registro
│   ├── modulos/
│   │   ├── carrito.js  → Módulo de gestión del carrito (localStorage)
│   │   ├── favoritos.js → Módulo de gestión de favoritos (localStorage)
│   │   └── usuario.js  → Módulo de registro de usuarios (localStorage)
│   ├── services/
│   │   └── libros.js   → Petición fetch al archivo JSON
│   └── utils/
│       └── helpers.js  → Funciones auxiliares (formateo de precio)
│
├── data/
│   └── libros.json     → Base de datos de 12 libros en formato JSON
│
└── img/
    └── libro-1.jpg     → Portadas de los libros (libro-1.jpg … libro-12.jpg)
```

---

## Funcionalidades implementadas

| Funcionalidad | Tecnología |
|---|---|
| Carga de libros desde JSON | `fetch` asíncrono |
| Filtrado por texto, categoría y orden | JavaScript — eventos `input` / `change` |
| Paginación del catálogo (8 por página) | JavaScript — array `slice` |
| Carrito con cantidades y cupones | `localStorage` — clave `agapea_carrito` |
| Lista de favoritos | `localStorage` — clave `agapea_favoritos` |
| Registro de usuarios con validación | `localStorage` — clave `agapea_usuarios` |
| Diseño responsive | CSS Flexbox y Grid con media queries |
| Arquitectura modular | ES Modules (`import` / `export`) |

### Cupones de descuento disponibles

| Cupón | Descuento |
|---|---|
| `AGAPEA10` | 10% |
| `LIBROS5` | 5% |

---

## Cómo ejecutar el proyecto

El proyecto utiliza `fetch` para cargar `data/libros.json`, por lo que **necesita un servidor HTTP local** (no funciona abriendo el HTML directamente desde el explorador de archivos).

**Opción 1 — Live Server (VS Code):**
Clic derecho en `index.html` → *Open with Live Server*

**Opción 2 — Python:**
```bash
python -m http.server 8080
# Abrir http://localhost:8080
```

**Opción 3 — Node.js:**
```bash
npx serve .
```

---

## Tecnologías utilizadas

- **HTML5** — estructura semántica
- **CSS3** — Flexbox, Grid, variables CSS, media queries
- **JavaScript ES6+** — módulos, async/await, fetch, localStorage
- **Font Awesome 6** — iconografía
- **JSON** — almacenamiento de datos de libros

---

## Páginas

### `index.html` — Catálogo
Muestra todos los libros en un grid. Incluye filtros por texto libre, categoría y orden, además de paginación (8 libros por página). Los enlaces del sidebar también filtran por categoría.

### `book.html` — Ficha de libro
Muestra los datos completos de un libro: portada, precio, descuento, stock, descripción y tabla de detalles. Permite añadir al carrito con selector de cantidad y guardar en favoritos. Muestra libros relacionados de la misma categoría.

### `cart.html` — Carrito
Lista los artículos añadidos con sus cantidades editables. Calcula el subtotal, el envío (gratis a partir de 19 €) y el total. Permite aplicar cupones de descuento. El botón de confirmar pedido vacía el carrito.

### `login.html` — Login y Registro
Dos pestañas: inicio de sesión (sin funcionalidad de backend) y registro de cuenta nueva con validación completa de todos los campos.

---

## Autores

Proyecto realizado para la asignatura de **Lenguaje de Marcas — DAW**
