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
    app.run()
