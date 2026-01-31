# Window navigation
unbind C-n
bind-key -n C-] switch-client -p
bind-key -n C-[ switch-client -n
bind h previous-window
bind l next-window

# Create windows/panes
bind c new-window -c "#{pane_current_path}"
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"

# Close windows/panes
bind & kill-window
bind x kill-pane

# Reload config
bind r source-file ~/.config/tmux/tmux.conf \; display-message "󰑓 Config reloaded"

# Resize panes
bind -r Down resize-pane -D 5
bind -r Up resize-pane -U 5
bind -r Right resize-pane -R 5
bind -r Left resize-pane -L 5
bind -r m resize-pane -Z

# VIM copy mode
set-window-option -g mode-keys vi
bind-key -T copy-mode-vi 'v' send -X begin-selection
bind-key -T copy-mode-vi 'y' send -X copy-selection
unbind -T copy-mode-vi MouseDragEnd1Pane

# Session management
bind-key n command-prompt "new-session -s '%%'"

# Popups and menus
bind y display-popup -d "#{pane_current_path}" -w 90% -h 90% -E "yazi"
bind w display-popup -E -w 50% -h 50% ~/.config/tmux/scripts/tmux-menu.sh
bind T display-popup -E -w 80% -h 80% ~/.config/tmux/scripts/tmux-scratch.sh
bind g display-popup -d "#{pane_current_path}" -E -w 80% -h 80% -E lazygit

# Scratchpad popup bindings
bind -T popup t send-keys t
bind -T popup q send-keys q
bind -T popup T detach

# Config menu
bind d display-menu -T "#[align=centre]Config" -x C -y C \
    ".zshrc"            z  "display-popup -w 75% -h 75% -E 'nvim ~/.zshrc'" \
    "tmux.conf"         t  "display-popup -w 75% -h 75% -E 'nvim ~/.config/tmux/tmux.conf'" \
    "nvim"              v  "display-popup -d "~/dotfiles/nvim/.config/nvim" -E 'nvim ~/.config/nvim'" \
    "quit"              q  ""
