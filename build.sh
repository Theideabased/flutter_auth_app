#!/bin/bash

# Vercel build script for Flutter Web
set -e

echo "Installing Flutter..."

# Check if Flutter is already cached
if [ ! -d "flutter" ]; then
  echo "Cloning Flutter SDK..."
  git clone https://github.com/flutter/flutter.git -b stable --depth 1
else
  echo "Using cached Flutter SDK..."
  cd flutter
  git pull
  cd ..
fi

# Add Flutter to PATH
export PATH="$PATH:`pwd`/flutter/bin"

echo "Flutter version:"
flutter --version

echo "Enabling web support..."
flutter config --enable-web

echo "Installing dependencies..."
flutter pub get

echo "Building web app..."
flutter build web --release

echo "Build complete! Output directory: build/web"
