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
    alias ls='exa --icons'
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
export KYOPURO_ROOT_DIR='/Users/komotokenta/Docker/kyopro/'
export KYOPURO_LIB_PATH='/Users/komotokenta/Docker/kyopro/lib.rs'
alias linkrs='/Users/komotokenta/Docker/kyopro/link_files/target/release/link_files'
alias run='/Users/komotokenta/Docker/kyopro/builder/target/debug/builder'

function mkfile() {
    local out=$(python3 ~/Docker/kyopro/Organizer/make_file.py $@) \
    && echo $out \
    && linkrs \
    && echo $out | rg '>' | awk '{print $2}' | pbcopy
}

function rbuild() {
    build_dir="/Users/komotokenta/Docker/kyopro/builder/"
    cp $1 "$build_dir/src/main.rs" \
    && cd $build_dir \
    && cargo build \
    && cd "$build_dir/.." \
    || cd "$build_dir/.."        
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

