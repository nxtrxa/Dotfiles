# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# colours
autoload -Uz compinit colors zcalc

compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

if [[ -z "$SSH_AUTH_SOCK" ]]; then
    eval "$(ssh-agent -s)" >/dev/null
    ssh-add ~/.ssh/github >/dev/null 2>&1
fi

ssh-add -l >/dev/null 2>&1 || ssh-add ~/.ssh/github >/dev/null 2>&1

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit .p10k.zsh.
[[ ! -f ${ZDOTDIR}/plugins/p10k/.p10k.zsh ]] || \
    source ${ZDOTDIR}/plugins/p10k/.p10k.zsh

autoload -Uz add-zsh-hook

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST

setopt AUTO_CD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT

# tab completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)--color=auto}"                        # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                                                # automatically find new executables in path
zstyle ':completion:*' menu select                                                # Highlight menu selection

if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
fi

mkcd() {
    if [ -d "$1" ]; then
        echo "Directory already exists"
        cd "$1"
    else
        mkdir -p "$1" && cd "$1"
    fi
}

cx() { cd "$@" && lx }
cv() { cd "$@" && nv }

source "$ZDOTDIR/fzf.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/mappings.zsh"
source "$ZDOTDIR/plugins.zsh"
source "$ZDOTDIR/prompt.sh"

export PATH="$HOME/.local/bin:$HOME/.cargo/bin:${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# yazi setup
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cxd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ $cwd != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
