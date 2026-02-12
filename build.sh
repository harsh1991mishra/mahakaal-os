#!/bin/bash

# Build script for Mahakaal OS
# Must be run as root on a Debian/Kali system

if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root" 
    exit 1
fi

# Install dependencies if missing
apt-get update
apt-get install -y live-build cdebootstrap

# Clean previous builds
lb clean

# Configure
lb config

# Build
echo "Starting build process for Mahakaal OS..."
lb build

echo "Build complete! Check the .iso file in this directory."
