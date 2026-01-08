#!/bin/bash
set -e

echo "🚀 Starting Flutter web build on Netlify..."

# Install Flutter if not already installed
if ! command -v flutter &> /dev/null; then
  echo "📦 Installing Flutter SDK..."
  
  # Use git to clone Flutter (more reliable than downloading archives)
  FLUTTER_VERSION="${FLUTTER_VERSION:-stable}"
  FLUTTER_DIR="/tmp/flutter"
  
  if [ ! -d "$FLUTTER_DIR" ]; then
    git clone --depth 1 --branch $FLUTTER_VERSION https://github.com/flutter/flutter.git $FLUTTER_DIR
  else
    cd $FLUTTER_DIR
    git fetch origin $FLUTTER_VERSION
    git checkout $FLUTTER_VERSION
    git pull
  fi
  
  export PATH="$PATH:$FLUTTER_DIR/bin"
  
  # Precache web dependencies
  flutter precache --web
fi

# Navigate to project directory
cd "$NETLIFY_BUILD_BASE" || cd /opt/build/repo || pwd

# Verify Flutter installation
echo "✅ Flutter version:"
flutter --version

# Get Flutter dependencies
echo "📚 Getting Flutter dependencies..."
flutter pub get

# Generate localization files
echo "🌐 Generating localization files..."
flutter gen-l10n || echo "⚠️ Localization generation skipped"

# Build Flutter web
echo "🔨 Building Flutter web app..."
flutter build web --release

echo "✅ Build completed successfully!"
ls -la build/web/
