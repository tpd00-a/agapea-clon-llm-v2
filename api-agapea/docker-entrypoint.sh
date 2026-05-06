#!/bin/sh
set -e

php artisan config:cache
php artisan route:cache
php artisan migrate --force
php artisan db:seed --force
php artisan storage:link || true

echo "Laravel listo - arrancando Apache"
exec "$@"
