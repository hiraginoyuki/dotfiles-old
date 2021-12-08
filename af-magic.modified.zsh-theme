# af-magic.modified.zsh-theme
# original repo: https://github.com/andyfleming/oh-my-zsh


# settings
typeset +H return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
typeset +H gray="FG[237]"
typeset +H blue="$FG[032]"
typeset +H purple="$FG[105]"
typeset +H orange="$FG[214]"

# primary prompt
PS1='$FG[237]╭╴ $FG[032]%~%{$reset_color%}
$FG[237]╰╴%{$reset_color%}$(git_prompt_info) $FG[105]%(!.#.»)%{$reset_color%} '
PS2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

# right prompt
RPS1+=' $gray%n@%m%{$reset_color%}%'

# git settings
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_PREFIX=" $FG[075]($FG[078]"
ZSH_THEME_GIT_PROMPT_DIRTY="$orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"

