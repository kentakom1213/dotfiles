. "$HOME/.cargo/env"

# デフォルトエディタ
export EDITOR=code

# コマンド履歴
export SAVEHIST=10000
export MCFLY_RESULTS=50
export MCFLY_FUZZY=1

# Rust関係
export RUST_BACKTRACE=1
export RUST_LOG=info
export PATH=$HOME/.cargo/bin:$PATH

# バイナリにパスを通す
export PATH='/home/powell/.local/bin':$PATH

export NVM_DIR="$HOME/.nvm"

[ -f "/home/powell/.ghcup/env" ] && . "/home/powell/.ghcup/env" # ghcup-env

# pnpm
export PNPM_HOME="/home/powell/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# golang
export PATH=$PATH:/usr/local/go/bin

# codon
export PATH=/home/powell/.codon/bin:$PATH

# GPG
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

# karukan
export FCITX_ADDON_DIRS=$HOME/.local/lib/fcitx5:$(pkg-config --variable=libdir Fcitx5Core)/fcitx5
