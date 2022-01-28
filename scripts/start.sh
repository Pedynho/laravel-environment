# commands to setup laravel app
cd www
composer update
composer upgrade
composer install
cp .env.example .env
php artisan key:generate
php artisan migrate
chown -R www-data:www-data /var/www/storage
chown -R www-data:www-data /var/www/bootstrap/cache