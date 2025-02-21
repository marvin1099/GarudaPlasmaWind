#!/bin/bash

REPO_URL_PRIMARY="https://codeberg.org/marvin1099/GarudaPlasmaWind.git"
REPO_URL_BACKUP="https://github.com/marvin1099/GarudaPlasmaWind.git"
REPO_DIR="GarudaPlasmaWind"
USER_DIR="user"

noterm=0

# Check if stdout is a terminal, otherwise mark as no terminal
if [ ! -t 1 ]; then
    if command -v konsole &>/dev/null; then
        konsole -e "$0"
        exit 0
    elif command -v gnome-terminal &>/dev/null; then
        gnome-terminal -- bash -c "$0"
        exit 0
    elif command -v xterm &>/dev/null; then
        xterm -e "$0"
        exit 0
    elif command -v x-terminal-emulator &>/dev/null; then
        x-terminal-emulator -e "$0"
        exit 0
    else
        echo "No suitable terminal found. Continuing without opening a terminal."
        noterm=1
    fi
fi

# Check if inside a git repo and if the user directory exists
if git rev-parse --is-inside-work-tree &>/dev/null && [ -d "$USER_DIR" ]; then
    echo "Inside a Git repository. Copying user files..."
elif [ -d "$REPO_DIR/$USER_DIR" ]; then
    echo "User directory found inside $REPO_DIR. Using it..."
    USER_DIR="$REPO_DIR/$USER_DIR"
else
    echo "Not inside a Git repository. Cloning the repo..."
    if ! git clone "$REPO_URL_PRIMARY" "$REPO_DIR"; then
        echo "Primary repo failed. Trying backup..."
        git clone "$REPO_URL_BACKUP" "$REPO_DIR" || { echo "Failed to clone repository."; exit 1; }
    fi
    USER_DIR="$REPO_DIR/user"
fi

# Ensure the user directory exists before copying
if [ -d "$USER_DIR" ]; then
    echo "Copying files from $USER_DIR to $HOME..."
    if ! cp -rT "$USER_DIR" "$HOME" 2>/dev/null; then
        if [ "$noterm" -eq 0 ]; then
            echo "Permission denied. Trying with sudo..."
            sudo cp -rT "$USER_DIR" "$HOME" || { echo "Failed to copy files even with sudo."; exit 1; }
        else
            echo "Permission denied, but cannot prompt for sudo due to no terminal."
            exit 1
        fi
    fi
else
    echo "Error: User directory does not exist in the repository."
    exit 1
fi

echo "Done."
sleep 5
