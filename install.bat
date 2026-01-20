@echo off
REM ECE4076 Installation Script for Windows
REM This script sets up your environment and installs all required packages

echo.
echo ==========================================
echo ECE4076 Computer Vision Installation
echo ==========================================
echo.

REM Check if Python is installed
where python >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Python is not installed or not in PATH.
    echo Please install Python 3.8 or higher from https://www.python.org/
    echo Make sure to check "Add Python to PATH" during installation.
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('python --version') do set PYTHON_VERSION=%%i
echo %PYTHON_VERSION%
echo.

REM Create virtual environment
echo Creating virtual environment...
python -m venv ece4076_env
echo Virtual environment created
echo.

REM Activate virtual environment
echo Activating virtual environment...
call ece4076_env\Scripts\activate.bat
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to activate virtual environment
    pause
    exit /b 1
)
echo Virtual environment activated
echo.

REM Upgrade pip
echo Upgrading pip...
python -m pip install --upgrade pip setuptools wheel
echo pip upgraded
echo.

REM Install requirements
echo Installing packages (this may take a few minutes)...
pip install -r requirements.txt
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to install packages
    pause
    exit /b 1
)
echo Packages installed
echo.

REM Install Jupyter kernel
echo Installing Jupyter kernel...
python -m ipykernel install --user --name ece4076 --display-name "ECE4076"
echo Jupyter kernel installed
echo.

echo ==========================================
echo Installation complete!
echo ==========================================
echo.
echo To use this environment in the future, activate it with:
echo   ece4076_env\Scripts\activate.bat
echo.
echo To start Jupyter notebooks, run:
echo   jupyter notebook
echo.
echo Select the 'ECE4076' kernel when prompted.
echo.
pause
