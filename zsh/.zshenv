export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export ASDF_DATA_DIR="$XDG_DATA_HOME"/asdf
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config
export AZURE_CONFIG_DIR="$XDG_DATA_HOME"/azure
# export HISTFILE="${XDG_STATE_HOME}"/bash/history
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CODEX_HOME="$XDG_DATA_HOME/codex"
export PATH="$XDG_DATA_HOME/npm/bin:$PATH"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

export GPG_TTY=$(tty)

export GALLIUM_DRIVER=d3d12
export MESA_LOADER_DRIVER_OVERRIDE=d3d12
export MESA_GL_VERSION_OVERRIDE=4.5
export GLFW_PLATFORM=x11
export SDL_VIDEODRIVER=x11
unset VK_ICD_FILENAMES

if command -v bat >/dev/null 2>&1; then
    export MANPAGER="bat -l man -p"
fi

prefix=${XDG_DATA_HOME}/npm
cache=${XDG_CACHE_HOME}/npm
