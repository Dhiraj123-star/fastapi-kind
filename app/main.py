from fastapi import FastAPI
import os

app = FastAPI()

@app.get("/")
def read_root():
    return {"message":"FastAPI on KIND is running!!!"}

@app.get("/health",tags=['Health'])
def health_check():
    return {"status":"ok"}

@app.get("/info")
def info():
    return {
        "app_env": os.getenv("APP_ENV"),
        "app_name": os.getenv("APP_NAME"),
        "version": os.getenv("APP_VERSION"),
    }
