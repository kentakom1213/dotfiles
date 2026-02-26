# コマンド履歴
export SAVEHIST=100000
export MCFLY_RESULTS=50
export MCFLY_FUZZY=1

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# venv - find and activate
function activate() {
	local venv_dir
	venv_dir="$(find "$PWD" -name "activate" | sed -n 1p)"
	[ -n "$venv_dir" ] && . "$venv_dir"
}

# エイリアス
alias ls='eza --icons auto'
alias tree='eza -T -L 3 -a -I "node_modules|.git|.cache" --icons auto'
alias typora='/Applications/Typora.app/Contents/MacOS/Typora'

# diff
alias diff='diff -u --color'

# 競プロ支援ツール
[ -f "$HOME/.config/kyopro/util.sh" ] && source "$HOME/.config/kyopro/util.sh"

# GPG key
export GPG_TTY="$(tty)"

# nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# rye
[ -f "$HOME/.rye/env" ] && source "$HOME/.rye/env"

# haskell
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

# ipe
alias ipe='/Applications/Ipe.app/Contents/MacOS/ipe'

# spaceship
# [ -f "$HOME/.zsh/spaceship/spaceship.zsh" ] && source "$HOME/.zsh/spaceship/spaceship.zsh"
