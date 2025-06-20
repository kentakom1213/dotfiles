#!/bin/zsh

# 競プロ支援ツール

# パス
export KYOPRO_DIR=$HOME/develop/algo/kyopro
export KYOPURO_LIBRARY_DIR=$HOME/develop/algo/cp-library/cp-library-rs

# バンドラ
export BUNDLER='/Users/komotokenta/develop/algo/cp-library/expander/target/release/expand'

# エイリアス
alias compete=$HOME/.config/kyopro/compete.sh

alias bundle="$BUNDLER $KYOPURO_LIBRARY_DIR"
alias bundler=$BUNDLER
