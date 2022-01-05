[[ -f ~/.dotfiles.verbose ]]
verbose=$?

[[ verbose =  1 ]] && echo "\e[35;1mLoading ~/.zshrc.d ...\e[0m"
for config in $HOME/.zshrc.d/*.zsh; do
        [[ verbose =  1 ]] && echo "\e[90m- $config\e[0m"
        source $config
done
[[ verbose =  1 ]] && echo "\e[35;1mDone.\e[0m"

true

