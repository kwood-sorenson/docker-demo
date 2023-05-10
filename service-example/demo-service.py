from flask import Flask, request, abort

app = Flask(__name__)

@app.get("/")
def root_get():
    return "<p>Hello, Docker!</p>"

@app.post("/")
def root_post():
    if 'data' in request.form:
        datastr = str(request.form['data'])
        return f"<p>I counted {len(datastr.split())} words</p>"
    abort(400)