#!/bin/bash

# Download core. 
docker-compose exec --user root php-fpm wp core download --force --allow-root

# Create WP config file (if one doesn't already exist).
if [ ! -f wordpress/wp-config.php ]; then
    docker-compose exec --user root php-fpm wp config create \
        --dbhost="db:3306" \
        --dbname=wordpress \
        --dbuser=wordpress \
        --dbpass=wordpress \
        --force \
        --allow-root 
fi

# Perform WP installation process.
docker-compose exec --user root php-fpm wp core install \
    --url=localhost \
    --title="WP Skateboard" \
    --admin_user="admin" \
    --admin_email="admin@test.com" \
    --admin_password="password" \
    --allow-root

# Install Composer dependencies.
docker-compose exec --user root php-fpm /bin/bash -c "cd wp-content && composer install"

# Change default tagline.
docker-compose exec --user root php-fpm wp option update blogdescription "A starter WordPress environment built with Docker." --allow-root

# Turn on debugging.
docker-compose exec --user root php-fpm wp config set WP_DEBUG true --raw --type="constant" --allow-root
docker-compose exec --user root php-fpm wp config set WP_DEBUG_LOG true --raw --type="constant" --allow-root

# Remove all posts, comments, and terms.
docker-compose exec --user root php-fpm wp site empty --yes --allow-root

# Remove default plugins and themes.
docker-compose exec --user root php-fpm wp plugin delete hello --allow-root
docker-compose exec --user root php-fpm wp plugin delete akismet --allow-root
docker-compose exec --user root php-fpm wp theme delete twentyfifteen --allow-root
docker-compose exec --user root php-fpm wp theme delete twentysixteen --allow-root

# Remove widgets.
docker-compose exec --user root php-fpm wp widget delete recent-posts-2 --allow-root
docker-compose exec --user root php-fpm wp widget delete recent-comments-2 --allow-root
docker-compose exec --user root php-fpm wp widget delete archives-2 --allow-root
docker-compose exec --user root php-fpm wp widget delete search-2 --allow-root
docker-compose exec --user root php-fpm wp widget delete categories-2 --allow-root
docker-compose exec --user root php-fpm wp widget delete meta-2 --allow-root

