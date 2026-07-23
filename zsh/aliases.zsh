alias ff='fastfetch'

alias cls='clear'
alias nv='nvim'
alias bat='bat --style=auto'

alias lx='exa --icons -la'
alias ll='exa -lh --icons --git'
alias la='eza -lah --icons --git'
alias trx='exa -a --icons --tree'

compdef eza=ls

alias grep='rg --color=auto'
alias diff='diff --color=auto'
alias df='df -h'

alias sozsh='source ~/.zshrc'
alias zshrc='nvim ~/.zshrc'
alias nvrc='cd ~/.config/nvim && nvim .'
alias envrc='cd /mnt/c/Users/muril/.config && nvim .'
alias tmuxrc='cd ~/.config/tmux && nvim .'
alias confrc='cd ~/dotfiles/.config/ && nvim .'

alias tmxa='tmux attach'

alias c3std='cd /usr/lib/c3c/lib/std && nvim .'

alias py='python3'
alias cl='clang'

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

alias svn="svn --config-dir $XDG_CONFIG_HOME/subversion"
alias wget="wget --hsts-file=\"$XDG_DATA_HOME/wget-hsts\""
# alias yarn="yarn --use-yarnrc /home/notrya/dotfiles/.config/yarn/config"

# Docker
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

#Dirs
alias -- -='cd -'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
