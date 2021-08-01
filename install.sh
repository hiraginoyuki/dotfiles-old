DOTPATH=~/.dotfiles

for f in .??*
do
	[ "$f" = ".git"       ] && continue
	[ "$f" = ".gitignore" ] && continue

	ln -snfv "$DOTPATH/$f" "$HOME"/"$f"
done

