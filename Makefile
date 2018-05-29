.PHONY: docker docker-compose

docker:
	docker build -t wp-skateboard .

prep: 
	sh scripts/prep.sh

localize:
	sh scripts/localize.sh

up: 
	docker-compose up

down: 
	docker-compose down

restart:
	make up && make down

bash:
	docker-compose exec --user root wordpress /bin/bash