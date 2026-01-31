# Ella Project Mobile App

## Features
- Real Login & Signup with FastAPI Backend
- Persistent data in SQLite (Backend)
- Platform-aware API communication (Localhost for Windows, IP for Mobile/Web)
- Multi-platform support: Windows, Android, Web

## Setup
1. Ensure the backend is running at `192.168.0.205:8000`.
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run on desired platform:
   - Web: `flutter run -d chrome`
   - Windows: `flutter run -d windows`
   - Android: `flutter run -d <device_id>`

## Platform Handling
The app automatically switches the API base URL:
- **Windows**: `http://localhost:8000`
- **Android/Web**: `http://192.168.0.205:8000`
