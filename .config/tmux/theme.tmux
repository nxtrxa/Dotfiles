# ---------- Core ----------
set -g status on
set -g status-interval 5
set -g status-position bottom
set -g status-justify centre

set -g status-style "bg=default,fg=#cdd6f4"
set -g message-style "bg=default,fg=#cdd6f4"
set -g message-command-style "bg=default,fg=#cdd6f4"

# ---------- Panes ----------
set -g pane-border-style "fg=#313244"
set -g pane-active-border-style "fg=#89b4fa"

# ---------- Windows (CENTER) ----------
set -g window-status-separator "  "
set -g window-status-style "fg=#6c7086,bg=default"
set -g window-status-current-style "fg=#89b4fa,bg=default"
set -g window-status-format " #I:#P"
set -g window-status-current-format " #I:#P"

# ---------- Status Left ----------
set -g status-left-length 30
set -g status-left \
"#[fg=#74c7ec]󰣇 #(whoami)@#H #[fg=#a7c7e7] #S"

# ---------- Status Right ----------
set -g status-right-length 35
set -g status-right \
"#[fg=#74c7ec]󰆧 #W  \
#[fg=#89b4fa]󰉋 #{b:pane_current_path}  \
#[fg=#94e2d5]󰓩 #{window_panes}  \
#[fg=#6c7086]󰥔 %H:%M"

# ---------- Modes ----------
setw -g mode-style "bg=#313244,fg=#cdd6f4"
setw -g clock-mode-colour "#89b4fa"

# ---------- Silence ----------
set -g visual-activity off
set -g visual-bell off
set -g bell-action none
