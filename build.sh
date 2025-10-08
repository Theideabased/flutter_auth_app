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

echo "Getting dependencies..."
flutter pub get

echo "Building web app..."
flutter build web --release
