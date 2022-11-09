# starshipの導入
eval "$(starship init zsh)"

# Rustのコンパイル (競プロ用)
function rbuild() {
    local full=$(readlink -f $1)
    local out_path=$full:r
    rustc \
        -o $out_path \
        $full
}

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

alias typora="open -a typora"

# PATH
export PATH="/opt/homebrew/opt/python@3.10/bin:$PATH"

# 競プロ支援ツール
alias mkfile="python3 ~/Docker/kyopuro/Organizer/make_file.py"

[ -f "/Users/komotokenta/.ghcup/env" ] && source "/Users/komotokenta/.ghcup/env" # ghcup-env

. $HOME/.ghcup/env
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

source /Users/komotokenta/Docker/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# line notify
alias notify='~/Docker/line_notify/notify.sh'

