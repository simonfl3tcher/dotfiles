if ! is-macos -o ! is-executable brew; then
  echo "Skipped: neovim"
  return
fi

wget --quiet https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage --output-document nvim

chmod +x nvim
sudo mv nvim /usr/bin
mkdir -p ~/.config/nvim

rm -Rf ~/.config/nvim/init.vim # Remove if exists
ln -s ~/.vimrc ~/.config/nvim/init.vim
