# Plugin Manager
set -g @plugin 'tmux-plugins/tpm'

# Essential plugins
set -g @plugin 'christoomey/vim-tmux-navigator'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-yank'

# Session management
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'omerxx/tmux-sessionx'

# Utility plugins
set -g @plugin 'fcsonline/tmux-thumbs'
set -g @plugin 'sainnhe/tmux-fzf'
set -g @plugin 'wfxr/tmux-fzf-url'
set -g @plugin 'omerxx/tmux-floax'

# Status bar plugins (if you want to keep battery/online status)
set -g @plugin 'tmux-plugins/tmux-online-status'
set -g @plugin 'tmux-plugins/tmux-battery'

# Plugin configurations
set -g @resurrect-capture-pane-contents 'on'
set -g @continuum-restore 'on'
set -g @continuum-save-interval '1'
set -g @resurrect-strategy-nvim 'session'

# FZF URL
set -g @fzf-url-fzf-options '-p 60%,30% --prompt="   " --border-label=" Open URL "'
set -g @fzf-url-history-limit '2000'

# Floax
set -g @floax-width '80%'
set -g @floax-height '80%'
set -g @floax-border-color 'magenta'
set -g @floax-text-color 'magenta'
set -g @floax-bind 'p'
set -g @floax-change-path 'true'

# Sessionx
set -g @sessionx-bind 'o'
set -g @sessionx-bind-zo-new-window 'ctrl-y'
set -g @sessionx-auto-accept 'off'
set -g @sessionx-custom-paths '/Users/omerxx/dotfiles'
set -g @sessionx-x-path '~/dotfiles'
set -g @sessionx-window-height '85%'
set -g @sessionx-window-width '75%'
set -g @sessionx-zoxide-mode 'on'
set -g @sessionx-custom-paths-subdirectories 'false'
set -g @sessionx-filter-current 'false'

# Online/Battery status (configure if using)
set -g @online_icon "ok"
set -g @offline_icon "nok"
