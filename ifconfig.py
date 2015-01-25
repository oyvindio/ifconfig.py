from daemon import DaemonContext
from daemon.pidfile import TimeoutPIDLockFile
from flask import Flask, request, Response
from os.path import abspath, dirname, join

pidfile_path = join(abspath(dirname(__file__)), 'ifconfig-py.pid')
app = Flask(__name__)


@app.route("/")
def remote_addr():
    try:
        ip = request.headers['X-Forwarded-For']
    except KeyError:
        ip = request.remote_addr
    return Response(ip, mimetype='text/plain; charset=utf-8')

if __name__ == '__main__':
    with DaemonContext(pidfile=TimeoutPIDLockFile(pidfile_path)):
        app.run()
