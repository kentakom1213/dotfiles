eval "$(starship init zsh)"

# zshの補完
source ~/develop/utils/zsh-autosuggestions/zsh-autosuggestions.zsh

# zshのハイライト
source ~/develop/utils/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# wezterm
alias wezterm='flatpak run org.wezfurlong.wezterm'

# コマンド履歴
export SAVEHIST=100000

# mcfly
eval "$(mcfly init zsh)"

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
    function batdiff() {
        if [[ $# -gt 1  ]]; then
            git diff $@ | bat
        else
            git diff HEAD . | bat
        fi
    }
fi

# diff
alias diff="diff -u --color"

# 競プロ支援ツール
export KYOPRO_DIR='/home/powell/develop/algo/kyopro'
export KYOPURO_LIBRARY_DIR='/home/powell/develop/algo/cp-library/cp-library-rs'
export BUNDLER='/home/powell/develop/algo/cp-library/expander/target/release/expand'
alias compete='/home/powell/develop/algo/kyopro/utils/compete.sh'
alias snippet='/home/powell/develop/algo/kyopro/utils/snippet.sh'
alias bundle='/home/powell/develop/algo/cp-library/expander/target/release/expand $KYOPURO_LIBRARY_DIR'
alias bundler='/home/powell/develop/algo/cp-library/expander/target/release/expand'

function linkrs () {
	local tmp=`pwd`
	cd "$KYOPRO_DIR/utils/link_files"
	cargo run --release -- "$KYOPRO_DIR/AlgoMethod" 2> /dev/null
	cargo run --release -- "$KYOPRO_DIR/AOJ" 2> /dev/null
    cd $tmp
}
alias run=$KYOPRO_DIR/utils/builder/target/debug/builder

# Rust関係
export RUST_BACKTRACE=1
export RUST_LOG=info
export PATH=$HOME/.cargo/bin:$PATH

# バイナリにパスを通す
export PATH='/home/powell/.local/bin':$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pbcopy
alias pbcopy='xclip -selection clipboad'
alias pbpaste='xclip -selection clipboad -o'

# codon
export PATH=/home/powell/.codon/bin:$PATH
export CODON_PYTHON=/usr/lib/x86_64-linux-gnu/libpython3.10.so

[ -f "/home/powell/.ghcup/env" ] && . "/home/powell/.ghcup/env" # ghcup-env

# GPG key
export GPG_TTY=$(tty)


# cargo fix と cargo fmt
alias ff='cargo fix --allow-dirty --allow-staged && cargo fmt'

# rye
source "$HOME/.rye/env"

# marp
alias marp=marp-cli-carroarmato0.marp

# slide
alias slide-flow='/home/powell/develop/nu/slides/slide-flow/target/release/slide-flow'

# pnpm
export PNPM_HOME="/home/powell/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
. "$HOME/.cargo/env"
