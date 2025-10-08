#!/bin/bash
set -e

# Flutter Web build script for Vercel
echo "Downloading Flutter SDK..."
curl -fsSL https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.5-stable.tar.xz -o flutter.tar.xz

echo "Extracting Flutter SDK..."
tar xf flutter.tar.xz

echo "Setting up Flutter..."
export PATH="$PWD/flutter/bin:$PATH"

# Fix git ownership issue in Vercel environment
git config --global --add safe.directory '*'

echo "Configuring Flutter..."
flutter config --enable-web --no-analytics

echo "Checking .env file..."
if [ -f ".env" ]; then
  echo "✓ .env file found"
  cat .env
else
  echo "✗ .env file not found - creating one..."
  echo "AUTH0_DOMAIN=dev-r1s7xzqfu3rt2lmr.us.auth0.com" > .env
  echo "AUTH0_CLIENT_ID=aG1x463yGHmdpoFWF3KAVXNkGxRaX0TJ" >> .env
  echo "AUTH0_CUSTOM_SCHEME=com.auth0.sample" >> .env
fi

echo "Getting dependencies..."
flutter pub get

echo "Building web app with HTML renderer..."
flutter build web --release --web-renderer html
