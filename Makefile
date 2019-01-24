.PHONY: bash docker-compose

setup: 
	bash setup.sh

up: 
	docker-compose up -d

down: 
	docker-compose down

restart:
	make down && make up

bash:
	docker-compose exec --user root php-fpm /bin/bash
