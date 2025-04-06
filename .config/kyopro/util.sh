#!/bin/zsh

# 競プロ支援ツール

# パス
export KYOPRO_DIR=$HOME/develop/algo/kyopro
local KYOPRO_UTIL_DIR=$HOME/develop/algo/cp-library
export KYOPURO_LIBRARY_DIR=$KYOPRO_UTIL_DIR/cp-library-rs

# バンドラ
export BUNDLER=$KYOPRO_UTIL_DIR/expander/target/release/expand

# エイリアス
alias compete=$HOME/.config/kyopro/compete.sh

alias bundle="$BUNDLER $KYOPURO_LIBRARY_DIR"
alias bundler=$BUNDLER
