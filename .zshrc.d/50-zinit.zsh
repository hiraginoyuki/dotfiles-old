repo=https://github.com/zdharma-continuum/zinit.git
if [[ ! -a ~/.zinit     ]]; then mkdir ~/.zinit; fi
if [[ ! -a ~/.zinit/bin ]]; then git clone $repo ~/.zinit/bin; fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
autoload -Uz compinit && compinit
(( ${+_comps} )) && _comps[zplugin]=_zplugin

