#!/bin/bash
apt update && apt upgrade -y
apt install python3 python3-pip jupyter python3-venv uvicorn -y

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install 22

FOLDER="venv"

if [ ! -d "$FOLDER" ]; then
  echo "Folder '$FOLDER' does not exist. Running the command..."
  # Run the command if the folder does not exist
  python3 -m venv venv
else
  echo "Folder '$FOLDER' already exists."
fi

INSTALL_LOC="/usr/local/bin/ollama"
if [ ! -e "$INSTALL_LOC" ]; then
  echo "File '$INSTALL_LOC' does not exist. Running the command..."
  # Run the command if the file does not exist
  curl -fsSL https://ollama.com/install.sh | sh
else
  echo "File '$INSTALL_LOC' already exists."
fi

sleep 1
ollama pull llama2
# ollama pull llama3:70b
