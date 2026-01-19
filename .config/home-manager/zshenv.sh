#!/bin/zsh

# homebrew
eval $(/opt/homebrew/bin/brew shellenv)
export PATH="/opt/homebrew/bin:$PATH"

. "$HOME/.cargo/env"

# mcfly
# eval "$(mcfly init zsh)"

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# コマンド履歴
export SAVEHIST=100000
export MCFLY_RESULTS=50
export MCFLY_FUZZY=1

# venv - find and activate
function activate() {
    local venv_dir=`find $PWD -name "activate" | sed -n 1p`
    . $venv_dir
}

# エイリアス
alias ls='eza --icons auto'
alias tree='eza -T -L 3 -a -I "node_modules|.git|.cache" --icons auto'
alias typora='/Applications/Typora.app/Contents/MacOS/Typora'

# diff
alias diff="diff -u --color"

# 競プロ支援ツール
source $HOME/.config/kyopro/util.sh

# Rust関係
export RUST_BACKTRACE=1
export RUST_LOG=info
export PATH=$HOME/.cargo/bin:$PATH

# バイナリにパスを通す
export PATH='/home/powell/.local/bin':$PATH
export PATH='/Users/komotokenta/.local/bin':$PATH

# GPG key
export GPG_TTY=$(tty)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# rye
source "$HOME/.rye/env"

# slide
alias sf=slide-flow
alias pg=password-generator

# haskell
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

# go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# ipe
alias ipe='/Applications/Ipe.app/Contents/MacOS/ipe'

# codon
export PATH=/Users/komotokenta/.codon/bin:$PATH

export PKG_CONFIG_PATH="/opt/homebrew/lib/pkgconfig"

# Googleドライブ
export MYDRIVE="$HOME/Google Drive/マイドライブ"
