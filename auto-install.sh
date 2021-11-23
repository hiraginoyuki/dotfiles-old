#!/bin/bash
git clone https://github.com/HiraginoYuki/dotfiles ~/.dotfiles
cd ~/.dotfiles
./install.sh
echo "Type 'exec zsh' to reload your shell and have fun!"
echo "Note: 'source .zshrc' is deprecated. for more info, visit:"
echo "https://blog.mattclemente.com/2020/06/26/oh-my-zsh-slow-to-load.html"
