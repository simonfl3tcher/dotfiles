# Path to your oh-my-zsh installation.
export USER='mrsimonfletcher'
export ZSH="/Users/$USER/.oh-my-zsh"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
# export MANPATH="/usr/local/man:$MANPATH"

export PATH="./.bundle/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Default editor settings
export EDITOR=/usr/local/bin/nvim
export VISUAL=/usr/local/bin/nvim
export KEYTIMEOUT=1

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"
ssh-add ~/.ssh/id_rsa &>/dev/null

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Aliases

# Config
alias zshconfig="v ~/.zshrc"
alias ohmyzsh="v ~/.oh-my-zsh"

# List PSQL processes
alias listpsql="lsof -i tcp:5432"
alias listforeman="lsof -i tcp:5000"
alias killpsqlconnections="sh ~/killpsql.sh"

# GO
alias godocs="godoc --http=:6060 -d"

# NeoVim Alias
alias v='nvim'

# Git
alias cleanupds="find . -type f -name '*.DS_Store' -ls -delete"

# Rails
alias migrate="rake db:migrate db:rollback && rake db:migrate db:test:prepare"
alias s="rspec"

# better bundle alias
alias b='bundle install --binstubs .bundle/bin --path .bundle/gems'

# Wipe rails DB
alias pdb="bundle exec rake db:drop db:create db:migrate db:seed RAILS_ENV=development"

# Rainy Mood
rainymood() {
  FILE=$((RANDOM%4))
  URL="https://rainymood.com/audio1110/${FILE}.ogg"
  mpv "$URL" && rainymood
}

# use vim bindings
bindkey -v
# reeable Ctrl-R for history (unbound with vim bindings)
bindkey '^R' history-incremental-search-backward

# Added by the Heroku Toolbelt
export GOPATH=$HOME/go
export PATH="/usr/local/heroku/bin:$PATH"
export PATH=$GOPATH/bin:$PATH
export PATH="/usr/local/python/bin:$PATH"

# ASDF
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# ZSH Completions
fpath=(/usr/local/share/zsh-completions $fpath)
