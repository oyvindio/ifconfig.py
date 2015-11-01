.PHONY: deploy install-dependencies smoketest
SHELL=bash

install-dependencies:
	pip install -r requirements.txt

deploy:
	ssh ifconfig-py@oyvind.io 'cd ~/ifconfig.py && git pull && ~/env/bin/pip install -r requirements.txt && sudo systemctl reload-or-restart ifconfig-gunicorn.service && sudo systemctl status ifconfig-gunicorn.service && make smoketest'

smoketest:
	[[ $$(curl -L http://oyvind.io/ip 2> /dev/null) =~ [0-9]+\.[0-9]+\.[0-9]+\.[0-9]+ ]] && echo -e '\e[0;32mSmoketest OK\e[0m' || echo -e '\e[0;31mSmoketest FAILED\e[0m'
