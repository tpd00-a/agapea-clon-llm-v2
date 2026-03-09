# 📚 Agapea Clone — Librería Online

Proyecto desarrollado para la asignatura de **Lenguaje de Marcas**. Clon funcional de [agapea.com](https://www.agapea.com), librería online española, implementado con HTML5, CSS3 y JavaScript vanilla.

---

## Índice

1. [Descripción del proyecto](#descripción-del-proyecto)
2. [Estructura de archivos](#estructura-de-archivos)
3. [Páginas y funcionalidades](#páginas-y-funcionalidades)
4. [Módulos JavaScript](#módulos-javascript)
5. [LocalStorage — Persistencia de datos](#localstorage--persistencia-de-datos)
6. [Validación de formularios](#validación-de-formularios)
7. [Tecnologías utilizadas](#tecnologías-utilizadas)
8. [Cómo ejecutar el proyecto](#cómo-ejecutar-el-proyecto)
9. [Datos de prueba](#datos-de-prueba)

---

## Descripción del proyecto

Este proyecto es un clon de la interfaz de usuario de Agapea.com, una de las mayores librerías online en España. El objetivo es demostrar el uso de:

- Maquetación responsive con HTML5 y CSS3 puro
- Manipulación dinámica del DOM con JavaScript
- Peticiones asíncronas (`fetch`) para cargar datos JSON
- Persistencia de datos en el navegador mediante `localStorage`
- Validación de formularios sin librerías externas
- Arquitectura modular del código JavaScript

---

## Estructura de archivos

```
/
├── index.html          → Página principal (catálogo de libros)
├── book.html           → Ficha detalle de un libro
├── cart.html           → Carrito de compra
├── login.html          → Inicio de sesión y registro
├── css/
│   └── styles.css      → Hoja de estilos principal (2000+ líneas)
├── js/
│   └── app.js          → Lógica JavaScript completa (900+ líneas)
└── data/
    └── books.json      → Catálogo de libros en formato JSON (12 títulos)
```

---

## Páginas y funcionalidades

### `index.html` — Página principal / Catálogo

La landing page muestra el catálogo completo de libros con las siguientes funcionalidades:

**Búsqueda y filtrado:**
- Campo de búsqueda en tiempo real que filtra por título, autor, ISBN y etiquetas
- Filtro por categoría mediante `<select>` y también desde el sidebar de navegación lateral
- Ordenación por: relevancia, precio (ascendente/descendente), valoración, fecha de publicación y título A-Z

**Paginación:**
- Se muestran 8 libros por página
- Navegación con botones Anterior / Siguiente y números de página
- Se muestran puntos suspensivos (`…`) para rangos largos

**Cards de libros:**
- Imagen de portada, título, autor, estrellas de valoración y precio
- Badge de novedad, bestseller o descuento
- Botón "Añadir" que añade el libro al carrito (actualiza badge del header)
- Botón de favorito ♥ que guarda/elimina el libro de la lista de deseos

**Sidebar:**
- Lista de categorías con filtrado al hacer clic
- Datos de contacto (teléfono atención al cliente)
- Cards de accesos directos (recomendador, más deseados, novedades)

**Hero Banner y Features Strip:**
- Banner visual con CTA al catálogo
- Tira informativa: envío gratis, devolución, pago seguro, atención al cliente

---

### `book.html` — Ficha del libro

Accesible desde cualquier card pulsando sobre el libro. Carga los datos del libro mediante el parámetro `?id=N` de la URL.

**Funcionalidades:**
- Portada ampliada, título, autor, valoración con estrellas
- Precio con descuento (precio tachado + badge de %)
- Indicador de stock (disponible / últimas unidades / sin stock)
- Control de cantidad (`−` / `+`) antes de añadir al carrito
- Botón de favorito con estado visual
- **Pestañas (tabs):**
  - *Descripción:* texto editorial del libro
  - *Detalles:* tabla con ISBN, editorial, año, páginas, idioma, categoría
  - *Valoraciones:* formulario de reseña (visible solo si el usuario ha iniciado sesión)
- **Libros relacionados:** grid con libros de la misma categoría/género
- Breadcrumb de navegación

---

### `cart.html` — Carrito de compra

**Funcionalidades:**
- Lista de libros añadidos al carrito con imagen, título, autor y precio unitario
- Control de cantidad por ítem (`−` / `+` inline)
- Eliminación individual de artículos
- **Cálculo automático:**
  - Subtotal por ítem (precio × cantidad)
  - Gastos de envío (GRATIS si el pedido supera 19 €, 3,99 € en caso contrario)
  - Total final
- **Código de descuento:** campo de cupón con validación (códigos demo: `AGAPEA10`, `LIBROS5`)
- **Confirmar pedido:** genera un número de pedido aleatorio y vacía el carrito. Requiere sesión iniciada; si no, redirige al login
- Modal de confirmación con número de pedido
- Estado de carrito vacío con enlace al catálogo
- Iconos de métodos de pago (Visa, Mastercard, PayPal)

---

### `login.html` — Login y Registro

Página con dos pestañas: *Iniciar sesión* y *Crear cuenta*.

**Inicio de sesión:**
- Campo email con validación de formato
- Campo contraseña con botón mostrar/ocultar
- Checkbox "Recordarme"
- Enlace "¿Olvidaste tu contraseña?" (demo)
- Botones de login social Google / Facebook (demo, no funcional)
- Mensajes de error inline si los datos son incorrectos

**Registro:**
- Campos: nombre, apellidos, email, contraseña, repetir contraseña
- Indicador visual de fortaleza de contraseña (muy débil → muy fuerte)
- Validación de que ambas contraseñas coinciden
- Checkbox de aceptación de términos (obligatorio)
- Checkbox de suscripción a newsletter (opcional)

**Panel de ventajas:**
- Panel lateral con los beneficios de registrarse (historial de pedidos, lista de deseos, descuentos, etc.)

**Flujo de autenticación:**
- Si el usuario ya está autenticado al entrar al login, es redirigido automáticamente al índice
- Tras login/registro exitoso, el nombre del usuario aparece en el header de todas las páginas

---

## Módulos JavaScript

El archivo `js/app.js` está organizado en módulos con responsabilidades separadas:

### `Cart` — Gestión del carrito
```
Cart.add(book, qty)       → Añade un libro (o incrementa cantidad)
Cart.remove(id)           → Elimina un artículo
Cart.updateQty(id, qty)   → Actualiza la cantidad
Cart.clear()              → Vacía el carrito
Cart.count()              → Número total de artículos
Cart.total()              → Precio total
Cart.updateHeaderBadge()  → Actualiza el contador del header
```

### `Favorites` — Lista de deseos
```
Favorites.has(id)         → Comprueba si un libro está en favoritos
Favorites.toggle(id)      → Añade o elimina de favoritos
Favorites.getAll()        → Devuelve array de IDs favoritos
```

### `UserModule` — Autenticación
```
UserModule.login(email, pass)   → Valida credenciales y guarda sesión
UserModule.register(data)       → Registra nuevo usuario
UserModule.logout()             → Cierra sesión
UserModule.isLoggedIn()         → Comprueba si hay sesión activa
UserModule.get()                → Devuelve datos del usuario actual
UserModule.updateHeader()       → Actualiza el nombre en el header
```

### Funciones de UI por página
| Función | Página |
|---|---|
| `applyFiltersAndSort()` | index.html |
| `renderPage()` | index.html |
| `goToPage(n)` | index.html |
| `initBookPage()` | book.html |
| `renderFicha(book)` | book.html |
| `addToCartFromFicha()` | book.html |
| `switchTab(btn, panelId)` | book.html |
| `initCartPage()` | cart.html |
| `renderCartPage()` | cart.html |
| `procederCheckout()` | cart.html |
| `initLoginPage()` | login.html |
| `switchAuthTab(tab)` | login.html |

---

## LocalStorage — Persistencia de datos

| Clave | Contenido | Tipo |
|---|---|---|
| `agapea_cart` | Array de artículos del carrito | JSON array |
| `agapea_favorites` | Array de IDs de libros favoritos | JSON array |
| `agapea_user` | Datos del usuario con sesión activa | JSON object |
| `agapea_users` | Base de datos local de usuarios registrados | JSON array |

**Estructura de un item del carrito:**
```json
{
  "id": 2,
  "title": "El nombre de la rosa",
  "author": "Umberto Eco",
  "price": 10.95,
  "cover": "https://...",
  "stock": 30,
  "qty": 1
}
```

**Estructura de un usuario registrado:**
```json
{
  "id": 1748293845231,
  "name": "María",
  "surname": "García López",
  "email": "maria@email.com",
  "password": "a1b2c3d4",
  "newsletter": true,
  "createdAt": "2026-03-08T10:30:00.000Z"
}
```
> ⚠️ Las contraseñas se almacenan con un hash simple. Este sistema es válido para una demo local pero **no es apto para producción**. En producción se utilizaría bcrypt en el servidor.

---

## Validación de formularios

Todos los formularios usan validación JavaScript personalizada (sin dependencias externas), con mensajes de error inline bajo cada campo.

**Reglas implementadas:**

| Campo | Validación |
|---|---|
| Email | Formato `x@x.x` con regex |
| Contraseña login | Mínimo 6 caracteres |
| Nombre / Apellidos | Mínimo 2 caracteres |
| Contraseña registro | Mínimo 6 caracteres |
| Repetir contraseña | Coincide con la contraseña |
| Términos y condiciones | Checkbox obligatorio |

Los campos inválidos muestran borde rojo y mensaje de error. Al corregirse, el error desaparece automáticamente.

---

## Tecnologías utilizadas

| Tecnología | Versión | Uso |
|---|---|---|
| HTML5 | — | Estructura semántica de las páginas |
| CSS3 | — | Estilos, layout flex/grid, responsive design |
| JavaScript ES6+ | — | Lógica, DOM, fetch, módulos, async/await |
| Font Awesome | 6.5.1 | Iconografía (carrito, estrellas, flechas...) |
| Google/Open Library | — | Imágenes de portadas de libros |

**Sin frameworks ni librerías JavaScript.** Todo el código es vanilla JS.

---

## Cómo ejecutar el proyecto

El proyecto usa `fetch()` para cargar el archivo `data/books.json`, por lo que **no puede abrirse directamente como archivo** (`file://`). Es necesario un servidor HTTP local.

**Opción 1 — VS Code + Live Server:**
1. Abre la carpeta del proyecto en VS Code
2. Instala la extensión "Live Server" (ritwickdey.LiveServer)
3. Clic derecho sobre `index.html` → "Open with Live Server"

**Opción 2 — Node.js:**
```bash
npx serve .
# Abre http://localhost:3000
```

**Opción 3 — Python:**
```bash
python -m http.server 8080
# Abre http://localhost:8080
```

---

## Datos de prueba

El archivo `data/books.json` incluye 12 libros con los siguientes campos:

```json
{
  "id": 1,
  "title": "Comerás Flores",
  "author": "Lucía Solla Sobral",
  "isbn": "9788410178595",
  "price": 22.75,
  "originalPrice": 22.75,
  "discount": 0,
  "stock": 15,
  "category": "gastronomia",
  "genre": "Cocina",
  "publisher": "Planeta",
  "year": 2024,
  "pages": 256,
  "language": "Castellano",
  "cover": "https://...",
  "description": "...",
  "rating": 4.5,
  "reviews": 23,
  "featured": true,
  "newRelease": true,
  "bestseller": false,
  "tags": ["cocina", "flores", "gastronomia"]
}
```

**Cupones de descuento para probar:**
- `AGAPEA10` → 10% de descuento
- `LIBROS5` → 5% de descuento

---

## Notas de desarrollo

- El diseño sigue la paleta de colores real de Agapea: azul `#00679f`, gris oscuro `#2c2c2c`, fondo `#ededed`
- La tipografía es Verdana, idéntica a la del sitio original
- El layout usa Flexbox y CSS Grid, sin Bootstrap ni frameworks CSS
- El código JavaScript está modularizado en objetos con métodos claros y separación de responsabilidades
- Las imágenes de portada provienen de Unsplash y Open Library (URLs externas)

---

*Proyecto académico — Lenguaje de Marcas — 2025/2026*