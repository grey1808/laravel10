include .env
USER = "$(shell id -u):$(shell id -g)"

up:
	docker-compose up -d --remove-orphans
down:
	docker-compose down
build:
	docker-compose build
bash:
	docker exec -it --user=$(USER) $(APP_NAME)-php bash
root:
	docker exec -it --user=0 $(APP_NAME)-php bash
migrate:
	docker exec -it $(APP_NAME)-php bash -c 'php artisan migrate'
vite:
	docker exec -it $(APP_NAME)-php bash -c 'composer dev'




