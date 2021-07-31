echo
echo "\e[35m\e[1mLoading ~/.zshrc.d ...\e[0m\e[90m"
for config in $HOME/.zshrc.d/*.zsh; do
        echo "- $config"
        source $config
done
echo "\e[35m\e[1mDone.\e[0m"
echo

