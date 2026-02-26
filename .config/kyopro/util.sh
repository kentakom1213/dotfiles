#!/bin/zsh

# 競プロ支援ツール

# パス
export KYOPRO_DIR=$HOME/develop/algo/kyopro
local KYOPRO_UTIL_DIR=$HOME/develop/algo/cp-library
export KYOPRO_LIBRARY_DIR=$KYOPRO_UTIL_DIR/cp-library-rs

# エイリアス
alias compete=$HOME/.config/kyopro/compete.sh

alias bundle='bundler --crate-name cp-library-rs'
alias bundle_local="bundler --library $KYOPRO_LIBRARY_DIR"
