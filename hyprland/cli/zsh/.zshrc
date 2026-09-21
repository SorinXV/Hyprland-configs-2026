# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change the frequency the auto-updater is run (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line to set how old an update must be before it's applied, manually or via the auto-updater (in days).
# zstyle ':omz:update' cooldown 10

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



eval "$(oh-my-posh init zsh --config https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/jandedobbeleer.omp.json)"
# Function to wipe the entire current prompt buffer
clear-entire-line() {
  BUFFER=""
  CURSOR=0
}
zle -N clear-entire-line

# Bind to Ctrl + Backspace or another key combo:
bindkey '^H' clear-entire-line     # Ctrl + Backspace in many terminalsc

# Prepend sudo to the previous command or current buffer on double Esc
sudo-command-line() {
  [[ -z $BUFFER ]] && zle up-history
  if [[ $BUFFER == sudo\ * ]]; then
    BUFFER="${BUFFER#sudo }"
  else
    BUFFER="sudo $BUFFER"
  fi
  CURSOR=$#BUFFER
}

zle -N sudo-command-line

# Bind Escape + Escape ('\e\e') to trigger the function
bindkey '\e\e' sudo-command-line



fastfetch

# ==============================================================================
# PHASE 1: DIRECTORY LISTINGS (STANDARD GNU LS)
# ==============================================================================
# Clean default: colorized, directories clustered at the top, type indicators (/, *, @)
alias ls="ls --color=auto --group-directories-first -F"

# Detailed long format with human-readable sizes (KB, MB, GB)
alias ll="ls -lh --color=auto --group-directories-first -F"

# Detailed long format including hidden files/dotfiles
alias la="ls -lah --color=auto --group-directories-first -F"

# Sort by modification time (newest files first)
alias lt="ls -lth --color=auto --group-directories-first -F"

# Reverse time sort: newest files appear at the very bottom right above your prompt
alias ltr="ls -ltrh --color=auto --group-directories-first -F"

# List only hidden files and directories
alias ldot="ls -ld .* --color=auto"


# ==============================================================================
# PHASE 2: ARCH LINUX PACKAGE MANAGEMENT (PACMAN)
# ==============================================================================
# Synchronize repositories and upgrade all official packages
alias update="sudo pacman -Syu"

# Install a package from official Arch repos
alias install="sudo pacman -S"

# Remove package and clean unneeded dependencies + config files
alias remove="sudo pacman -Rns"

# Find and wipe all orphaned dependencies taking up storage
alias orphans="sudo pacman -Qtdq | sudo pacman -Rns -"

# Clear out uninstalled package tarballs from cache to free disk space
alias pacclean="sudo pacman -Sc"


# ==============================================================================
# PHASE 3: KITTY TERMINAL INTEGRATIONS (BUILT-IN KITTENS)
# ==============================================================================
# Display images inline directly in Kitty
alias icat="kitty +kitten icat"

# Side-by-side terminal diff tool with syntax highlighting
alias kdiff="kitty +kitten diff"

# Auto-copies terminfo to avoid 'unknown terminal xterm-kitty' errors on remote servers
alias sssh="kitty +kitten ssh"

# Quick-edit Kitty config file
alias kconf="${EDITOR:-nano} ~/.config/kitty/kitty.conf"


# ==============================================================================
# PHASE 4: NAVIGATION & INTERACTIVE SAFETY GUARDS (COREUTILS)
# ==============================================================================
# Quick directory stepping
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Interactive safety flags: prompt before overwriting/deleting and print actions (-v)
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"

# Edit and reload Zsh configuration
alias zconf="${EDITOR:-nano} ~/.zshrc"
alias reload="source ~/.zshrc"


# ==============================================================================
# PHASE 5: SYSTEM DIAGNOSTICS & SYSTEMD
# ==============================================================================
# View recent system error logs with explanations
alias jlog="journalctl -xe"

# Check if any systemd services failed to start
alias failed="systemctl --failed"

# Human-readable disk free space overview
alias df="df -h"

# Human-readable RAM and Swap memory usage
alias free="free -h"