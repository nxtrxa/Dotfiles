if command -v fd >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden'
fi
# elif command -v rg >/dev/null 2>&1; then
#     export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_OPTS="
    --height 40%
    --layout=reverse
    --border
    --preview 'bat --style=numbers --color=always {}'
"

_fzf_file_no_hidden() {
    local cmd result
    cmd="${FZF_DEFAULT_COMMAND/--hidden /}"
    result=$(eval ${cmd:-find . -type f} | fzf) && LBUFFER+="$result"
    zle reset-prompt
}
zle -N _fzf_file_no_hidden
