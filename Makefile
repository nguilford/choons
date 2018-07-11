.PHONY: build run

build:
	@ docker-compose --file build/docker-compose.yml build ${COMPOSE_SERVICE}

run:
	@ docker-compose --file build/docker-compose.yml up ${COMPOSE_SERVICE}
