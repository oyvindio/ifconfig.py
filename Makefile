.PHONY: deploy install-dependencies smoketest
SHELL=bash

install-dependencies:
	pip install -r requirements.txt

deploy:
	ssh ifconfig-py@oyvind.io "bash --login -c 'cd ~/ifconfig.py && git pull && make install-dependencies && sudo systemctl reload-or-restart ifconfig-gunicorn.service && sudo systemctl status ifconfig-gunicorn.service && make smoketest'"

smoketest:
	./smoketest.py

test:
	py.test .
