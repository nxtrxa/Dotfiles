# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# colours
autoload -Uz compinit colors zcalc
compinit

if [[ -z "$SSH_AUTH_SOCK" ]]; then
  eval "$(ssh-agent -s)" >/dev/null
  ssh-add ~/.ssh/github >/dev/null 2>&1
fi

ssh-add -l >/dev/null 2>&1 || ssh-add ~/.ssh/github >/dev/null 2>&1

# fastfetch

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# source /share/powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ -f ~/.zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] \
  && source ~/.zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/custom/plugins/zsh-histdb/sqlite-history.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/notrya/.zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -Uz add-zsh-hook

export EDITOR=/usr/bin/nvim
export XDG_CONFIG_HOME=/home/notrya/.config

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


alias cls='clear'
alias nv='nvim'
alias bat='bat --style=auto'
alias lx='exa --icons -la'
alias trx='exa -a .?* --icons --tree'
alias ff='fastfetch'

alias sozsh='source ~/.zshrc'
alias zshrc='nvim ~/.zshrc'
alias nvrc='cd ~/.config/nvim && nvim .'
alias envrc='cd /mnt/c/Users/muril/.config && nvim .'
alias tmuxrc='cd ~/.config/tmux && nvim .'
alias dotfiles='cd ~/dotfiles && nvim .'

alias tmxa='tmux attach'

alias c3std='cd /usr/lib/c3c/lib/std && nvim .'

# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpo="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add .'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'

# Docker
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

#Dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

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

export PATH="$HOME/.local/bin:$HOME/.cargo/bin:${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# bindkey "$terminfo[kcuu1]" history-substring-search-up
# bindkey "$terminfo[kcud1]" history-substring-search-down
# bindkey '^[[A' history-substring-search-up
# bindkey '^[OA' history-substring-search-up
# bindkey '^[[B' history-substring-search-down
# bindkey '^[OB' history-substring-search-down
# bindkey -M vicmd '^[[A' history-substring-search-up 
# bindkey -M vicmd '^[OA' history-substring-search-up 
# bindkey -M vicmd '^[[B' history-substring-search-down
# bindkey -M vicmd '^[OB' history-substring-search-down
# bindkey -M viins '^[[A' history-substring-search-up 
# bindkey -M viins '^[OA' history-substring-search-up 
# bindkey -M viins '^[[B' history-substring-search-down 
# bindkey -M viins '^[OB' history-substring-search-down

# tab completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)--color=auto}"                        # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                                                # automatically find new executables in path
zstyle ':completion:*' menu select                                                # Highlight menu selection

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-R



# Load Angular CLI autocompletion.
source <(ng completion script)
