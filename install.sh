DOTPATH=~/.dotfiles

entries="\
	.zshrc \
	.zshrc.d \
	.config/nvim \
"

for f in $entries
do
	ln -snfv "$DOTPATH/$f" "$HOME"/"$f"
done

