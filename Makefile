all:
	@mkdir --verbose -p /home/${USER}/data/wordpress_volume
	@mkdir --verbose -p /home/${USER}/data/mariadb_volume
	docker compose -f ./srcs/docker-compose.yml up --build

up: all

down:
	docker compose -f ./srcs/docker-compose.yml down

re: down all

clean: down
	-docker stop $$(docker ps -qa)
	-docker rm $$(docker ps -qa)
	-docker rmi -f $$(docker images -qa)
	-docker volume rm $$(docker volume ls -q) 
	-docker network rm srcs_inception_network
	sudo rm -rf /home/$(USER)/data/

prune: clean
	@docker system prune -a -f --volumes

.PHONY: all up re down clean prune
