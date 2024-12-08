#!/bin/zsh

# 競プロ支援ツール

# パス
export KYOPRO_DIR='/Users/komotokenta/Docker/kyopro'
export KYOPURO_LIBRARY_DIR='/Users/komotokenta/Docker/cp-library'

# バンドラ
export BUNDLER=$KYOPURO_LIBRARY_DIR/expander/target/release/expand

# エイリアス
alias compete=./compete.sh

alias bundle=$BUNDLER $KYOPURO_LIBRARY_DIR
alias bundler=$BUNDLER
