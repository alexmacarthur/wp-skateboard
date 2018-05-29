# Download WordPress core to /core directory.
docker-compose exec --user root wordpress wp core download --path=core --force --allow-root

# Copy over our config from default image.
docker-compose exec --user root wordpress cp wp-config.php core/wp-config.php

# Set constants to new WP core location.
docker-compose exec --user root wordpress wp config set WP_CONTENT_DIR /var/www/html/wp-content --type=constant --path=core --allow-root
docker-compose exec --user root wordpress wp config set WP_SITEURL $(docker-compose exec --user root wordpress wp option get home --allow-root | tr -d '\r')/core --type=constant --path=core --allow-root

# Route requests to new WP core location.
docker-compose exec --user root wordpress /bin/bash -c "echo \"<?php require(dirname(__FILE__) . '/core/index.php'); ?>\" > index.php"