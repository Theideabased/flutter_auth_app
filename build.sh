#!/bin/bash

# Vercel build script for Flutter Web
set -e

echo "=========================================="
echo "Starting Flutter Web Build"
echo "=========================================="

# Check if Flutter is already cached
if [ -d "flutter" ]; then
  echo "✓ Flutter found in cache, updating..."
  cd flutter
  git pull origin stable || echo "Failed to update, continuing with cached version"
  cd ..
else
  echo "✓ Cloning Flutter SDK (stable branch)..."
  git clone https://github.com/flutter/flutter.git -b stable --depth 1
fi

# Add Flutter to PATH
export PATH="$PATH:$PWD/flutter/bin"

echo ""
echo "Flutter version:"
flutter --version

echo ""
echo "✓ Configuring Flutter for web..."
flutter config --enable-web --no-analytics

echo ""
echo "✓ Installing dependencies..."
flutter pub get

echo ""
echo "✓ Building Flutter web app (release mode)..."
flutter build web --release --web-renderer canvaskit

echo ""
echo "=========================================="
echo "✓ Build Complete!"
echo "=========================================="
echo "Output directory: build/web"
