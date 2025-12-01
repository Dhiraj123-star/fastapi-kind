from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message":"FastAPI on KIND is running!!!"}

@app.get("/health",tags=['Health'])
def health_check():
    return {"status":"ok"}