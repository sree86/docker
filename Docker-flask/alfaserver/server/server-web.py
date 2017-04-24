#!/bin/python
from flask import Flask, render_template, request
import json
import sqlite3 as sql
app = Flask(__name__)

@app.route('/result')
def result():
        con = sql.connect("/var/lib/db/reports.db")
        con.row_factory = sql.Row
        cur = con.cursor()
        cur.execute("select * from matrixes ;")
        rows = cur.fetchall();
        print rows
        return render_template("list.html",rows = rows)

@app.route('/clients', methods=['POST'])
def post():
        host = request.json.get('username')
        attempt = request.json.get('userId')
        print host
        print attempt
        con = sql.connect("/var/lib/db/reports.db")
        cur = con.cursor()
        cursor = cur.execute("SELECT count(*) from matrixes where hostname = '%s';"% (str(host)))
        data=cursor.fetchone()[0]
        if data != 0:
                cur.execute("UPDATE matrixes set attempts=attempts+1 where hostname = '%s';"% (str(host)))
                con.commit()
        else:
                cur.execute("INSERT  INTO matrixes (hostname, attempts ) VALUES ('%s', %d);"% (str(host),int(attempt)))
                con.commit()
        return json.dumps(request.json)
        con.close()

if __name__ == '__main__':
   app.run(host = '0.0.0.0', port = 80, debug = True)

