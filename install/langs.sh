if ! is-macos -o ! is-executable brew; then
  echo "Skipped: gem"
  return
fi

git clone https://github.com/asdf-vm/asdf.git ~/.asdf

echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc

asdf install ruby 2.5.0
asdf global ruby 2.5.0

asdf install nodejs 9.10.1
asdf global nodejs 2.5.0

gem install lunchy
gem install rails

packages=(
  npm
)

npm install -g "${packages[@]}"
