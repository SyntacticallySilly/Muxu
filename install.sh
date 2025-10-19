#!/bin/zsh
# Written by SyntacticallySilly, or Syn for short.
# This script installs specified packages using pkg and clones a dotfiles repository.

# --- Prechecks ---
termux-setup-storage && cd $HOME && bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# --- Configuration ---

# Packages to be installed.
packages=(
  "git" # Version control and other cool stuff.
  "neovim" # Default text editor/IDE.
  "zsh" # Preferred POSIX shell.
  "nnn" # A simple CLI file manager.
  "man" # Holy bible of ricers. aka 
  "oh-my-posh" # Prompt for shell.
  "atuin" # History navigator but can be more if configured properly.
  "zoxide" # A bettrr and smarter cd.
  "neofetch" # Fetches sys info.
  "fzf" # Fuzzily find anything. extremely powerful and extendable.
  "eza" # Sexier 'ls' with icons and colored text.
  "bat" # Better cat written in rust with git integration and syntax highlighting.
  "termux-tools" # Tools for termux, like termux-set-clipboard and others. some of them require the Termux:API plugin.
  "fd" # Better and faster 'find'
  "ripgrep" # Better and faster 'grep'
)

# Repositories.
dotfiles_repo="https://github.com/SyntacticallySilly/Muxu.git"

# --- Installation ---

# Update package lists
pkg update -y && pkg upgrade -y

# Install packages
echo "Installing packages..."
for package in "${packages[@]}"; do
  pkg install -y "$package"
done

echo "All packages installed."

# Setting up Neovim
# echo "Installing LazyVim.."
# git clone https://github.com/LazyVim/starter ~/.config/nvim

# Clone dotfiles repository
echo "Cloning setup"
git clone "$dotfiles_repo" "$HOME/"

echo "Config setup is finished."

echo "Installation complete!"
