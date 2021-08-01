if [[ ! -a ~/.zinit     ]]; then mkdir ~/.zinit; fi
if [[ ! -a ~/.zinit/bin ]]; then git clone https://github.com/zdharma/zinit.git ~/.zinit/bin; fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
autoload -Uz compinit && compinit
(( ${+_comps} )) && _comps[zplugin]=_zplugin

