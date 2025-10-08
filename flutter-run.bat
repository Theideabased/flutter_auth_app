@echo off
REM Flutter Runner Script
REM This script ensures Git and Flutter can find each other

SET PATH=C:\Program Files\Git\cmd;C:\Program Files\Git\bin;C:\src\flutter\bin;%PATH%

C:\src\flutter\bin\flutter.bat %*
