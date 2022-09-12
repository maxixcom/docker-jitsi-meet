DOCKER_COMPOSE?=docker-compose
INSTALL=install

-include .env

start: docker-compose.yml jibri_multi.yml
	$(DOCKER_COMPOSE) -f docker-compose.yml -f jibri_multi.yml up -d

stop:
	$(DOCKER_COMPOSE) -f docker-compose.yml -f jibri_multi.yml down -v

status:
	$(DOCKER_COMPOSE) -f docker-compose.yml -f jibri_multi.yml ps

JIBRIES=jibri jibri_2 jibri_3 jibri_4 jibri_5 jibri_6 jibri_7 jibri_8 jibri_9 jibri_10 jibri_11

finalize: $(foreach mod, $(JIBRIES), install-finalize-$(mod) )

install-finalize-%:
	$(INSTALL) jibri/finalize.sh $(CONFIG)/$*
