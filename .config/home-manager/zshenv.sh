. "$HOME/.cargo/env"

# デフォルトエディタ
export EDITOR=code

# コマンド履歴
export SAVEHIST=100000
export MCFLY_RESULTS=30
export MCFLY_FUZZY=1

# venv - find and activate
function activate() {
    local venv_dir=`find $PWD -name "activate" | sed -n 1p`
    . $venv_dir
}

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# エイリアス
alias ls='exa --icons'
alias tree='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'

# diff
alias diff="diff -u --color"

# 競プロ支援ツール
source ~/.config/kyopro/util.sh

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
alias sf='/home/powell/develop/nu/slides/slide-flow/target/release/slide-flow'

# pnpm
export PNPM_HOME="/home/powell/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

