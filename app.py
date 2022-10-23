#!/usr/bin/env python3


from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def argoapp():
  return jsonify("ARGI-CD is awesome")

if __name__ == '__main__':
    app.run(host='0.0.0.0' ,debug = True)





