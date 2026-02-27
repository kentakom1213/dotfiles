# util/llm-tools.zsh

llm-tools() {
  emulate -L zsh
  setopt pipefail

  local separator="====="

  usage() {
    cat <<'EOF'
Usage:
  llm-tools [-s SEP] <subcommand> [args]

Subcommands:
  files <file...>

Options:
  -s, --separator SEP   set section separator (default: =====)
  -h, --help            show this help
EOF
  }

  die() {
    print -ru2 -- "$1"
    return 1
  }

  section() { print -- "${separator} $1 ${separator}"; }

  llm_files() {
    (( $# > 0 )) || { print -ru2 "files: at least one file required"; return 1; }
    local file
    for file in "$@"; do
      if [[ -f "$file" ]]; then
        section "FILE: $file"
        print -- '```'
        cat -- "$file"
        print -- '```'
        print
      else
        section "MISSING: $file"
        print
      fi
    done
  }

  # ---- 引数なし → usage + return 2 ----
  if (( $# == 0 )); then
    usage
    return 2
  fi

  # ---- global options ----
  while (( $# > 0 )); do
    case "${1-}" in
      -s|--separator)
        shift
        (( $# > 0 )) || { print -ru2 "missing value for --separator"; return 2; }
        separator="${1-}"
        shift
        ;;
      -h|--help)
        usage
        return 0
        ;;
      --)
        shift
        break
        ;;
      -*)
        print -ru2 "unknown option: ${1-}"
        return 2
        ;;
      *)
        break
        ;;
    esac
  done

  local cmd="${1-}"
  if [[ -z "$cmd" ]]; then
    usage
    return 2
  fi
  shift

  case "$cmd" in
    files) llm_files "$@" ;;
    *)
      print -ru2 "Unknown subcommand: $cmd"
      return 2
      ;;
  esac
}
