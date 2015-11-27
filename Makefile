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

smoketest:
	./smoketest.py

test:
	py.test .
