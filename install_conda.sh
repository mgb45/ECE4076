#!/bin/bash
# ECE4076 Installation Script (Conda Version - Simplest Fix)
# - Creates conda env (Python 3.11)
# - Installs everything inside it
# - No system kernel registration
# - Avoids /usr/local permission errors

set -euo pipefail

ENV_NAME="ece4076"
PYTHON_VERSION="3.11"

echo "=========================================="
echo "ECE4076 Computer Vision Installation"
echo "Using Conda Environment"
echo "=========================================="
echo ""

if ! command -v conda &> /dev/null; then
  echo "ERROR: Conda not found."
  echo "Please install Miniconda or Anaconda first."
  exit 1
fi

echo "✓ Conda detected"
echo ""

# Initialize conda in this shell
eval "$(conda shell.bash hook)"

# Remove existing environment (clean install)
if conda env list | awk '{print $1}' | grep -qx "${ENV_NAME}"; then
  echo "Removing existing environment ${ENV_NAME}..."
  conda env remove -n "${ENV_NAME}" -y
fi

echo "Creating conda environment (${ENV_NAME}) with Python ${PYTHON_VERSION}..."
conda create -n "${ENV_NAME}" -y python="${PYTHON_VERSION}" pip
echo "✓ Environment created"
echo ""

echo "Activating environment..."
conda activate "${ENV_NAME}"
echo "✓ Environment activated"
echo ""

# Pin setuptools for legacy repo compatibility (pkg_resources)
echo "Installing compatible build tools..."
conda install -y "setuptools<82" wheel
python -m pip install --upgrade pip build pyproject_hooks
echo "✓ Build tools installed"
echo ""

echo "Installing packages from requirements.txt..."
python -m pip install --no-build-isolation --upgrade-strategy only-if-needed -r requirements.txt
echo "Installing ipykernel separately..."
python -m pip install ipykernel
echo "✓ Packages installed"
echo ""

echo "=========================================="
echo "Installation complete!"
echo "=========================================="
echo ""
echo "To use this environment:"
echo "  conda activate ${ENV_NAME}"
echo "  jupyter notebook"
echo ""
echo "IMPORTANT: Always activate the environment before starting Jupyter."
echo ""
