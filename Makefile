DOCKER_COMPOSE ?= docker-compose -f containers/docker-compose.yml

.PHONY: all build clean up

all: up

build:
	$(DOCKER_COMPOSE) build

up: build
	-$(DOCKER_COMPOSE) run cyverse_irods_dev_new

new_up: build
	-$(DOCKER_COMPOSE) run cyverse_irods_dev_new

old_up: build
	-$(DOCKER_COMPOSE) run cyverse_irods_dev_old

clean:
	-$(DOCKER_COMPOSE) stop
	-$(DOCKER_COMPOSE) rm --force --all
