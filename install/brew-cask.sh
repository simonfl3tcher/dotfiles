if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Homebrew-Cask"
  return
fi

brew tap homebrew/cask-versions
brew tap homebrew/cask
brew tap homebrew/cask-fonts

# Install packages

apps=(
  caffeine
  dropbox
  iterm2
  ngrok
  postman
  figma
  slack
  spotify
  rectangle
  whatsapp
  zoom
  visual-studio-code
  raycast
  notion
  kap
)

brew install --cask  "${apps[@]}"
