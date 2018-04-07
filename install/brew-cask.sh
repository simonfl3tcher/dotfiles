if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Homebrew-Cask"
  return
fi

brew tap caskroom/versions
brew tap caskroom/cask
brew tap caskroom/fonts

# Install packages

apps=(
  1password
  adobe-acrobat-reader
  caffeine
  dropbox
  flux
  github
  graphiql
  google-chrome
  iterm2
  ngrok
  postman
  sketch
  slack
  spotify
  whatsapp
  zoomus
)

brew cask --force install "${apps[@]}"
