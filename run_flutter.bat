@echo off
SET PATH=C:\Program Files\Git\cmd;C:\Program Files\Git\bin;C:\src\flutter\bin;%PATH%
SET GIT_HOME=C:\Program Files\Git

echo Setting up Flutter environment...
cd /d C:\Users\PC\Desktop\sample

echo.
echo Installing dependencies...
flutter pub get

echo.
echo Running app locally...
flutter run

pause
