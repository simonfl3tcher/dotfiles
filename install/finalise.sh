if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Symlinks"
  return
fi

