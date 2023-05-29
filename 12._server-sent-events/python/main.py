from fastapi import FastAPI
from datetime import datetime
import requests


app = FastAPI()

@app.get("/date")
def get_date():
    try:
        return {"data" : datetime.now()}
    except:
        return {"error" : "An error happened on the server"}

@app.get("/datefromexpress")
def get_date_from_express():
    try:
        response = requests.get("http://127.0.0.1:8080/date")
        date = response.json()
        return {"data" : date}
    except:
        return {"error" : "An error happened on the server"}