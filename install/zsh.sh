if ! is-macos -o ! is-executable brew; then
  echo "Skipped: ZSH"
  return
fi

curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

chsh -s /usr/local/bin/zsh
