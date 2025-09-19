from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    app_name: str = "DevOps Command Center"
    secret_key: str = "change_this_secret"
    debug: bool = False

    s3_bucket: str = ""
    s3_key: str = ""
    aws_access_key_id: str = ""
    aws_secret_access_key: str = ""
    aws_region: str = ""

    class Config:
        env_file = ".env"
        case_sensitive = True

settings = Settings()