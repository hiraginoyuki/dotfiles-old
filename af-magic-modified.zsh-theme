# https://ohmyz.sh

local is_chroot=false
diff /proc/{1,self}/mountinfo &>/dev/null
[[ $? == 1 ]] && is_chroot=true

PS1='$FG[008]╭╴ $($is_chroot&&echo "(chroot) ")%(!.$FG[009]$FX[blink].$FG[012])%n$FX[reset]$FG[008] @ $FG[012]%M$FG[008] in $FG[012]%~$FX[reset]
$FG[008]╰╴$FX[reset]$(git_prompt_info) %(?.$FG[001].$FG[004])❥$FX[reset] '
PS2='%{$fg[red]%}\ %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_PREFIX=" $FG[012]($FG[010]"
ZSH_THEME_GIT_PROMPT_DIRTY="$FG[011]*$FX[reset]"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[012])$FX[reset]"

