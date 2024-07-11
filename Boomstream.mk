DOCKER_COMPOSE?=docker-compose

start: docker-compose.yml jibri_multi.yml
	$(DOCKER_COMPOSE) -f docker-compose.yml -f jibri_multi.yml -f etherpad.yml up -d

stop:
	$(DOCKER_COMPOSE) -f docker-compose.yml -f jibri_multi.yml -f etherpad.yml down -v

status:
	$(DOCKER_COMPOSE) -f docker-compose.yml -f jibri_multi.yml -f etherpad.yml ps


start-one: docker-compose.yml jibri.yml
	$(DOCKER_COMPOSE) -f docker-compose.yml -f jibri.yml -f etherpad.yml up -d

stop-one: docker-compose.yml jibri.yml
	$(DOCKER_COMPOSE) -f docker-compose.yml -f jibri.yml -f etherpad.yml down -v


