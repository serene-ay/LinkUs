#!/usr/bin/env python3
from gevent import monkey; monkey.patch_all()
from bottle import Bottle, run, redirect, template, request, response, HTTPResponse, get, post, static_file
import atexit
import pickle
import time
import json

app = Bottle()
events = ["message","location","emoji"]
event_history_size = 10

# ready from disk or init data
try:
    file = open('database', 'rb')
    data = pickle.load(file)
    file.close()
    previous_msg = dict(data["event"][len(data["event"])-1])
except:
    data = dict()
    data["event"] = []
    previous_msg = dict()
    for i in events:
        previous_msg[i] = ""
        previous_msg[i+"_date"] = ""
        previous_msg[i+"_time"] = ""

# store data on disk if exit with ctrl-c
@atexit.register
def goodbye():
    file = open('database', 'wb')
    pickle.dump(dict(data), file)
    print("goodbye")

# serve the home page
@app.route('/')
def home():
    return template('home')

# RESTFUL POST for pushing data
@app.route('/b/<event_type>',method="POST")
def button_call(event_type):
    if event_type in events and request.json and "info" in dict(request.json):
        previous_msg[event_type] = request.json["info"]
        previous_msg[event_type+"_date"] = time.strftime("%Y-%m-%d")
        previous_msg[event_type+"_time"] = time.strftime("%H:%M:%S")
        data["event"].append(dict(previous_msg))
        while len(data["event"]) > event_history_size:
            data["event"].pop(0)
    else:
        return HTTPResponse(body='501 missing message', status=501)
    return

# RESTFUL GET to get json data
@app.route('/json')
def return_json():
    response.content_type = 'application/json'
    data["current_time"] = time.strftime("%H:%M:%S")
    data["current_date"] = time.strftime("%Y-%m-%d")
    return json.dumps(dict(data))

# serving emoji page
@app.route('/emoji')
def emoji():
    return template('emoji')

# serving static file
@app.route('/static/<filename>')
def server_static(filename):
    return static_file(filename, root='static/')

# default route, redirect to home page
@app.route('/<tmp>')
def tmp(tmp):
    redirect("/")

run(app, host='0.0.0.0', port=80, server="gevent", reloader=True, debug=True)
#run(app, host='0.0.0.0', port=80, server="gevent")
