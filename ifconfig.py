from __future__ import absolute_import
from __future__ import division
from __future__ import print_function
from __future__ import unicode_literals

from flask import Flask, request, Response

app = Flask(__name__)


@app.route("/")
def remote_addr():
    try:
        ip = request.headers['X-Forwarded-For']
    except KeyError:
        ip = request.remote_addr
    return Response(ip, mimetype='text/plain; charset=utf-8')

if __name__ == '__main__':
    app.run(port=8888)
