from fastapi import FastAPI
import requests
from dotenv import load_dotenv, dotenv_values
import os

app = FastAPI()

dotenv_values = dotenv_values()

## Example 1

@app.get("/mysecret")
def get_env_secret():
    return {"data" : dotenv_values.get("MY_SECRET")}

@app.get("/myothersecret")
def get_other_env_secret():
    return {"data" : dotenv_values.get("MY_OTHER_SECRET")}


## Example 2

@app.get("/mysecretfromos")
def get_env_secret_os():
    load_dotenv()
    return {"data" : os.getenv("MY_SECRET")}

@app.get("/myothersecretfromos")
def get_other_env_os():
    load_dotenv()
    return {"data" : os.getenv("MY_OTHER_SECRET")}

