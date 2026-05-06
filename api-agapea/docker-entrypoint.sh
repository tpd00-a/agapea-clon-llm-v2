#!/bin/bash
set -e

# Cachear configuración y rutas de Laravel
php artisan config:cache
php artisan route:cache

# Ejecutar migraciones (seguro de repetir en cada deploy)
php artisan migrate --force

# Ejecutar seeders solo si la BD está vacía (evita duplicar datos)
ROLES=$(php artisan tinker --execute="echo \App\Models\Role::count();" 2>/dev/null | tail -1)
if [ "$ROLES" = "0" ] || [ -z "$ROLES" ]; then
    echo "BD vacía — ejecutando seeders..."
    php artisan db:seed --force
else
    echo "BD ya tiene datos — saltando seeders"
fi

# Enlace de storage (para archivos públicos)
php artisan storage:link || true

echo "✓ Laravel listo — arrancando Apache"
exec "$@"
