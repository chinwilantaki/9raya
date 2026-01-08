#!/bin/bash
set -e

echo "🚀 Starting Flutter web build on Netlify..."
echo "📁 Current directory: $(pwd)"
echo "📁 NETLIFY_BUILD_BASE: ${NETLIFY_BUILD_BASE:-not set}"

# Install Flutter if not already installed
if ! command -v flutter &> /dev/null; then
  echo "📦 Installing Flutter SDK..."
  
  # Use git to clone Flutter (more reliable than downloading archives)
  FLUTTER_VERSION="${FLUTTER_VERSION:-stable}"
  FLUTTER_DIR="/tmp/flutter"
  
  if [ ! -d "$FLUTTER_DIR" ]; then
    echo "📥 Cloning Flutter from GitHub..."
    # Try to clone Flutter
    if command -v git &> /dev/null; then
      git clone --depth 1 --branch $FLUTTER_VERSION https://github.com/flutter/flutter.git $FLUTTER_DIR 2>&1 || {
        echo "⚠️ Failed to clone with branch $FLUTTER_VERSION, trying master..."
        git clone --depth 1 https://github.com/flutter/flutter.git $FLUTTER_DIR 2>&1 || {
          echo "❌ Git clone failed. Trying wget method..."
          # Fallback: Download Flutter SDK archive
          FLUTTER_VERSION_NUM="${FLUTTER_VERSION:-3.24.0}"
          cd /tmp
          wget -q "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION_NUM}-stable.tar.xz" -O flutter.tar.xz || {
            echo "❌ Failed to download Flutter SDK"
            exit 1
          }
          tar xf flutter.tar.xz
          rm flutter.tar.xz
        }
      }
    else
      echo "❌ Git not available. Installing via wget..."
      FLUTTER_VERSION_NUM="${FLUTTER_VERSION:-3.24.0}"
      cd /tmp
      wget -q "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION_NUM}-stable.tar.xz" -O flutter.tar.xz || {
        echo "❌ Failed to download Flutter SDK"
        exit 1
      }
      tar xf flutter.tar.xz
      rm flutter.tar.xz
    fi
  else
    echo "🔄 Updating existing Flutter installation..."
    cd $FLUTTER_DIR
    if command -v git &> /dev/null; then
      git fetch origin $FLUTTER_VERSION 2>&1 || git fetch origin master 2>&1 || true
      git checkout $FLUTTER_VERSION 2>&1 || git checkout master 2>&1 || true
      git pull 2>&1 || true
    fi
  fi
  
  export PATH="$PATH:$FLUTTER_DIR/bin"
  
  # Verify Flutter is accessible
  if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter not found in PATH after installation"
    echo "PATH: $PATH"
    exit 1
  fi
  
  echo "✅ Flutter installed successfully"
  
  # Precache web dependencies
  echo "📦 Precaching Flutter web dependencies..."
  flutter precache --web || echo "⚠️ Precaching failed, continuing..."
fi

# Navigate to project directory
PROJECT_DIR="${NETLIFY_BUILD_BASE:-/opt/build/repo}"
echo "📂 Navigating to project directory: $PROJECT_DIR"
cd "$PROJECT_DIR" || {
  echo "❌ Failed to navigate to project directory"
  echo "Current directory: $(pwd)"
  exit 1
}

# Verify Flutter installation
echo "✅ Flutter version:"
flutter --version || {
  echo "❌ Flutter command failed"
  exit 1
}

# Get Flutter dependencies
echo "📚 Getting Flutter dependencies..."
flutter pub get || {
  echo "❌ Failed to get Flutter dependencies"
  exit 1
}

# Generate localization files
echo "🌐 Generating localization files..."
flutter gen-l10n || {
  echo "⚠️ Localization generation failed, but continuing..."
}

# Build Flutter web
echo "🔨 Building Flutter web app..."
flutter build web --release || {
  echo "❌ Flutter build failed"
  echo "Checking for build errors..."
  flutter doctor -v
  exit 1
}

echo "✅ Build completed successfully!"
echo "📦 Build output:"
ls -la build/web/ || {
  echo "❌ Build output directory not found"
  exit 1
}
