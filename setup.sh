#!/bin/bash

# Install necessary dependencies
echo "Installing dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

# Install system dependencies for OpenCV and picamera2
echo "Installing system dependencies..."
apt-get update
apt-get install -y libopencv-dev libcamera-dev

echo "Setup complete!"
