from flask import Flask, request, Response
app = Flask(__name__)

@app.route("/")
def remote_addr():
    return Response(request.remote_addr, mimetype='text/plain; charset=utf-8')

if __name__ == "__main__":
    app.run()
