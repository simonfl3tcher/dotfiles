if ! is-macos -o ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
  echo "Skipped: Homebrew (missing: ruby, curl and/or git)"
  return
fi

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap Goles/battery
brew update
brew upgrade

# Install packages

apps=(
  ctags
  git-extras
  gnupg
  gnupg2
  httpie
  hub
  imagemagick
  mpv
  python
  postgresql@14
  redis
  the_silver_searcher
  tmux
  vim
  watchman
  wget
  wifi-password
  yarn
  zsh
  zsh-completions
)

brew install "${apps[@]}"

export DOTFILES_BREW_PREFIX_COREUTILS=`brew --prefix coreutils`
set-config "DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_BREW_PREFIX_COREUTILS" "$DOTFILES_CACHE"
