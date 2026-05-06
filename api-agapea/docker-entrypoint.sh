#!/bin/bash
set -e

# Cachear configuración y rutas de Laravel
php artisan config:cache
php artisan route:cache

# Enlace de storage (para archivos públicos)
php artisan storage:link || true

echo "✓ Laravel listo — arrancando Apache"
exec "$@"
