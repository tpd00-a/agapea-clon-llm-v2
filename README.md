# Agapea — Clon de Plataforma de Venta de Libros Online

Proyecto de fin de módulo. Clon funcional de Agapea.com con arquitectura desacoplada: API REST en Laravel, storefront público (MPA) y panel de administración (SPA).

## Arranque Rápido

Una vez instalado (ver sección siguiente), el orden de arranque es:

```
1. Iniciar XAMPP → módulos Apache y MySQL
2. cd api-agapea → php artisan serve
3. Abrir agapea-frontend/index.html con Live Server  (tienda pública)
4. Abrir adm-agapea/index.html con Live Server       (panel de administración — opcional)
```

> Si abres los dos proyectos con Live Server a la vez, el segundo ocupará el puerto 5501 en lugar del 5500. Ábrelos de uno en uno si quieres mantener siempre el puerto 5500.

## Estructura del Proyecto

```
/agapea
├── api-agapea/        → Backend API REST (Laravel 11 + Sanctum)
├── agapea-frontend/   → Tienda pública (MPA — Vanilla JS)
├── adm-agapea/        → Panel de administración (SPA — Vanilla JS)
└── agapea_db.sql      → Volcado completo de la base de datos
```

## Requisitos del Sistema

- **PHP 8.2 o superior**
- **Composer**
- **XAMPP** (incluye Apache + MySQL/MariaDB)
- **Visual Studio Code** con la extensión **Live Server**

## Instalación

### 1. Base de datos

1. Abre XAMPP e inicia los módulos Apache y MySQL.
2. Accede a **phpMyAdmin** (`http://localhost/phpmyadmin`).
3. Crea una base de datos llamada `agapea_db`.
4. Importa el archivo `agapea_db.sql` dentro de esa base de datos.

### 2. Backend (`api-agapea/`)

```bash
# Instalar dependencias PHP
composer install

# Crear el fichero de entorno
cp .env.example .env

# Generar clave de aplicación
php artisan key:generate
```

Edita el archivo `.env` con tus credenciales locales:

```env
APP_NAME=Agapea
APP_ENV=local
APP_DEBUG=true
APP_URL=http://localhost:8000

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=agapea_db
DB_USERNAME=root
DB_PASSWORD=

FRONTEND_URL=http://127.0.0.1:5500
```

> `FRONTEND_URL` es necesario para que la configuración de CORS permita las peticiones del frontend desde Live Server. Si el frontend corre en un puerto distinto al 5500, actualiza este valor.

Arranca el servidor de la API estando dentro de la carpeta `api-agapea/`:

```bash
php artisan serve
```

Esto puede tardar unos segundos. La API quedará disponible en `http://localhost:8000/api/v1`.

### 3. Frontend (`agapea-frontend/`) y Admin (`adm-agapea/`)

Ambos son proyectos estáticos (HTML + CSS + JS). No requieren instalación ni compilación.

Ábrelos con **VS Code → clic derecho sobre `index.html` → Open with Live Server**:

- **Tienda pública:** `agapea-frontend/index.html` → `http://127.0.0.1:5500`
- **Panel de administración:** `adm-agapea/index.html` → `http://127.0.0.1:5500` (o 5501 si ambos están abiertos a la vez)

### 4. Verificar la URL de la API en el frontend

En `agapea-frontend/js/services/api.js` comprueba que `API_BASE` apunta al puerto donde corre la API:

```javascript
export const API_BASE = 'http://localhost:8000/api/v1';
```

## Credenciales por Defecto

| Rol | Email | Contraseña |
|---|---|---|
| Administrador | `admin@agapea.com` | `admin123` |

Los clientes de prueba se crean desde el formulario de registro de la tienda.

## Notas

- La autenticación usa **Laravel Sanctum** con tokens Bearer almacenados en `localStorage`.
- El carrito persiste en `localStorage` y se sincroniza con la API cuando hay sesión activa.
- Los logs de errores del backend se encuentran en `api-agapea/storage/logs/laravel.log`.

## Equipo

Richard · Tomás
