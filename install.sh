#!/bin/bash

# Diretório do repositório
DOTFILES_DIR="$HOME/dotfiles"

# Função para criar symlink
link_file() {
    local src=$1
    local dst=$2
    
    # Backup se já existir
    if [ -f "$dst" ]; then
        mv "$dst" "$dst.backup"
    fi
    
    ln -s "$src" "$dst"
    echo "Linked $src -> $dst"
}

# Criar symlinks
link_file "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
link_file "$DOTFILES_DIR/bash/.bashrc" "$HOME/.bashrc"

echo "Dotfiles installed!"