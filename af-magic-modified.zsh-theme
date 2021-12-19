# https://ohmyz.sh

PS1='$FG[008]╭╴ $FG[004]%n$FG[008] @ $FG[004]%m$FG[008] in $FG[011]%~$FX[reset]
$FG[008]╰╴$FX[reset]$(git_prompt_info) %(?.$FG[001].$FG[004])%(!.#.❥)$FX[reset] '
PS2='%{$fg[red]%}\ %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_PREFIX=" $FG[012]($FG[010]"
ZSH_THEME_GIT_PROMPT_DIRTY="$FG[011]*$FX[reset]"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[012])$FX[reset]"

