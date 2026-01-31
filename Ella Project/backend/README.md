# Ella Project Backend

## Requirements
- Python 3.8+
- FastAPI
- SQLite
- SQLAlchemy

## Setup
1. Create a virtual environment:
   ```bash
   python -m venv venv
   source venv/Scripts/activate  # Windows
   ```
2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
3. Run the server:
   ```bash
   uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
   ```

## API Documentation
Once the server is running, visit `http://localhost:8000/docs` for the interactive Swagger UI.
