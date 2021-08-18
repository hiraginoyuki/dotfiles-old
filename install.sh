DOTPATH=~/.dotfiles

entries="\
	.zshrc \
	.zshrc.d \
	.config/nvim \
  .gitconfig \
"

for f in $entries; do
  if echo $f | grep -q '/'; then
    mkdir -p $(echo $f | sed -r 's/\/[^\/]+$//')
  fi
	ln -snfv "$DOTPATH/$f" "$HOME"/"$f"
done

