FROM alpine:latest
MAINTAINER oyvindio <oyvind.overgaard@gmail.com>
RUN apk update && \
apk add python3 && \
easy_install-3.4 pip && \
rm -rf /var/cache/apk/*
ADD ifconfig.py /app/
ADD test_ifconfig.py /app/
ADD smoketest.py /app/
ADD requirements.txt /app/
RUN cd /app && pip install -r requirements.txt && py.test .
EXPOSE 8888
ENTRYPOINT ["gunicorn", "--chdir=/app", "--bind=0.0.0.0:8888", "--log-file=-", "--access-logfile=-", "--error-logfile=-", "ifconfig:app"]
