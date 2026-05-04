# Requisitos y Configuración del Proyecto Agapea

Este documento describe los pasos necesarios para configurar y ejecutar el proyecto Agapea, que consta de una API backend en Laravel, un frontend web estático y un panel de administración.

## Requisitos del Sistema

Antes de comenzar, asegúrate de tener instalados los siguientes componentes:

* **PHP 8.2 o superior**: Necesario para ejecutar la API Laravel.
* **Composer**: Gestor de dependencias para PHP.
* **Node.js y npm**: Para gestionar dependencias de JavaScript y construir assets.
* **Servidor web**: Apache, Nginx o similar para servir el frontend y la API.
* **Base de datos**: MySQL o MariaDB (recomendado) o SQLite (alternativa).
* **Git**: Para clonar el repositorio si es necesario.

### Instalación de Dependencias Básicas

#### En Windows:

* Instala PHP desde https://www.php.net/downloads
* Instala Composer desde https://getcomposer.org/download/
* Instala Node.js desde https://nodejs.org/
* Instala un servidor MySQL como XAMPP o MySQL Server.

#### En Linux/Mac:

* Usa el gestor de paquetes de tu sistema (apt, brew, etc.) para instalar PHP, Composer y Node.js.

## Estructura del Proyecto

El proyecto se divide en tres partes principales:

* `api-agapea/`: API backend en Laravel.
* `agapea-frontend/`: Frontend web para usuarios.
* `adm-agapea/`: Panel de administración.
* `agapea_db.sql`: Esquema y datos iniciales de la base de datos.

## Configuración de la API (api-agapea/)

1. **Instalar dependencias de PHP**:

   ```
   cd api-agapea
   composer install
   ```

2. **Configurar el entorno**:

   * Copia el archivo `.env.example` a `.env`:

     ```
     cp .env.example .env
     ```
   * Edita `.env` con tus configuraciones locales:

     * `APP_NAME`: Nombre de la aplicación (ej: "Agapea").
     * `APP_ENV`: "local" para desarrollo.
     * `APP_DEBUG`: "true" para desarrollo.
     * `APP_URL`: URL base de la API (ej: "http://localhost/api-agapea/public").
     * Configura la base de datos (ver sección siguiente).

3. **Generar clave de aplicación**:

   ```
   php artisan key:generate
   ```

4. **Instalar dependencias de JavaScript**:

   ```
   npm install
   ```

5. **Construir assets**:

   ```
   npm run build
   ```

## Configuración de la Base de Datos

### Uso con XAMPP

Para importar la base de datos en XAMPP:

1. Crea una base de datos llamada `agapea_db` desde phpMyAdmin.
2. Importa el archivo `agapea_db.sql` dentro de esa base de datos.

### Configuración general

1. **Configurar conexión en .env**:

   ```
   DB_CONNECTION=mysql
   DB_HOST=127.0.0.1
   DB_PORT=3306
   DB_DATABASE=agapea_db
   DB_USERNAME=tu_usuario
   DB_PASSWORD=tu_contraseña
   ```

2. **Ejecutar migraciones (opcional, si hay cambios)**:

   ```
   php artisan migrate
   ```

3. **Ejecutar seeders (opcional, para datos de prueba)**:

   ```
   php artisan db:seed
   ```

## Configuración del Frontend (agapea-frontend/)

El frontend es estático y no requiere configuración especial. Simplemente sirve los archivos desde un servidor web.

1. **Servir los archivos**:

   * Coloca la carpeta `agapea-frontend/` en el directorio raíz de tu servidor web.
   * O usa un servidor de desarrollo simple:

     ```
     cd agapea-frontend
     python -m http.server 8000
     ```

2. **Configurar API endpoints**:

   * En los archivos JavaScript (`js/services/api.js`), asegúrate de que las URLs apunten a tu API:

     * Cambia `baseURL` a la URL de tu API (ej: "http://localhost/api-agapea/public/api/v1").

## Configuración del Panel de Administración (adm-agapea/)

Similar al frontend, es estático.

1. **Servir los archivos**:

   * Coloca la carpeta `adm-agapea/` en tu servidor web.

2. **Configurar API**:

   * Asegúrate de que los scripts apunten correctamente a la API.

## Cómo Ejecutar el Proyecto

1. **Iniciar la API**:

   ```
   cd api-agapea
   php artisan serve
   ```

   * La API estará disponible en `http://localhost:8000`.

2. **Servir el frontend**:

   * Configura tu servidor web para servir `agapea-frontend/` en una URL (ej: `http://localhost`).

3. **Servir el panel de administración**:

   * Configura tu servidor web para servir `adm-agapea/` en una URL separada (ej: `http://localhost/admin`).

## Notas Adicionales

* **Autenticación**: La API usa Laravel Sanctum para autenticación. Los tokens se envían en headers `Authorization: Bearer <token>`.
* **Producción**: Configura `APP_ENV=production`, `APP_DEBUG=false`, y optimiza con:

  ```
  php artisan config:cache
  php artisan route:cache
  ```

Si encuentras problemas, revisa los logs en `storage/logs/laravel.log`.
