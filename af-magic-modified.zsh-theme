# https://ohmyz.sh

is_chroot=false
diff /proc/1/mountinfo /proc/self/mountinfo &>/dev/null
[ $? = 1 ] && is_chroot=true

# https://unix.stackexchange.com/a/9607/37523
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  SESSION_TYPE=remote/ssh
else
  case $(ps -o comm= -p $PPID) in
    sshd|*/sshd) SESSION_TYPE=remote/ssh;;
  esac
fi

PS1='$FG[008]╭╴ $([ "$SESSION_TYPE" = remote/ssh ] && echo "(ssh) ")$($is_chroot&&echo "(chroot) ")%(!.$FG[009]$FX[blink].$FG[012])%n$FX[reset]$FG[008] @ $FG[012]%M$FG[008] in $FG[012]%~$FX[reset]
$FG[008]╰╴$FX[reset]$(git_prompt_info) %(?.$FG[001].$FG[004])❥$FX[reset] '
PS2='%{$fg[red]%}\ %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_PREFIX=" $FG[012]($FG[010]"
ZSH_THEME_GIT_PROMPT_DIRTY="$FG[011]*$FX[reset]"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[012])$FX[reset]"

