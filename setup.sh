#!/bin/sh

echo "Creating symlinks ..."
ln -s .zprofile ~
source ~/.zprofile

echo "Installing zsh ..."
sudo apt update && sudo apt install zsh

echo "Installing neovim ..."
curl --create-dirs -L -o "$XDG_RUNTIME_DIR" "https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz"
tar -xzf "$XDG_RUNTIME_DIR/nvim-linux64.tar.gz"

rsync --remove-source-files -vrt "$XDG_RUNTIME_DIR/nvim-linux64/" /usr

echo "Installing nvm ..."
PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | NVM_DIR="$XDG_DATA_HOME/nvm" bash'
