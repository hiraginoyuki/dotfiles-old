repo=https://github.com/zdharma-continuum/zinit.git
if [[ ! -a ~/.zinit     ]]; then mkdir -p ~/.zinit; fi
if [[ ! -a ~/.zinit/bin ]]; then git clone $repo ~/.zinit/bin; fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
autoload -Uz compinit && compinit
(( ${+_comps} )) && _comps[zplugin]=_zplugin


zinit cdclear -q
setopt promptsubst


alias _lazy='zinit ice wait silent'

       zinit snippet OMZL::history.zsh
       zinit snippet OMZL::git.zsh
_lazy; zinit snippet OMZL::clipboard.zsh
       zinit snippet OMZL::key-bindings.zsh
       zinit snippet OMZL::prompt_info_functions.zsh
       zinit snippet OMZL::spectrum.zsh

_lazy; zinit load zsh-users/zsh-autosuggestions
_lazy; zinit load zsh-users/zsh-history-substring-search
_lazy; zinit load zdharma-continuum/history-search-multi-word
       zinit load zdharma-continuum/fast-syntax-highlighting

       zinit snippet OMZP::git
       zinit snippet OMZP::history
       zinit snippet ~/.dotfiles/af-magic-modified.zsh-theme

unalias _lazy

bindkey "^R" history-search-multi-word

