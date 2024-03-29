# starshipの導入
eval "$(starship init zsh)"

# zshの補完
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# venv - find and activate
function activate() {
    local venv_dir=`find $PWD -name "activate" | sed -n 1p`
    . $venv_dir
}

# エイリアス
# exa
if [[ $(command -v exa) ]]; then
    alias ls='exa'  #'exa --icons'
    alias tree='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
fi

# bat
if [[ $(command -v bat) ]]; then
    batdiff() {
        if [[ $# -gt 1  ]]; then
            git diff $@ | bat
        else
            git diff HEAD . | bat
        fi
    }
fi

# diff
alias diff="diff -u --color"

# コマンドのエイリアス
alias typora="open -a typora"
alias zed="open -a zed"

# PATH
export PATH="/opt/homebrew/opt/python@3.10/bin:$PATH"

# 競プロ支援ツール
# rust-analyzerを有効化
alias run='/Users/komotokenta/Docker/kyopro/utils/builder/target/debug/builder'
export KYOPURO_LIBRARY_DIR='/Users/komotokenta/Docker/cp-library/'
alias compete='/Users/komotokenta/Docker/kyopro/utils/compete.sh'
alias snippet='/Users/komotokenta/Docker/kyopro/utils/snippet.sh'

function linkrs() {
    local tmp=`pwd`
    cd /Users/komotokenta/Docker/kyopro/utils/link_files
    cargo run --release -- '/Users/komotokenta/Docker/kyopro/AlgoMethod' 2> /dev/null
    cargo run --release -- '/Users/komotokenta/Docker/kyopro/AOJ' 2> /dev/null
    cargo run --release -- '/Users/komotokenta/Docker/kyopro/LibraryChecker' 2> /dev/null
}

# . $HOME/.ghcup/env
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

source /Users/komotokenta/Docker/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# line notify
alias notify='~/Docker/line_notify/notify.sh'

# dotfilesの環境変数
export DOTDIR=~/Docker/dotfiles

# texのドキュメント
export TEXDOCS=~/Docker/latex_documents/Documents

# 授業
export CLASSES=~/OneDrive\ -\ 国立大学法人東海国立大学機構/Classes

# Rustのデバッグ
export RUST_BACKTRACE=1


export PATH="/usr/local/opt/git/bin:$PATH"

# zコマンド
. ~/Docker/z/z.sh

# helix
export PATH="/Users/komotokenta/.rustup/toolchains/stable-aarch64-apple-darwin/bin:$PATH"

export PATH="/Users/komotokenta/.detaspace/bin:$PATH"


# bun completions
[ -s "/Users/komotokenta/.bun/_bun" ] && source "/Users/komotokenta/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# npmのバイナリ
export PATH=$PATH:`npm prefix --location=global`/bin

