OLD_PWD="$PWD"
auto_cdls() {
  if [ "$OLD_PWD" != "$PWD" ]; then
    ls
    OLD_PWD="$PWD"
  fi
}

precmd() {
  auto_cdls
}

