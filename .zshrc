# コマンド履歴
setopt EXTENDED_HISTORY

# mcfly
eval "$(mcfly init zsh)"

# venv - find and activate
function activate() {
    local venv_dir
    venv_dir="$(find "$PWD" -name "activate" | sed -n 1p)"
    [ -n "$venv_dir" ] && . "$venv_dir"
}

# yazi
function y() {
    local tmp cwd
    tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# エイリアス
alias ls='eza --icons auto'
alias tree='eza -T -L 3 -a -I "node_modules|.git|.cache" --icons auto'
alias wezterm='flatpak run org.wezfurlong.wezterm'
alias diff='diff -u --color'
alias pbcopy='xclip -selection clipboad'
alias pbpaste='xclip -selection clipboad -o'
alias sf='slide-flow'
alias pg='password-generator'
alias comp='canberra-gtk-play -i complete'

# HOME/ENDで行末，行頭に移動
bindkey "^[[H" beginning-of-line
bindkey "^[OH" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[OF" end-of-line
bindkey "^[[3~" delete-char

# 競プロ支援ツール
source ~/.config/kyopro/util.sh

# nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# GPG key
export GPG_TTY="$(tty)"

# spaceship
[ -f "$HOME/.zsh/spaceship/spaceship.zsh" ] && source "$HOME/.zsh/spaceship/spaceship.zsh"
