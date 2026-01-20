#!/bin/bash
# ECE4076 Installation Script for Linux and macOS
# This script sets up your environment and installs all required packages

set -e  # Exit on error

echo "=========================================="
echo "ECE4076 Computer Vision Installation"
echo "=========================================="
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "ERROR: Python 3 is not installed."
    echo "Please install Python 3.8 or higher from https://www.python.org/"
    exit 1
fi

PYTHON_VERSION=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
echo "✓ Found Python $PYTHON_VERSION"
echo ""

# Create virtual environment
echo "Creating virtual environment..."
python3 -m venv ece4076_env
echo "✓ Virtual environment created"
echo ""

# Activate virtual environment
echo "Activating virtual environment..."
source ece4076_env/bin/activate
echo "✓ Virtual environment activated"
echo ""

# Upgrade pip
echo "Upgrading pip..."
pip install --upgrade pip setuptools wheel
echo "✓ pip upgraded"
echo ""

# Install requirements
echo "Installing packages (this may take a few minutes)..."
pip install -r requirements.txt
echo "✓ Packages installed"
echo ""

# Install Jupyter kernel
echo "Installing Jupyter kernel..."
python -m ipykernel install --user --name ece4076 --display-name "ECE4076"
echo "✓ Jupyter kernel installed"
echo ""

echo "=========================================="
echo "Installation complete!"
echo "=========================================="
echo ""
echo "To use this environment, activate it with:"
echo "  source ece4076_env/bin/activate"
echo ""
echo "To start Jupyter notebooks, run:"
echo "  jupyter notebook"
echo ""
echo "Select the 'ECE4076' kernel when prompted."
echo ""
