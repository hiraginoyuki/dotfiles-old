zinit cdclear -q
setopt promptsubst

alias lazy='zinit ice wait silent'

zinit snippet OMZL::history.zsh
zinit snippet OMZL::git.zsh
lazy; zinit snippet OMZL::clipboard.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::prompt_info_functions.zsh
zinit snippet OMZL::spectrum.zsh

lazy; zinit load zsh-users/zsh-autosuggestions
lazy; zinit load zsh-users/zsh-history-substring-search
lazy; zinit load zdharma-continuum/history-search-multi-word
zinit load zdharma-continuum/fast-syntax-highlighting

zinit snippet OMZP::git
zinit snippet OMZP::history
zinit snippet ~/.dotfiles/af-magic.modified.zsh-theme

bindkey "^R" history-search-multi-word

