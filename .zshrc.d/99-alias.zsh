alias cdf="cd ~/.dotfiles"
alias ":q"=exit
alias reload="exec zsh"
alias la="ls -lah"
alias nf="neofetch"
alias cls=clear
alias cb="xsel --clipboard --input"
alias dc=docker-compose

if [[ -r /etc/arch-release ]]; then
  aur_helpers=(aurman aurutils pakku pikaur trizen yay paru bauerbill pkgbuilder aura repofish wrapaur aurget pacman)

  for helper in $aur_helpers; do
    if type $helper > /dev/null; then
      aur=$helper
      break
    fi
  done
  if [[ $aur = pacman ]]; then
    echo "Using pacman, as no AUR helper was found."
    aur="sudo $aur"
  fi

  alias u="${aur} -Syyu"
  alias i="${aur} -S"
  alias p="${aur} -R"
  alias s="${aur} -Ss"
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

