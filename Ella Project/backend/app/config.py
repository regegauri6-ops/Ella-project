from pydantic_settings import BaseSettings
import os

class Settings(BaseSettings):
    DATABASE_URL: str = "sqlite:///./app.db"
    SECRET_KEY: str = "your_secret_key_here"
    ALGORITHM: str = "HS256"

    class Config:
        env_file = ".env"

settings = Settings()
