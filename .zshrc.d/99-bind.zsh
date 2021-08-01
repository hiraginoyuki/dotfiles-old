source "$HOME/.zkbd/xterm-256color-:0"
unsetopt MULTIBYTE

bindkey  ${key[Home]}   beginning-of-line
bindkey  ${key[End]}    end-of-line
bindkey  ${key[Delete]} delete-char

