#!/bin/bash

# Python Setup Script for macOS
# This script sets up Python 3.13 using pyenv and configures aliases

set -e  # Exit on any error

echo "🐍 Setting up Python 3.13 development environment..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    print_error "Homebrew is not installed. Please install Homebrew first."
    exit 1
fi

print_status "Homebrew found ✓"

# Install pyenv if not already installed
if ! command -v pyenv &> /dev/null; then
    print_status "Installing pyenv..."
    brew install pyenv
    print_success "pyenv installed successfully"
else
    print_status "pyenv already installed ✓"
fi

# Install Python 3.13 using pyenv
print_status "Installing Python 3.13 using pyenv..."
pyenv install 3.13.7 --skip-existing
print_success "Python 3.13.7 installed successfully"

# Set Python 3.13 as global default
print_status "Setting Python 3.13 as global default..."
pyenv global 3.13.7
print_success "Python 3.13.7 set as global default"

# Configure shell initialization
SHELL_CONFIG_FILE="$HOME/.zshrc"
PYENV_INIT='if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi'

# Check if pyenv init is already in .zshrc
if ! grep -q "pyenv init" "$SHELL_CONFIG_FILE" 2>/dev/null; then
    print_status "Adding pyenv initialization to $SHELL_CONFIG_FILE..."
    echo "" >> "$SHELL_CONFIG_FILE"
    echo "# Python environment management" >> "$SHELL_CONFIG_FILE"
    echo "$PYENV_INIT" >> "$SHELL_CONFIG_FILE"
    print_success "pyenv initialization added to $SHELL_CONFIG_FILE"
else
    print_status "pyenv initialization already configured ✓"
fi

# Add aliases for python and python3 commands
PYTHON_ALIASES='# Python aliases to use pyenv version
alias python="python3"
alias python3="$(pyenv which python3)"'

# Check if Python aliases are already in .zshrc
if ! grep -q "alias python=" "$SHELL_CONFIG_FILE" 2>/dev/null; then
    print_status "Adding Python aliases to $SHELL_CONFIG_FILE..."
    echo "" >> "$SHELL_CONFIG_FILE"
    echo "$PYTHON_ALIASES" >> "$SHELL_CONFIG_FILE"
    print_success "Python aliases added to $SHELL_CONFIG_FILE"
else
    print_status "Python aliases already configured ✓"
fi

# Reload shell configuration
print_status "Reloading shell configuration..."
eval "$(pyenv init -)"

# Upgrade pip and install essential packages
print_status "Upgrading pip and installing essential packages..."
python3 -m pip install --upgrade pip setuptools wheel virtualenv pipenv
print_success "Essential Python packages installed"

# Create a virtual environment for development
print_status "Creating development virtual environment..."
if [ ! -d "$HOME/python-dev" ]; then
    python3 -m venv "$HOME/python-dev"
    print_success "Virtual environment created at $HOME/python-dev"
else
    print_status "Virtual environment already exists ✓"
fi

# Verification
print_status "Verifying installation..."
echo ""
echo "Python version: $(python3 --version)"
echo "Pip version: $(python3 -m pip --version)"
echo "Python executable: $(which python3)"
echo ""

print_success "Python setup completed successfully! 🎉"
print_warning "Please restart your terminal or run 'source ~/.zshrc' to use the new configuration."
print_status "To activate the development environment, run: source ~/python-dev/bin/activate"
