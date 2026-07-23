#!/usr/bin/env zsh
# Alternative yazi launcher for tmux – works around terminal response timeout
# Bind this script to a key:
#   bind b run-shell "~/.config/tmux/scripts/yazi-popup.sh"

# -------------------------------------------------------------------
# 1. Get the current pane's working directory
# -------------------------------------------------------------------
local pane_cwd
pane_cwd=$(tmux display-message -p '#{pane_current_path}') || {
    echo "yazi-popup: failed to get pane path" >&2
    exit 1
}

# -------------------------------------------------------------------
# 2. Try the popup first (you may tune this)
# -------------------------------------------------------------------
# Set a terminal type that avoids excessive querying.
# linux is safe, xterm-256color may work with higher escape-time.
export TERM=linux

# Optional: if you want colour, try TERM=xterm-256color and
# increase escape-time in your tmux.conf to 500 ms.

tmux display-popup -d "$pane_cwd" -C -w 90% -h 90% yazi 2>/dev/null
local popup_exit=$?

if [[ $popup_exit -eq 0 ]]; then
    exit 0    # everything went fine
fi

# -------------------------------------------------------------------
# 3. Fallback: temporary zoomed pane (100% reliable)
# -------------------------------------------------------------------
# Create a vertical split, run yazi, and zoom it to fill the whole window.
# When yazi exits, the pane is killed automatically.
tmux split-window -v -c "$pane_cwd" -l 90% "yazi; tmux kill-pane"
tmux resize-pane -Z
