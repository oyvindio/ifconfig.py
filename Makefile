.PHONY: deploy install-dependencies smoketest
SHELL=bash

CONTAINER_NAME=ifconfig.py
IMAGE_NAME=oyvindio/${CONTAINER_NAME}

build:
	docker build --tag ${IMAGE_NAME} .

run:
	docker run --detach --publish 8888:8888 --name ${CONTAINER_NAME} ${IMAGE_NAME}

install-dependencies:
	pip install -r requirements.txt

deploy:
	ssh ifconfig-py@oyvind.io "bash --login -c 'cd ~/ifconfig.py && git pull && make install-dependencies && sudo systemctl reload-or-restart ifconfig-gunicorn.service && sudo systemctl status ifconfig-gunicorn.service && make smoketest'"

smoketest:
	./smoketest.py

test:
	py.test .
