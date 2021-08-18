DOTPATH=~/.dotfiles

entries="\
	.zshrc \
	.zshrc.d \
	.config/nvim \
	.gitconfig \
"

for f in $entries; do
	parent_dir=$(dirname $HOME/$f)
	if [[ ! -e $parent_dir ]]; then
		mkdir -p $parent_dir
	fi
	ln -snfv "$DOTPATH/$f" "$HOME"/"$f"
done

