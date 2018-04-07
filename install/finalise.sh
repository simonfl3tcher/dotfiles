if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Symlinks"
  return
fi

# On load run redis + postgres
mkdir -p ~/Library/LaunchAgents
ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents

launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist

# Create local postgres
createdb

