#!/bin/zsh

# 競プロ支援ツール

# パス
export KYOPRO_DIR=$HOME/Docker/kyopro
export KYOPURO_LIBRARY_DIR=$HOME/Docker/cp-library

# バンドラ
export BUNDLER=$KYOPURO_LIBRARY_DIR/expander/target/release/expand

# エイリアス
alias compete=$HOME/.config/kyopro/compete.sh

alias bundle=$BUNDLER $KYOPURO_LIBRARY_DIR
alias bundler=$BUNDLER
