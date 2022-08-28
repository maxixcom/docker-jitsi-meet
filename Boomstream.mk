DOCKER_COMPOSE?=docker-compose

start-single: docker-compose.yml jibri.yml
	$(DOCKER_COMPOSE) -f docker-compose.yml -f jibri.yml up -d

stop-single:
	$(DOCKER_COMPOSE) -f docker-compose.yml -f jibri.yml down -v

start: docker-compose.yml jibri_multi.yml
	$(DOCKER_COMPOSE) -f docker-compose.yml -f jibri_multi.yml up -d

stop:
	$(DOCKER_COMPOSE) -f docker-compose.yml -f jibri_multi.yml down -v
