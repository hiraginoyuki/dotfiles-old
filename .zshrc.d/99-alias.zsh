alias cdf="cd ~/.dotfiles"
alias ":q"=exit
alias reload="exec zsh"
alias la="ls -lah"
alias nf="neofetch"
alias cls=clear
alias cb="xsel --clipboard --input"

if [[ -r /etc/arch-release ]]; then
  pacmans=(paru yay aurman pacman)
  pacman=$(
    for p in $pacmans; do
      if type $p > /dev/null; then
        echo $p; break;
      fi
    done
  )

	alias u="$pacman -Syyu"
	alias i="$pacman -S"
	alias p="$pacman -R"
	alias s="$pacman"
elif [[ -r /etc/os-release ]] && grep -q Ubuntu < /etc/os-release; then
	alias u="sudo apt update && sudo apt upgrade -y"
	alias i="sudo apt install -y"
	alias p="sudo apt purge --autoremove -y"
	alias s="sudo apt search"
fi


alias t="tmux"
alias ta="tmux attach"
alias tk="tmux kill-server"
alias tl="tmux ls"

alias vz="vim ~/.zshrc"
alias ve="vim ~/.zshrc.d/00-env.zsh"
alias va="vim ~/.zshrc.d/99-alias.zsh"
alias vb="vim ~/.zshrc.d/99-bind.zsh"

alias svim="sudoedit"
alias vx="vim ~/.vnc/xstartup"
alias vX="vim ~/.Xresources"
alias vzd="vim ~/.zshrc.d/"
alias vn="vim ~/.config/nvim/init.vim"
alias vp="vim ~/.config/nvim/init.d/plugins.vim"
alias vt="vim ~/.tmux.conf"
alias vs="sudo vim /etc/apt/sources.list"
alias vsd="sudo vim /etc/apt/sources.list.d"

