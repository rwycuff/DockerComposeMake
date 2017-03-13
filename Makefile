CURRENT_DIRECTORY := $(shell pwd)

TESTSCOPE = apps
TESTFLAGS = --with-timer --timer-top-n 10 --keepdb

help:
	@echo "Docker Compose Help"
	@echo "-----------------------"
	@echo ""
	@echo "docker-compose up"
	@echo "    make start"
	@echo ""
	@echo ""


start:
	@docker-compose up -d

stop:
	@docker-compose stop

status:
	@docker-compose ps

restart: stop start

clean: stop
	@docker-compose rm --force
	@find . -name \*.pyc -delete

build:
	@docker-compose build api

cli:
	@docker-compose run --rm api bash

tail:
	@docker-compose logs -f

.PHONY: start stop status restart clean build test testwarn migrate fixtures cli tail
