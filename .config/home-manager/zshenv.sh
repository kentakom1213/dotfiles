#!/bin/zsh

# Homebrew
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export PATH="/opt/homebrew/bin:$PATH"
fi

# Rust
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
export RUST_BACKTRACE=1
export RUST_LOG=info
export PATH="$HOME/.cargo/bin:$PATH"

# User bins
export PATH="$HOME/.local/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"

# Go
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Codon
export PATH="$HOME/.codon/bin:$PATH"

# pkg-config
export PKG_CONFIG_PATH="/opt/homebrew/lib/pkgconfig"

# Google Drive
export MYDRIVE="$HOME/Google Drive/マイドライブ"

alias sf=slide-flow
alias pg=password-generator
