#!/bin/zsh

# 競プロ支援ツール

# パス
export KYOPRO_DIR="$HOME/develop/algo/kyopro"
export KYOPRO_LIBRARY_DIR="$HOME/develop/algo/cp-library/cp-library-rs"

# エイリアス
alias compete=$HOME/.config/kyopro/compete.sh

alias bundle_local="~/.local/bin/bundler -l $KYOPRO_LIBRARY_DIR"
alias bundle="~/.local/bin/bundler --crate-name cp-library-rs"
