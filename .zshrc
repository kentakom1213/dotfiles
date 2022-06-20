
# starshipの導入
eval "$(starship init zsh)"

# venv
function activate() {
    local cur=$(basename $PWD)
    . .$cur/bin/activate
}

# mkdir+cd
mkcd () {
    mkdir $1 && cd $1 && pwd
}

# エイリアス
alias accpy="acc s main.py -- --guess-python-interpreter pypy"
alias ojtpy="oj test -c 'python3 main.py'"
alias ojtcpp="cppbuild main.cpp &&oj test -c './_main'"

alias tree="tree -N"
alias typora="open -a typora"

# youtube-dlの証明書エラーを無視
alias youtube-dl_="youtube-dl --no-check-certificate"

# PATH
export PATH="/opt/homebrew/opt/python@3.10/bin:$PATH"

# 競プロ支援ツール
alias mkfile="python3 ~/Docker/kyopuro/Organizer/make_file.py"



[ -f "/Users/komotokenta/.ghcup/env" ] && source "/Users/komotokenta/.ghcup/env" # ghcup-env

[ -f "/Users/[your-user-name]/.ghcup/env" ] && source "/Users/[your-user-name]/.ghcup/env" # ghcup-env
. $HOME/.ghcup/env
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

source /Users/komotokenta/Docker/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
