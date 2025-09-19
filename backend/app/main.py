from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.core.command_loader import load_commands_from_s3

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/api/sections")
def get_sections():
    data = load_commands_from_s3()
    return data