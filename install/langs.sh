if ! is-macos -o ! is-executable brew; then
  echo "Skipped: langs"
  return
fi

if [ ! -d "$HOME/.asdf" ]; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.3.0
fi

install_asdf_plugin() {
  local name="$1"
  local url="$2"

  if ! asdf plugin-list | grep -Fq "$name"; then
    asdf plugin-add "$name" "$url"
  fi
}

source "$HOME/.asdf/asdf.sh"
install_asdf_plugin "ruby" "https://github.com/asdf-vm/asdf-ruby.git"
install_asdf_plugin "nodejs" "https://github.com/asdf-vm/asdf-nodejs.git"

install_asdf_language() {
  local language="$1"
  local version
  version="$(asdf list-all "$language" | tail -1)"

  if ! asdf list "$language" | grep -Fq "$version"; then
    asdf install "$language" "$version"
    asdf global "$language" "$version"
  fi
}

fancy_echo "Installing latest Ruby..."

install_asdf_language "ruby"

gem update --system
gem_install_or_update "tmuxinator"
gem_install_or_update "bundler"
gem_install_or_update "launchy"
gem_install_or_update "rails"


fancy_echo "Installing latest Node..."
bash "$HOME/.asdf/plugins/nodejs/bin/import-release-team-keyring"
install_asdf_language "nodejs"
