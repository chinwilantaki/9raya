#!/bin/bash
set -e

echo "🚀 Starting Flutter web build on Netlify..."

# Install Flutter if not already installed
if ! command -v flutter &> /dev/null; then
  echo "📦 Installing Flutter SDK..."
  
  # Download and install Flutter
  FLUTTER_VERSION="${FLUTTER_VERSION:-3.24.0}"
  FLUTTER_SDK="flutter_linux_${FLUTTER_VERSION}-stable.tar.xz"
  
  cd /tmp
  wget -q "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/${FLUTTER_SDK}" || \
  wget -q "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz"
  
  tar xf flutter_linux_${FLUTTER_VERSION}-stable.tar.xz || \
  tar xf "flutter_linux_${FLUTTER_VERSION}-stable.tar.xz"
  
  export PATH="$PATH:/tmp/flutter/bin"
  
  # Accept licenses
  flutter doctor --android-licenses || true
fi

# Navigate to project directory
cd "$NETLIFY_BUILD_BASE" || cd /opt/build/repo

# Verify Flutter installation
flutter --version

# Get Flutter dependencies
echo "📚 Getting Flutter dependencies..."
flutter pub get

# Generate localization files
echo "🌐 Generating localization files..."
flutter gen-l10n

# Build Flutter web
echo "🔨 Building Flutter web app..."
flutter build web --release

echo "✅ Build completed successfully!"
ls -la build/web/
