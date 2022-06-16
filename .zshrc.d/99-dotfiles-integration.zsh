alias cdf="cd ~/.dotfiles"
alias dfu="zsh -c 'cd ~/.dotfiles && git stash -a && git switch master && git pull --ff-only && git switch - && git stash pop' && zinit update --quiet && exec zsh"
