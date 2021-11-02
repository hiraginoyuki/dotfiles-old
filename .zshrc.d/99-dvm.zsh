if [[ -d ~/.dvm ]]; then
  export DENO_INSTALL="/home/yuki/.deno"
  export PATH="$PATH:$DENO_INSTALL/bin"
  export DVM_DIR="/home/yuki/.dvm"
  export PATH="$PATH:$DVM_DIR/bin"
fi

