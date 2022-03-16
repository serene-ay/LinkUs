#!/usr/bin/env python3
from gevent import monkey; monkey.patch_all()
from bottle import Bottle, run, redirect, template, request, response, HTTPResponse, get, post
import atexit
import pickle
import time
import json

app = Bottle()

# ready from disk or init data
try:
    file = open('database', 'rb')
    data = pickle.load(file)
    file.close()
except:
    data = dict()
    data["event"] = []

# store data on disk if exit with ctrl-c
@atexit.register
def goodbye():
    file = open('database', 'wb')
    pickle.dump(dict(data), file)
    print("goodbye")

@app.route('/')
def home():
    ip = request.environ.get('REMOTE_ADDR')
    return template('home', ip=ip)

@app.route('/b',method="POST")
def button_call():
    if request.json and "message" in dict(request.json):
        tmp_msg = dict()
        tmp_msg["message"] = request.json["message"]
        tmp_msg["date"] = time.strftime("%Y-%m-%d")
        tmp_msg["time"] = time.strftime("%H:%M:%S")
        data["event"].append(tmp_msg)
        while len(data["event"]) > 10:
            data["event"].pop(0)
    else:
        return HTTPResponse(body='501 missing message', status=501)
    return

@app.route('/json')
def return_json():
    response.content_type = 'application/json'
    return json.dumps(dict(data))

@app.route('/test')
def test():
    return "test"

@app.route('/<tmp>')
def tmp(tmp):
    redirect("/")

run(app, host='0.0.0.0', port=80, server="gevent", reloader=True, debug=True)
