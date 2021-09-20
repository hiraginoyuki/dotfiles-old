zinit cdclear -q
setopt promptsubst

zinit snippet OMZL::history.zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZL::clipboard.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::prompt_info_functions.zsh
zinit snippet OMZL::spectrum.zsh

zplugin load zsh-users/zsh-autosuggestions
zplugin load zsh-users/zsh-history-substring-search
zplugin load zdharma/history-search-multi-word
zplugin load zdharma/fast-syntax-highlighting

zinit snippet OMZP::git
zinit snippet OMZP::history

zinit snippet OMZT::af-magic.zsh-theme

bindkey "^R" history-search-multi-word

