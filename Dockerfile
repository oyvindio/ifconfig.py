FROM alpine:latest
MAINTAINER oyvindio <oyvind.overgaard@gmail.com>
RUN apk update && \
apk add python3 && \
easy_install-3.4 pip && \
rm -rf /var/cache/apk/*
ADD ifconfig.py /app/ifconfig.py
ADD test_ifconfig.py /app/test_ifconfig.py
ADD requirements.txt /app/requirements.txt
RUN cd /app && pip install -r requirements.txt && py.test .
EXPOSE 8888
ENTRYPOINT ["python3", "/app/ifconfig.py"]
