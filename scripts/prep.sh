#!/bin/bash

# Remove all posts, comments, and terms.
docker-compose exec --user www-data wordpress wp site empty --yes

# Remove plugins and themes.
docker-compose exec --user www-data wordpress wp plugin delete hello
docker-compose exec --user www-data wordpress wp plugin delete akismet
docker-compose exec --user www-data wordpress wp theme delete twentyfifteen
docker-compose exec --user www-data wordpress wp theme delete twentysixteen

# Remove widgets.
docker-compose exec --user www-data wordpress wp widget delete recent-posts-2
docker-compose exec --user www-data wordpress wp widget delete recent-comments-2
docker-compose exec --user www-data wordpress wp widget delete archives-2
docker-compose exec --user www-data wordpress wp widget delete search-2
docker-compose exec --user www-data wordpress wp widget delete categories-2
docker-compose exec --user www-data wordpress wp widget delete meta-2

