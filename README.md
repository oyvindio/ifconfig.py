![Travis build status for branch master](https://travis-ci.org/oyvindio/ifconfig.py.svg?branch=master)

# ifconfig.py

ifconfig.py is a python app which listens for http requests, and just answers with the client's remote IP in UTF-8 plain text. It can be used to (try to) determine a machine's remote IP when behind NAT.

Try it at: http://oyvind.io/ip
Docker Hub page: https://hub.docker.com/r/oyvindio/ifconfig.py/

## Run it

To test it out:
```
$ docker run --publish 8888:8888 oyvindio/ifconfig.py
$ curl -v http://localhost:8888
# or if you're using docker-machine, something like
$ curl -v http://$(docker-machine ip default):8888
```
If you want to run your own on something that runs systemd, you might want to take a look the systemd service file [systemd-examples/ifconfig.py.service](systemd-examples/ifconfig.py.service).

## License
GPLv3. See [LICENSE](LICENSE)
