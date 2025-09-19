from fastapi import APIRouter
from app.core.command_loader import load_commands_from_s3

router = APIRouter()

@router.get("/sections")
def get_sections():
    sections = load_commands_from_s3()
    return sections
    


