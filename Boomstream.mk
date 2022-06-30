DOCKER_COMPOSE?=docker-compose

start: docker-compose.yml jibri_multi.yml
	$(DOCKER_COMPOSE) -f docker-compose.yml -f jibri_multi.yml up -d

stop:
	$(DOCKER_COMPOSE) -f docker-compose.yml -f jibri_multi.yml down -v